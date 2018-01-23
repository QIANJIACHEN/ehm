<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="recorddataplane-info-modal" tabindex="-1" role="dialog" aria-labelledby="recorddataplane-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">飞机属性更变信息</h3>
            </div>
            <form id="form-recorddataplaneinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">ID</label>
                        <input type="tel" class="form-control" id="editid"
                               placeholder="ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-username">TAIL</label>
                        <input type="tel" class="form-control" id="edittail"
                               placeholder="TAIL">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">基地</label>
                        <select class="form-control" id="editduty">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">推力</label>
                        <input type="text" class="form-control" id="editratingPlane"
                               placeholder="推力">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">构型</label>
                        <input type="text" class="form-control" id="editconfigPlane"
                               placeholder="构型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">原始的发动机编码</label>
                        <input type="text" class="form-control" id="editegsnOriginal"
                               placeholder="原始的发动机编码">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">型号1级</label>
                        <input type="text" class="form-control" id="editseries"
                               placeholder="型号1级">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">型号2级</label>
                        <input type="text" class="form-control" id="edittype"
                               placeholder="型号2级">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">型号3级</label>
                        <input type="text" class="form-control" id="editmodel"
                               placeholder="型号3级">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">属性</label>
                        <input type="text" class="form-control" id="editattribute"
                               placeholder="属性">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ETOPS</label>
                        <input type="text" class="form-control" id="editetops"
                               placeholder="ETOPS">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">高高原</label>
                        <select class="form-control" id="edithHighLand">
                        	<option value="1">是</option>
                        	<option value="0">否</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">VARIABLE</label>
                        <input type="text" class="form-control" id="editvariable"
                               placeholder="VARIABLE">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">MSN</label>
                        <input type="text" class="form-control" id="editserial"
                               placeholder="MSN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">LINE</label>
                        <input type="text" class="form-control" id="editline"
                               placeholder="LINE">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">MANUAL</label>
                        <input type="text" class="form-control" id="editmanual"
                               placeholder="MANUAL">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">航空公司（品牌）</label>
                        <input type="text" class="form-control" id="editoperater"
                               placeholder="航空公司（品牌）">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">所有人</label>
                        <input type="text" class="form-control" id="editowner"
                               placeholder="所有人">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <input type="text" class="form-control" id="editremark"
                               placeholder="备注">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">引进方式</label>
                        <input type="text" class="form-control" id="editimportWay"
                               placeholder="引进方式">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">录入人</label>
                        <input type="text" class="form-control" id="edituserId"
                               placeholder="录入人" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">创建时间</label>
                        <input type="text" class="form-control" id="editctime"
                               placeholder="创建时间" readonly>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editrecorddataplane()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
