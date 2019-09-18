package mapper;

import com.css.dao.UserMapper;
import com.css.entity.User;
import com.css.util.UuidUtil;
import jdk.nashorn.internal.runtime.logging.Logger;
import org.junit.After;
import org.junit.Before;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

    AbstractApplicationContext ac = null;

    @Before
    public void init(){
        ac = new ClassPathXmlApplicationContext("spring-mvc.xml","configuration.xml");
        System.err.println("ac: "+ ac);
    }

    @org.junit.Test
    public void test(){
        UserMapper userMapper = ac.getBean("userMapper",UserMapper.class);
        User user = new User();
        user.setSjhm("13524115641");
        user.setPwd("123");
        user.setId(UuidUtil.getUUID());
        user.setZjhm("123");
        Integer count = userMapper.saveUser(user);
        System.err.println("count: "+count);

    }

    @After
    public void destroy(){
        ac.close();
    }
}
