<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="controlfleetengspare-info-modal" tabindex="-1" role="dialog" aria-labelledby="controlfleetplane-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">发动机维修信息</h3>
            </div>
            <form id="form-controlfleetplaneinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">ID</label>
                        <input type="text" class="form-control" id="editid"
                               placeholder="ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-username">发动机编号</label>
                        <select class="form-control engId" id="editengSn">
                        	<option value="0" engSn="0" engId="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">拆发时间</label>
                        <input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editremoveDate"
                               placeholder="拆发时间">
                    </div>
                    
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <input type="text" class="form-control" id="editcondition"
                               placeholder="状态">
                    </div>
                    <div>
                    	<label for="text-nickname">INSTALL_PLAN</label>
                    	<input class="form-control" id="editinstallPlan" placeholder="INSTALL_PLAN">
                    </div>
                    <div>
                    	<label for="text-nickname">LLP_SAP</label>
                    	<input class="form-control" id="editllpSap" placeholder="LLP_SAP">
                    </div>
                    <div>
                    	<label for="text-nickname">CONFIG_ACCESS</label>
                    	<input class="form-control" id="editconfigAccess" placeholder="CONFIG_ACCESS">
                    </div>
                    <div>
                    	<label for="text-nickname">备注</label>
                    	<textarea class="form-control" id="editremark" placeholder="备注"></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editcontrolfleetengspare()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
