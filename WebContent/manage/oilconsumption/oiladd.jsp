<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="oil-add-modal" tabindex="-1" role="dialog" aria-labelledby="oil-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建数据</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">维修单位</label>
                        <select id="addduty" name="duty" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机型</label>
                        <input type="text" class="form-control" name="configPlane"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">tail</label>
                        <select id="addtail" name="planeId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">航班号</label>
                        <input type="text" class="form-control" name="fltNo"
                               placeholder="航班号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞行日期</label>
                        <input type="text" class="form-control" name="fltTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               placeholder="飞行日期">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">空中时间</label>
                        <input type="text" class="form-control" name="airTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                               placeholder="空中时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">空地时间</label>
                        <input type="text" class="form-control" name="groundTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
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
                        <input type="text" class="form-control" name="refuelOil1"
                               placeholder="1发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition1"
                               placeholder="1发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference1"
                               placeholder="1发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume1"
                               placeholder="1发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">1发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate1"
                               placeholder="1发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil2"
                               placeholder="2发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition2"
                               placeholder="2发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference2"
                               placeholder="2发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume2"
                               placeholder="2发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">2发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate2"
                               placeholder="2发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil3"
                               placeholder="3发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition3"
                               placeholder="3发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference3"
                               placeholder="3发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume3"
                               placeholder="3发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">3发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate3"
                               placeholder="3发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发加油前滑油量</label>
                        <input type="text" class="form-control" name="refuelOil4"
                               placeholder="4发加油前滑油量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油添加量</label>
                        <input type="text" class="form-control" name="oilAddition4"
                               placeholder="4发滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发加油时间差</label>
                        <input type="text" class="form-control" name="refuelTimeDifference4"
                               placeholder="4发加油时间差">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油消耗</label>
                        <input type="text" class="form-control" name="oilConsume4"
                               placeholder="4发滑油消耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">4发滑油消耗率</label>
                        <input type="text" class="form-control" name="oilConsumeRate4"
                               placeholder="4发滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机警戒值</label>
                        <input type="text" class="form-control" name="engVigilance"
                               placeholder="发动机警戒值">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油添加量</label>
                        <input type="text" class="form-control" name="apuOilAddition"
                               placeholder="APU滑油添加量">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油消耗率</label>
                        <input type="text" class="form-control" name="apuOilConsumeRate"
                               placeholder="APU滑油消耗率">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">APU滑油消耗警戒值</label>
                        <input type="text" class="form-control" name="apuOilConsumeVigilance"
                               placeholder="APU滑油消耗警戒值">
                    </div>
                </div>
                <div class="box-footer" style="text-align: right;">
					<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addoil()">新建</button>
					<button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
