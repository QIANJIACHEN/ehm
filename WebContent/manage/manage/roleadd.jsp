<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="role-add-modal" tabindex="-1" role="dialog" aria-labelledby="role-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建角色</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">角色名称</label>
                        <input type="tel" class="form-control" id="addname"
                               placeholder="角色名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">上级</label>
                        <select id="addpId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否有效</label>
                         <select id="addstatus" class="form-control" style="width: 100%">
                         	<option value="0">无效</option>
                         	<option value="1">有效</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <input type="text" class="form-control" id="addremark"
                               placeholder="备注">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">排序</label>
                        <select id="addlistorder" class="form-control" style="width: 100%">
                         	<option value="0">0</option>
                         	<option value="1">1</option>
		                 </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addrole()">新建</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
