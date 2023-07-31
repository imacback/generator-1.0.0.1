<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.persist.dao;


import ${basePackage}.${module}.persist.domain.entity.${className}DO;
import ${basePackage}.${module}.persist.domain.query.${className}Query;
import ${basePackage}.${module}.persist.domain.query.${className}PageQuery;
import com.bwton.lang.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.List;


/**
* Created by zdf
*/
public class ${className}MapperTest extends BaseDaoTest{
	@Autowired
	private ${className}Mapper mapper;

	@Test
	public void testInsert(){
		${className}DO ${classNameLower}DO = new ${className}DO();
		Long v = 1L;
	<#list table.columns as column>
	<#if column.javaType == "java.lang.String">
		${classNameLower}DO.set${column.columnName}(v + "");
	<#elseif column.javaType == "java.util.Date">
		${classNameLower}DO.set${column.columnName}(new Date());
	<#elseif column.javaType == "java.lang.Long">
		${classNameLower}DO.set${column.columnName}(Long.valueOf(v));
	<#elseif column.javaType == "java.lang.Integer">
		${classNameLower}DO.set${column.columnName}(v.intValue());
	<#else>
		${classNameLower}DO.set${column.columnName}(v.intValue());
	</#if>
	</#list>
		Integer ret = mapper.insert(${classNameLower}DO);
		System.out.println(ret);
		System.out.println(${classNameLower}DO.getId());
	}

	@Test
	public void testSelectByPrimaryKey(){
		Long id = 4L;
		${className}DO ${classNameLower}DO = mapper.selectByPrimaryKey(id);
		System.out.println(${classNameLower}DO.toString());
	}

	@Test
	public void testDeleteByPrimaryKey(){
		Long id = 1L;
		Integer ret = mapper.deleteByPrimaryKey(id);
		System.out.println(ret);
	}

	@Test
	public void testUpdateByPrimaryKeySelective(){
		${className}DO ${classNameLower}DO = new ${className}DO();

		Long v = 1L;
	<#list table.columns as column>
	<#if column.javaType == "java.lang.String">
		${classNameLower}DO.set${column.columnName}(v + "");
	<#elseif column.javaType == "java.util.Date">
		${classNameLower}DO.set${column.columnName}(new Date());
	<#elseif column.javaType == "java.lang.Long">
		${classNameLower}DO.set${column.columnName}(v);
	<#elseif column.javaType == "java.lang.Integer">
		${classNameLower}DO.set${column.columnName}(v.intValue());
	<#else>
		${classNameLower}DO.set${column.columnName}(v);
	</#if>
	</#list>
		Integer ret = mapper.updateByPrimaryKeySelective(${classNameLower}DO);
		System.out.println(ret);
	}

	@Test
	public void testQueryList(){
		${className}Query ${classNameLower}Query = new ${className}Query();

		List<${className}DO> list = mapper.queryForList(${classNameLower}Query);
    	for (${className}DO ${classNameLower}DO:list) {
    		System.out.println(${classNameLower}DO.toString());
    	}
    }

    @Test
    public void testPage(){
		${className}PageQuery ${classNameLower}PageQuery = new ${className}PageQuery();
		${classNameLower}PageQuery.setPageNo(1);
		${classNameLower}PageQuery.setPageSize(2);

        Page<${className}DO> page = mapper.queryForPage(${classNameLower}PageQuery);
    	List<${className}DO> list = page.getRows();
        for (${className}DO ${classNameLower}DO: list) {
        	System.out.println(${classNameLower}DO.toString());
        }
	}
}
