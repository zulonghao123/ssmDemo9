package com.bdqn.services;

import com.bdqn.dao.TUserMapper;
import com.bdqn.entity.TUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/2.
 */
@Service
public class TUserServicesImpl implements TUserServices {
    @Autowired
    private TUserMapper tUserMapper;
    @Override
    public TUser login(TUser user) {
        return tUserMapper.login(user);
    }

    @Override
    public PageInfo<TUser> queryTuserForPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<TUser> list = tUserMapper.queryAll();
        PageInfo<TUser> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }
}
