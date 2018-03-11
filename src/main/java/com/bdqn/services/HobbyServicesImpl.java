package com.bdqn.services;

import com.bdqn.dao.HobbyMapper;
import com.bdqn.entity.Hobby;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/5.
 */
@Service
public class HobbyServicesImpl implements HobbyServices {
    @Autowired
    private HobbyMapper hobbyMapper;
    @Override
    public PageInfo<Hobby> queryAll(Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Hobby> list = hobbyMapper.queryAll();
        PageInfo<Hobby> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public Integer addHobby(Hobby hobby) {
        return hobbyMapper.addHobby(hobby);
    }


    @Override
    public Integer deleteHobbyListByIds(List<Integer> ids) {
        return hobbyMapper.deleteHobbyListByIds(ids);
    }

    @Override
    public Integer updateHobby(Hobby hobby) {
        return hobbyMapper.updateHobby(hobby);
    }

    @Override
    public Hobby queryHobbyById(Integer id) {
        return hobbyMapper.queryHobbyById(id);
    }

    @Override
    public Integer deleteHobbyById(Integer id) {
        return hobbyMapper.deleteHobbyById(id);
    }
}
