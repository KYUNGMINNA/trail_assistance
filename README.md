  <h1>온라인 재판 조력자 선발 시스템</h1>

 <br>
 <h2>프로젝트 개요</h2>
<h4>법원에서 전문적인 지식과 경험이 필요로 하는 사건을 심사 할 때 법원 외부의 관련 전문가를 참여하게 하여 도움을 받는데 서면으로 진행되던 방식을 온라인으로 제공하기 위함</h4>

<br>
<h2>브라우저 서포트</h2>
<ul>
<h4>Chrome</h4>
</ul>



<br>
<h2>프로젝트 주요 기능</h2>
<h3>사용자</h3>
<ul>
<h4>회원 가입 및 아이디 비밀번호 찾기</h4>
<h4>개인정보수정</h4>
<h4>조력자 신청(개인,기관)</h4>
<h4>1:1문의 등록</h4>
</ul>

<h3>관리자</h3>
<ul>
<h4>공지사항 , FAQ , 조력자 모집 공고 등록</h4>
<h4>1:1문의 답변</h4>
<h4>조력자 승인 여부 심사</h4>
</ul>


<br>
<h2>프로젝트 개발 환경</h2>
<h3>Front</h3>
<ul>
<h4>HTML5&CSS3&JS</h4>
</ul>
<h3>Back</h3>
<ul>
<h4>Language : JAVA8</h4>
<h4>Framwork : Spring  5.3.18</h4>
<h4>Server : Apache Tomcat8.5</h4>
<h4>DataBase :Oracle 11g</h4>

</ul>
<h3>Tools</h3>
<ul>
<h4>STS 3.9.13</h4>
</ul>



<br>
<h2>상세 설명</h2>
<ul>
<li>
<h3>사용자의 조력자 신청,사용자 계정의 마이페이지 , 관리자의 게시글 등록 ,관리자 조력자 승인기능들은 로그인이 되어 있지 않으면 사용이 불가능하게 인터셉터를 설정</h3>
</li>

```java
public class UserAuthHandler implements HandlerInterceptor {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();

		if(session.getAttribute("login") ==null) {
			response.sendRedirect(request.getContextPath()+"/account/login");
			return false;
		}

		return true; 

	}
}



```


```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<bean id="userAuth" class="com.assistance.trial.util.interceptor.UserAuthHandler"/>
	<mvc:interceptors>
			<mvc:interceptor>
				<mvc:mapping path="/assistant/*"/>
				<mvc:mapping path="/admin/*"/>
				<mvc:mapping path="/mypage/*"/>
				<mvc:mapping path="/oneboard/*" />
				<ref bean="userAuth"/>
			</mvc:interceptor>
	</mvc:interceptors>

</beans>




```
<br>
<br>
<li>
<h3>로그인한 계정의 정보를 유지하기 위해 세션을 사용하였으며 로그인 성공시 세션을 생성하였음</h3>
</li>

```java
public class UserLoginSuccessHandler implements HandlerInterceptor{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		ModelMap mv=modelAndView.getModelMap();
		AccountVO vo=(AccountVO)mv.get("user");
		
		if(vo ==null) {
			modelAndView.addObject("msg", "loginFail");
			modelAndView.setViewName("/user/login");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("login", vo);			
			response.sendRedirect(request.getContextPath()); 

		}
		
	}
}

```

```xml

<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-4.3.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<bean id="userLoginSuccessHandler" class="com.assistance.trial.util.interceptor.UserLoginSuccessHandler"/>
	<mvc:interceptors>
			<mvc:interceptor>
				<mvc:mapping path="/account/userlogin"/>
				<ref bean="userLoginSuccessHandler"/>
			</mvc:interceptor>
	</mvc:interceptors>

</beans>

```


</ul>






