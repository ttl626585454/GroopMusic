package Dao;

import Bean.User;

import java.util.List;

public interface IUserDao {
    public List<User> findAll();


    public User findUserById(int id);
    void addUser(User user); //增添用户信息
    void updateUser(User user);//修改用户信息
    void deleteUserById(int id);//删除用户信息
}
