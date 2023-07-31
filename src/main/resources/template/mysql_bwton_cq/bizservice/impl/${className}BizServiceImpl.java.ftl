<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.bizservice.impl;

import ${basePackage}.${module}.bizservice.${className}BizService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${basePackage}.${module}.persist.service.${className}Service;


/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @see ${basePackage}.${module}.bizservice.${className}BizService
 * @author ${author}
 * @date ${.now}
 */
@Slf4j
@Service
public class ${className}BizServiceImpl implements ${className}BizService {
    @Autowired
    private ${className}Service ${classNameLower}userService;


}
