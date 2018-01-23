<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="datacfmperformance-add-modal" tabindex="-1" role="dialog" aria-labelledby="datacfmperformance-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建发动机性能数据</h3>
            </div>
            <form id="form-datacfmperformanceadd" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">tail</label>
                        <select id="addplaneId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机位置</label>
                        <select id="addeposition" class="form-control" style="width: 100%">
                        	<option value="1">左</option>
                        	<option value="2">右</option>
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-username">发动机SN</label>
                        <select id="addengId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ESN</label>
                        <input type="text" class="form-control" id="addesn"
                               placeholder="ESN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <select id="addflightPhase" class="form-control" style="width: 100%">
                        	<option value="1">起飞</option>
                        	<option value="2">巡航</option>
		                </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞行时间</label>
                        <input type="text" class="form-control" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="addflightDateTime"
                               placeholder="飞行时间">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机类型</label>
                        <input type="text" class="form-control" id="addengineType"
                               placeholder="发动机类型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">N1 Phase Angle Rear</label>
                        <input type="text" class="form-control" id="addzphsr"
                               placeholder="N1 Phase Angle Rear">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Core Speed Smoothed</label>
                        <input type="text" class="form-control" id="addgpcn25Smoothed"
                               placeholder="Delta Core Speed Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta EGT Smoothed</label>
                        <input type="text" class="form-control" id="adddegtSmoothed"
                               placeholder="Delta EGT Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">N1 Phase Angle Fwd</label>
                        <input type="text" class="form-control" id="addzphsf"
                               placeholder="N1 Phase Angle Fwd">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">EGT Hot Day Margin Divergence</label>
                        <input type="text" class="form-control" id="addegthdmD"
                               placeholder="EGT Hot Day Margin Divergence">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Fan Vibe Fwd Smoothed</label>
                        <input type="text" class="form-control" id="addzvb1fSmoothed"
                               placeholder="Fan Vibe Fwd Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Fuel Flow</label>
                        <input type="text" class="form-control" id="addgwfm"
                               placeholder="Delta Fuel Flow">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">EGT Hot Day Margin</label>
                        <input type="text" class="form-control" id="addegthdm"
                               placeholder="EGT Hot Day Margin">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Fuel Flow Divergence</label>
                        <input type="text" class="form-control" id="addgwfmD"
                               placeholder="Delta Fuel Flow Divergence">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Fan Vibe Rear</label>
                        <input type="text" class="form-control" id="addzvb1r"
                               placeholder="Fan Vibe Rear">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">EGT Hot Day Margin Divergence Smoothed</label>
                        <input type="text" class="form-control" id="addegthdmDSmoothed"
                               placeholder="EGT Hot Day Margin Divergence Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Oil Temperature</label>
                        <input type="text" class="form-control" id="addztoil"
                               placeholder="Oil Temperature">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Core Vibe Fwd</label>
                        <input type="text" class="form-control" id="addzvb2f"
                               placeholder="Core Vibe Fwd">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Core Vibe Rear</label>
                        <input type="text" class="form-control" id="addzvb2r"
                               placeholder="Core Vibe Rear">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Fan Vibe Fwd</label>
                        <input type="text" class="form-control" id="addzvb1f"
                               placeholder="Fan Vibe Fwd">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Core Vibe Rear Smoothed</label>
                        <input type="text" class="form-control" id="addzvb2rSmoothed"
                               placeholder="Core Vibe Rear Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta EGT Divergence Smoothed</label>
                        <input type="text" class="form-control" id="adddegtDSmoothed"
                               placeholder="Delta EGT Divergence Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Core Speed Divergence</label>
                        <input type="text" class="form-control" id="addgpcn25D"
                               placeholder="Delta Core Speed Divergence">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Fan Vibe Rear Smoothed</label>
                        <input type="text" class="form-control" id="addzvb1rSmoothed"
                               placeholder="Fan Vibe Rear Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Oil Temperature Smoothed</label>
                        <input type="text" class="form-control" id="addztoilSmoothed"
                               placeholder="Oil Temperature Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Fuel Flow Smoothed</label>
                        <input type="text" class="form-control" id="addgwfmSmoothed"
                               placeholder="Delta Fuel Flow Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Core Speed</label>
                        <input type="text" class="form-control" id="addgpcn25"
                               placeholder="Delta Core Speed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Fuel Flow Divergence Smoothed</label>
                        <input type="text" class="form-control" id="addgwfmDSmoothed"
                               placeholder="Delta Fuel Flow Divergence Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta Core Speed Divergence Smoothed</label>
                        <input type="text" class="form-control" id="addgpcn25DSmoothed"
                               placeholder="Delta Core Speed Divergence Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Core Vibe Fwd Smoothed</label>
                        <input type="text" class="form-control" id="addzvb2fSmoothed"
                               placeholder="Core Vibe Fwd Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Oil Pressure Smoothed</label>
                        <input type="text" class="form-control" id="addzpoilSmoothed"
                               placeholder="Oil Pressure Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">EGT Hot Day Margin Smoothed</label>
                        <input type="text" class="form-control" id="addegthdmSmoothed"
                               placeholder="EGT Hot Day Margin Smoothed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta EGT Divergence</label>
                        <input type="text" class="form-control" id="adddegtD"
                               placeholder="Delta EGT Divergence">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Oil Pressure</label>
                        <input type="text" class="form-control" id="addzpoil"
                               placeholder="Oil Pressure">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">EGT</label>
                        <input type="text" class="form-control" id="addzt49"
                               placeholder="EGT">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Delta EGT</label>
                        <input type="text" class="form-control" id="adddegt"
                               placeholder="Delta EGT">
                    </div>
                </div>
                 <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary " onclick="adddatacfmperformance()">新建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
