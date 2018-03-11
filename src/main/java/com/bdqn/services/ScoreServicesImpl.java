package com.bdqn.services;

import com.bdqn.dao.ScoreMapper;
import com.bdqn.entity.Score;
import com.bdqn.util.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/8.
 */
@Service
public class ScoreServicesImpl implements ScoreServices {
    @Autowired
    private ScoreMapper scoreMapper;
    @Override
    public PageUtil<Score> queryScoreByGradeIdAndStudentId(Integer gid, Integer sid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Score> list = scoreMapper.queryScoreByGradeIdAndStudentId(gid, sid);
        PageInfo<Score> pageInfo = new PageInfo<>(list);
        PageUtil<Score> pageUtil = new PageUtil<>(pageInfo);

        return pageUtil;

    }
}
