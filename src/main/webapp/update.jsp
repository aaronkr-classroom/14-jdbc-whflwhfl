<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%@ include file="connect.jsp" %>
   <%
   request.setCharacterEncoding("utf-8");

   String id = null;
   String pw = null;
   String name = null;
   
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   
   try {
      String sql = "SELECT id, passwd, name FROM Member WHERE id=?";
      pstmt = conn.preparedStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      
      if (rs.next()){
         pw = rs.getString("passwd");
         name = rs.getString("name");
      }
   } catch (SQLException e) {
      out.println("Member 테이블에서 id 찾을 수 없었습니다 ~ ㅠㅠ ");
      out.println("SQLException: " + e.getMessage());
   } finally {
      if (rs != null) rs.close();
      if (pstmt !=null) pstmt.close();
      if (conn != null) conn.colse();
   }
   %>
   <form method="POST" action="update_process.jsp">
      <p>아이디: <input type="text" name="id" value=<%= id %>/></p>
      <p>비밀번호: <input type="password" name="passwd" value=<%= pw %>/></p>
      <p>아이디: <input type="text" name="name" value=<%= name %>/></p>
      <p><input type="submit" value="수정" %>/></p>
   </form>
</body>
</html>