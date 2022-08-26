package io.report.modules.rdp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.report.common.exception.CodeException;
import io.report.common.utils.R;
import io.report.modules.rdp.handler.ReportAnalysis;
import io.report.modules.sys.entity.SysUserEntity;

/*
 * 报表展现相关--不拦截
 */
@RestController
@RequestMapping("/rdppub")
public class RdpPubController {
    @Value("${report.rdp.data-path}")
    private String realPath;
    @Value("${report.rdp.maxexport}")
    private int maxexport;
    @Value("${report.relative-path}")
    private Boolean relativePath;

    @Autowired
    HttpServletRequest rq;
    @Autowired
    HttpServletResponse rp;
    CodeException codeException = new CodeException();

    /**
     * 显示报表
     */
    @RequestMapping("/show")
    public void show() {
    	SysUserEntity su = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if (su != null) {
            su.setPassword("");
            su.setSalt("");
        }
	    rq.setAttribute("sys__user", su);
	    ReportAnalysis.selectShow(rq, rp, relativePath, realPath);
    }

    /**
     * 报表导出状态
     *
     * @return
     */
    @RequestMapping("/exportFlag")
    public R exportFlag() {
        if (ReportAnalysis.exportFlag(rq, maxexport)) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    /**
     * 导出非主子报表
     * @return
     */
    @RequestMapping("/exportFile")
    public void exportFile() {
        SysUserEntity su = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if (su != null) {
            su.setPassword("");
            su.setSalt("");
        }
        rq.setAttribute("sys__user", su);
        ReportAnalysis.exportFile(rq, rp, relativePath, realPath);
    }

    /**
     * 导出主子报表
     * @return
     */
    @RequestMapping("/exportSubFile")
    public void exportSubFile() {
        SysUserEntity su = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if (su != null) {
            su.setPassword("");
            su.setSalt("");
        }
        rq.setAttribute("sys__user", su);
        ReportAnalysis.exportSubFile(rq, rp, relativePath, realPath);
    }

    /**
     * 显示报表参数
     *
     * @return
     */
    @RequestMapping("/showparam")
    public R showparam() {
        try {
            Map<String, Object> map = ReportAnalysis.showparam(rq, rp, relativePath, realPath);
            return R.ok().put("data", map);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("获取参数出错！");
        }
    }

    /**
     * 填报保存 --注意：填报不支持多数据源
     * @return
     */
    @RequestMapping("/savereport")
    public R savereport(@RequestBody Map<String, Object> fillData) {
    	return ReportAnalysis.saveReport(rq, rp, relativePath, realPath, fillData);
    }

}
