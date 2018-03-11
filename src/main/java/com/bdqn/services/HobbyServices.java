package com.bdqn.services;

import com.bdqn.entity.Hobby;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/5.
 */

public interface HobbyServices {

    PageInfo<Hobby> queryAll(Integer pageNum, Integer pageSize);

    Integer addHobby(Hobby hobby);

    Integer deleteHobbyById(Integer id);

    Integer deleteHobbyListByIds(List<Integer> ids);

    Integer updateHobby(Hobby hobby);

    Hobby queryHobbyById( Integer id);
}
