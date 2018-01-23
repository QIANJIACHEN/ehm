<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-head.jsp"/>
    <jsp:include page="../AdminLTE-2.3.0/myapp/my-common-script.jsp"/>
    <style type="text/css">
    	table.tablerecord th ,table.tablerecord td{
    		text-align:center;
    		border:1px solid #d7d7d7 !important;
    	}
    	table.tablerecord th{
    		background-color:#f2f2f2;
    	}
    	table.tablerecord td a{
    		text-decoration:underline;
    	}
    	.basicinfo p span{
    		display:inline-block;
    		width:40%;
    		padding-left:10px;
    		box-sizing:border-box;
    		font-size:15px;
    	}
    	.basicinfo p span.key{
    		width:45%;
    		padding-left:0px;
    		font-weight:bold;
    	}
    	.basicinfo p span a{
    		text-decoration:underline;
    	}
    </style>
</head>
<body class="hold-transition" >

<div class="wrapper">

    <div class="box wrapper " style="overflow: auto;">
        <div class="box-header">
        	<div class="row" style="margin:15px 0px">
                <div style="min-width: 160px;display:inline-block;vertical-align:bottom;float:right">
                    <button onclick="history.go(-1)" class="btn btn-block btn-primary col-sm-1">
                       	 返回
                    </button>
                </div>
			</div>
        	<h2>发动机性能数据信息</h2><br>
        	<h4>基础信息</h4><br>
        	<div class="row basicinfo">
        		<div class="col-md-3 col-xs-3">
        			<p>
        				<span class="key">tail</span>
        				<span class="val" id="tail"></span>
        			</p>
        			<p>
        				<span class="key">发动机SN</span>
        				<span class="val" id="engSn"></span>
        			</p>
        			<p>
        				<span class="key">发动机位置</span>
        				<span class="val" id="eposition"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">ESN</span>
        				<span class="val" id="esn" ></span>
        			</p>
        			<p>
        				<span class="key">状态</span>
        				<span class="val" id="flightPhase" ></span>
        			</p>
        			<p>
        				<span class="key">飞行时间</span>
        				<span class="val" id="flightDateTime" ></span>
        			</p>
        			<p>
        				<span class="key">发动机类型</span>
        				<span class="val" id="engineType"></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">N1 Phase Angle Rear</span>
        				<span class="val" id="zphsr" ></span>
        			</p>
        			<p>
        				<span class="key">Delta Core Speed Smoothed</span>
        				<span class="val" id="gpcn25Smoothed"></span>
        			</p>
        			<p>
        				<span class="key">Delta EGT Smoothed</span>
        				<span class="val" id="degtSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">N1 Phase Angle Fwd</span>
        				<span class="val" id="zphsf" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">EGT Hot Day Margin Divergence</span>
        				<span class="val" id="egthdmD" ></span>
        			</p>
        			<p>
        				<span class="key">Fan Vibe Fwd Smoothed</span>
        				<span class="val" id="zvb1fSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">Delta Fuel Flow</span>
        				<span class="val" id="gwfm"></span>
        			</p>
        			<p>
        				<span class="key">EGT Hot Day Margin</span>
        				<span class="val" id="egthdm" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Delta Fuel Flow Divergence</span>
        				<span class="val" id="gwfmD" ></span>
        			</p>
        			<p>
        				<span class="key">Fan Vibe Rear</span>
        				<span class="val" id="zvb1r"></span>
        			</p>
        			<p>
        				<span class="key">EGT Hot Day Margin Divergence Smoothed</span>
        				<span class="val" id="egthdmDSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">Oil Temperature</span>
        				<span class="val" id="ztoil" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Core Vibe Fwd</span>
        				<span class="val" id="zvb2f" ></span>
        			</p>
        			<p>
        				<span class="key">Core Vibe Rear</span>
        				<span class="val" id="zvb2r"></span>
        			</p>
        			<p>
        				<span class="key">Fan Vibe Fwd</span>
        				<span class="val" id="zvb1f"></span>
        			</p>
        			<p>
        				<span class="key">Core Vibe Rear Smoothed</span>
        				<span class="val" id="zvb2rSmoothed" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Delta EGT Divergence Smoothed</span>
        				<span class="val" id="degtDSmoothed" ></span>
        			</p>
        			<p>
        				<span class="key">Delta Core Speed Divergence</span>
        				<span class="val" id="gpcn25D"></span>
        			</p>
        			<p>
        				<span class="key">Fan Vibe Rear Smoothed</span>
        				<span class="val" id="zvb1rSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">Oil Temperature Smoothed</span>
        				<span class="val" id="ztoilSmoothed" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Delta Fuel Flow Smoothed</span>
        				<span class="val" id="gwfmSmoothed" ></span>
        			</p>
        			<p>
        				<span class="key">Delta Core Speed</span>
        				<span class="val" id="gpcn25"></span>
        			</p>
        			<p>
        				<span class="key">Delta Fuel Flow Divergence Smoothed</span>
        				<span class="val" id="gwfmDSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">Delta Core Speed Divergence Smoothed</span>
        				<span class="val" id="gpcn25DSmoothed" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Core Vibe Fwd Smoothed</span>
        				<span class="val" id="zvb2fSmoothed" ></span>
        			</p>
        			<p>
        				<span class="key">Oil Pressure Smoothed</span>
        				<span class="val" id="zpoilSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">EGT Hot Day Margin Smoothed</span>
        				<span class="val" id="egthdmSmoothed"></span>
        			</p>
        			<p>
        				<span class="key">Delta EGT Divergence</span>
        				<span class="val" id="degtD" ></span>
        			</p>
        		</div>
        		<div class="col-md-2 col-xs-3">
        			<p>
        				<span class="key">Oil Pressure</span>
        				<span class="val" id="zpoil" ></span>
        			</p>
        			<p>
        				<span class="key">EGT</span>
        				<span class="val" id="zt49"></span>
        			</p>
        			<p>
        				<span class="key">Delta EGT</span>
        				<span class="val" id="degt"></span>
        			</p>
        			<p>
        				<span class="key">创建时间</span>
        				<span class="val" id="ctime" ></span>
        			</p>
        		</div>
        	</div>
        </div>
    </div>
