<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="controlfleetengspare-add-modal" tabindex="-1" role="dialog" aria-labelledby="controlfleetengspare-add-modal-lable">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">发动机维修信息</h3>
            </div>
            <form id="form-controlfleetplaneadd" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">发动机编号</label>
                        <select class="form-control engId" id="addengId">
                        	<option value="0" engSn="0" engId="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">拆发时间</label>
                         <input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="addremoveDate"
                               placeholder="拆发时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <input type="text" class="form-control" id="addcondition"
                               placeholder="状态" >
                    </div>
                    
                    <div class="form-group">
                        <label for="text-nickname">INSTALL_PLAN</label>
                        <input type="text" class="form-control" id="addinstallPlan"
                               placeholder="INSTALL_PLAN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">LLP_SAP</label>
                        <input type="text" class="form-control" id="addllpSap"
                               placeholder="LLP_SAP">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CONFIG_ACCESS</label>
                        <input type="text" class="form-control" id="addconfigAccess"
                               placeholder="CODE_POSITION">
                    </div>
                    <div>
                    	<label for="text-nickname">备注</label>
                    	<textarea class="form-control" id="addremark" placeholder="备注"></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addcontrolfleetengspare()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
