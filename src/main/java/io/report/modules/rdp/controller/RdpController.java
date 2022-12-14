package io.report.modules.rdp.controller;

import java.io.*;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.ZipUtil;
import com.alibaba.fastjson.JSONArray;
import io.report.common.annotation.SysLog;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.hutool.http.HttpUtil;
import io.report.common.db.bean.DataSourceBean;
import io.report.common.db.bean.TableBean;
import io.report.common.db.bean.TableColumnBean;
import io.report.common.db.util.DBUtil;
import io.report.common.utils.Base64Util;
import io.report.common.utils.R;
import io.report.common.utils.ServerUtil;
import io.report.common.utils.code.CodeUtil;
import io.report.modules.rdp.bean.ReportFileBean;
import io.report.modules.rdp.entity.JsonToXMLUtil;
import io.report.modules.rdp.entity.json.DataParms;
import io.report.modules.rdp.entity.json.JsonReportEntity;
import io.report.modules.rdp.entity.xml.ParmEntity;
import io.report.modules.rdp.entity.xml.ReportEntity;
import io.report.modules.rdp.service.DesignService;
import io.report.modules.rdp.skin.SkinUtil;
import io.report.modules.rdp.util.Cache;
import io.report.modules.rdp.util.DataSourceUtil;
import io.report.modules.rdp.util.DesignXmlUtil;
import io.report.modules.rdp.util.ImportExcelUtil;
import io.report.modules.ser.service.DataSourceService;

/*
 * ??????????????????
 */
@RestController
@RequestMapping("/rdp")
public class RdpController {
    protected Logger logger = LoggerFactory.getLogger(getClass());
    @Value("${report.rdp.data-path}")
    private String realPath;
    @Value("${report.relative-path}")
    private Boolean relativePath;
    @Autowired
    HttpServletRequest rq;
    @Autowired
    HttpServletResponse rp;

    @Autowired
    private DesignService designService;

    @Autowired
    private DataSourceService dataSourceService;

    /**
     * ??????excel
     *
     * @param filedata // ???????????????
     */

    @RequestMapping("/importExcelAction")
    public R ImportExcel(@RequestParam("filedata") MultipartFile filedata) {
        try {
            String filedataFileName = filedata.getOriginalFilename();
            String filedataContentType = filedata.getContentType();
            JsonReportEntity json = ImportExcelUtil.importExcel(filedata, filedataFileName, filedataContentType);
            return R.ok().put("data", json);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("????????????");
        }
    }

    /**
     * ??????uuid?????????
     *
     * @param uuid
     * @return
     */
    @RequestMapping("/selectReport")
    public R SelectReport(@RequestParam("uuid") String uuid) {
        ReportEntity model = DesignXmlUtil.openXMLNew(ServerUtil.getDataPath(relativePath, realPath) + uuid + ".xml");
        if (model != null) {
            JsonReportEntity json = JsonToXMLUtil.XmlToJson(model);
            return R.ok().put("json", json);
        } else {
            return R.error("??????????????????!");
        }
    }

