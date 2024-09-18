package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.service.ISysPatrolService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 巡查管理Controller
 * 
 * @author ruoyi
 * @date 2024-06-23
 */
@RestController
@RequestMapping("/system/patrol")
public class SysPatrolController extends BaseController
{
    @Autowired
    private ISysPatrolService sysPatrolService;

    /**
     * 查询巡查管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPatrol sysPatrol)
    {
        startPage();
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList(sysPatrol);
        return getDataTable(list);
    }

    /**
     * 导出巡查管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:export')")
    @Log(title = "巡查管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPatrol sysPatrol)
    {
        List<SysPatrol> list = sysPatrolService.selectSysPatrolList(sysPatrol);
        ExcelUtil<SysPatrol> util = new ExcelUtil<SysPatrol>(SysPatrol.class);
        util.exportExcel(response, list, "巡查管理数据");
    }

    /**
     * 获取巡查管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysPatrolService.selectSysPatrolById(id));
    }

    /**
     * 新增巡查管理
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:add')")
    @Log(title = "巡查管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPatrol sysPatrol)
    {
        return toAjax(sysPatrolService.insertSysPatrol(sysPatrol));
    }

    /**
     * 修改巡查管理
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:edit')")
    @Log(title = "巡查管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPatrol sysPatrol)
    {
        return toAjax(sysPatrolService.updateSysPatrol(sysPatrol));
    }

    /**
     * 删除巡查管理
     */
    @PreAuthorize("@ss.hasPermi('system:patrol:remove')")
    @Log(title = "巡查管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysPatrolService.deleteSysPatrolByIds(ids));
    }
}
