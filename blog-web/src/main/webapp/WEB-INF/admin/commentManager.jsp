<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>评论管理</title>
		<link href="${pageContext.request.contextPath}/js/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    
	    <!-- Font Awesome -->
	    <link href="${pageContext.request.contextPath}/js/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/limonte-sweetalert2/6.4.1/sweetalert2.min.css">
		   <!-- Custom Theme Style -->
	    <link href="${pageContext.request.contextPath}/css/custom.min.css" rel="stylesheet">
	    <style type="text/css">
	  	.menuItemColor{background-color:#272C35}
	  </style>
	</head>
	<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0; background:#FFFFFF">
              <a href="${pageContext.request.contextPath}/admin/appearance.action" class="site_title"><img src="${pageContext.request.contextPath}/images/headImg.png"style="margin-bottom: 20px;" height="60px" width="60px"/>&nbsp;&nbsp;<span style="color:#000000">Cat BLOG</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                
                <ul id="menuList" class="nav side-menu" style="margin-top:0px;">
									<li id="firstItem">
										<a style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-tachometer" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>仪表盘</span></a>
									</li>
									<li>
										<a style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>发布文章</span></a>
									</li>
									<li id="essayManager">
										<a style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-list"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>文章管理</span></a>
									</li>
									<li>
										<a style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-file-text"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>页面管理</span></a>
									</li>
									<li><a  style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-cubes"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>其他管理</span><span class="fa fa-plus md-add"></span></a>
										<ul id="qtItem" class="nav side_menu">
											<li><a href="javascript:void(0);" style="color:#75798B">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comments"></i><span>评论管理</span></a></li>
											<li><a href="javascript:void(0);" style="color:#75798B">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-tags"></i><span>分类/标签</span></a></li>
										</ul>
									</li>
									<li>
										<a style="margin-bottom: 0px;padding-bottom:18px;"><i class="fa fa-gear"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>系统设置</span>
									</a>
                   
                  </li>
                </ul>
              </div>
             

            </div>
         
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="" id="rightLi" >
                  <a id="rightHeadImg" href="javascript:;" class="user-profile dropdown-toggle"  data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/images/img.jpg" style="width:50px; height:50px;" alt="">
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right" style="width:160px; height: 120px;border:1px solid #D6D6D6">
                     <li style="margin: 0px;"><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-eye"></i>&nbsp;&nbsp;<span>查看网站</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/myself.action"><i class="fa fa-sun-o"></i>&nbsp;&nbsp;<span>个人设置</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/exit.action"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;<span>注销</span></a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->









        <!-- page content -->
        <div class="right_col" role="main">
        	<div class="row"  style="width: 1500px;">
			<div class="col-sm-12">
				<h4 class="page-title">评论管理</h4>
			</div>
			<div class="col-md-12">
		        <table class="table table-striped table-bordered">
		            <thead>
		            <tr>
		                <th>评论内容</th>
		                <th>评论人</th>
		                <th>评论时间</th>
		                <th>操作</th>
		            </tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${requestScope.discusss}" var="discuss">
		            	<tr cid="1">
			                <td>
			                    <a href="${pageContext.request.contextPath}/admin/showEssay.action?essayId=${discuss.eId}" target="_blank"><p>${discuss.dContent}</p>
								</a>
			                </td>
			                <td>${discuss.dName}</td>
			                <td><fmt:formatDate value="${discuss.dTime}"/></td>
			                <td>
			                    <a href="javascript:void(0)" onclick="reply('${discuss.dId}');" class="btn btn-primary btn-sm waves-effect waves-light m-b-5"><i class="fa fa-edit"></i> <span>回复</span></a>
			                    <a href="${pageContext.request.contextPath}/admin/deleteDiscuss.action?discussId=${discuss.dId}" class="btn btn-danger btn-sm waves-effect waves-light m-b-5"><i class="fa fa-trash-o"></i> <span>删除</span></a>
			                </td>
			            </tr>
		            </c:forEach>
		            </tbody>
		        </table>
		        <div class="clearfix"></div>
		<ul class="pagination m-b-5 pull-right">
		
		    <li  class="active" ><a href="?page=1">1</a></li>
		
		    <li><span>共1页</span></li>
		</ul>
		    </div>
		</div>
	    </div>
        
        </div>
      
      </div>
    </div>
	<script>
			function reply(dPid){
				 	swal({  
				            title: '回复评论',  
				            text:'请输入你要回复的内容:',
				            confirmButtonText: '回复',  
				            confirmButtonColor: '#3085D6',
				            cancelButtonText: '取消', 
				            cancelButtonColor: '#AAAAAA',
				            input: 'text',
				            inputValidator: function(value) {  
				                return new Promise(function(resolve, reject) {  
				                    if(value) {  
				                        resolve();  
				                    } else {  
				                        reject('至少要输入一个值哦！');  
				                    }  
				                });  
				            }  
				        }).then(function(result) {
				        	var url = "${pageContext.request.contextPath}/admin/ajaxDiscussManager.action";
				        	var data={
				        			"dPid":dPid,
				        			"dContent":result
				        	};
				        	$.post(url,data,function(msg){
				        		if(msg=="true"){
				        			swal({  
							            title: '温馨提示',
							            type: "success",
							            text: "回复成功！",  
							            confirmButtonText: '确认',  
							            confirmButtonColor: '#3085D6', 
							            timer: 3000
							        })
							        location.herf="${pageContext.request.contextPath}/admin/commentManager.action";
				        		}
				        	});
				        });  
			}
	</script>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/js/bootstrap/dist/js/bootstrap.min.js"></script>


    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
		<script src="${pageContext.request.contextPath}/js/limonte-sweetalert2/6.4.1/sweetalert2.min.js"></script>
	
		<script type="text/javascript">
		
				$(function(){
					$("#menuList li:eq(4)").addClass("active");
					$("#qtItem li:eq(0) a").css("color","#FFFFFF");
					
					$("li").mouseup(function(){
							var vv = $(this);
							var value = vv.find("span:first").text();
							if(contains(value,"仪表盘")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/appearance.action");
							}else if(contains(value,"发布文章")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/writerEssay.action");
							}else if(contains(value,"文章管理")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/essayManager.action");
							}else if(contains(value,"页面管理")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/pageManager.action");
							}else if(contains(value,"评论管理")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/commentManager.action");
							}else if(contains(value,"分类/标签")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/classAndLabelManager.action");
							}else if(contains(value,"系统设置")){
								$(location).attr("href","${pageContext.request.contextPath}/admin/settings.action");
							}
							if(contains(value,"其他管理")){
								$("#qtItem").css("background-color","#2F353F");
							}
					});
					
				});
				
				//判断父字符串是否包含子串
				function contains(parent,child){
					if(parent.indexOf(child)>=0){
						return true;
					}
					return false;
				}
				
				//跳转到个人设置
				function grSetting(){
					$("li.active").removeClass("active");
					$("#contentPage").attr("src","${pageContext.request.contextPath}/admin/myself.action");
					
				}
				
		</script>
  </body>
</html>