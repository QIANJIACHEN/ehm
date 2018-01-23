<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="sapdailyreport-info-modal" tabindex="-1" role="dialog" aria-labelledby="sapdailyreport-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">日报信息</h3>
            </div>
            <form id="form-sapdailyreportinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">ID</label>
                        <input type="tel" class="form-control" id="editid" name="editid"
                               placeholder="ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">基地ID</label>
                        <select id="editduty" name="duty" class="form-control">
                        	<option value="">请选择</option>
                        	<option value="2">真测试用的2</option>
                        	<option value="1">真测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机型</label>
                        <input type="text" class="form-control" id="editseries" name="editseries"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">飞机ID</label>
                        <select class="form-control" id="editplaneId" name="editplaneId">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机号</label>
                        <input type="text" class="form-control" id="edittail" name="edittail"
                               placeholder="机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机位置</label>
                        <input type="text" class="form-control" id="editengPosit" name="editengPosit"
                               placeholder="发动机位置">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机ID</label>
                        <select class="form-control" id="editengId" name="editengId">
                        	<option value="0">请选择</option>
                        	<option value="1">测试用的</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序号</label>
                        <input type="text" class="form-control" id="editengSn" name="editengSn"
                               placeholder="发动机序号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机设备号</label>
                        <input type="text" class="form-control" id="editengPn" name="editengPn"
                               placeholder="发动机设备号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Rating</label>
                        <input type="text" class="form-control" id="editrating" name="editrating"
                               placeholder="Rating">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">Config</label>
                        <input type="text" class="form-control" id="editconfig" name="editconfig"
                               placeholder="Config">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSN</label>
                        <input type="text" class="form-control" id="editetsn" name="editetsn"
                               placeholder="当前ETSN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSN</label>
                        <input type="text" class="form-control" id="editecsn" name="editecsn"
                               placeholder="当前ECSN">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前EGTM(℃)</label>
                        <input type="text" class="form-control" id="editegtm" name="editegtm"
                               placeholder="当前EGTM(℃)">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">LLP最小剩余寿命</label>
                        <input type="text" class="form-control" id="editminLlp" name="editminLlp"
                               placeholder="LLP最小剩余寿命">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">备注</label>
                        <textarea rows="4" class="form-control" id="editremark" name="editremark" placeholder="备注"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否正常</label>
                        <select class="form-control" name="editisNormal" id="editisNormal">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">厂家网站监控</label>
                        <input type="text" class="form-control" id="editdeliveryModeMonitoring" name="editdeliveryModeMonitoring"
                               placeholder="厂家网站监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">滑耗监控</label>
                        <input type="text" class="form-control" id="editoilMonitoring" name="editoilMonitoring"
                               placeholder="滑耗监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">振动监控</label>
                        <input type="text" class="form-control" id="editvibratopmMonitoring" name="editvibratopmMonitoring"
                               placeholder="振动监控">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">磁堵检查报告</label>
                        <input type="text" class="form-control" id="editmagneticPluginSpectionReport" name="editmagneticPluginSpectionReport"
                               placeholder="磁堵检查报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">孔探报告</label>
                        <input type="text" class="form-control" id="editborescopeReport" name="editborescopeReport"
                               placeholder="孔探报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">CNR报告</label>
                        <input type="text" class="form-control" id="editcnrReport" name="editcnrReport"
                               placeholder="CNR报告">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ACARS传输</label>
                        <input type="text" class="form-control" id="editacars" name="editacars"
                               placeholder="ACARS传输">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">航线运行</label>
                        <input type="text" class="form-control" id="editrouteOperation" name="editrouteOperation"
                               placeholder="航线运行">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机滑耗</label>
                        <input type="text" class="form-control" id="editengOil" name="editengOil"
                               placeholder="发动机滑耗">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">ETOPS能力</label>
                        <input type="text" class="form-control" id="editetops" name="editetops"
                               placeholder="ETOPS能力">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">高高原能力</label>
                        <select class="form-control" id="edithHighLand" name="edithHighLand">
                        	<option value="1">是</option>
                        	<option value="0">否</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">营运人</label>
                        <input type="text" class="form-control" id="editcntrOptr" name="editcntrOptr"
                               placeholder="营运人">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">预计拆发日期</label>
                        <input type="text" class="form-control form_datetime" id="editetime" name="editetime"
                               placeholder="预计拆发日期">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSR</label>
                        <input type="text" class="form-control" id="editetsr" name="editetsr"
                               placeholder="当前ETSR">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSR</label>
                        <input type="text" class="form-control" id="editecsr" name="editecsr"
                               placeholder="当前ECSR">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSI</label>
                        <input type="text" class="form-control" id="editetsi" name="editetsi"
                               placeholder="当前ETSI">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSI</label>
                        <input type="text" class="form-control" id="editecsi" name="editecsi"
                               placeholder="当前ECSI">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ETSO</label>
                        <input type="text" class="form-control" id="editetso" name="editetso"
                               placeholder="当前ETSO">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">当前ECSO</label>
                        <input type="text" class="form-control" id="editecso" name="editecso"
                               placeholder="当前ECSO">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">装机日期</label>
                        <input type="text" class="form-control form_datetime" id="editptime" name="editptime"
                               placeholder="装机日期" readonly >
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">创建日期</label>
                        <input type="text" class="form-control" id="editctime" name="editctime"
                               placeholder="创建日期" readonly >
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">创建人ID</label>
                        <input type="text" class="form-control" id="editcUserId" name="editcUserId"
                               placeholder="创建人ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">更改人ID</label>
                        <input type="text" class="form-control" id="edituUserId" name="edituUserId"
                               placeholder="更改人ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">更改日期</label>
                        <input type="text" class="form-control" id="editutime" name="editutime"
                               placeholder="更改日期" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">审核人ID</label>
                        <input type="text" class="form-control" id="editauditor" name="editauditor"
                               placeholder="审核人ID" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">审核日期</label>
                        <input type="text" class="form-control" id="editatime" name="editatime"
                               placeholder="审核日期" readonly>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">性能月报编号</label>
                        <input type="text" class="form-control" id="editmonPerformanceNo" name="editmonPerformanceNo"
                               placeholder="性能月报编号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">是否历史数据</label>
                        <select class="form-control" id="editisHisData" name="editisHisData">
                        	<option value="0">否</option>
                        	<option value="1">是</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DOC</label>
                        <input type="text" class="form-control" id="editdoc" name="editdoc"
                               placeholder="DOC">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editsapdailyreport()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
