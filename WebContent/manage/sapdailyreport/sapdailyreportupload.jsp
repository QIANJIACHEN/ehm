<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="sapdailyreport-upload-modal" tabindex="-1" role="dialog" aria-labelledby="sapdailyreport-upload-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">日报信息</h3>
            </div>
            <form id="form-sapdailyreportadd" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/manage/test/test.do">
                <div class="box-body">
                	<input type="file" name="addfile" id="addfile" >
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right" >提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