    /**
     * ????????????
     *
     * @param uuid
     * @param report
     * @return
     */
    @RequestMapping("/saveReport")
    public R SaveReport(@RequestParam("uuid") String uuid, @RequestParam("report") String report) {
        try {
            report = Base64Util.decode(report, "Unicode");
            JsonReportEntity json = JSON.parseObject(report, JsonReportEntity.class);
            ReportEntity re = JsonToXMLUtil.JsonToXml(json);
            String filePath = ServerUtil.getDataPath(relativePath, realPath) + re.getUuid() + ".xml";
            if (DesignXmlUtil.reportToXML(re, filePath)) {
                Cache.xmlMap.remove(re.getUuid());
                return R.ok("????????????");
            } else {
                return R.error("???????????????");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ??????uuid????????????
     *
     * @param uuid
     * @return
     */
    @RequestMapping("/deleteReport")
    public R DeleteReport(@RequestParam("uuid") String uuid) {
        try {
            designService.deleteReport(ServerUtil.getDataPath(relativePath, realPath) + uuid + ".xml");
            Cache.xmlMap.remove(uuid);
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ??????uuid?????????
     *
     * @param uuid
     * @return
     */
    @RequestMapping("/viewReport")
    public R ViewReport(@RequestParam("uuid") String uuid) {
        try {
            String filepath = ServerUtil.getDataPath(relativePath, realPath) + uuid + ".xml";
            String fileContent = DesignXmlUtil.readToString(filepath);
            return R.ok().put("data", fileContent);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ?????????????????????
     *
     * @return
     */
    @RequestMapping("/selectAllReportFile")
    public R SelectAllReportFile(@RequestParam(name = "kw") String kw) {
        try {
            List<ReportFileBean> list = designService.findAllReportFile(ServerUtil.getDataPath(relativePath, realPath));
            List<ReportFileBean> showlist = new ArrayList<ReportFileBean>();
            if (kw != null && !"".equals(kw) && !"undefined".equals(kw)) {
                for (ReportFileBean node : list) {
                    if (node.getName().indexOf(kw) > -1 || node.getUuid().indexOf(kw) > -1) {
                        showlist.add(node);
                    }
                }
            } else {
                showlist.addAll(list);
            }

            return R.ok().put("list", showlist);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ???????????????????????????
     *
     * @param uuid
     * @return
     */
    @RequestMapping("/selectAllParmsByUUID")
    public R SelectAllParmsByUUID(@RequestParam("uuid") String uuid) {
        try {
            List<ParmEntity> list = DesignXmlUtil.getParmsByUUID(ServerUtil.getDataPath(relativePath, realPath) + uuid + ".xml");
            Map<String, Object> map = new HashMap<String, Object>();
            for (ParmEntity entity : list) {
                map.put(entity.getName(), "");
            }
            return R.ok().put("list", map);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("?????????????????????");
        }
    }

    /**
     * ???????????????????????????
     *
     * @return
     */
    @RequestMapping("/selectAllDataSourceName")
    public R SelectAllDataSourceName() {
        try {
            List<DataSourceBean> list = designService.selectAllDataSource();
            return R.ok().put("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ???????????????????????????
     *
     * @return
     */
    @RequestMapping("/selectAllJSONName")
    public R selectAllJSONName() {
        try {
            List<DataSourceBean> list = designService.selectAllJSONNSource();
            return R.ok().put("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * @param dataSourceName ???????????????
     * @param dataSetType    ???????????????
     * @param parm           ?????????????????????(???????????????)
     * @param parms          ???????????????
     * @param value          sql??????
     * @return
     */
    @RequestMapping("/parFieldsForJSON")
    public R ParFieldsForJSON(@RequestParam("dataSourceName") String dataSourceName, @RequestParam("dataSetType") String dataSetType, @RequestParam("parm") String parm, @RequestParam("parms") String parms, @RequestParam("value") String value) {
        try {
            DataSourceBean dsb = new DataSourceBean();
            List<DataParms> parmsList = new ArrayList<DataParms>();
            if (StringUtils.isNotBlank(parms)) {
            	parmsList = JSONObject.parseArray(parms, DataParms.class);
            }
            Map<String, String> dataMap = new HashMap<String, String>();
            if (dataSourceName != null && !dataSourceName.equals("javabean") && !dataSourceName.equals("json")) {
                if (Cache.dataSourceBeanMap.get(dataSourceName) != null) {
                    dsb = Cache.dataSourceBeanMap.get(dataSourceName);
                } else {
                    dsb = dataSourceService.getDataSourceBeanByDataSourceName(dataSourceName);
                }
                dataMap = DBUtil.connTest(dsb);
            } else {
                dsb.setType(dataSourceName.toLowerCase());
                dataMap.put("flag", "1");
            }
            if (dataMap != null && dataMap.size() > 0) {
                if ("1".equals(dataMap.get("flag"))) {
                    String sqlStr = Base64Util.decode(value, "Unicode");
                    String errorMsg = "";
                    List<TableColumnBean> list = new ArrayList<TableColumnBean>();
                    try {
                    	list = designService.parFieldsForJSON(dsb, dataSetType, sqlStr, parm, parmsList);
                    }catch (Exception e) {
                    	if(e.getMessage()!=null&&e.getMessage().startsWith("ORA-")) {
        					errorMsg = e.getMessage()+"????????????SQL????????????????????????????????????????????????";
        				}else if(e.getMessage()!=null){
        					errorMsg = e.getMessage();
        				}
					}
                    if (list != null && list.size() > 0) {
                    	String columnKey = "[\\u4e00-\\u9fa5\\x3130-\\x318F\\xAC00-\\xD7A\\u0800-\\u4e00_a-zA-Z0-9]+";
                    	Pattern columnPattern = Pattern.compile(columnKey); 
                    	for(TableColumnBean columnBean:list) {
                    		String columnName = columnBean.getColumnName();
                    		if(!columnPattern.matcher(columnName).matches()) {
                    			errorMsg="Sql???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????";
                    			break;
                    		}
                    	}
                    	if("".equals(errorMsg)) {
                    		return R.ok().put("list", list);
                    	}else {
                    		return R.error(errorMsg);
                    	}
                    } else {
                    	if("".equals(errorMsg)) {
                    		return R.error("SQL???????????????????????????????????????????????????????????????SQL???");
                    	}else {
                    		return R.error(errorMsg);
                    	}
                    }
                } else {
                    return R.error(dataMap.get("msg"));
                }
            } else {
                return R.error("?????????????????????");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ??????????????????
     *
     * @param dataSourceName ???????????????
     * @param path           ????????????
     * @param method         ????????????
     * @return
     */
    @RequestMapping("/getJSONDataByUrl")
    public R getJSONDataByUrl(@RequestParam("dataSourceName") String dataSourceName, @RequestParam("path") String path, @RequestParam("method") String method) {
        String result = "";
        try {
            DataSourceBean dataSourceBean = dataSourceService.getDataSourceBeanByDataSourceName(dataSourceName);
            String url = dataSourceBean.getDataBaseUrl() + path;
            url = url.replace("&amp;", "&");
            if ("0".equals(method)) {
                result = HttpUtil.get(url);
            } else {
                result = HttpUtil.post(url, "");
            }
            System.out.println("????????????" + url);
            try {
                return R.ok().put("list", JSONObject.parseObject(result));
            } catch (Exception ex) {
                try {
                    return R.ok().put("list", JSONObject.parseArray(result));
                } catch (Exception ex1) {
                    return R.error("???????????????JSON?????????????????????");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }

    }

    /**
     * ??????????????????????????????
     *
     * @param dataSourceName
     * @return
     */
    @RequestMapping("/getTableInfo")
    public R getTableInfo(@RequestParam("dataSourceName") String dataSourceName) {
        try {
            DataSourceBean dataSourceBean = dataSourceService.getDataSourceBeanByDataSourceName(dataSourceName);
            try {
                List<TableBean> listb = new DataSourceUtil().getTableInfo(dataSourceBean);
                return R.ok().put("list", listb);
            } catch (Exception ex1) {
                return R.error("???????????????JSON?????????????????????");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ????????????????????????????????????
     *
     * @param dataSourceName
     * @param tableName
     * @return
     */
    @RequestMapping("/getColumnInfo")
    public R getColumnInfo(@RequestParam("dataSourceName") String dataSourceName, @RequestParam("tableName") String tableName) {
        try {
            DataSourceBean dataSourceBean = dataSourceService.getDataSourceBeanByDataSourceName(dataSourceName);
            try {
                List<TableColumnBean> listb = new DataSourceUtil().getColumnsInfo(dataSourceBean, tableName);
                return R.ok().put("list", listb);
            } catch (Exception ex1) {
                return R.error("???????????????JSON?????????????????????");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ?????????????????????
     *
     * @param barType
     * @param barImage
     * @return
     */
    @RequestMapping("/getBarCode")
    public R getBarCode(@RequestParam("barType") String barType,
                        @RequestParam("barSize") String barSize,
                        @RequestParam("width") Integer width,
                        @RequestParam("height") Integer height,
                        @RequestParam("barImage") String barImage,
                        @RequestParam("showContentFlag") Boolean showContentFlag) {
        try {
            CodeUtil codeUtil = new CodeUtil();
            String base64Str = codeUtil.showImageCode(barType, width, height, barImage, showContentFlag);
            return R.ok().put("imageStr", base64Str);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("???????????????");
        }
    }

    /**
     * ????????????????????????
     *
     * @return
     */
    @RequestMapping("/refreshDic")
    public R refreshDic() {
        Cache.dicMap.clear();
        return R.ok();
    }

    /**
     * ?????????????????????????????????
     *
     * @param fileName
     * @return
     */
    @RequestMapping("/checkSkin")
    public R checkSkin(@RequestParam("fileName") String fileName) {
        if (SkinUtil.exsitCustomFile(fileName)) {
            return R.error("?????????????????????");
        } else {
            return R.ok();
        }
    }

    /**
     * ???????????????????????????
     *
     * @return
     */
    @RequestMapping("/customSkinList")
    public R customSkinList() {
        List<String> lists = SkinUtil.getCustomFiles();
        return R.ok().put("list", lists);
    }

    /**
     * ????????????????????????
     *
     * @return
     */
    @RequestMapping("/getCustomSkin")
    public R getCustomSkin(@RequestParam("fileName") String fileName) {
        net.sf.json.JSONObject json = SkinUtil.getSustomSkinJson(fileName);
        return R.ok().put("json", json);
    }

    /**
     * ?????????????????????
     *
     * @return
     */
    @RequestMapping("/removeCustomSkin")
    public R removeCustomSkin(@RequestParam("fileName") String fileName) {
        Boolean flag = SkinUtil.removeSustomSkinJson(fileName);
        if (flag) {
            return R.ok();
        } else {
            return R.error("???????????????");
        }
    }

    /**
     * ?????????????????????
     *
     * @return
     */
    @RequestMapping("/saveCustomSkin")
    public R saveCustomSkin(@RequestParam("fileName") String fileName, @RequestParam("content") String content) {
        SkinUtil.saveSustomSkinJson(fileName, content);
        return R.ok();
    }

    /**
     * ????????????
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public R upload(MultipartFile file) {
        R result = new R();
        if (file == null) {
            result = R.error("file????????????");
            return result;
        }
        String fileName = file.getOriginalFilename(); //???????????????
        String filePathName = ServerUtil.getDataPath(relativePath, realPath) + File.separator + fileName;
        try {
            file.transferTo(new File(filePathName));
            if (fileName.toLowerCase().endsWith(".zip")) {
                ZipUtil.unzip(filePathName, realPath);
                new File(filePathName).delete();
            }
            result = R.ok();
        } catch (IOException e) {
            result = R.error(e.getMessage());
        }
        return result;
    }

    /**
     * ??????????????????
     */
    @SysLog("??????????????????")
    @RequestMapping("/down")
    public void down() {
        String uuIds=rq.getParameter("uuIds");
        if(uuIds!=null) {
            String zipFile = "report.zip";
            try {
                rp.reset();
                zipFile = URLEncoder.encode(zipFile, "UTF-8");
                rp.addHeader("Content-Disposition", "attachment;filename=" + zipFile);
                rp.setContentType("multipart/form-data");
                rp.setHeader("Set-Cookie", "fileDownload=true; path=/");
                rp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                ZipOutputStream zos = new ZipOutputStream(rp.getOutputStream());
                BufferedOutputStream bos = new BufferedOutputStream(zos);
                List<String> uuids= JSONArray.parseArray(uuIds,String.class);
                for (int i = 0; i < uuids.size(); i++) {
                    String fname = uuids.get(i) + ".xml";
                    byte[] f = FileUtil.readBytes(ServerUtil.getDataPath(relativePath, realPath) + File.separator + uuids.get(i) + ".xml");

                    BufferedInputStream bis = new BufferedInputStream(new ByteArrayInputStream(f));
                    zos.putNextEntry(new ZipEntry(fname));

                    int len = 0;
                    byte[] buf = new byte[10 * 1024];
                    while ((len = bis.read(buf, 0, buf.length)) != -1) {
                        bos.write(buf, 0, len);
                    }
                    bis.close();
                    bos.flush();
                }
                bos.close();
            } catch (Exception ex) {
                rp.setHeader("Set-Cookie", "fileDownload=false; path=/");
                rp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                logger.error(ex.getMessage());
            }
        }else{
            rp.setHeader("Set-Cookie", "fileDownload=false; path=/");
            rp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        }
    }

    /**
     * ??????????????????
     */
    @SysLog("??????????????????")
    @RequestMapping("/downall")
    public void downall() {
        String zipFile = "reportfiles.zip";
        try {
            rp.reset();
            zipFile = URLEncoder.encode(zipFile, "UTF-8");
            rp.addHeader("Content-Disposition", "attachment;filename=" + zipFile);
            rp.setContentType("multipart/form-data");
            rp.setHeader("Set-Cookie", "fileDownload=true; path=/");
            rp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            ZipOutputStream zos = new ZipOutputStream(rp.getOutputStream());
            BufferedOutputStream bos = new BufferedOutputStream(zos);
            List<File> files=FileUtil.loopFiles(ServerUtil.getDataPath(relativePath, realPath));
            for(File file : files){
                String fname = file.getName();            //??????zip?????????
                byte[]  f = FileUtil.readBytes(file);            //??????zip???????????????

                BufferedInputStream bis = new BufferedInputStream(new ByteArrayInputStream(f));
                zos.putNextEntry(new ZipEntry(fname));

                int len = 0;
                byte[] buf = new byte[10 * 1024];
                while( (len=bis.read(buf, 0, buf.length)) != -1){
                    bos.write(buf, 0, len);
                }
                bis.close();
                bos.flush();
            }
            bos.close();
        }catch (Exception ex){
            rp.setHeader("Set-Cookie", "fileDownload=false; path=/");
            rp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            logger.error(ex.getMessage());
        }
    }
}
