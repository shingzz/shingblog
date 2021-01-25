package com.zzcheng.dao;

import com.zzcheng.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface UserDao {
    User getUserByName(String userName);
    User getInformation(Integer userId);
}
