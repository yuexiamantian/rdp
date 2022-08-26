$(function () {
	$("#jqGrid").jqGrid({
		url: baseURL + 'rdp/selectAllReportFile?kw=',
		datatype: "json",
		colModel: [{
				label: 'UUID',
				name: 'uuid',
				index: 'uuid',
				search: true,
				key: true,
				formatter: function (value, options, row) {
					return '<a href="../../rdppage/main/'+value+'" target="view_window">'+value+'</a>';
				}
			},
			{
				label: '报表名称',
				name: 'name',
				index: 'name',
				search: true
			},
			/*{
				label: '报表类型',
				name: 'reportStyle',
				index: 'reportStyle',
				width: 80
			},*/
			{
				label: '版本号',
				name: 'version',
				index: 'version',
				align: "center",
				width: 40
			},
			{
				label: '操作',
				name: '',
				width: 100,
				formatter: function (value, options, row) {
					var btns = [
						/*{
						"lable": "查看源",
						"fun": "viewReport('" + row.uuid + "')"
					}, */
						{
						"lable": "修改",
						"fun": "updateReport('" + row.uuid + "')"
					}, {
						"lable": "删除",
						"fun": "deleteReport('" + row.uuid + "')"
					}];
					return formatterBtn(btns);
				}
			}
		],
		viewrecords: true,
		height: window.innerHeight - $(".grid-btn").outerHeight(true) - 100,
		rowNum: 10,
		rowList: [10, 30, 50],
		rownumbers: true,
		rownumWidth: 25,
		autowidth: true,
		loadonce: true,
		multiselect: true,
		pager: "#jqGridPager",
		jsonReader: {
			root: "list"
		},
		gridComplete: function () {
			//隐藏grid底部滚动条
			$("#jqGrid").closest(".ui-jqgrid-bdiv").css({
				"overflow-x": "hidden"
			});
		}
	});

	new AjaxUpload('#upload', {
		action: baseURL + "rdp/upload",
		name: 'file',
		autoSubmit:true,
		responseType:"json",
		onSubmit:function(file, extension){
			if (!(extension && /^(xml|zip)$/.test(extension.toLowerCase()))){
				alert('只支持xml、zip格式的文件！');
				return false;
			}
		},
		onComplete : function(file, r){
			if(r.code == 0){
				layer.msg("导入成功", {icon: 1});
				//$("#jqGrid").trigger("reloadGrid");
				vm.reload();
			}else{
				alert(r.msg);
			}
		}
	});

});

var vm = new Vue({
	el: '#rrapp',
	data: {
		q: {
			name: null
		},
		showList: true,
		title: null,
		dict: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		reload: function (event) {
			vm.showList = true;
			jQuery("#jqGrid").jqGrid('setGridParam', {
				datatype: 'json',
				page: 1
			}).jqGrid('setGridParam', {
				url: baseURL + 'rdp/selectAllReportFile?kw=' + (vm.q.key?vm.q.key:""),
				page: 1
			}).trigger("reloadGrid");
		},
		add:function(){
			window.open("rdpDesign.html","_blank");    
		},
		refresh:function(){
			confirm('确定要刷新数据字典缓存吗？', function (sts,index) {
				$.ajax({
					type: "get",
					url: baseURL + "rdp/refreshDic",
					contentType: "application/json",
					success: function (r) {
						if (r.code == 0) {
							alert('缓存清除成功');
						} else {
							alert(r.msg);
						}
					}
				});
			});
		},
		down:function(){
			var uuIds = getSelectedRows();
			if(uuIds == null){
				return ;
			}
			layer.load(1, {
				shade: [0.1,'#fff'] //0.1透明度的白色背景
			});
			$.fileDownload(baseURL + "rdp/down",{data:{uuIds:JSON.stringify(uuIds)},httpMethod:'POST',
				successCallback: function (url) { layer.closeAll('loading') },
				failCallback: function (responseHtml, url) { layer.closeAll('loading');alert("导出失败！")}
			});
		},
		downall:function(){
			layer.load(1, {
				shade: [0.1,'#fff'] //0.1透明度的白色背景
			});
			$.fileDownload(baseURL + "rdp/downall",{data:'',httpMethod:'POST',
				successCallback: function (url) { layer.closeAll('loading') },
				failCallback: function (responseHtml, url) { layer.closeAll('loading');alert("导出失败！")}
			});
		}
	}
});

function viewReport(uuid){
	$.ajax({
		type: "get",
		url: baseURL + "rdp/viewReport",
		contentType: "application/json",
		data: {
			uuid: uuid
		},
		success: function (r) {
			if (r.code == 0) {
				parent.layer.open({
					type: 1,
					skin: 'layui-layer-rim', //加上边框
					area: ['100%', '100%'], //宽高
					content: '<pre>'+r.data.replace(/</g,'&lt;').replace(/>/g,'&gt;')+'</pre>'
				});
			} else {
				alert(r.msg);
			}
		}
	});
}

function updateReport(uuid) {
	window.open('rdpDesign.html?uuid=' + uuid, 'left=0,top=0,width=' + (screen.availWidth - 10) + ',height=' + (screen.availHeight - 50) + ',toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');
}

function deleteReport(uuid) {
	confirm('确定要删除选中的记录？', function (sts,index) {
		$.ajax({
			type: "get",
			url: baseURL + "rdp/deleteReport",
			contentType: "application/json",
			data: {
				uuid: uuid
			},
			success: function (r) {
				if (r.code == 0) {
					closeLayer(index);
					jQuery("#jqGrid").jqGrid('setGridParam', {
						datatype: 'json',
						page: 1
					}).jqGrid('setGridParam', {
						url: baseURL + 'rdp/selectAllReportFile?kw=',
						page: 1
					}).trigger("reloadGrid");
				} else {
					alert(r.msg);
				}
			}
		});
	});
}