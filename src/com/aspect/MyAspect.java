package com.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

//@Aspect("goodsAspect")
public class MyAspect {
//	@Pointcut("execution(* com.service.*.*(..)")
//	private void goodsMethod() {
//		
//	}
	
	//@Before("goodsMethod()")
	public void beforemethod(JoinPoint call) {
		String className = call.getTarget().getClass().getName();
		String methodName = call.getSignature().getName();
		System.out.println("前置通知：" + className + "的" + methodName + "方法开始...");
	}
	

}
