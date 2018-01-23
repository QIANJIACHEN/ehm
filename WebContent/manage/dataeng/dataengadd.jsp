<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="dataeng-add-modal" tabindex="-1" role="dialog" aria-labelledby="dataeng-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建发动机</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">发动机SN</label>
                        <input type="tel" class="form-control" id="addengSn"
                               placeholder="发动机SN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">SAP平台显示的方式</label>
                        <input type="text" class="form-control" id="addengSnSap"
                               placeholder="SAP平台显示的方式">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序列</label>
                        <input type="text" class="form-control" id="addengSeries"
                               placeholder="发动机序列">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机类型</label>
                        <input type="text" class="form-control" id="addengType"
                               placeholder="发动机类型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机模型</label>
                        <input type="text" class="form-control" id="addengModel"
                               placeholder="发动机模型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机构型</label>
                        <input type="text" class="form-control" id="addengConfig"
                               placeholder="发动机构型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">原始厂商</label>
                        <input type="text" class="form-control" id="adddeliveryMode"
                               placeholder="原始厂商">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">所有人</label>
                        <input type="text" class="form-control" id="addowner"
                               placeholder="所有人">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CODE_CONFIG</label>
                        <input type="text" class="form-control" id="addcodeConfig"
                               placeholder="CODE_CONFIG">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机型号另一种标识</label>
                        <input type="text" class="form-control" id="addengConfigration"
                               placeholder="发动机型号另一种标识">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机设备号</label>
                        <input type="text" class="form-control" id="addengPn"
                               placeholder="发动机设备号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <input type="text" class="form-control" id="addcondition"
                               placeholder="状态">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <input type="text" class="form-control" id="addremark"
                               placeholder="备注">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary " onclick="adddataeng()">新建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
