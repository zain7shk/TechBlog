
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
       
    </head>
    <body>
        <%@include file="normalnavbar.jsp" %>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-3x">
                                </span>
                                <p>
                                    Register here
                                </p>
                            </div>
                             <div class="card-body">
                                 <form  id="reg-form" action="RegisterServlet" method="POST">
                                     <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">
                                       </div>
                                     
                                     
                                     
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                     </div>
                                     
                                     
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                     
                                     
                                     <div class="form-group">
                                      <label for="gender">Select gender</label>
                                      <input type="radio"  id="gender" name="gender" value="male">Male
                                      <input type="radio"  id="gender" name="gender" value="female">FEMale
                                    </div>
                                     
                                     <div class="form-group">
                                         <textarea name="about" class="form-control"  rows="5" placeholder="Enter something about us">
                                         </textarea>

                                     </div>
                                     
                                    <div class="form-check">
                                      <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>
                                        <br>
                                        <div class="container text-center" id="loader" style="display: none;" >
                                        <span class="fa fa-refresh fa-spin fa-3x">
                                        </span>
                                            <h4>Please wait</h4>
                                        </div>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>
                                 
                             
                            
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </main>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
    $(document).ready(function(){
        console.log("loaded");
        
        $('#reg-form').on('submit',function(event)
        {
           event.preventDefault();
           let form=new FormData(this);
           
        $("#submit-btn").hide();
        $("#loader").show();
        //send register servlet
        
        $.ajax({
            url:"RegisterServlet",
            type:'POST',
            data:form,
            success: function(data, textStatus , jqXHR){
                console.log(data);
                 $("#submit-btn").show();
                 $("#loader").hide();
                 
                   
                       
                   
                 swal(" Registered Successfully we are redirecting to login page")
                 .then((value) => {
                  window.location= "login_page.jsp" ;
                });
                  
                 
                 
            },
            error:function(jqXHR, textStatus, errorThrown){
                   $("#submit-btn").show();
                 $("#loader").hide();          
                swal("Someting went wrong");
              

            
                
            },
            processData:false,
            contentType:false
            
            
        });
           
           
        });
        
        
        
    });
    </script>

        
    </body>
</html>
