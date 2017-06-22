package JunitTest;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext_Junit.xml")
@WebAppConfiguration("web") // web项目的根目录，默认为 file:src/main/webapp
public class UserControllerLoginTest {
	@Autowired
	private AdminService userService;
	@Autowired
	private WebApplicationContext wac;
	private MockMvc mockMvc;
	private MockHttpSession session;
	@Rule
	public ExpectedException expectedException = ExpectedException.none();

	@Before
	public void setUpSession() throws Exception {
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
		RequestBuilder builder = MockMvcRequestBuilders.post("/admin/signInPost").param("username", "admin").param("password", "123456");
		// 执行
		ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
		// MockMvcResultHandlers提供结果处理功能
		// MockMvcResultMatchers提供断言功能
		// .andExpect(MockMvcResultMatchers.status().isOk()
		MvcResult result = resultActions.andReturn();
		session = (MockHttpSession) result.getRequest().getSession();
	}

	public void queryOrders() throws Exception {
//      {"message":"添加成功","status":1}  {"message":"添加失败，用户已存在！","status":0}
		RequestBuilder builder = MockMvcRequestBuilders
				.post("/SOA/queryOrders")
				.param("sfzh", "321322199512165417")
				.param("name", "张猛治")
				.param("phone", "15545016598")
				.session(session);
		ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
		MvcResult result = resultActions.andReturn();
		session = (MockHttpSession) result.getRequest().getSession();
	}

    public void addUser() throws Exception {
//      {"message":"添加成功","status":1}  {"message":"添加失败，用户已存在！","status":0}
        RequestBuilder builder = MockMvcRequestBuilders
                .post("/SOA/orderRoom")
                .param("sfzh", "321322199512165417")
                .param("name", "张猛治")
                .param("inDate", "2017-06-29")
                .param("roomType", "总统套房")
                .param("phone", "15545016598")
//                .param("title","教授")
//                .param("introduction","我就是张猛治，哈哈")
//                .param("role","teacher")
//                .param("phone","15545016598")
                .session(session);
        ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
        MvcResult result = resultActions.andReturn();
        session = (MockHttpSession) result.getRequest().getSession();
    }

	public void cancelOrder() throws Exception {
		RequestBuilder builder = MockMvcRequestBuilders
				.post("/SOA/cancelOrder")
				.param("id", "2")
//                .param("title","教授")
//                .param("introduction","我就是张猛治，哈哈")
//                .param("role","teacher")
//                .param("phone","15545016598")
				.session(session);
		ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
		MvcResult result = resultActions.andReturn();
		session = (MockHttpSession) result.getRequest().getSession();
	}
	public void inMoney() throws Exception {
//	    {"total":2,"rows":[{"role":"teacher","id":2,"userName":"张猛治4","title":"教授","introduction":"我就是张猛治，哈哈"},{"role":"teacher","phone":"15545016598","id":3,"userName":"张猛治5","title":"教授","introduction":"我就是张猛治，哈哈"}]}
		RequestBuilder builder = MockMvcRequestBuilders
				.post("/admin/inMoney")
				.param("order_id", "1")
                .session(session);
		ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
		MvcResult result = resultActions.andReturn();
		session = (MockHttpSession) result.getRequest().getSession();
	}
    public void roomNumberListCanSelect() throws Exception {
//	    {"total":2,"rows":[{"role":"teacher","id":2,"userName":"张猛治4","title":"教授","introduction":"我就是张猛治，哈哈"},{"role":"teacher","phone":"15545016598","id":3,"userName":"张猛治5","title":"教授","introduction":"我就是张猛治，哈哈"}]}
        RequestBuilder builder = MockMvcRequestBuilders
                .post("/admin/roomNumberListCanSelect")
                .param("order_id", "1")
                .session(session);
        ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
        MvcResult result = resultActions.andReturn();
        session = (MockHttpSession) result.getRequest().getSession();
    }
    public void checkIn() throws Exception {
//	    {"total":2,"rows":[{"role":"teacher","id":2,"userName":"张猛治4","title":"教授","introduction":"我就是张猛治，哈哈"},{"role":"teacher","phone":"15545016598","id":3,"userName":"张猛治5","title":"教授","introduction":"我就是张猛治，哈哈"}]}
        RequestBuilder builder = MockMvcRequestBuilders
                .post("/admin/checkIn")
                .param("order_id", "1")
                .param("roomNumberId", "5")
                .session(session);
        ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
        MvcResult result = resultActions.andReturn();
        session = (MockHttpSession) result.getRequest().getSession();
    }
    @Test
    public void nii() throws Exception {
//	    {"total":2,"rows":[{"role":"teacher","id":2,"userName":"张猛治4","title":"教授","introduction":"我就是张猛治，哈哈"},{"role":"teacher","phone":"15545016598","id":3,"userName":"张猛治5","title":"教授","introduction":"我就是张猛治，哈哈"}]}
        RequestBuilder builder = MockMvcRequestBuilders
                .post("/admin/ordersListNotInMoney")
                .session(session);
        ResultActions resultActions = mockMvc.perform(builder).andDo(MockMvcResultHandlers.print());
        MvcResult result = resultActions.andReturn();
        session = (MockHttpSession) result.getRequest().getSession();
    }
}
