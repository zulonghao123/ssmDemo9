package com.bdqn.dao;

import com.bdqn.entity.Hobby;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/5.
 */
public interface HobbyMapper {
    List<Hobby> queryAll();

    Integer addHobby(Hobby hobby);

    Integer deleteHobbyById(@Param("id") Integer id);

    Integer deleteHobbyListByIds(List<Integer> ids);

    Integer updateHobby(Hobby hobby);

    Hobby queryHobbyById(@Param("id") Integer id);
}
