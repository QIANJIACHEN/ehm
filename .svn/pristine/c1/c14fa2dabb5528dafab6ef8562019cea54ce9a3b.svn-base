<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="record-modal" tabindex="-1" role="dialog" aria-labelledby="record-modal-label">
    <div class="modal-dialog" role="document">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title" id="sub-title">新建</h3>
            </div>
            <form id="form-userinfo" method="post" enctype="multipart/form-data">
            <input type="hidden" class="form-control" id="type"  value="1"/>
            <input type="hidden" class="form-control" name="id" id="id" />
                <div class="box-body">
                    <div class="form-group">
                        <label for="text-username">执管单位</label>
                        <input type="tel" class="form-control" id="duty"
                               placeholder="执管单位">
                    </div>
                    <div class="form-group">
                        <label for="text-username">机型</label>
                        <input type="tel" class="form-control" id="stries"
                               placeholder="机型">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">机号</label>
                        <input type="text" class="form-control" id="tail"
                               placeholder="机号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">位置</label>
                        <input type="text" class="form-control" id="engPosit"
                               placeholder="位置">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">发动机序号</label>
                        <input type="text" class="form-control" id="engSn"
                               placeholder="发动机序号">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">状态</label>
                        <input type="text" class="form-control" id="status"
                               placeholder="状态">
                    </div>
                    <div class="form-group">
                        <label for="text-nickname">故障件名称</label>
                        <input type="text" class="form-control" id="name"
                               placeholder="故障件名称">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="button" id="subbtn" class="btn btn-primary pull-right" onclick="subActivity()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
	function subActivity(){
		var type = $('#type').val();
		var id = $('#id').val();
		var duty = $('#duty').val();
		var stries = $('#stries').val();
		var tail = $('#tail').val();
		var engPosit = $('#engPosit').val();
		var engSn = $('#engSn').val();
		var status = $('#status').val();
		var name = $('#name').val();
		$.ajax({
			type : "post",
			data :{'type':type,'id':id,'duty':duty,'stries':stries,'tail':tail,'engPosit':engPosit,'engSn':engSn,'status':status,'name':name},
			url : "${pageContext.request.contextPath}/manage/troubleShooting/recordaddupdate.do",
			success : function(data){
				window.location.reload(true);
			}
		})
	}
</script>