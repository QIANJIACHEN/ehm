<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="oil-info-modal" tabindex="-1" role="dialog" aria-labelledby="oil-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">数据信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <input type="hidden" class="form-control" name="id" id="id">
                    <div class="form-group">
                        <label for="text-username">维修单位</label>
                        <select id="editduty" name="duty" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机型</label>
                        <input type="text" class="form-control" name="configPlane" id="configPlane"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">tail</label>
                        <select id="edittail" name="planeId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">航班号</label>
                        <input type="text" class="form-control" name="fltNo" id="fltNo"
                               placeholder="航班号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞行日期</label>
                        <input type="text" class="form-control" name="fltTime" id="fltTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               placeholder="飞行日期">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">空中时间</label>
                        <input type="text" class="form-control" name="airTime" id="airTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               placeholder="空中时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">空地时间</label>
                        <input type="text" class="form-control" name="groundTime" id="groundTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               placeholder="空地时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">起飞航站</label>
                        <select name="startTerminal" class="form-control" style="width: 100%">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">到达航站</label>
                        <select name="endTerminal" class="form-control" style="width: 100%">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil1" id="refuelOil1"
                               placeholder="1发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition1" id="oilAddition1"
                               placeholder="1发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference1" id="refuelTimeDifference1"
                               placeholder="1发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume1" id="oilConsume1"
                               placeholder="1发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate1" id="oilConsumeRate1"
                               placeholder="1发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil2" id="refuelOil2"
                               placeholder="2发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition2" id="oilAddition2"
                               placeholder="2发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference2" id="refuelTimeDifference2"
                               placeholder="2发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume2" id="oilConsume2"
                               placeholder="2发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate2" id="oilConsumeRate2"
                               placeholder="2发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil3" id="refuelOil3"
                               placeholder="3发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition3" id="oilAddition3"
                               placeholder="3发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference3" id="refuelTimeDifference3"
                               placeholder="3发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume3" id="oilConsume3"
                               placeholder="3发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate3" id="oilConsumeRate3"
                               placeholder="3发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil4" id="refuelOil4"
                               placeholder="4发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition4" id="oilAddition4"
                               placeholder="4发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference4" id="refuelTimeDifference4"
                               placeholder="4发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume4" id="oilConsume4"
                               placeholder="4发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate4" id="oilConsumeRate4"
                               placeholder="4发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机警戒值</label>
                        <input type="text" class="form-control" name="engVigilance" id="engVigilance"
                               placeholder="发动机警戒值">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油添加量</label>
                        <input type="text" class="form-control" name="apuOilAddition" id="apuOilAddition"
                               placeholder="APU滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油消耗率</label>
                        <input type="text" class="form-control" name="apuOilConsumeRate" id="apuOilConsumeRate"
                               placeholder="APU滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油消耗警戒值</label>
                        <input type="text" class="form-control" name="apuOilConsumeVigilance" id="apuOilConsumeVigilance"
                               placeholder="APU滑油消耗警戒值">
                    </div>
                </div>
                <div class="box-footer" style="text-align: right;">
                    <button type="button" class="btn btn-primary" onclick="editoil()">保存</button>
					<button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
