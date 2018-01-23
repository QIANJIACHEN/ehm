<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="duty-add-modal" tabindex="-1" role="dialog" aria-labelledby="duty-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建部门</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-nickname">上级</label>
                        <select id="addparentId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">名称</label>
                         <input type="text" class="form-control" id="addname"
                               placeholder="名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">角色</label>
                         <select id="addrole" name="roletype" class="form-control" style="width: 100%">
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">所在地</label>
                         <input type="text" class="form-control" id="addlocation"
                               placeholder="所在地">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">分类</label>
                         <select id="addtype" class="form-control" style="width: 100%">
                         	<option value="1">分公司</option>
                         	<option value="2">子公司</option>
                         	<option value="3">执行单位</option>
                         	<option value="4">基地</option>
		                 </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addduty()">新建</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
