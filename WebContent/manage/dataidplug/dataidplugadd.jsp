<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="dataidplug-add-modal" tabindex="-1" role="dialog" aria-labelledby="dataidplug-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建IDPLUG数据</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">发动机SN</label>
                        <select id="addengId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">转速</label>
                        <input type="text" class="form-control" id="addrating"
                               placeholder="转速">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞机型号</label>
                        <input type="text" class="form-control" id="addplaneType"
                               placeholder="飞机型号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">IDPLUG_PN</label>
                        <input type="text" class="form-control" id="addidPlugPn"
                               placeholder="IDPLUG_PN">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary " onclick="adddataidplug()">新建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
