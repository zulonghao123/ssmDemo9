package com.bdqn.services;

import com.bdqn.entity.TUser;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by 祖龙浩 on 2018/2/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TUserServicesImplTest {
    @Autowired
    private TUserServices services;
    @Test
    public void queryTuserForPage() throws Exception {
        PageInfo<TUser> pageInfo = services.queryTuserForPage(2, 2);
        List<TUser> list = pageInfo.getList();
        if (list != null) {

            for (TUser tUser : list) {
                System.out.println(tUser);
            }
        }
    }

}