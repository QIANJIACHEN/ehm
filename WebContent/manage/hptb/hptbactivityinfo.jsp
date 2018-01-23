<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="hptbactivity-info-modal" tabindex="-1" role="dialog" aria-labelledby="hptbactivity-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">hptb信息</h3>
            </div>
            <form id="form-info" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">engSn</label>
                        <input readonly="readonly" type="text" class="form-control" id="editengSn"
                               placeholder="engSn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">hptbPn</label>
                        <input type="text" class="form-control" id="edithptbPn"
                               placeholder="hptbPn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">hptbSn</label>
                        <input type="text" class="form-control" id="edithptbSn"
                               placeholder="hptbSn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">engPn</label>
                        <input type="text" class="form-control" id="editengPn"
                               placeholder="engPn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onDate</label>
                        <input type="text" class="form-control" id="editonDate"
                               placeholder="onDate">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onEtsn</label>
                        <input type="text" class="form-control" id="editonEtsn"
                               placeholder="onEtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onEcsn</label>
                        <input type="text" class="form-control" id="editonEcsn"
                               placeholder="onEcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onPtsn</label>
                        <input type="text" class="form-control" id="editonPtsn"
                               placeholder="onPtsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">onPcsn</label>
                        <input type="text" class="form-control" id="editonPcsn"
                               placeholder="onPcsn">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">limitSpecial</label>
                        <input type="text" class="form-control" id="editlimitSpecial"
                               placeholder="limitSpecial">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">code</label>
                        <input type="text" class="form-control" id="editcode"
                               placeholder="code">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">remark</label>
                        <input type="text" class="form-control" id="editremark"
                               placeholder="remark">
                    </div>
                </div>
                <div class="box-footer" style="text-align: right;">
                    <button type="button" class="btn btn-primary" onclick="edithptbactivity()">保存</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
