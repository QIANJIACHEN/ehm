<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="engconditionfleet-info-modal" tabindex="-1" role="dialog" aria-labelledby="engconditionfleet-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">发动机状态简报信息</h3>
            </div>
            <form id="form-ngconditionfleetinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">ID</label>
                        <input type="tel" class="form-control" id="editid"
                               placeholder="ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-username">发动机编号</label>
                        <select class="form-control engId" id="editengId">
                        	<option value="0" engSn="0">请选择</option>
                        	<option value="1" engSn="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSI_START</label>
                        <input type="text" class="form-control" id="edittsiStart"
                               placeholder="TSI_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSI_START</label>
                        <input type="text" class="form-control" id="editcsiStart"
                               placeholder="CSI_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">SV_TIME</label>
                        <input type="text" class="form-control" id="editsvTime"
                               placeholder="SV_TIME">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSR_START</label>
                        <input type="text" class="form-control" id="edittsrStart"
                               placeholder="TSR_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSR_START</label>
                        <input type="text" class="form-control" id="editcsrStart"
                               placeholder="CSR_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TSO_START</label>
                        <input type="text" class="form-control" id="edittsoStart"
                               placeholder="TSO_START">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CSO_START</label>
                        <input type="text" class="form-control" id="editcsoStart"
                               placeholder="CSO_START">
                    </div>
                   	<div class="form-group">
                        <label for="text-nickname">创建时间</label>
                        <input type="text" class="form-control" id="editctime"
                               placeholder="创建时间" readonly>
                    </div>
                   
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editengconditionfleet()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
