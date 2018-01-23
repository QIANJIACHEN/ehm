<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="rulecomputation-add-modal" tabindex="-1" role="dialog" aria-labelledby="rulecomputation-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新增计算规则信息</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">监测规则表ID</label>
                        <input type="tel" class="form-control" id="addinspectionId"
                               placeholder="监测规则表ID">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">条件类型</label>
                        <select id="addtype" class="form-control" style="width: 100%">
                         	<option value="0">第一个条件</option>
                         	<option value="1">and</option>
                         	<option value="2">or</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">规则参数ID</label>
                        <input type="text" class="form-control" id="addruleId"
                               placeholder="规则参数ID">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">最大值</label>
                        <input type="text" class="form-control" id="addmaxVal"
                               placeholder="最大值">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">最小值</label>
                        <input type="text" class="form-control" id="addminVal"
                               placeholder="最小值">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addrulecomputation()">创建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
