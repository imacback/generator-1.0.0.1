<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.persist.service.impl;

import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${basePackage}.${module}.persist.dao.${className}Mapper;
import ${basePackage}.${module}.persist.service.${className}Service;
import ${basePackage}.${module}.persist.domain.entity.${className}DO;
import ${basePackage}.${module}.persist.domain.query.${className}PageQuery;
import ${basePackage}.${module}.persist.domain.query.${className}Query;
import com.bwton.lang.Page;

/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @see ${basePackage}.${module}.persist.service.${className}Service
 * @author ${author}
 * @date ${.now}
 */
@Slf4j
@Service
public class ${className}ServiceImpl implements ${className}Service {

	@Autowired
    private ${className}Mapper ${classNameLower}Mapper;

    @Override
    public ${className}DO selectByPrimaryKey(<#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> id) {
        return ${classNameLower}Mapper.selectByPrimaryKey(id);
    }

    @Override
    public <#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> insert(${className}DO ${classNameLower}DO) {
        ${classNameLower}DO.setCreateTime(new Date());
        ${classNameLower}Mapper.insert(${classNameLower}DO);

        <#list table.pkColumns as column>
        return ${classNameLower}DO.get${column.columnName}();
        </#list>
    }

    @Override
    public int updateByPrimaryKeySelective(${className}DO ${classNameLower}DO) {
        ${classNameLower}DO.setUpdateTime(new Date());

        return ${classNameLower}Mapper.updateByPrimaryKeySelective(${classNameLower}DO);
    }

    @Override
    public int deleteByPrimaryKey(<#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> id) {
        return ${classNameLower}Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public List <${className}DO> queryForList(${className}Query ${classNameLower}Query) {
       return ${classNameLower}Mapper.queryForList(${classNameLower}Query);
    }

    @Override
    public Page<${className}DO> queryForPage(${className}PageQuery ${classNameLower}PageQuery) {
        Page<${className}DO> page = ${classNameLower}Mapper.queryForPage(${classNameLower}PageQuery);
        return page;
    }

}
