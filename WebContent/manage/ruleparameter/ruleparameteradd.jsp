<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="ruleparameter-add-modal" tabindex="-1" role="dialog" aria-labelledby="ruleparameter-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建规则参数信息</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">上级ID</label>
                        <input type="tel" class="form-control" id="addparentId"
                               placeholder="上级ID">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">类型</label>
                        <select id="addtype" class="form-control" style="width: 100%">
                         	<option value="0">表</option>
                         	<option value="1">字段</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">值</label>
                        <input type="text" class="form-control" id="addval"
                               placeholder="值">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">注释</label>
                        <input type="text" class="form-control" id="addannotation"
                               placeholder="注释">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否加入计算</label>
                        <select id="addisCalculate" class="form-control" style="width: 100%">
                         	<option value="0">否</option>
                         	<option value="1">是</option>
		                 </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addruleparameter()">新建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
