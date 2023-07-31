<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.dao.${module};

import com.cheguo.econtract.BaseTest;
import org.junit.Test;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${basePackage}.domain.${module}.${className};
import ${basePackage}.dto.${module}.Query${className}Dto;


/**
* Created by zdf
*/
public class ${className}ServiceTest extends BaseTest{
	@Autowired
	private ${className}Service service;

	@Test
	public void testInsert(){
		${className} entity = new ${className}();

		Integer ret = service.insert(entity);
		System.out.println(ret);
		System.out.println(entity.getId());
	}

	@Test
	public void testGetById(){
		Integer id = 4;
		${className} entity = service.getById(id);
		System.out.println(entity.toString());
	}

	@Test
	public void testDelById(){
		Integer id = 1;
		Integer ret = service.delById(id);
		System.out.println(ret);
	}

	@Test
	public void testUpdate(){
		${className} entity = new ${className}();
		entity.setId(4);

		Integer ret = service.update(entity);
		System.out.println(ret);
	}

	@Test
	public void testQueryList(){
		Query${className}Dto query${className}Dto = new Query${className}Dto();

		List<${className}> list = service.queryList(query${className}Dto);
    	for (${className} ${classNameLower}:list) {
    		System.out.println(${classNameLower}.toString());
    	}
    }

    @Test
    public void testPage(){
		Query${className}Dto query${className}Dto = new Query${className}Dto();
		query${className}Dto.setPageNo(1);
		query${className}Dto.setPageSize(10);
		PageInfo pageInfo = service.queryForPage(query${className}Dto);
		if(null != pageInfo){
		System.out.println(pageInfo.getTotal());
		System.out.println(pageInfo.getPageSize());
		for (${className} ${classNameLower}:(List<${className}>)pageInfo.getList()) {
				System.out.println(${classNameLower}.toString());
			}
        }
	}
}
