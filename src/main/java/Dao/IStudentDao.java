package Dao;

import Bean.Student;

import java.util.List;

public interface IStudentDao {
    public void insertStudentAutoId(Student student);
    public List<Student> findStudentByConnectionWithTeacherId(int id); //查找老师编号为id的所有学生信息
}
