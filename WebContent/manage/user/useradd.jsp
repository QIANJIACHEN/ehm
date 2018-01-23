<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="user-add-modal" tabindex="-1" role="dialog" aria-labelledby="user-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建用户</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">用户名</label>
                        <input type="tel" class="form-control" id="addusername"
                               placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">姓名</label>
                        <input type="text" class="form-control" id="addrealName"
                               placeholder="姓名">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">密码</label>
                        <input type="text" class="form-control" id="addpassword"
                               placeholder="密码">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">职位</label>
                        <input type="text" class="form-control" id="addposition"
                               placeholder="职位">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">角色</label>
                         <select id="addrole" name="roletype" class="form-control" style="width: 100%">
		                 </select>
		                  
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">手机号</label>
                        <input type="text" class="form-control" id="addphone"
                               placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">基地</label>
                        <select id="addduty" name="roletype" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">邮箱</label>
                        <input type="text" class="form-control" id="addemail"
                               placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">工号</label>
                        <input type="text" class="form-control" id="addnumber"
                               placeholder="工号">
                    </div>
                </div>
                <div class="box-footer" style="text-align: right;">
					<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="adduser()">新建</button>
					<button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
