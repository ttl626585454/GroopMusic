package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtil {
    public static SqlSessionFactory sqlSessionFactory;
    static {
        try {
            InputStream inputStream = Resources.getResourceAsStream("sqlMapConfig.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public static  SqlSession getSqlSession(){
//        true带表事务自动提交
        return sqlSessionFactory.openSession(true);

    }

}
