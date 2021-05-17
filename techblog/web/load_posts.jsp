<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.connprovider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%
    
    User uuu=(User)session.getAttribute("currentuser");
    
Thread.sleep(1000);
PostDao d=new PostDao(connprovider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0)
{
    posts=d.getAllPosts();
    
}
else{
    posts=d.getPostByCatId(cid);
}

if(posts.size()==0)
{
    out.println("<h3 class='display-3 text-center'> No posts in this category</h3>");
}
for(Post p: posts)
{
 %>
 <div class="col-md-6 mt-2">
     <div class="card">
          <div class="card-body">
              <img class="card-img-top" src="blogs_pics/<%=p.getpPic()%>" alt="Card image cap">
              <b> <%=p.getPtitle()%></b>
              <p><%=p.getpContent()%></p> 
              
          </div>
              <div class="card-footer primary-background text-center">
                  <%
                      LikeDao ld=new LikeDao(connprovider.getConnection());

                  %>
                  
                  
                  <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countOnLikePost(p.getPid())%></span></a>
                  <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More..</a>
                  <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i>20</a>
                  
              
              
          </div>
         
            
         
     </div>
     
     
 </div>
 
    <%
        
        
        }

    %>
    
    </div>


