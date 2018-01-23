<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="engdeadlinellp-add-modal" tabindex="-1" role="dialog" aria-labelledby="engdeadlinellp-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">发动机备发信息</h3>
            </div>
            <form id="form-engdeadlinellpinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-nickname">ENG_SN</label>
                        <select class="form-control engId" id="addengSn">
                        	<option value="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DEADLINE_LLP</label>
                         <input type="text" class="form-control" id="adddeadLineLlp"
                               placeholder="DEADLINE_LLP">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">DEADLINE_211</label>
                         <input type="text" class="form-control" id="adddeadLine211"
                               placeholder="DEADLINE_211">
                    </div>
                    
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addengdeadlinellp()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
