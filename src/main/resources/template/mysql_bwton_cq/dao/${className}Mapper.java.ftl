<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.persist.dao;

import java.util.List;
import org.apache.ibatis.annotations.*;
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
@Mapper
public interface ${className}Mapper extends BaseMapper<Long, ${className}DO>{


    /**
    * 查询数据列表
    * @param ${classNameLower}Query
    * @return List<${className}DO>
    */
    List<${className}DO> queryForList(${className}Query ${classNameLower}Query);

	/**
	* 条件查询-可分页
    * @param ${classNameLower}PageQuery
    * @return
	*/
    Page<${className}DO> queryForPage(${className}PageQuery ${classNameLower}PageQuery);
}
