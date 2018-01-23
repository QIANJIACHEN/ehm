<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="ruleinspection-add-modal" tabindex="-1" role="dialog" aria-labelledby="user-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">故障信息</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-nickname">故障</label>
                        <input type="text" class="form-control" id="addcase_"
                               placeholder="故障">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">RESOURCE</label>
                        <input type="text" class="form-control" id="addresource"
                               placeholder="RESOURCE">
                    </div>
                    
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-primary pull-right" onclick="addruleinspection()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
