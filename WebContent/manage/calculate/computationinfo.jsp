<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		.box_tab tr td>.form-control{
			min-width:200px!important;
		}
	</style>
	
	
 			<!-- Modal -->
			<div class="modal fade" id="info-modal" tabindex="-1" role="dialog" aria-labelledby="info-modal-label">
			    <div class="modal-dialog" role="document">
			        <div class="box box-primary">
			            <div class="box-header with-border">
			                <h3 class="box-title">修改条件</h3>
			            </div>
			            <div class="box_a" style="padding:0 15px 10px 15px">
			             <ul class="nav nav_tabs" role="tablist" style="border-bottom:1px solid #3399FF">
			   				 <li role="presentation" class="active"><a href="#ea" aria-controls="home" role="tab" data-toggle="tab">已设置公式</a></li>
			   				 <li role="presentation"><a href="#eb" role="tab" data-toggle="tab">条件设置</a></li>
						 </ul>
						 
						 <div class="tab-content">
							<div role="tabpanel" class="tab-pane active" style="padding-top:10px" id="ea">
								<form>
								<input type="hidden" id="eaid">
						    	<table class="box_tab" style="width:100%;">
						    		<tr>
						    			<td style="width:20%;">
						    				<label for="text">与前一条件的关系</label>
					    				</td>
					    				<td>
					    					<select class="form-control" id="eatype">
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
					    					<select class="form-control" id="eins">
								    			<option>请选择</option>
						    				</select>
					    				</td>
					    			</tr>
						    		<tr>
					    				<td>
					    				</td>
					    				<td>
					    					<input type="reset" id="eareset" style="display: none;">
											<button type="button" class="btn btn-default" style="margin-right:40px;" data-dismiss="modal">取消</button>
					    					<button type="button" class="btn btn-primary" id="eaf" onclick="editIns()">保存</button>
					    				</td>
					    			</tr>
						    	</table>
						    	</form>
				    		</div>
				    		
						    <div role="tabpanel" class="tab-pane" style="padding-top:30px" id="eb">
						    	<form id="form" method="post" enctype="multipart/form-data">
					    			<input type="hidden" id="eid">
						    		<table class="box_tab" style="width:100%;">
						    			<tr>
						    				<td style="width:20%;">
						    					<label for="text">与前一条件的关系</label>
						    				</td>
						    				<td>
						    					<select class="form-control" id="etype">
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
						    					<select class="form-control" id="ecalculationType">
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
						    					<input type="text" class="form-control" id="ecalculationRange"
			                              		 placeholder="计算范围">
			                              		 <select class="form-control"  id="erangeType">
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
						    					<select class="form-control" style="width: 100%" id="eflightPhase">
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
						    					<select class="form-control" style="width: 100%" onchange="getePId()" id="epVal">
							    				</select>
							    				<select class="form-control" style="width: 100%" id="ecVal">
							    				</select>
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">MAX</label>
						    				</td>
						    				<td>
						    					 <input type="tel" class="form-control" id="emax"
			                              		 placeholder="MAX">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">MIN</label>
						    				</td>
						    				<td>
						    					 <input type="text" class="form-control" id="emin"
			                              		 placeholder="MIN">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					<label for="text">等于</label>
						    				</td>
						    				<td>
						    					<input type="text" class="form-control" id="eequal"
			                               		placeholder="等于">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					 <label for="text">不等于</label>
						    				</td>
						    				<td>
						    					 <input type="text" class="form-control" id="eunequal"
			                              		 placeholder="不等于">
						    				</td>
						    			</tr>
						    			<tr>
						    				<td>
						    					
						    				</td>
						    				<td>
						    					<input type="reset" id="ebreset" style="display: none;">
												<button type="button" class="btn btn-default" style="margin-right:40px;" data-dismiss="modal">取消</button>
						    					<button type="button" class="btn btn-primary" id="ebf" onclick="editcomputation()">保存</button>
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
					
