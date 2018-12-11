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
 <div class="jqGrid_wrapper">
                                <table id="table_list_2"></table>
                                <div id="pager_list_2"></div>
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
        $(document).ready(function () {
            // Configuration for jqGrid Example 2
            $("#table_list_2").jqGrid({
				url:'bookjson',
                mtype: 'POST',
                datatype: "json",
                height: 450,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 20,
                rowList: [10, 20, 30],
                colNames:['編號','書名','價錢'],
                colModel:[
				    {name:'b_id',index:'b_id',editable: true,editoptions:{readonly:true}, width:50, sorttype:"int",search:true},
				    {name:'b_name',index:'b_name', editable: true, width:50,search:true},
					{name:'b_price',index:'b_price', editable: true, width:50,search:true}
                ],
                pager: "#pager_list_2",
				editurl: "bookedit",
                viewrecords: true,
                caption: "書本管理",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                hidegrid: false
            });

            // Add selection
            $("#table_list_2").setSelection(4, true);


            // Setup buttons
            $("#table_list_2").jqGrid('navGrid', '#pager_list_2',
                    {edit: true, add: true, del: true, search: true,searchtext: "查找", addtext: "添加",edittext: "编辑",deltext: "删除",refreshtext:"刷新"},
                    {
					height: 500, 
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
                     closeAfterAdd: true,//Closes the add window after add
					 reloadAfterSubmit: true,	 
                     afterSubmit: function (response, postdata) {
                         if (response.responseText.trim() == "") {
							   //$(this).jqGrid('setGridParam', { datatype: 'json' }).trigger('reloadGrid');//Reloads the grid after Add
								//$(this).trigger("reloadGrid", [{ current: true }]);
								$("#table_list_2").trigger("reloadGrid", { fromServer: true, page: 1 });
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
						 b_id: function () {
                             var sel_id = $('#table_list_2').jqGrid('getGridParam', 'selrow');
                             var value = $('#table_list_2').jqGrid('getCell', sel_id, 'b_id');
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
                $('#table_list_2').setGridWidth(width);
            });
			

            setTimeout(function(){
                $('.wrapper-content').removeClass('animated fadeInRight');
            },700);

        });

    </script>
</html>