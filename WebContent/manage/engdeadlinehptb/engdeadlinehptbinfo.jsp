<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="engdeadlinehptb-info-modal" tabindex="-1" role="dialog" aria-labelledby="engdeadlinehptb-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">重要部件门限信息</h3>
            </div>
            <form id="form-engdeadlinehptbinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                	<input type="hidden" id="editid" value="">
                    <div class="form-group">
                        <label for="text-nickname">ENG_SN</label>
                        <select class="form-control engId" id="editengSn">
                        	<option value="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DEADLINE_HPTB</label>
                         <input type="text" class="form-control" id="editdeadLineHptb"
                               placeholder="DEADLINE_HPTB">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DEADLINE_HPTB_EO</label>
                         <input type="text" class="form-control" id="editdeadLineHptbEo"
                               placeholder="DEADLINE_HPTB_EO">
                    </div>
                    
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="editengdeadlinehptb()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
