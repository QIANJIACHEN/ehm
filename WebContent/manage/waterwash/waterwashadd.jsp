<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="waterwash-add-modal" tabindex="-1" role="dialog" aria-labelledby="user-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">水洗信息</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    
                    <div class="form-group">
                        <label for="text-username">设备参数</label>
                        <input type="tel" class="form-control" id="addparameterApparatus"
                               placeholder="设备参数">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">水洗人员</label>
                        <select class="form-control" id="adduserId">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">地理位置</label>
                        <input type="text" class="form-control" id="addgeographic"
                               placeholder="地理位置">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">天气</label>
                        <input type="text" class="form-control" id="addweather"
                               placeholder="天气">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机型号</label>
                        <select class="form-control engId" id="addengId">
                        	<option value="0" engId="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">效果</label>
                        <input type="text" class="form-control" id="addresult"
                               placeholder="效果">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">评级</label>
                        <input type="text" class="form-control" id="addlevel"
                               placeholder="评级">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">持续时间</label>
                        <input type="text"  class="form-control " onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="adddurationTime"
                               placeholder="持续时间">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="addwaterwash()">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>

