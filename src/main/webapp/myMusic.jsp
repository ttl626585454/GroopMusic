<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="util.MybatisUtil" %>
<%@ page import="Dao.IMusicDao" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.Music" %>
<%@ page import="java.io.Writer" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: JimRaynor
  Date: 18/5/2021
  Time: 下午10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    引入所有css--%>
    <title>mymusic</title>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8" />
    <title></title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <!-- <link rel="stylesheet" type="text/css" href="./css/main.css"/> -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/materialdesignicons.min.css" rel="stylesheet">
    <link href="./css/style.min.css" rel="stylesheet">

    <!-- 外部引入main.css -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="main.css">
</head>
<body>
<%

    SqlSession sqlSession =  MybatisUtil.getSqlSession();
    IMusicDao iMusicDao = sqlSession.getMapper(IMusicDao.class);
    List<Music> allMusic = iMusicDao.findAllMusic();
    int count  = allMusic.size(),temp=0; //音乐总数
    String name=request.getParameter("name");//第一次加载页面，无法取得name
    if(name!=null){
        allMusic.clear();
        allMusic.add(iMusicDao.findMusicByName(name));
    }

//    System.out.println(allMusic.toString());
%>
<div class="container">
    <div class="row">
        <div class="col">
            1 of 3
        </div>
        <div class="col-6">
                <div class="input-group">
                    <form name="thisform"method="post">
                        <input type="text" name="name">
                        <input type="button" value="查询"onclick="sel()">
                    </form>
                </div>

            <div>
                    <%--表格--%>
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">musicId</th>
                        <th scope="col">musicName</th>
                        <th scope="col">singerName</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>1</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <%--循环打印列元素--%>
                    <%
                        for (temp = 0;temp<count;temp++){
                        %>
                    <tr>
                        <th scope="row">#</th>
                        <td><%=allMusic.get(temp).getMusicId().toString()%></td>
                        <td><%=allMusic.get(temp).getMusicName()%></td>
                        <td><%=allMusic.get(temp).getSinger()%></td>
                    </tr>
                    <%}
                    %>

                    </tbody>
                </table>
            </div>

        </div>
        <div class="col">
            3 of 3
        </div>
    </div>
</div>
<script language="javascript">
    function sel(){
        document.thisform.submit();
    }
</script>
</body>


</html>
