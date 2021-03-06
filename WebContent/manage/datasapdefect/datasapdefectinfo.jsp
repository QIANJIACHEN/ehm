<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="datasapdefect-info-modal" tabindex="-1" role="dialog" aria-labelledby="datasapdefect-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">故障件信息</h3>
            </div>
            <form id="form-datasapdefectinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                	<input type="hidden" id="editid" value="">
                    <div class="form-group">
                        <label for="text-nickname">基地</label>
                        <select class="form-control dutyId" id="editduty">
                        	<option value="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机型</label>
                         <input type="text" class="form-control" id="editseries"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">TAIL</label>
                         <select class="form-control tail" id="edittail">
                        	<option value="0">请选择</option>
                        </select>
                    </div>
                    <div>
                    	<label for="text-nickname">发动机序号</label>
                         <select class="form-control engId" id="editengSn">
                        	<option value="0">请选择</option>
                        </select>
                    </div>
                    <div>
                    	<label for="text-nickname">发动机位置</label>
                         <select class="form-control" id="editengPosit">
                        	<option value="1">左发</option>
                        	<option value="2">右发</option>
                        </select>
                    </div>
                    <div>
                    	<label for="text-nickname">是否重点监控</label>
                         <select class="form-control" id="editstatus">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">故障件名称</label>
                         <input type="text" class="form-control" id="editname"
                               placeholder="故障件名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                         <input type="text" class="form-control" id="editremark"
                               placeholder="备注">
                    </div>
                    
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editdatasapdefect()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
