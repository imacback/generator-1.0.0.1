<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.persist.service;



import java.util.List;
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
 * @author ${author}
 * @date ${.now}
 */
public interface ${className}Service {
    /**
     *
     * 根据ID获取记录
     * @param id
     * @return
     */
    ${className}DO selectByPrimaryKey(<#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> id);

    /**
     *
     * 保存记录并返回主键
     * @param ${classNameLower}DO
     * @return
     */
    <#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> insert(${className}DO ${classNameLower}DO);

    /**
     *
     * 更新记录（主键不为空）
     * @param ${classNameLower}DO
     * @return
     */
    int updateByPrimaryKeySelective(${className}DO ${classNameLower}DO);

    /**
     *
     * 根据ID删除记录（物理）
     * @param id
     * @return
     */
    int deleteByPrimaryKey(<#list table.pkColumns as column>${column.javaType?split(".")[2]}</#list> id);

    /**
     *
     * 多条件组合查询
     * @param ${classNameLower}Query
     * @return
     */
    List <${className}DO> queryForList(${className}Query ${classNameLower}Query);

    /**
     *
     * 分页查找
     * @param ${classNameLower}PageQuery
     * @return
     */
    Page<${className}DO> queryForPage(${className}PageQuery ${classNameLower}PageQuery);

}
