package com.bdqn.dao;

import com.bdqn.entity.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/7.
 */
public interface ScoreMapper {
    List<Score> queryScoreByGradeIdAndStudentId(@Param("gradeId") Integer gid, @Param("studentId") Integer sid);

}
