<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="troubleshooting-add-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">添加故障记录</h3>
            </div>
            <form method="post">
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-bh">发动机编号</label>
                        <input type="text" class="form-control" id="text-bh"
                               placeholder="发动机编号">
                    </div>
                    <div class="form-group">
                        <label for="text-desp">故障描述</label>
                        <input type="text" class="form-control" id="text-desp"
                               placeholder="故障描述">
                    </div>
                    <div class="form-group">
                        <label for="text-status">状态</label>
                        <input type="text" class="form-control" id="text-status"
                               placeholder="状态">
                    </div>
                    <div class="form-group">
                        <label for="text-engineer">发动机类型</label>
                        <input type="text" class="form-control" id="text-engineer"
                               placeholder="发动机类型">
                    </div>
                    <div class="form-group">
                        <label for="text-engineerbh">发动机编号</label>
                        <input type="text" class="form-control" id="text-engineerbh"
                               placeholder="发动机编号">
                    </div>
                    <div class="form-group">
                        <label for="text-date">发生日期</label>
                        <input type="text" class="form-control" id="text-date"
                               placeholder="发生日期">
                    </div>
                </div>
                <div class="box-footer" style="text-align:right">
                    <button type="button" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>