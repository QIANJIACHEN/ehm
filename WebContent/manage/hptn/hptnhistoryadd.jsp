<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="hptnhistory-add-modal" tabindex="-1" role="dialog" aria-labelledby="hptnhistory-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建hptn历史记录</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">engSnUsed</label>
                        <input type="tel" class="form-control" id="addengSnUsed"
                               placeholder="engSnUsed">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">hptnPn</label>
                        <input type="text" class="form-control" id="addhptnPn"
                               placeholder="hptnPn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">hptnSn</label>
                        <input type="text" class="form-control" id="addhptnSn"
                               placeholder="hptnSn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">engPn</label>
                        <input type="text" class="form-control" id="addengPn"
                               placeholder="engPn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onDate</label>
                        <input type="text" class="form-control" id="addonDate"
                               placeholder="onDate">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onEtsn</label>
                        <input type="text" class="form-control" id="addonEtsn"
                               placeholder="onEtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onEcsn</label>
                        <input type="text" class="form-control" id="addonEcsn"
                               placeholder="onEcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onPtsn</label>
                        <input type="text" class="form-control" id="addonPtsn"
                               placeholder="onPtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onPcsn</label>
                        <input type="text" class="form-control" id="addonPcsn"
                               placeholder="onPcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">offDate</label>
                        <input type="text" class="form-control" id="addoffDate"
                               placeholder="offDate">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">offEtsn</label>
                        <input type="text" class="form-control" id="addoffEtsn"
                               placeholder="offEtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">offEcsn</label>
                        <input type="text" class="form-control" id="addoffEcsn"
                               placeholder="offEcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">offPtsn</label>
                        <input type="text" class="form-control" id="addoffPtsn"
                               placeholder="offPtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">offPcsn</label>
                        <input type="text" class="form-control" id="addoffPcsn"
                               placeholder="offPcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">limitSpecial</label>
                        <input type="text" class="form-control" id="addlimitSpecial"
                               placeholder="limitSpecial">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">code</label>
                        <input type="text" class="form-control" id="addcode"
                               placeholder="code">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">remark</label>
                        <input type="text" class="form-control" id="addremark"
                               placeholder="remark">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary " onclick="addhptnhistory()">新建</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
