package com.bdqn.dao;

import com.bdqn.entity.TUser;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/2.
 */
public interface TUserMapper {
    TUser login(TUser user);
    List<TUser> queryAll();
}
