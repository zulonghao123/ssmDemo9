package com.bdqn.services;

import com.bdqn.entity.Score;
import com.bdqn.util.PageUtil;

/**
 * Created by 祖龙浩 on 2018/3/8.
 */
public interface ScoreServices {

    PageUtil<Score> queryScoreByGradeIdAndStudentId(Integer gid, Integer sid, Integer pageNum, Integer pageSize);

}
