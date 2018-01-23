<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="pwf-add-modal" tabindex="-1" role="dialog" aria-labelledby="pwf-add-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">新建飞机航班关联</h3>
            </div>
            <form id="form-add" method="post" enctype="multipart/form-data">
                <div class="box-body">
                	<div class="form-group">
                        <label for="text-nickname">机号</label>
                        <select id="addplaneId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                	<div class="form-group">
                        <label for="text-nickname">航班</label>
                        <select id="addflightId" class="form-control" style="width: 100%">
		                </select>
                    </div>
                </div>
                <div class="box-footer" style="text-align: right;">
					<input type="reset" id="reset" style="display: none;">
                    <button type="button" class="btn btn-primary" onclick="addpwf()">新建</button>
					<button type="button" class="btn btn-default"  data-dismiss="modal" >取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
