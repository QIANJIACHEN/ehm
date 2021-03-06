<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="controlfleetplane-add-modal" tabindex="-1" role="dialog" aria-labelledby="controlfleetplane-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">飞机发动机关联信息</h3>
            </div>
            <form id="form-controlfleetplaneadd" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                   
                    <div class="form-group">
                        <label for="text-username">飞机号</label>
                        <select class="form-control planeId" id="addplaneId">
                        	<option value="0" tail="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-username">发动机编号</label>
                        <select class="form-control engId" id="addengId">
                        	<option value="0"  engPn="0" engSn="0" >请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机位置</label>
                        
                         <select class="form-control" id="addengPosition">
                         	<option value="1">左发</option>
                         	<option value="2">右发</option>
                         </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机设备号</label>
                        <input type="text" class="form-control" id="addengPn"
                               placeholder="发动机设备号" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label for="text-nickname">CODE_POSITION</label>
                        <input type="text" class="form-control" id="addcodePosition"
                               placeholder="CODE_POSITION">
                    </div>
                    <div>
                    	<label for="text-nickname">备注</label>
                    	<textarea class="form-control" id="addremark" placeholder="备注"></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addcontrolfleetplane()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
