
import Bean.Student;
import Dao.IStudentDao;
import Dao.IUserDao;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import util.MybatisUtil;


import java.util.List;

public class IUserDaoTest {

    @Test
    public void test(){
        SqlSession sqlSession =  MybatisUtil.getSqlSession();
        IUserDao iUserDao = sqlSession.getMapper(IUserDao.class);
        IStudentDao iStudentDao = sqlSession.getMapper(IStudentDao.class);
         List<Student> studentList = iStudentDao.findStudentByConnectionWithTeacherId(1);
         for(Student student:studentList){
             System.out.println(student);
         }
        sqlSession.close();

    }

}
