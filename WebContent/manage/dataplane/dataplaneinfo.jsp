<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="dataplane-info-modal" tabindex="-1" role="dialog" aria-labelledby="dataplane-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">飞机信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text">某个点飞机的唯一标识</label>
                        <input type="tel" class="form-control" id="edittail"
                               placeholder="某个点飞机的唯一标识">
                    </div>
                    <div class="form-group">
                        <label for="text">基地</label>
                        <select id="editduty" name="roletype" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text">推力</label>
                        <input type="text" class="form-control" id="editratingPlane"
                               placeholder="推力">
                    </div>
                    <div class="form-group">
                        <label for="text">构型</label>
                        <input type="text" class="form-control" id="editconfigPlane"
                               placeholder="构型">
                    </div>
                    <div class="form-group">
                        <label for="text">原始的发动机编码</label>
                        <input type="text" class="form-control" id="editegsnOriginal"
                               placeholder="原始的发动机编码">
                    </div>
                    <div class="form-group">
                        <label for="text">型号1级</label>
                        <input type="text" class="form-control" id="editseries"
                               placeholder="型号1级">
                    </div>
                    <div class="form-group">
                        <label for="text">型号2级</label>
                        <input type="text" class="form-control" id="edittype"
                               placeholder="型号2级">
                    </div>
                    <div class="form-group">
                        <label for="text">型号3级</label>
                        <input type="text" class="form-control" id="editmodel"
                               placeholder="型号3级">
                    </div>
                    <div class="form-group">
                        <label for="text">属性</label>
                        <input type="text" class="form-control" id="editattribute"
                               placeholder="属性">
                    </div>
                    <div class="form-group">
                        <label for="text">ETOPS</label>
                        <input type="text" class="form-control" id="editetops"
                               placeholder="ETOPS">
                    </div>
                    <div class="form-group">
                        <label for="text">高高原</label>
                         <select id="edithHighLand" name="roletype" class="form-control" style="width: 100%">
                         	<option value="1">是</option>
                         	<option value="0">否</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text">VARIABLE</label>
                        <input type="text" class="form-control" id="editvariable"
                               placeholder="VARIABLE">
                    </div>
                    <div class="form-group">
                        <label for="text">MSN</label>
                        <input type="text" class="form-control" id="editserial"
                               placeholder="MSN">
                    </div>
                    <div class="form-group">
                        <label for="text">LINE</label>
                        <input type="text" class="form-control" id="editline"
                               placeholder="LINE">
                    </div>
                    <div class="form-group">
                        <label for="text">手册适用性</label>
                        <input type="text" class="form-control" id="editeffectivity"
                               placeholder="手册适用性">
                    </div>
                    <div class="form-group">
                        <label for="text">营运人</label>
                        <input type="text" class="form-control" id="editoperater"
                               placeholder="营运人">
                    </div>
                    <div class="form-group">
                        <label for="text">所有人</label>
                        <input type="text" class="form-control" id="editowner"
                               placeholder="所有人">
                    </div>
                    <div class="form-group">
                        <label for="text">备注</label>
                        <input type="text" class="form-control" id="editremark"
                               placeholder="备注">
                    </div>
                    <div class="form-group">
                        <label for="text">引进方式</label>
                        <input type="text" class="form-control" id="editimportWay"
                               placeholder="引进方式">
                    </div>
                    <div class="form-group">
                        <label for="text">状态</label>
                        <input type="text" class="form-control" id="editcondition"
                               placeholder="状态">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="editdataplane()">保存</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
