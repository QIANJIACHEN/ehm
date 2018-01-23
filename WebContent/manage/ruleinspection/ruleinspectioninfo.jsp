<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="ruleinspection-info-modal" tabindex="-1" role="dialog" aria-labelledby="ruleinspection-info-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">检测规则信息</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
                <div class="box-body">
                        
                    <div class="form-group">
                        <label for="text-username">名称</label>
                        <input type="tel" class="form-control" id="editname"
                               placeholder="名称">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">录入人</label>
                        <input type="text" class="form-control" id="edituserId"
                               placeholder="录入人">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <select id="edittype" class="form-control" style="width: 100%">
                         	<option value="1">关闭</option>
                         	<option value="0">开启</option>
		                 </select>
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">警告提示内容</label>
                        <input type="text" class="form-control" id="editcontent"
                               placeholder="警告提示内容">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序列</label>
                        <input type="text" class="form-control" id="editengSeries"
                               placeholder="发动机序列">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机类型</label>
                        <input type="text" class="form-control" id="editengType"
                               placeholder="发动机类型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机模型</label>
                        <input type="text" class="form-control" id="editengModel"
                               placeholder="发动机模型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机构型</label>
                        <input type="text" class="form-control" id="editengConfig"
                               placeholder="发动机构型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">优先级</label>
                        <select id="editorderId" class="form-control" style="width: 100%">
                         	<option value="1">1</option>
                         	<option value="0">0</option>
		                 </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                	<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="editruleinspection()">保存</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
