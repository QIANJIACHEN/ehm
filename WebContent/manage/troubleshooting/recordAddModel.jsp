<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="recordAdd-modal" tabindex="-1" role="dialog" aria-labelledby="record-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title" id="sub-title">新建</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
            <input type="hidden" class="form-control" id="type-add"  value="2"/>
            <input type="hidden" class="form-control" name="id" id="id-add" />
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">执管单位</label>
                        <input type="tel" class="form-control" id="duty-add"
                               placeholder="执管单位">
                    </div>
                    <div class="form-group">
                        <label for="text-username">机型</label>
                        <input type="tel" class="form-control" id="stries-add"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机号</label>
                        <input type="text" class="form-control" id="tail-add"
                               placeholder="机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">位置</label>
                        <input type="text" class="form-control" id="engPosit-add"
                               placeholder="位置">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序号</label>
                        <input type="text" class="form-control" id="engSn-add"
                               placeholder="发动机序号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <input type="text" class="form-control" id="status-add"
                               placeholder="状态">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">故障件名称</label>
                        <input type="text" class="form-control" id="name-add"
                               placeholder="故障件名称">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" id="subbtn" class="btn btn-primary pull-right" onclick="subAddActivity()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
	function subAddActivity(){
		var type = $('#type-add').val();
		var id = $('#id-add').val();
		var duty = $('#duty-add').val();
		var stries = $('#stries-add').val();
		var tail = $('#tail-add').val();
		var engPosit = $('#engPosit-add').val();
		var engSn = $('#engSn-add').val();
		var status = $('#status-add').val();
		var name = $('#name-add').val();
		$.ajax({
			type : "post",
			data : {'type':type,'id':id,'duty':duty,'stries':stries,'tail':tail,'engPosit':engPosit,'engSn':engSn,'status':status,'name':name},
			url : "${pageContext.request.contextPath}/manage/troubleShooting/recordaddupdate.do",
			success : function(data){
				window.location.reload(true);
			}
		})
	}
</script>