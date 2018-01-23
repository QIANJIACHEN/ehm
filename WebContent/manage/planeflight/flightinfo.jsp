<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="flight-info-modal" tabindex="-1" role="dialog" aria-labelledby="flight-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">航班信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                	 <input type="hidden" id="id" name="id">
                	 <div class="form-group">
                        <label for="text">航班号</label>
                        <input type="text" class="form-control" name="number" id="number"
                               placeholder="航班号">
                     </div>
                     <div class="form-group">
                        <label for="text">飞行时间</label>
                        <input type="text" class="form-control" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="flyTime" id="flyTime"
                               placeholder="飞行时间">
                    </div>
                    <div class="form-group">
                        <label for="text">空中时间</label>
                        <input type="text" class="form-control" name="airTime" id="airTime"
                               placeholder="空中时间">
                    </div>
                    <div class="form-group">
                        <label for="text">空地时间</label>
                        <input type="text" class="form-control" name="floorTime " id="floorTime"
                               placeholder="空地时间">
                    </div>
                    <div class="form-group">
                        <label for="text">起飞航站</label>
                        <select name="sTerminal" class="form-control" style="width: 100%">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text">到达航站</label>
                        <select name="eTerminal" class="form-control" style="width: 100%">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
		                </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary" onclick="editflight()">保存</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
