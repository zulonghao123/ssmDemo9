package com.bdqn.services;

import com.bdqn.entity.TUser;
import com.github.pagehelper.PageInfo;

/**
 * Created by 祖龙浩 on 2018/2/2.
 */
public interface TUserServices {
    TUser login(TUser user);

    PageInfo<TUser> queryTuserForPage(Integer pageNum, Integer pageSize);

}
