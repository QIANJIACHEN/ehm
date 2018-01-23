<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="recordengsvschedule-info-modal" tabindex="-1" role="dialog" aria-labelledby="recordengsvschedule-info-modal">
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
                        <label for="text-username">拆发时间</label>
                        <input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editremoveDate"
                               placeholder="拆发时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">工厂</label>
                        <input type="text" class="form-control" id="editfactory"
                               placeholder="工厂">
                    </div>
                    
                    <div class="form-group">
                        <label for="text-nickname">到达时间</label>
                        <input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editarrived"
                               placeholder="到达时间">
                    </div>
                    <div>
                    	<label for="text-nickname">INDUCTION</label>
                    	<input class="form-control" id="editinduction" placeholder="INDUCTION">
                    </div>
                    <div>
                    	<label for="text-nickname">计划完成时间</label>
                    	<input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editcompletePlan" placeholder="计划完成时间">
                    </div>
                    <div>
                    	<label for="text-nickname">完成时间</label>
                    	<input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editcomplete" placeholder="完成时间">
                    </div>
                    <div>
                    	<label for="text-nickname">送还时间</label>
                    	<input type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control" id="editship" placeholder="送还时间">
                    </div>
                    <div>
                    	<label for="text-nickname">花费</label>
                    	<input class="form-control" id="editcost" placeholder="花费">
                    </div>
                    <div>
                    	<label for="text-nickname">耗时</label>
                    	<input class="form-control" id="edittat" placeholder="耗时（精确到小数点后两位）">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editrecordengsvschedule()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
