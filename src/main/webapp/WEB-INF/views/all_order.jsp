<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
    <link href="css/plugins/jqGrid/ui.jqgrid.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
 <div class="ibox-content">
                            <div class="jqGrid_wrapper">
                                <table id="table_list_1"></table>
                                <div id="pager_list_1"></div>
                            </div>
							 <div class="jqGrid_wrapper">
                                <table id="table_list_2"></table>
                                <div id="pager_list_2"></div>
                            </div>
                        </div>
</body>
   <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>

    <!-- jqGrid -->
    <script src="js/plugins/jqGrid/i18n/grid.locale-en.js"></script>
    <script src="js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>


    <script>
    var o_id_value = 0;
    $(document).ready(function () {
        // Configuration for jqGrid Example 2
        $("#table_list_1").jqGrid({
			url:'orderjson',
            mtype: 'POST',
            datatype: "json",
            height: 200,
            autowidth: true,
            shrinkToFit: true,
            rowNum: 20,
            rowList: [10, 20, 30],
            colNames:['編號','使用者編號',"是否付款", '建立時間', '修改時間'],
            colModel:[
			    {name:'o_id',index:'o_id',editable: true,editoptions:{readonly:true}, width:40, sorttype:"int",search:true},
			    {name:'u_id',index:'u_id', editable: true,editoptions:{readonly:true}, width:40,search:true},
			    {name:'pay',index:'pay', editable: true,width:60, edittype:"select",formatter: function (cellValue, options, rowObject) {if (cellValue == 1) {return '已付款';}else if(cellValue == 0) {return '未付款';}}, editoptions:{value: {1:'已付款', 0:'未付款'}}, width:10,search:true},
                {name:'createtime',index:'createtime', editable: false, width:90},
                {name:'updatetime',index:'updatetime', editable: false, width:90}
            ],
            pager: "#pager_list_1",
			editurl: "/controller/admin/edit_area.jsp",
            viewrecords: true,
            caption: "區域管理",
            add: true,
            edit: true,
            addtext: 'Add',
            edittext: 'Edit',
            hidegrid: false,
			onSelectRow: function (rowid, status) {
				　selId = rowid;　　//给最外层的selId赋值
				     o_id_value = $('#table_list_1').jqGrid('getCell', selId, 'o_id');
					 $('#table_list_2').jqGrid('setGridParam', { url:'/controller/data/classschool.jsp?o_id=' + o_id_value}).trigger('reloadGrid');//Reloads the grid after edit
				　}
        });
		
		 $("#table_list_2").jqGrid({
			url:'/controller/data/classschool.jsp?a_id=' + o_id_value,
            mtype: 'POST',
            datatype: "json",
            height: 200,
            autowidth: true,
            shrinkToFit: true,
            rowNum: 20,
            rowList: [10, 20, 30],
            colNames:['編號','商品編號','商品名稱','商品假格','商品數量', '建立時間', '修改時間'],
            colModel:[
			    {name:'d_id',index:'d_id',editable: true,editoptions:{readonly:true}, width:20, sorttype:"int",search:true},
			    {name:'b_id',index:'b_id', editable: true,editoptions:{readonly:true}, width:50,search:true},
				{name:'b_name',index:'b_name', editable: true,editoptions:{readonly:true}, width:50,search:true},
				{name:'b_price',index:'b_price', editable: true,editoptions:{readonly:true}, width:120,search:true},
				{name:'b_count',index:'b_count', editable: true,editoptions:{readonly:true}, width:180,search:true},
                {name:'createtime',index:'createtime', editable: true,editoptions:{readonly:true}, width:1},
                {name:'updatetime',index:'updatetime', editable: true,editoptions:{readonly:true}, width:1}
            ],
            pager: "#pager_list_2",
			editurl: "/controller/admin/edit_school.jsp",
            viewrecords: true,
            caption: "合作校管理",
            add: true,
            edit: true,
            addtext: 'Add',
            edittext: 'Edit',
            hidegrid: false
        });

        // Add selection
        $("#table_list_1").setSelection(4, true);
		$("#table_list_2").setSelection(5, true);

        // Setup buttons
        $("#table_list_1").jqGrid('navGrid', '#pager_list_1',
                {edit: true, add: true, del: true, search: true,searchtext: "查找", addtext: "添加",edittext: "编辑",deltext: "删除",refreshtext:"刷新"},
                {
				height: 'auto', 
				width: 'auto',
				 closeAfterEdit: true,//Closes the add window after add
				reloadAfterSubmit: true,
				 drag: true,
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
                         $(this).jqGrid('setGridParam', { datatype: 'json'}).trigger('reloadGrid');//Reloads the grid after edit
                        // return [true, '']
						// $(this).trigger("reloadGrid", [{ current: true }]);
                         return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit
                         return [false, response.responseText]//Captures and displays the response text on th Edit window
                     }
                 }
				},
				 {
				height: 'auto', 
				width: 'auto', 
                 closeAfterAdd: true,//Closes the add window after add
				 reloadAfterSubmit: true,	 
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
						   $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after Add
							//$(this).trigger("reloadGrid", [{ current: true }]);
							//$("#table_list_1").trigger("reloadGrid", { fromServer: true, page: 1 });
							return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                         return [false, response.responseText]
                     }
                 }
             },
             {   //DELETE
                 closeOnEscape: true,
                 closeAfterDelete: true,
				 reloadAfterSubmit: true,
                 closeOnEscape: true,
                 drag: true,
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
                         $(this).trigger("reloadGrid", [{ current: true }]);
                         return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                         return [false, response.responseText]
                     }
                 },
                 delData: {
					 a_id: function () {
                         var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                         var value = $('#table_list_1').jqGrid('getCell', sel_id, 'a_id');
                         return value;
                     }
                 }
             },
             {//SEARCH
                 closeOnEscape: true

             }
        );
		
		 $("#table_list_2").jqGrid('navGrid', '#pager_list_2',
                {edit: true, add: true, del: true, search: true,searchtext: "查找", addtext: "添加",edittext: "编辑",deltext: "删除",refreshtext:"刷新"},
                {
				height: 'auto', 
				width: 'auto',
				 closeAfterEdit: true,//Closes the add window after add
				reloadAfterSubmit: true,
				 drag: true,
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
                         $(this).jqGrid('setGridParam', { datatype: 'json'}).trigger('reloadGrid');//Reloads the grid after edit
                        // return [true, '']
						// $(this).trigger("reloadGrid", [{ current: true }]);
                         return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid'); //Reloads the grid after edit
                         return [false, response.responseText]//Captures and displays the response text on th Edit window
                     }
                 }
				},
				 {
				height: 'auto', 
				width: 'auto',	 
                 closeAfterAdd: true,//Closes the add window after add
				 reloadAfterSubmit: true,	
				 beforeSubmit: function(postdata, formid){
					 postdata.a_id = o_id_value;
					 console.log(postdata);
					 return [true, '']
				},
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
						   $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after Add
							//$(this).trigger("reloadGrid", [{ current: true }]);
							//$("#table_list_2").trigger("reloadGrid", { fromServer: true, page: 1 });
							return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')//Reloads the grid after Add
                         return [false, response.responseText]
                     }
                 }
             },
             {   //DELETE
                 closeOnEscape: true,
                 closeAfterDelete: true,
				 reloadAfterSubmit: true,
                 closeOnEscape: true,
                 drag: true,
                 afterSubmit: function (response, postdata) {
                     if (response.responseText.trim() == "") {
                         $(this).trigger("reloadGrid", [{ current: true }]);
                         return [true, '']
                     }
                     else {
                         $(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid')
                         return [false, response.responseText]
                     }
                 },
                 delData: {
					 sc_id: function () {
                         var sel_id = $('#table_list_2').jqGrid('getGridParam', 'selrow');
                         var value = $('#table_list_2').jqGrid('getCell', sel_id, 'sc_id');
                         return value;
                     },
					  a_id: function () {
                         var sel_id = $('#table_list_1').jqGrid('getGridParam', 'selrow');
                         var value = $('#table_list_1').jqGrid('getCell', sel_id, 'a_id');
                         return value;
                     }
                 }
             },
             {//SEARCH
                 closeOnEscape: true

             }
        );

        // Add responsive to jqGrid
        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_list_1').setGridWidth(width);
			$('#table_list_2').setGridWidth(width);
        });
		

        setTimeout(function(){
            $('.wrapper-content').removeClass('animated fadeInRight');
        },700);

    });


    </script>
</html>