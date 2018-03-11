package com.bdqn.services;

import com.bdqn.dao.CourseMapper;
import com.bdqn.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/3/9.
 */
@Service
public class CourseServicesImpl implements CourseServices {
    @Autowired
    private CourseMapper courseMapper;
    @Override
    public List<Course> queryAll() {
        return courseMapper.queryAll();
    }
}
