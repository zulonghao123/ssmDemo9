package com.bdqn.aop;

import org.aspectj.lang.JoinPoint;

import java.util.Arrays;
import java.util.logging.Logger;

/**
 * Created by 祖龙浩 on 2018/3/2.
 */
public class ControllerLogger {
    private static final Logger log = Logger.getLogger("ControllerLogger");
    public void before(JoinPoint jp){
        log.info("before调用" + jp.getTarget() + "的" + jp.getSignature().getName() + "方法,入参为:" + Arrays.toString(jp.getArgs()));
    }
    public void after(JoinPoint jp ,Object result){
        log.info("after调用" + jp.getTarget() + "的" + jp.getSignature().getName() + "方法.返回值为:" + result);
    }
}
