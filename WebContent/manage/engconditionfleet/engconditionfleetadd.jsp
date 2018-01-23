<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="engconditionfleet-add-modal" tabindex="-1" role="dialog" aria-labelledby="engconditionfleet-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">发动机状态简报信息</h3>
            </div>
            <form id="form-ngconditionfleetadd" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    
                    <div class="form-group">
                        <label for="text-username">发动机编号</label>
                        <select class="form-control engId" id="addengId">
                        	<option value="0" engSn="0">请选择</option>
                        	<option value="1" engSn="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSI_START</label>
                        <input type="text" class="form-control " id="addtsiStart"
                               placeholder="TSI_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSI_START</label>
                        <input type="text" class="form-control" id="addcsiStart"
                               placeholder="CSI_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">SV_TIME</label>
                        <input type="text" class="form-control" id="addsvTime"
                               placeholder="SV_TIME">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSR_START</label>
                        <input type="text" class="form-control" id="addtsrStart"
                               placeholder="TSR_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSR_START</label>
                        <input type="text" class="form-control" id="addcsrStart"
                               placeholder="CSR_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSO_START</label>
                        <input type="text" class="form-control" id="addtsoStart"
                               placeholder="TSO_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSO_START</label>
                        <input type="text" class="form-control" id="addcsoStart"
                               placeholder="CSO_START">
                    </div>
                   
                   
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addengconditionfleet()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
