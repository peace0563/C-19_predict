<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Prediction</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/styles.css">
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</head>

<body>
    

  <section id="title">
    <div class="container-fluid">



    <!-- Nav Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
      <a class="navbar-brand" href="">Rexxion</a>
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a class="nav-link" href="algo.html">Algorithm</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="contact.html"> Contact Us</a>
          </li>
      </ul>
   </div>
  </nav>




    <!-- Title -->
    <div class="row">
      <div class="col-lg-6">
        <h1>Team Rexxion's <br>Covid-19 Predictions</h1>
        <p>Click on the Button to go to Ministry of Health and Family Welfare MOHFW for Current Data of Covid-19.</p>
        <button  onclick="location.href='https://www.mohfw.gov.in';" type="button" class="btn btn-dark btn-lg" ><i class="fas fa-chart-line"></i> MOHFW</button>
      </div>
      <div class="col-lg-6">
        <img src="" alt="">
      </div>
    </div>
</div>
</section>



  <!-- Features -->
  <%
         
        Class.forName("org.postgresql.Driver");
        Connection con=DriverManager.getConnection("jdbc:postgresql://ec2-34-225-82-212.compute-1.amazonaws.com:5432/d3v829thk6mdlt?stringtype=unspecified&sslmode=require","mxbweohwuekozf","d5ec44ef0ce17c6834fe7916f05c78f7733cb3edb0ffe8341ccaa1ae5aeee7b1");    

        int count=0;
        String pred_on = "";
        PreparedStatement pst1;
          
        try{
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("Select date,total_cases,predicted_on from new_data");
    %>

  <section id="features">
    <div class="row">
      <div class="feature-box col-lg-4 col-sm-4">
          <i class="iconn fas fa-square-full fa-4x"></i>
          <h3><pre>  </pre><br><br></h3>
    <%        
            while(count<2 && rs.next())
            {
                ++count;
                out.println("<p>"+rs.getString(1)+"<br> Cases = "+rs.getString(2)+"</p>");
                pred_on = rs.getString(3);
            }
            if(count==0)
            {  
                out.println("<p>No predictions found!!!</p>");
            }
            
    %>    
      </div>     
      <div class="feature-box col-lg-4 col-sm-4">
        <i class="icon fas fa-chart-area fa-4x"></i>
        <h3> Predicted Confirmed Cases</h3>
        <br>
    <%        
            while(count<4 && rs.next())
            {
                ++count;
                out.println("<p>"+rs.getString(1)+"<br> Cases = "+rs.getString(2)+"</p>");
                pred_on = rs.getString(3);
            }
            if(count==0)
            {  
                out.println("<p>No predictions found!!!</p>");
            }
            
    %>    
      </div>
      <div class="feature-box col-lg-4 col-sm-4">
        <i class="iconn fas fa-square-full fa-4x"></i>
        <h3><pre>  </pre><br><br></h3>
    <%        
            while(count<6 && rs.next())
            {
                ++count;
                out.println("<p>"+rs.getString(1)+"<br> Cases = "+rs.getString(2)+"</p>");
                pred_on = rs.getString(3);
            }
            if(count==0)
            {  
                out.println("<p>No predictions found!!!</p>");
            }
            
    %>    
      </div>
    </div>
   </section>
      
      
    <section id="second">
      <div class="row">
        <div class="feature-box col-lg-4">
          <i class="icon fas fa-chart-bar fa-4x"></i>
        <h3> Confirmed Cases (Present)</h3>
        <p id="dert"></p>
      </div>
      
      <div class="feature-box col-lg-4">
        <i class="icon fas fa-clock fa-4x"></i>
        <h3>Predicted on</h3>
        <%
            out.println("<p>"+pred_on+" IST</p>");
        %>
      </div>
    </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script>
        $.getJSON( "https://api.covid19india.org/data.json", function( json ) {
            var cases = json.statewise[0].confirmed
            document.getElementById("dert").innerText=cases.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        });
    </script>
    <%
            con.close();
        }
                        
        catch(Exception e)
        {
            out.println("<p style=\"color:red;\">"+e+"</p>");
        }
        
        %>

  <!-- Testimonials -->

  <section id="testimonials">
    <div id="testimonial-carousel" class="carousel slide" data-ride="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <h2>At this time,there is no evidence that animals play a significant role
        in spreading of COVID-19. so,  Don't hate them."</h2>
      <img class="t-image" src="images/dog-img.jpg" class="d-block w-100" alt="dog-image">
      <em>- Team Rexxion</em>
      <h2 class="hey">Social - Message</h2>
    </div>
    <div class="carousel-item">
      <h2> Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them
      with soap and water.</h2>
      <img class="t-image" src="images/d2.png" class="d-block w-100" alt="senitizer-image">
      <em>...World Health organization</em>
      <h2 class="hey"> WHO - Prevention-1</h2>
    </div>
    <div class="carousel-item">
      <h2> Maintain at least 1 meter distance <br> between yourself and........... others.</h2>
      <img class="t-image" src="images/s.png" class="d-block w-100" alt="social-distancing-image">
      <em>...World Health organization</em>
      <h2 class="hey">WHO - Prevention-2</h2>
    </div>

  </div>
  <a class="carousel-control-prev" href="#testimonial-carousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#testimonial-carousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  <!-- <h2 class="testimonial-text">My dog used to be so lonely, but with TinDog's help, they've found the love of their life. I think.</h2>
    <img class="testimonial-image" src="images/lady-img.jpg" alt="lady-profile">
    <em>Beverly, Illinois</em> -->

  </section>



  <!-- Pricing -->

  <section id="pricing">
    <i class="icon  fas fa-file-code fa-4x"></i>
    <h2 class="team"> Developers </h2>
    <p>This website is Developed by Core Members of Team Rexxion.<br>
Ankit Mishra ( Web Developer & Data Science Enthusiast )<br>Avaneesh Shukla ( Data Science Enthusiast )<br>
      Akul Maurya ( Jack of All trades, Master of None ) </p>
</section>


  <!-- Call to Action -->
<section id="info">
  <h2>The Prediction is based on Time-Series Dataset from Kaggle. <br> We do not guarantee it to be 100% accurate.</h2>
  <p> - Team Rexxion.</p>
</section>

  <!-- Footer -->

<footer id="footer">
  <i  class="f-icon fab fa-linkedin "></i>
    <p>@ Copyright 2020 Rexxion</p>
</footer>


</body>

</html>
