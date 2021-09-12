<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<s:url value="/resources/javascript/menu/head.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/common/nav.js"/>"></script>
<script type="text/javascript" src="<s:url value="/resources/javascript/menu/menu.js"/>"></script>
										
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<!--header //-->
	<header>
		<!-- 로고 //-->
		<div class="logo">
			<hgroup>
				<h1><img src="<s:url value="/resources/images/common/logo.gif"/>" alt="A Cube" /></h1>
			</hgroup>
		</div>
		<!--// 로고 -->
		<!-- //-->
		<div class="top_box">
			<!-- 로그인정보 //-->
			<div class="top_info_box">
				<ul>
					<li>
						<span>UNITEL > IT TEAM(00052398)</span>
						<span>2012-10-18 Thursday 14:00:00</span>
					</li>

					<li class="loginfo">
						<b>Hong Gi Min</b>
						<a href="<s:url value="/security/logout"/>"><img src="<s:url value="/resources/images/btn/logout.gif"/>" /></a>
					</li>
				</ul>
			</div>
			<!--// 로그인정보 -->
			<!-- Navigation //-->
			<nav>
				<ul class="menu" id="menu">
					<!-- 1Depth 고객 //-->
					<li><a href="#" class="menulink">Customer</a>
						<ul>
							<!-- 2Depth //-->
							<li>
								<a href="#" class="sub topline">Customer</a>
								<ul>
									<!-- 3Depth //-->
									<li class="topline">
									<a href="#" id="menuClick" menuId="csCust001">Customer Registration</a></li>
									<li><a href="#" id="menuClick" menuId="csCust002" >Relationship</a></li>
									<li><a href="#" id="menuClick" menuId="csCust009" >Family ID</a></li>
									<li><a href="#" id="menuClick" menuId="csCust010" >HouseHold</a></li>
									<li><a href="#" id="menuClick" menuId="csCust010_Hotel" >Hotel</a></li>
									<!--// 3Depth -->
									
								</ul>
							</li>
							<!--// 2Depth -->
							<li>
								<a href="#" class="sub">Customer Service</a>
								<ul>
									<li class="topline" ><a href="#" id="menuClick" menuId="csCust006" >Description Search</a></li>
									<li><a href="#" id="menuClick" menuId="csCust007" >Special Information</a></li>
									<li><a href="#" id="menuClick" menuId="csCust005" >BlackList</a></li>
									<li><a href="#" id="menuClick" menuId="password001" >Password Change</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="sub">Bill Info</a>
								<ul> 
									<li class="topline"><a href="#" id="menuClick" menuId="csBill001">Bill Account Inquiry</a></li>
									<li><a href="#" id="menuClick" menuId="csBill002">Bill Account Change</a></li>
									
									
								</ul>
							</li>
						</ul>
					</li>
					<!--// 1Depth 고객 -->

					<!-- 1Depth 가입 //-->
					<li><a href="#" class="menulink"><s:message code="bill.label.bill003.title.000007"/><!--Subscriber--></a>
						<ul>
							<!-- 2Depth //-->
							<li>
								<a href="#" id="menuClick" menuId="searchSubscriber" target="mainWork" class="topline">Subscriber Search</a>
							</li>
							<!--// 2Depth -->
							<li>
								<a href="#" id="menuClick" menuId="csEntr002" target="mainWork" class="topline">Subscription</a>
							</li>
							<li>
								<a href="#" class="sub">Service Change</a>
								<ul>
								    <li class="topline"><a href="#">Job Status Inquiry</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr007">Number Change</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr008">Suspension/Resume</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr009">Installation Address Change</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr010">Ownership Change</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr011">Price Plan & Number & Device Change</a></li>
									<!-- <li><a href="#" id="menuClick" menuId="csEntr012">Vas Change</a></li> -->
									<li><a href="#" id="menuClick" menuId="csEntr013">Vas Change</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr025">Convergence</a></li>
									<li><a href="#" id="menuClick" menuId="csEntr027">Terminate</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="sub">CUG</a>
								<ul>
									<!--  <li><a href="#">Subscription Discount</a></li>
									<li><a href="#">Billing Discount</a></li>-->
									<li><a href="#" id="menuClick" menuId="cugm001">CUG</a></li>
									<li><a href="#" id="menuClick" menuId="cugm009">CUG Search</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<!--// 1Depth 가입 -->
					<!-- 1Depth 작업 //-->
					<li><a href="#" class="menulink">Task</a>
						<ul>
							<!-- 2Depth //-->
							
								<li class="topline"><a href="#" id="menuClick" menuId="ccsWork001">Task Receipt</a></li>
								<!-- <li><a href="#" id="menuClick" menuId="ccsWork002">Task Process</a></li> -->
								<li><a href="#" id="menuClick" menuId="ccsWork003_1">My task</a></li>
								<li><a href="#" id="menuClick" menuId="ccsWork004">Work Report</a></li>
							
							<!--// 2Depth -->
							
						</ul>
					</li>
					<!--// 1Depth 작업-->

					<li><a href="#" class="menulink"><s:message code="menu.bs.title.000000"/></a><!-- 청구/수납 -->
						<ul>
							<!-- 2Depth //-->
							<li>
								<a href="#" id="menuClick" menuId="bsArManage" class="topline"><s:message code="menu.bs.title.000001"/></a><!-- 청수미관리 -->
							</li>
							<!--// 2Depth -->
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000002"/></a><!-- 과금 -->
									<ul>
										<li class="topline"><a href="#" class="sub"><s:message code="menu.bs.title.000003"/></a><!-- 서비스이력조회 -->
											<ul>
												<li><a href="#"  class="topline" id="menuClick" menuId="bs1"><s:message code="menu.bs.title.000004"/></a></li><!-- 서비스내력조회 -->
												<li><a href="#" id="menuClick" menuId="bs2"><s:message code="menu.bs.title.000005"/></a></li><!-- 서비스요약조회 -->									
											</ul>
										</li>
										<li><a href="#" class="sub"><s:message code="menu.bs.title.000006"/></a><!-- 재과금요청관리 -->
											<ul>
												<li><a href="#"  class="topline" id="menuClick" menuId="bs3"><s:message code="menu.bs.title.000007"/></a></li><!-- 재과금요청등록 -->
												<li><a href="#" id="menuClick" menuId="bs4"><s:message code="menu.bs.title.000008"/></a></li><!-- 재과금요청내역조회 -->									
											</ul>
										</li>
									</ul>
							</li>
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000009"/></a><!-- 청구 -->
								<ul>
									<li class="topline"><a href="#" id="menuClick" menuId="bs5"><s:message code="menu.bs.title.000010"/></a></li><!-- 청구정보조회 -->
									<li><a href="#" id="menuClick" menuId="bs6"><s:message code="menu.bs.title.000011"/></a></li><!-- 핫빌 -->
									<!-- <li><a href="#" class="sub">Terminated Customer Management(해지고객관리)</a>
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="bs7">HotBill Calculation Details Inquiry(핫빌계산내역조회)</a></li>
										</ul>
									</li> -->
									<li><a href="#" class="sub"><s:message code="menu.bs.title.000012"/></a><!-- 청구/내역현황관리 -->
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="bs8"><s:message code="menu.bs.title.000013"/></a></li><!-- 각종내역서발행 -->
											<li><a href="#" id="menuClick" menuId="bs9"><s:message code="menu.bs.title.000014"/></a></li><!-- 정규청구서발행내역조회 -->
											<!-- <li><a href="#" menuId="bs6">청구서재발행내역조회</a></li> -->
											<!--<li><a href="#" id="menuClick" menuId="bs10">청구제외대상조회</a></li>-->
										</ul>
									</li>
							   <!-- <li><a href="#" class="sub">세금계산서관리</a>
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="bs11">세금계산서 발행</a></li>
											<li><a href="#" id="menuClick" menuId="bs12">세금계산서 발급이력조회</a></li>										
										</ul> 
									</li>-->
									<li><a href="#" class="sub"><s:message code="menu.bs.title.000015"/></a><!-- 분리청구 -->
										<ul>
											
									<li><a href="#" id="menuClick" menuId="bs11"><s:message code="menu.bs.title.000016"/></a></li><!-- 청구계정분리 -->
									<li><a href="#" id="menuClick" menuId="bs12"><s:message code="menu.bs.title.000017"/></a></li><!-- 청구계정통합 -->									
										</ul>
									</li>
									<li><a href="#" class="sub"><s:message code="menu.bs.title.000018"/></a><!-- 로밍청구 -->
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="bs14"><s:message code="menu.bs.title.000019"/></a></li><!-- 로밍청구내역 -->								
										</ul>
									</li>
									<li><a href="#" id="menuClick" menuId="billDiscount"><s:message code="menu.bs.title.000020"/></a></li><!-- 청구할인 -->
								</ul>
							</li>
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000021"/></a><!-- 조정 -->
								<ul>
									<li class="topline"><a href="#" id="menuClick" menuId="bs15"><s:message code="menu.bs.title.000022"/></a></li><!-- 요금조정 -->
									<li><a href="#" id="menuClick" menuId="bs16"><s:message code="menu.bs.title.000023"/></a></li><!-- 조정이력 -->
								</ul>
							</li>
																					
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000024"/></a><!-- 납부 -->
								<ul>
									<li class="topline"><a href="#" id="menuClick" menuId="ar1"><s:message code="menu.bs.title.000025"/></a></li><!-- 납부내역 -->
								</ul>
							</li>							
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000026"/></a><!-- 미납 -->
								<ul>
									<li class="topline"><a href="#" id="menuClick" menuId="ar22"><s:message code="menu.bs.title.000027"/></a><!-- 미납내역 -->
									</li>
									<!-- 보류 -->
									<!-- <li><a href="#" class="sub">Bad Dept Management(대손관리)</a>
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="ar25">대손대상자관리</a></li>
										</ul>
									</li> -->
								</ul>
							</li>
							<li>
								<a href="#" class="sub"><s:message code="menu.bs.title.000028"/></a><!-- 요금지원 -->
								<ul>
									<!-- <li class="topline"><a href="#" class="sub">Payment Support Management(납부지원관리)</a>
										<ul>
											보류.....
											<li><a href="#" id="menuClick" menuId="ar27">Bank Deposit Details Inquiry(은행입금내역조회)</a></li>
										</ul>
									</li> -->
									<li><a href="#" class="sub"><s:message code="menu.bs.title.000029"/></a><!-- 미납현황 -->
										<ul>
											<li><a href="#"  class="topline" id="menuClick" menuId="ar28"><s:message code="menu.bs.title.000030"/></a></li><!-- 미납회수현황 -->
											<li><a href="#" id="menuClick" menuId="ar29"><s:message code="menu.bs.title.000031"/></a></li><!-- 고액미납현황 -->
										</ul>
									</li>
								</ul>
							</li>
							<!-- <li>운영업무지원(Manage Business Support)</li> -->
						</ul>
					</li>
					<!--// 1Depth 요금-->

					

				<!-- 1Depth 유통채널 //-->
				<li><a href="#" class="menulink">Dealer</a>
					<ul>

						<!-- 2Depth //-->
						<li><a href="#" class="sub topline">Dealer Information</a>
							<ul>
								<li class="topline"><a href="#" menuId="cosInfo001">Dealer
										Register</a></li>
								<li><a href="#" menuId="cosInfo002">Payment Management</a></li>
							</ul></li>

						<!-- 2Depth //-->
						<li><a href="#" class="sub">Commission Management</a>
							<ul>
								<!-- 3Depth //-->
								<li class="topline"><a href="#" menuId="cosPol001">Commission Code Management</a></li>
								<li><a href="#" menuId="cosPol002">Commission Target List</a></li>
								<li><a href="#" class="sub">Commission Policy Registration</a>
									<ul>
										<!-- 4Depth //-->
										<li><a href="#" class="topline" menuId="cosPol003">Inquiry Commission
												Policy</a></li>
										<li><a href="#" menuId="cosPol004">Sales Count Policy</a></li>
										<li><a href="#" menuId="cosPol005">Sales Grade Policy</a></li>
										<li><a href="#" menuId="cosPol006">Voucher/Hotel Policy</a></li>
									</ul></li>
								<!-- 3Depth //-->
								<li><a href="#" class="sub">Commission Calculation
										Result</a>
									<ul>
										<!-- 4Depth //-->
										<li><a href="#" class="topline" menuId="cosPol007">Policy Calculation List</a></li>
										<li><a href="#" menuId="cosPol008">Policy Calculation Summary</a></li>
										<li><a href="#" menuId="cosPol009">Policy Calculation Result</a></li>
									</ul></li>

							</ul></li>

						<!-- 2Depth //-->
						<li><a href="#" class="sub">Report</a>
							<ul>
								<!-- 3Depth //-->
								<li class="topline"><a href="#" class="sub">Sales Result</a>
									<ul>
										<!-- 4Depth //-->
										<li><a href="#" class="topline" menuId="cosRep001">Real_Time Sales List</a></li>
										<li><a href="#" menuId="cosRep002">Additional Service Sales List</a></li>
										<li><a href="#" menuId="cosRep003">Sales Result</a></li>
										<li><a href="#" menuId="cosRep004">Payment by Reseller</a></li>
									</ul></li>
							</ul></li>
						<!-- 2Depth End -->
					</ul></li>
					<!--// 1Depth 유통채널 -->

					<!-- 1Depth 작업 //-->
					<li><a href="#" class="menulink">Resource</a>
						<ul>
							<!-- 2Depth //--> <!-- Voucher //-->
							<li class="topline">
								<a href="#" class="sub">Voucher Management</a>
								<ul>
									<!-- 3Depth //-->
									<li class="topline"><a href="#" class="sub">Basic Information</a>
										<ul>
											<!-- 4Depth //-->
											<li class="topline"><a href="#"   menuId="voucher001">Voucher Type Inquiry</a></li>
											<li><a href="#"   menuId="voucher002">Voucher Sales Policy Registration</a></li>
										</ul>									
									</li>
									<li><a href="#"  class="sub">Issue Management</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#"  menuId="voucher003">Inquiry of Voucher Issuance Info</a></li>
											<li><a href="#" menuId="voucher004">Voucher Issuance</a></li>
										</ul>																		
									</li>
									<li><a href="#"  class="sub">Distribute Management</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" menuId="voucher005">Voucher Distribution Management</a></li>
											<li><a href="#" menuId="voucher006">Returned Voucher Management</a></li>
										</ul>																											
									</li>
									<li><a href="#"  class="sub">Master Management</a>
										<ul>
											<!-- 4Depth //-->
											<li class="topline"><a href="#"  menuId="voucher007">Voucher Master Management</a></li>
										</ul>																																				
									</li>
									<li><a href="#"  class="sub">Stock Management</a>
										<ul>
											<!-- 4Depth //-->
											<li class="topline"><a href="#"  menuId="voucher008">Voucher Stock Management</a></li>
											<li><a href="#" menuId="voucher009">In-Out Voucher List Inquiry</a></li>																						
											<li><a href="#" menuId="voucher010">Daily Voucher Stock Inquiry</a></li>
											<li><a href="#" menuId="voucher011">Monthly Voucher Stock Inquiry</a></li>											
										</ul>																																				
									</li>																																				
								</ul>
							</li>
							<!-- 2Depth //-->
							<!-- Resource PART//-->
							<li class="topline">
								<a href="#" class="sub">Resource Management</a>
								
								<ul>
									<!-- 3Depth //-->
									<li>
										<a href="#" class="sub">Basic Information</a>
										<ul>
											<!-- 4Depth //-->
											<li class="topline"><a href="#"id="menuClick" menuId="res002">Model Info</a></li>
											<li><a href="#" id="menuClick" menuId="res001">Manufaturer Info</a></li>									
											<li><a href="#" id="menuClick" menuId="res003">Model Class Info</a></li>									
										</ul>								
							        </li>							
									<li class="topline"><a href="#" id="menuClick" menuId="res004">Resource Registration</a></li>
									<li><a href="#"  class="sub">SIM Management</a>		
										<ul>
											<!-- 4Depth //-->
											<li><a href="#"  class="topline" id="menuClick" menuId="res010">IMSI Upload</a></li>
											<li><a href="#"  id="menuClick" menuId="res011">IMSI Allocation</a></li>
											<li><a href="#"  id="menuClick" menuId="res012">Change Status of IMSI</a></li>
										</ul>
									<li><a href="#" class="sub">Number Resource</a>
										<ul>
											<li class="topline"><a href="#" menuId="res020">Number</a></li>
											<li><a href="#">Number Saving Release</a></li>
										</ul>
									</li>
									<li><a href="#" id="menuClick" menuId="res006">Master Management</a></li>							
									<li><a href="#"  id="menuClick" menuId="res005">Distribution Management</a></li>
									<li><a href="#" id="menuClick" menuId="res009">Assign Management</a></li>																											
									<li><a href="#"  class="sub">Stock Management</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#"  class="topline" id="menuClick" menuId="res007">Resource Daily Stock Management</a></li>
											<li><a href="#"  id="menuClick" menuId="res008">Resource Monthly Stock Management</a></li>
										</ul>																																				
									</li>
								</ul>								
							</li>
						
							<!--// 2Depth -->
						</ul>
					</li>
					<!--// 1Depth 리소스-->					


					<!-- 1Depth 파트너정산 //-->
					<li><a href="#" class="menulink" class="topline">Partner Settlement</a>
						<ul>
							<!--// 2Depth -->
							
							<li>
								<a href="#" class="sub">상품관리</a>
								<ul>
									<!-- 3Depth //-->
									<li class="topline"><a href="#"  menuId="prmProductMain"  >상품리스트</a></li>
									<li><a href="#" menuId="prmProductCode" >구간코드</a></li>
								<!--// 3Depth -->
								</ul>
							</li>		
							<li>
							
								<a href="#" class="sub">Partner</a>
								<ul>
									<!-- 3Depth //-->
									<li class="topline"><a href="#"  menuId="prmPtrMain" >Partner Status</a></li>
									<li><a href="#" menuId="ptrNew" >Junior-Partner Registration</a></li>
									<li><a href="#" menuId="ptrNew" class="sub">Partner Registration</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="ptrInfoNew">Partner Details Registration</a></li>
											<li><a href="#" menuId="ptrAccountNew">Account Information Registration</a></li>
										</ul>
									</li>
								<!--// 3Depth -->
								</ul>
							</li>
							
							<!-- 2Depth //-->
							<li>
								<a href="#"  class="sub">Standard Information Registration</a>
								<ul>
									<!-- 3Depth //-->							
									<li class="topline"><a href="#"  class="sub">Connection Charge Standard Information Management</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="statusList">Extracted Code Status</a></li>
											<li><a href="#" menuId="statusNew">Extracted Code Registration</a></li>
											<li><a href="#" menuId="rateList">Connection Rate Status</a></li>
										</ul>
									</li>
									<!-- 3Depth //-->							
									<li><a href="#"  class="sub">Contents Service Management</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="contentsList">Contents Registration Status</a></li>
											<li><a href="#" menuId="contentsCategory">Contents Category Status</a></li>
											<li><a href="#" menuId="contentsStatus">Contents Status</a></li>
											<li><a href="#" menuId="contentsMapping">Contents Mapping Information Registration</a></li>
										</ul>
									</li>
								</ul>
							</li>

							<!-- 2Depth //-->
							<li>
								<a href="#"  class="sub">정산내역</a>
								<ul>
									<!-- 3Depth //-->							
									<li class="topline"><a href="#"  class="sub">접속료 정산내역</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmPtr001">발신요약정보생성X</a></li>
											<li><a href="#" menuId="prmSettleOutGoing">발신통화조회</a></li>
											<li><a href="#" menuId="prmSettleInComming">착신통화조회</a></li>
											<li><a href="#" menuId="prmSettleInterconnect">타사정산내역조회</a></li>
										</ul>
									</li>
									<!-- 3Depth //-->							
									<li><a href="#"  class="sub">서비스정산내역</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmSettleContents">컨텐츠정산내역조회</a></li>
										</ul>
									</li>
								</ul>
							</li>
							<!-- 2Depth //-->
							<li>
								<a href="#"  class="sub">검증 및 조정</a>
								<ul>
									<!-- 3Depth //-->							
									<li class="topline"><a href="#"  class="sub">접속료 정산검증X</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmPtr001">접속료사업자별 검증</a></li>
											<li><a href="#" menuId="prmPtr001">접속료사업자별상세검증</a></li>
										</ul>
									</li>
									<!-- 3Depth //-->							
									<li><a href="#"  class="sub">접속료 조정</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmVerifyAdjustList">접속료조정이력조회</a></li>
											<li><a href="#" menuId="prmPtr001">접속료사업자별조정X</a></li>
										</ul>
									</li>
									<!-- 3Depth //-->							
									<li><a href="#"  class="sub">컨텐츠 정산검증X</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmPtr001">컨텐츠 사업자별 검증</a></li>
											<li><a href="#" menuId="prmPtr001">컨텐츠사업자별 상세검증</a></li>
										</ul>
									</li>
									<!-- 3Depth //-->							
									<li><a href="#"  class="sub">컨텐츠 조정X</a>
										<ul>
											<!-- 4Depth //-->
											<li><a href="#" class="topline" menuId="prmPtr001">컨텐츠 조정이력조회</a></li>
											<li><a href="#" menuId="prmPtr001">컨텐츠사업자별 조정</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<!--// 1Depth 파트너정산 -->
					
					<!-- 1Depth Roaming //-->
					<li><a href="#" class="menulink">Roaming</a>
						<ul>
							<!-- 2Depth //-->
							<li><a href="#"  class="topline" menuId="roamPrm001" >Roaming Status</a></li>
							<!--// 2Depth -->
							<li><a href="#"  class="sub">Register</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#" menuId="roamReg001">Associate Partner</a></li>
									<li><a href="#" menuId="roamReg002">Full Partner</a></li>
								</ul>
							</li>
							<li><a href="#"  class="sub">Reference Information</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#"	menuId="roamRef001">Exchange Rate</a></li>
									<li><a href="#" menuId="roamRef002">SDR Information</a></li>
								</ul>
							</li>		
							<li><a href="#"  class="sub">Invoice</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#"	menuId="roamInv001">Invoice Status</a></li>
									<li><a href="#" menuId="roamInv002">Invoice receipt</a></li>
									<li><a href="#" menuId="roamInv003">Invoicing</a></li>
								</ul>
							</li>
							<li><a href="#"  class="sub">History</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#">Settlement History (Monthly)</a></li>
									<li><a href="#" menuId="">Settlement History (Daily)</a></li>
								</ul>
							</li>
							<li><a href="#"  class="sub">Verification</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#" menuId="">Invoice Verification</a></li>
								</ul>
							</li>
							<li><a href="#"  class="sub">Adjustment</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#" menuId="">Adjustment History</a></li>
									<li><a href="#" menuId="">Adjustment</a></li>
								</ul>
							</li>
							<li><a href="#" menuId="">NRTRDE</a></li>
							<li><a href="#" menuId="">RAP</a></li>
							<li><a href="#" menuId="">Statistics</a></li>
						</ul>
					</li>

					<!-- 1Depth 업무지원 //-->
					<li><a href="#" class="menulink">Business Support</a>
						<ul>
							<!-- 2Depth //-->
							<li><a href="#"  class="topline" id="menuClick" menuId="sec001">Special Authority Application</a></li>
							<!--// 2Depth -->
							<li><a href="#"  class="topline" id="menuClick" menuId="sec003">Menu/Authority Application</a></li>
							<li><a href="#"  class="sub">Base Code Management</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#" menuId="addressManage">Address Management</a></li>
									<li><a href="#" menuId="codeManage">Code Management</a></li>
									<li><a href="#" menuId="coverageManage">COVERAGE</a></li>
									<li><a href="#" menuId="cugType"><s:message code="cs.lable.cug.000050"/><!--Cug Type--></a></li>
								</ul>
							</li>
							<li><a href="#"  class="sub">Organization Management</a>
								<ul>
									<!-- 3Depth //-->
									<li><a href="#">Organization/User Management</a></li>
									<li><a href="#" menuId="orUser000">User Registration</a></li>
								</ul>
							</li>		
							<li><a href="#" menuId="gridTest">gridTest</a></li>
							<li><a href="#" menuId="orUser000">User Registration</a></li>
							
						</ul>
					</li>
					<!--// 1Depth 업무지원 -->
					
					<!-- jqgrid_sample -->
					<li><a href="#" class="menulink">sample</a>
						<ul>
							<li><a href="#" menuId="jqgrid001">jqgrid_multi</a></li>
						</ul>
					</li>
					
				</ul>
				<!-- 메뉴관련 스크립트 //-->
				<script type="text/javascript">
					var menu=new menu.dd("menu");
					menu.init("menu","menuhover");
				</script>
				<!--// 메뉴관련 스크립트 -->
			</nav>
			<!--// Navigation -->
		</div>
		<!--// -->
	</header>