</div>

<%
	Integer	id = (Integer)request.getAttribute("id");
%>
<script type="text/javascript">
	 var id = '${id}';
	 $.post(
	         "${pageContext.request.contextPath}/manage/datacfmperformance/one.do",
	          {"id": id},
	          function (response) {
	          		$('#tail').html(response.data.tail);
	          		$('#eposition').html(response.data.eposition);
	          		$('#engSn').html(response.data.engSn);
	          		$('#esn').html(response.data.esn);
	          		$('#flightPhase').html(response.data.flightPhase);
	          		$('#flightDateTime').html(response.data.flightDateTime);
	          		$('#engineType').html(response.data.engineType);
	          		$('#zphsr').html(response.data.zphsr);
	          		$('#gpcn25Smoothed').html(response.data.gpcn25Smoothed);
	          		$('#degtSmoothed').html(response.data.degtSmoothed);
	          		$('#zphsf').html(response.data.zphsf);
	          		$('#egthdmD').html(response.data.egthdmD);
	          		$('#zvb1fSmoothed').html(response.data.zvb1fSmoothed);
	          		$('#gwfm').html(response.data.gwfm);
	          		$('#egthdm').html(response.data.egthdm);
	          		$('#gwfmD').html(response.data.gwfmD);
	          		$('#zvb1r').html(response.data.zvb1r);
	          		$('#egthdmDSmoothed').html(response.data.egthdmDSmoothed);
	          		$('#ztoil').html(response.data.ztoil);
	          		$('#zvb2f').html(response.data.zvb2f);
	          		$('#zvb2r').html(response.data.zvb2r);
	          		$('#zvb1f').html(response.data.zvb1f);
	          		$('#zvb2rSmoothed').html(response.data.zvb2rSmoothed);
	          		$('#degtDSmoothed').html(response.data.degtDSmoothed);
	          		$('#gpcn25D').html(response.data.gpcn25D);
	          		$('#zvb1rSmoothed').html(response.data.zvb1rSmoothed);
	          		$('#ztoilSmoothed').html(response.data.ztoilSmoothed);
	          		$('#gwfmSmoothed').html(response.data.gwfmSmoothed);
	          		$('#gpcn25').html(response.data.gpcn25);
	          		$('#gwfmDSmoothed').html(response.data.gwfmDSmoothed);
	          		$('#gpcn25DSmoothed').html(response.data.gpcn25DSmoothed);
	          		$('#zvb2fSmoothed').html(response.data.zvb2fSmoothed);
	          		$('#zpoilSmoothed').html(response.data.zpoilSmoothed);
	          		$('#egthdmSmoothed').html(response.data.egthdmSmoothed);
	          		$('#degtD').html(response.data.degtD);
	          		$('#zpoil').html(response.data.zpoil);
	          		$('#zt49').html(response.data.zt49);
	          		$('#degt').html(response.data.degt);
	          		$('#ctime').html(response.data.ctime);
	          },
	          "json"
	 );
</script>



</body>
</html>
