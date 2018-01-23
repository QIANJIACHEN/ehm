<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="sapdailyreport-add-modal" tabindex="-1" role="dialog" aria-labelledby="sapdailyreport-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">日报信息</h3>
            </div>
            <form id="form-sapdailyreportadd" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                   
                    <div class="form-group">
                        <label for="text-nickname">基地ID</label>
                        <select id="addduty" name="duty" class="form-control">
                        	<option value="">请选择</option>
                        	<option value="2">真测试用的2</option>
                        	<option value="1">真测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机型</label>
                        <input type="text" class="form-control" id="addseries" name="addseries"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞机ID</label>
                        <select class="form-control" id="addplaneId" name="addplaneId">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机号</label>
                        <input type="text" class="form-control" id="addtail" name="addtail"
                               placeholder="机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机位置</label>
                        <input type="text" class="form-control" id="addengPosit" name="addengPosit"
                               placeholder="发动机位置">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机ID</label>
                        <select class="form-control" id="addengId" name="addengId">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序号</label>
                        <input type="text" class="form-control" id="addengSn" name="addengSn"
                               placeholder="发动机序号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机设备号</label>
                        <input type="text" class="form-control" id="addengPn" name="addengPn"
                               placeholder="发动机设备号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Rating</label>
                        <input type="text" class="form-control" id="addrating" name="addrating"
                               placeholder="Rating">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Config</label>
                        <input type="text" class="form-control" id="addconfig" name="addconfig"
                               placeholder="Config">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSN</label>
                        <input type="text" class="form-control" id="addetsn" name="addetsn"
                               placeholder="当前ETSN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSN</label>
                        <input type="text" class="form-control" id="addecsn" name="addecsn"
                               placeholder="当前ECSN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前EGTM(℃)</label>
                        <input type="text" class="form-control" id="addegtm" name="addegtm"
                               placeholder="当前EGTM(℃)">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">LLP最小剩余寿命</label>
                        <input type="text" class="form-control" id="addminLlp" name="addminLlp"
                               placeholder="LLP最小剩余寿命">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <textarea rows="4" class="form-control" id="addremark" name="addremark" placeholder="备注"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否正常</label>
                        <select class="form-control" name="addisNormal" id="addisNormal">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">厂家网站监控</label>
                        <input type="text" class="form-control" id="adddeliveryModeMonitoring" name="adddeliveryModeMonitoring"
                               placeholder="厂家网站监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">滑耗监控</label>
                        <input type="text" class="form-control" id="addoilMonitoring" name="addoilMonitoring"
                               placeholder="滑耗监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">振动监控</label>
                        <input type="text" class="form-control" id="addvibratopmMonitoring" name="addvibratopmMonitoring"
                               placeholder="振动监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">磁堵检查报告</label>
                        <input type="text" class="form-control" id="addmagneticPluginSpectionReport" name="addmagneticPluginSpectionReport"
                               placeholder="磁堵检查报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">孔探报告</label>
                        <input type="text" class="form-control" id="addborescopeReport" name="addborescopeReport"
                               placeholder="孔探报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CNR报告</label>
                        <input type="text" class="form-control" id="addcnrReport" name="addcnrReport"
                               placeholder="CNR报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ACARS传输</label>
                        <input type="text" class="form-control" id="addacars" name="addacars"
                               placeholder="ACARS传输">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">航线运行</label>
                        <input type="text" class="form-control" id="addrouteOperation" name="addrouteOperation"
                               placeholder="航线运行">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机滑耗</label>
                        <input type="text" class="form-control" id="addengOil" name="addengOil"
                               placeholder="发动机滑耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ETOPS能力</label>
                        <input type="text" class="form-control" id="addetops" name="addetops"
                               placeholder="ETOPS能力">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">高高原能力</label>
                        <select class="form-control" id="addhHighLand" name="addhHighLand">
                        	<option value="1">是</option>
                        	<option value="0">否</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">营运人</label>
                        <input type="text" class="form-control" id="addcntrOptr" name="addcntrOptr"
                               placeholder="营运人">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">预计拆发日期</label>
                        <input type="text" class="form-control form_datetime" id="addetime" name="addetime"
                               placeholder="预计拆发日期">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSR</label>
                        <input type="text" class="form-control" id="addetsr" name="addetsr"
                               placeholder="当前ETSR">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSR</label>
                        <input type="text" class="form-control" id="addecsr" name="addecsr"
                               placeholder="当前ECSR">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSI</label>
                        <input type="text" class="form-control" id="addetsi" name="addetsi"
                               placeholder="当前ETSI">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSI</label>
                        <input type="text" class="form-control" id="addecsi" name="addecsi"
                               placeholder="当前ECSI">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSO</label>
                        <input type="text" class="form-control" id="addetso" name="addetso"
                               placeholder="当前ETSO">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSO</label>
                        <input type="text" class="form-control" id="addecso" name="addecso"
                               placeholder="当前ECSO">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">装机日期</label>
                        <input type="text" class="form-control form_datetime" id="addptime" name="addptime"
                               placeholder="装机日期" readonly >
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="text-nickname">性能月报编号</label>
                        <input type="text" class="form-control" id="addmonPerformanceNo" name="addmonPerformanceNo"
                               placeholder="性能月报编号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否历史数据</label>
                        <select class="form-control" id="addisHisData" name="addisHisData">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DOC</label>
                        <input type="text" class="form-control" id="adddoc" name="adddoc"
                               placeholder="DOC">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addsapdailyreport()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
