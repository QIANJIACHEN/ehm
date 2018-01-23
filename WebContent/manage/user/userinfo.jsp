<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="user-info-modal" tabindex="-1" role="dialog" aria-labelledby="user-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">用户信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">用户名</label>
                        <input type="tel" class="form-control" id="editusername"
                               placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">姓名</label>
                        <input type="text" class="form-control" id="editrealName"
                               placeholder="姓名">
                    </div>
                    <!-- <div class="form-group">
                        <label for="text-nickname">密码</label>
                        <input readonly="readonly" type="text" class="form-control" id="editpassword"
                               placeholder="密码">
                    </div> -->
                    <div class="form-group">
                        <label for="text-nickname">职位</label>
                        <input type="text" class="form-control" id="editposition"
                               placeholder="职位">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">角色</label>
                        <select id="editrole" name="roletype" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">手机号</label>
                        <input type="text" class="form-control" id="editphone"
                               placeholder="手机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">基地</label>
                        <select id="editduty" name="roletype" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">邮箱</label>
                        <input type="text" class="form-control" id="editemail"
                               placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">工号</label>
                        <input type="text" class="form-control" id="editnumber"
                               placeholder="工号">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="edituser()">保存</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
