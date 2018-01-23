<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="duty-info-modal" tabindex="-1" role="dialog" aria-labelledby="duty-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">部门信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="box-body">
                    <div class="form-group">
                        <label for="text-nickname">上级</label>
                        <select id="editparentId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">名称</label>
                         <input type="text" class="form-control" id="editname"
                               placeholder="名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">角色</label>
                         <select id="editrole" name="roletype" class="form-control" style="width: 100%">
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">所在地</label>
                         <input type="text" class="form-control" id="editlocation"
                               placeholder="所在地">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">分类</label>
                         <select id="edittype" class="form-control" style="width: 100%">
                         	<option value="1">分公司</option>
                         	<option value="2">子公司</option>
                         	<option value="3">执行单位</option>
                         	<option value="4">基地</option>
		                 </select>
                    </div>
                </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="editduty()">保存</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>