<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		.box_tab tr td>.form-control{
			min-width:200px!important;
		}
	</style>
	
	
 			<!-- Modal -->
			<div class="modal fade" id="add-modal" tabindex="-1" role="dialog" aria-labelledby="add-modal-label">
			    <div class="modal-dialog" role="document">
			        <div class="box box-primary">
			            <div class="box-header with-border">
			                <h3 class="box-title">新建条件</h3>
			            </div>
			            <div class="box_a" style="padding:0 15px 10px 15px">
			             <ul class="nav nav_tabs" role="tablist" style="border-bottom:1px solid #3399FF">
			   				 <li role="presentation"  class="active"><a href="#a" aria-controls="home" role="tab" data-toggle="tab">已设置公式</a></li>
			   				 <li role="presentation"><a href="#b" role="tab" data-toggle="tab">条件设置</a></li>
						 </ul>
						 
						 <div class="tab-content">
							<div role="tabpanel" class="tab-pane active" style="padding-top:10px" id="a">
								<form id="aform-add" method="post" enctype="multipart/form-data">
						    	<table class="box_tab" style="width:100%;">
						    		<tr>
						    			<td style="width:20%;">
						    				<label for="text">与前一条件的关系</label>
					    				</td>
					    				<td>
					    					<select class="form-control" id="a-type">
					    						<option disabled="disabled" selected>请选择</option>
								    			<option value="0">第一个条件</option>
								    			<option value="1">AND</option>
								    			<option value="2">OR</option>
						    				</select>
					    				</td>
					    			</tr>
						    		<tr>
						    			<td style="width:20%;">
						    				<label for="text">已设置公式</label>
					    				</td>
					    				<td>
					    					<select class="form-control" id="ins">
								    			<option value="0">请选择</option>
						    				</select>
					    				</td>
					    			</tr>
						    		<tr>
					    				<td>
					    				</td>
					    				<td>
					    					<input type="reset" id="areset" style="display: none;">
											<button type="button" class="btn btn-default" style="margin-right:40px;" data-dismiss="modal">取消</button>
					    					<button type="button" class="btn btn-primary" onclick="addIns()">保存</button>
					    				</td>
					    			</tr>
						    	</table>
						    	</form>
				    		</div>
				    		
						    <div role="tabpanel" class="tab-pane" style="padding-top:30px" id="b">
						    	<form id="form-add" method="post" enctype="multipart/form-data">
						    		<table class="box_tab" style="width:100%;">
						    			<tr>
						    				<td style="width:20%;">
						    					<label for="text">与前一条件的关系</label>
						    				</td>
						    				<td>
						    					<select class="form-control" id="type">
									    			<option value="0">第一个条件</option>
									    			<option value="1">AND</option>
									    			<option value="2">OR</option>
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">计算范围类型</label>
						    				</td>
						    				<td>
						    					<select class="form-control" id="calculationType">
										    		<option value="1">区间</option>
										    		<option value="2">短期</option>
										    		<option value="3">中期</option>
										    		<option value="4">长期</option>
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">计算范围</label>
						    				</td>
						    				<td>
						    					<input type="text" class="form-control" id="calculationRange"
			                              		 placeholder="计算范围">
			                              		 <select class="form-control"  id="rangeType">
									    			<option value="1">点</option>
									    			<option value="2">天</option>
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">状态</label>
						    				</td>
						    				<td>
						    					<select class="form-control" style="width: 100%" id="flightPhase">
									    			<option value="0">ALL</option>
									    			<option value="1">起飞</option>
									    			<option value="2">巡航</option>
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">选择参数</label>
						    				</td>
						    				<td>
						    					<select class="form-control" style="width: 100%" onchange="getPId()" id="pVal">
							    				</select>
							    				<select class="form-control" style="width: 100%" id="cVal">
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">MAX</label>
						    				</td>
						    				<td>
						    					 <input type="tel" class="form-control" id="max"
			                              		 placeholder="MAX">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">MIN</label>
						    				</td>
						    				<td>
						    					 <input type="text" class="form-control" id="min"
			                              		 placeholder="MIN">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">等于</label>
						    				</td>
						    				<td>
						    					<input type="text" class="form-control" id="equal"
			                               		placeholder="等于">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					 <label for="text">不等于</label>
						    				</td>
						    				<td>
						    					 <input type="text" class="form-control" id="unequal"
			                              		 placeholder="不等于">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					
						    				</td>
						    				<td>
									    		<input type="reset" id="reset" style="display: none;">
												<button type="button" class="btn btn-default" style="margin-right:40px;" data-dismiss="modal">取消</button>
						    					<button type="button" class="btn btn-primary" onclick="addcomputation()">保存</button>
						    				</td>
						    			</tr>
						    		</table>
						    	</form>
						    </div>
				    </div>
				    </div>
				    
		       	</div>
		    	</div>
			</div>
	