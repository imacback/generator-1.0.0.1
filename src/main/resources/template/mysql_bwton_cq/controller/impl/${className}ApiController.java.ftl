<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.controller;

import ${basePackage}.${module}.api.interfaces.${className}Api;
import ${basePackage}.${module}.bizservice.${className}BizService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @see ${basePackage}.${module}.api.interfaces.${className}Api
 * @author ${author}
 * @date ${.now}
 */
@RestController
@Slf4j
public class ${className}ApiController implements ${className}Api {
    @Autowired
    private ${className}BizService ${classNameLower}BizService;


}
