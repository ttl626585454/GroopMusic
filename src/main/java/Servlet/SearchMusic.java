package Servlet;

import Bean.Music;
import Dao.IMusicDao;
import org.apache.ibatis.session.SqlSession;
import util.MybatisUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SearchMusic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//         得到请求参数

        String musicName = req.getParameter("musicName");
        System.out.println(musicName);
//        创建sqlsession对象
        SqlSession sqlSession =  MybatisUtil.getSqlSession();

        IMusicDao iMusicDao = sqlSession.getMapper(IMusicDao.class);
//        得到对象
        Music music = iMusicDao.findMusicByName(musicName);
        if (music!=null) {
            req.setAttribute("music", music);
            //将list数据发送到.jsp文件中
            req.getRequestDispatcher("myMusic.jsp").forward(req,resp);
        }

    }
}
