<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Multi Step Form with Rhinoslider 1.05</title>
        <link type="text/css" rel="stylesheet" href="css/rhinoslider-1.05.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/rhinoslider-1.05.min.js"></script>
        <script type="text/javascript" src="js/mousewheel.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">



            $(document).ready(function() {
                $('#slider').rhinoslider({
                    controlsPlayPause: false,
                    showControls: 'always',
                    showBullets: 'always',
                    controlsMousewheel: false,
                    prevText: 'Back',
                    nextText:'Proceed',
		    slidePrevDirection: 'toRight',
		slideNextDirection: 'toLeft'
                });


                $(".rhino-prev").hide();
                $('.rhino-next').after('<a class="form-submit" href="javascript:void(0);" >Proceed</a>');
                $(".rhino-next").hide();




                var info = ["PERSONAL DETAILS","ACCOUNT DETAILS","CONTACT DETAILS"];
                var images = ["personal-details-icon.png","account-details.png","contact-details.png"];
                $('.rhino-bullet').each(function(index){
                    $(this).html('<p style="margin: 0pt; font-size: 13px; font-weight: bold;"><img src="./img/'+
                        images[index]+'"></p><p class="bullet-desc">'+info[index]+'</p></a>');
                });





            });

            $('.form-submit').live("click",function(){

                $('.form-error').html("");

                var current_tab = $('#slider').find('.rhino-active').attr("id");

                switch(current_tab){
                    case 'rhino-item0':
                        step1_validation();
                        break;
                    case 'rhino-item1':
                        step2_validation();
                        break;
                    case 'rhino-item2':
                        step3_validation();
                        break;
                }
            });

            var step1_validation = function(){

                var err = 0;

                if($('#fname').val() == ''){
                    $('#fname').parent().parent().find('.form-error').html("First Name is Required");
                    err++;
                }
                if($('#lname').val() == ''){
                    $('#lname').parent().parent().find('.form-error').html("Last Name is Required");
                    err++;
                }
                if($('#gender').val() == '0'){
                    $('#gender').parent().parent().find('.form-error').html("Please Select Gender");
                    err++;
                }
                if(err == 0){
                    $(".rhino-active-bullet").removeClass("step-error").addClass("step-success");
                    $(".rhino-next").show();
                    $('.form-submit').hide();
                    $('.rhino-next').trigger('click');
                }else{
                    $(".rhino-active-bullet").removeClass("step-success").addClass("step-error");
                }


            };

            var step2_validation = function(){
                var err = 0;

                if($('#username').val() == ''){
                    $('#username').parent().parent().find('.form-error').html("Username is Required");
                    err++;
                }
                if($('#pass').val() == ''){
                    $('#pass').parent().parent().find('.form-error').html("Password is Required");
                    err++;
                }
                if($('#cpass').val() == ''){
                    $('#cpass').parent().parent().find('.form-error').html("confirm Password is Required");
                    err++;
                }
                
                if(err == 0){
                    $(".rhino-active-bullet").removeClass("step-error").addClass("step-success");
                    $(".rhino-next").show();
                    $('.form-submit').hide();
                    $('.rhino-next').trigger('click');
                }else{
                    $(".rhino-active-bullet").removeClass("step-success").addClass("step-error");
                }

            };

            var step3_validation = function(){
                var err = 0;

                if($('#email').val() == ''){
                    $('#email').parent().parent().find('.form-error').html("Email is Required");
                    err++;
                }
                if(err == 0){
                    $(".rhino-active-bullet").removeClass("step-error").addClass("step-success");
                    $(".rhino-next").show();
                    $('.form-submit').hide();
                    $('.rhino-next').trigger('click');
                }else{
                    $(".rhino-active-bullet").removeClass("step-success").addClass("step-error");
                }

            };
        </script>
        <style type="text/css">
            body { background-color:#fff; }
            #wrapper{
                border: 1px solid #DCDADA;
                border-radius: 5px 5px 5px 5px;
                box-shadow: 2px 2px 2px #E1E1E1;
                background: #fff;
                width:700px;
                height:480px;
                background:#f4f4f4;


            }
            #wrapper h3{
                font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
                font-size:16px;
                height:60px;
                background:url(img/title.png) no-repeat left top;
                margin:0;
                padding:16px 0 0 20px;
                text-shadow: 1px 1px 2px #000;
                filter: dropshadow(color=#000, offx=1, offy=1);
                color:#fff;
            }
            #slider {

                background: #fff;
                /*IE bugfix*/
                padding:0;
                margin:0;
                width:700px;
                height:400px;	

            }

            #slider li { list-style:none; }

            #page {
                width:600px;
                margin:50px auto;
            }

            #slider{
                color: #000;
                background:#f4f4f4;
                font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
                font-size:12px;
            }

            .form-step{

                padding:16% 3% !important;


            }

            .form-submit{
                cursor: pointer;
                display: block;
                position: absolute;
                right: 0;
                bottom: 0;
                -moz-user-select: none;
                background: none repeat scroll 0 0 #6F95DC;
                border-radius: 5px 5px 5px 5px;
                color: #FFFFFF;
                display: block;
                margin: 0 20px 20px;
                padding: 10px;
                text-align: center;
                width: 125px;
                z-index: 10;
                font-weight: bold;
                text-decoration: none;
                background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#94b9e9), to(#4870d2));
                background-image: -moz-linear-gradient(#94b9e9, #4870d2);
                background-image: -webkit-linear-gradient(#94b9e9, #4870d2);
                background-image: -o-linear-gradient(#94b9e9, #4870d2);
                filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#94b9e9, endColorstr=#4870d2)";
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#94b9e9, endColorstr=#4870d2)";
                font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;

            }

            .errorDisplay{
                border:2px solid red;
            }

            .form-left{
                color: #717171;
                float: left;
                font-size: 13px;
                font-weight: bold;
                padding: 5px;
                width: 200px;
            }
            .form-right{
                float: left;
                width: 214px;
            }
            .row{
                float: left;
                margin: 5px 0;
                width: 100%;
            }
            .form-step input[type='text']{
                border: 1px solid #CFCFCF;
                border-radius: 4px 4px 4px 4px;
                height: 25px;
                padding: 3px;
                width: 200px;
            }
            select{
                border-radius: 4px;
                border: 1px solid #CFCFCF;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                background: #FFF;
                padding: 2px;
                height: 30px;
                width:205px;
                font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
                font-size:12px;
                background:#f4f4f4;
            }

            select option{
                font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
                font-size:12px;
                background:#f4f4f4;
                color:#717171;
            }


            .form-error{
                color: red;
                font-size: 12px;
                padding: 8px;
            }

            .step-error{
                background:#f5715f !important;
                color:#FFF !important;
                -moz-box-shadow:1px 1px 4px #C6C4C4
                    -webkit-box-shadow:1px 1px 4px #C6C4C4
                    box-shadow:1px 1px 4px #C6C4C4
            }
            .step-success{
                background:#72e487 !important;
                color:#FFF !important;
                -moz-box-shadow:1px 1px 1px 4px #C6C4C4
                    -webkit-box-shadow:1px 1px 1px 4px #C6C4C4
                    box-shadow:1px 1px 1px 4px #C6C4C4
            }
            .bullet-desc{
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div id="page">
            <div id="wrapper">
                <h3>고객확인 항목</h3>
                <form action="" >

                    <div id="slider">
                        <div class="form-step" >

                            <div class="row">
                                <div class="form-left">First Name *</div>
                                <div class="form-right"><input type="text" id="fname" name="fname" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Last Name *</div>
                                <div class="form-right"><input type="text" id="lname" name="lname" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Gender *</div>
                                <div class="form-right">
                                    <select id="gender" name="gender">
                                        <option value="0">Select</option>
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                    </select>
                                </div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Address</div>
                                <div class="form-right"><input type="text" id="address" name="address" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>

                        </div>
                        <div class="form-step" >
                            <div class="row">
                                <div class="form-left">Username *</div>
                                <div class="form-right"><input type="text" id="username" name="username" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Password *</div>
                                <div class="form-right"><input type="text" id="pass" name="pass" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Confirm Password *</div>
                                <div class="form-right"><input type="text" id="cpass" name="cpass" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                        </div>
                        <div class="form-step">
                            <div class="row">
                                <div class="form-left">Email *</div>
                                <div class="form-right"><input type="text" id="email" name="email" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                            <div class="row">
                                <div class="form-left">Mobile No</div>
                                <div class="form-right"><input type="text" id="mobile" name="mobile" class="form-input" /></div>
                                <div class="form-error"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
