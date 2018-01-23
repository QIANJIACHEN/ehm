<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="role-info-modal" tabindex="-1" role="dialog" aria-labelledby="role-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">角色信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">角色名称</label>
                        <input type="tel" class="form-control" id="editname"
                               placeholder="角色名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">上级</label>
                        <select id="editpId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否有效</label>
                         <select id="editstatus" name="roletype" class="form-control" style="width: 100%">
                         	<option value="0">无效</option>
                         	<option value="1">有效</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <input type="text" class="form-control" id="editremark"
                               placeholder="备注">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">创建时间</label>
                        <input readonly="readonly" type="text" class="form-control" id="editctime"
                               placeholder="创建时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">修改时间</label>
                        <input readonly="readonly" type="text" class="form-control" id="editutime"
                               placeholder="修改时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">排序</label>
                        <select id="editlistorder" class="form-control" style="width: 100%">
                         	<option value="0">0</option>
                         	<option value="1">1</option>
		                 </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="editrole()">保存</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
