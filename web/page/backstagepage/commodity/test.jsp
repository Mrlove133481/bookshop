<%--
  Created by IntelliJ IDEA.
  User: Mrlove
  Date: 2019/3/22
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" lay-id="test" style=" ">
    <div class="layui-table-tool">
        <div class="layui-table-tool-temp">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
                <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
                <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
            </div>
        </div>
        <div class="layui-table-tool-self">
            <div class="layui-inline" title="筛选列" lay-event="LAYTABLE_COLS"><i class="layui-icon layui-icon-cols"></i>
            </div>
            <div class="layui-inline" title="导出" lay-event="LAYTABLE_EXPORT"><i
                    class="layui-icon layui-icon-export"></i></div>
            <div class="layui-inline" title="打印" lay-event="LAYTABLE_PRINT"><i class="layui-icon layui-icon-print"></i>
            </div>
        </div>
    </div>
    <div class="layui-table-box">
        <div class="layui-table-header">
            <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                <thead>
                <tr>
                    <th data-field="0" data-key="1-0-0" data-unresize="true" class=" layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary"
                                                                                                        lay-filter="layTableAllChoose">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </th>
                    <th data-field="id" data-key="1-0-1" data-unresize="true" class=" layui-unselect">
                        <div class="layui-table-cell laytable-cell-1-0-1"><span>ID</span><span
                                class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"
                                                                         title="升序"></i><i
                                class="layui-edge layui-table-sort-desc" title="降序"></i></span></div>
                    </th>
                    <th data-field="username" data-key="1-0-2" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2"><span>用户名</span></div>
                    </th>
                    <th data-field="email" data-key="1-0-3" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><span>邮箱</span></div>
                    </th>
                    <th data-field="sex" data-key="1-0-4" class=" layui-unselect">
                        <div class="layui-table-cell laytable-cell-1-0-4"><span>性别</span><span
                                class="layui-table-sort layui-inline" lay-sort="desc"><i
                                class="layui-edge layui-table-sort-asc" title="升序"></i><i
                                class="layui-edge layui-table-sort-desc" title="降序"></i></span></div>
                    </th>
                    <th data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5"><span>城市</span></div>
                    </th>
                    <th data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6"><span>签名</span></div>
                    </th>
                    <th data-field="experience" data-key="1-0-7" class=" layui-unselect">
                        <div class="layui-table-cell laytable-cell-1-0-7"><span>积分</span><span
                                class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"
                                                                         title="升序"></i><i
                                class="layui-edge layui-table-sort-desc" title="降序"></i></span></div>
                    </th>
                    <th data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8"><span>IP</span></div>
                    </th>
                    <th data-field="logins" data-key="1-0-9" class=" layui-unselect">
                        <div class="layui-table-cell laytable-cell-1-0-9"><span>登入次数</span><span
                                class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"
                                                                         title="升序"></i><i
                                class="layui-edge layui-table-sort-desc" title="降序"></i></span></div>
                    </th>
                    <th data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10"><span>加入时间</span></div>
                    </th>
                    <th data-field="11" data-key="1-0-11" class=" layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><span>操作</span></div>
                    </th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="layui-table-body layui-table-main">
            <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                <tbody>
                <tr data-index="0" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10008</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">贤心</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">106</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="1" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10007</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">贤心</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">16</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="2" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10006</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">贤心</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">12</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="3" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10003</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">王勃</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">65</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="4" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary"
                                                                                                        checked="">
                            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10002</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">李白</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">君不见，黄河之水天上来，奔流到海不复回。 君不见，高堂明镜悲白发，朝如青丝暮成雪。
                            人生得意须尽欢，莫使金樽空对月。 天生我材必有用，千金散尽还复来。 烹羊宰牛且为乐，会须一饮三百杯。 岑夫子，丹丘生，将进酒，杯莫停。 与君歌一曲，请君为我倾耳听。(倾耳听
                            一作：侧耳听) 钟鼓馔玉不足贵，但愿长醉不复醒。(不足贵 一作：何足贵；不复醒 一作：不愿醒/不用醒) 古来圣贤皆寂寞，惟有饮者留其名。(古来 一作：自古；惟 通：唯)
                            陈王昔时宴平乐，斗酒十千恣欢谑。 主人何为言少钱，径须沽取对君酌。 五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。
                        </div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">12</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="5" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10001</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">杜甫</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">男</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">点击此处，显示更多。当内容超出时，点击单元格会自动显示更多内容。</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">116</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">108</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="6" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10005</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">冰心</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">女</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">86</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                <tr data-index="7" class="">
                    <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input type="checkbox"
                                                                                                        name="layTableCheckbox"
                                                                                                        lay-skin="primary">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                    class="layui-icon layui-icon-ok"></i></div>
                        </div>
                    </td>
                    <td data-field="id" data-key="1-0-1" class="">
                        <div class="layui-table-cell laytable-cell-1-0-1">10004</div>
                    </td>
                    <td data-field="username" data-key="1-0-2" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-2">李清照</div>
                    </td>
                    <td data-field="email" data-key="1-0-3" data-edit="text" data-content="xianxin@layui.com" class="">
                        <div class="layui-table-cell laytable-cell-1-0-3"><em>xianxin@layui.com</em></div>
                    </td>
                    <td data-field="sex" data-key="1-0-4" data-edit="text" class="">
                        <div class="layui-table-cell laytable-cell-1-0-4">女</div>
                    </td>
                    <td data-field="city" data-key="1-0-5" class="">
                        <div class="layui-table-cell laytable-cell-1-0-5">浙江杭州</div>
                    </td>
                    <td data-field="sign" data-key="1-0-6" class="">
                        <div class="layui-table-cell laytable-cell-1-0-6">人生恰似一场修行</div>
                    </td>
                    <td data-field="experience" data-key="1-0-7" class="">
                        <div class="layui-table-cell laytable-cell-1-0-7">666</div>
                    </td>
                    <td data-field="ip" data-key="1-0-8" class="">
                        <div class="layui-table-cell laytable-cell-1-0-8">192.168.0.8</div>
                    </td>
                    <td data-field="logins" data-key="1-0-9" class="">
                        <div class="layui-table-cell laytable-cell-1-0-9">106</div>
                    </td>
                    <td data-field="joinTime" data-key="1-0-10" class="">
                        <div class="layui-table-cell laytable-cell-1-0-10">2016-10-14</div>
                    </td>
                    <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                        <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                              lay-event="edit">编辑</a> <a
                                class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="layui-table-fixed layui-table-fixed-l">
            <div class="layui-table-header">
                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                    <thead>
                    <tr>
                        <th data-field="0" data-key="1-0-0" data-unresize="true" class=" layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary"
                                    lay-filter="layTableAllChoose">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </th>
                        <th data-field="id" data-key="1-0-1" data-unresize="true" class=" layui-unselect">
                            <div class="layui-table-cell laytable-cell-1-0-1"><span>ID</span><span
                                    class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"
                                                                             title="升序"></i><i
                                    class="layui-edge layui-table-sort-desc" title="降序"></i></span></div>
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="layui-table-body" style="height: 312px;">
                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                    <tbody>
                    <tr data-index="0" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10008</div>
                        </td>
                    </tr>
                    <tr data-index="1" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10007</div>
                        </td>
                    </tr>
                    <tr data-index="2" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10006</div>
                        </td>
                    </tr>
                    <tr data-index="3" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10003</div>
                        </td>
                    </tr>
                    <tr data-index="4" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary" checked="">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10002</div>
                        </td>
                    </tr>
                    <tr data-index="5" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10001</div>
                        </td>
                    </tr>
                    <tr data-index="6" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10005</div>
                        </td>
                    </tr>
                    <tr data-index="7" class="">
                        <td data-field="0" data-key="1-0-0" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-0 laytable-cell-checkbox"><input
                                    type="checkbox" name="layTableCheckbox" lay-skin="primary">
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                                        class="layui-icon layui-icon-ok"></i></div>
                            </div>
                        </td>
                        <td data-field="id" data-key="1-0-1" class="">
                            <div class="layui-table-cell laytable-cell-1-0-1">10004</div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="layui-table-fixed layui-table-fixed-r" style="right: -1px;">
            <div class="layui-table-header">
                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                    <thead>
                    <tr>
                        <th data-field="11" data-key="1-0-11" class=" layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><span>操作</span></div>
                        </th>
                    </tr>
                    </thead>
                </table>
                <div class="layui-table-mend"></div>
            </div>
            <div class="layui-table-body" style="height: 312px;">
                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                    <tbody>
                    <tr data-index="0" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="1" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="2" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="3" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="4" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="5" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="6" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    <tr data-index="7" class="">
                        <td data-field="11" data-key="1-0-11" data-off="true" class="layui-table-col-special">
                            <div class="layui-table-cell laytable-cell-1-0-11"><a class="layui-btn layui-btn-xs"
                                                                                  lay-event="edit">编辑</a> <a
                                    class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="layui-table-page">
        <div id="layui-table-page1">
            <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1"><a href="javascript:;"
                                                                                               class="layui-laypage-prev layui-disabled"
                                                                                               data-page="0"><i
                    class="layui-icon"></i></a><span class="layui-laypage-curr"><em
                    class="layui-laypage-em"></em><em>1</em></span><a href="javascript:;" data-page="2">2</a><a
                    href="javascript:;" data-page="3">3</a><span class="layui-laypage-spr">…</span><a
                    href="javascript:;" class="layui-laypage-last" title="尾页" data-page="300000">300000</a><a
                    href="javascript:;" class="layui-laypage-next" data-page="2"><i class="layui-icon"></i></a><span
                    class="layui-laypage-skip">到第<input type="text" min="1" value="1" class="layui-input">页<button
                    type="button" class="layui-laypage-btn">确定</button></span><span class="layui-laypage-count">共 3000000 条</span><span
                    class="layui-laypage-limits"><select lay-ignore=""><option value="10" selected="">10 条/页</option><option
                    value="20">20 条/页</option><option value="30">30 条/页</option><option value="40">40 条/页</option><option
                    value="50">50 条/页</option><option value="60">60 条/页</option><option value="70">70 条/页</option><option
                    value="80">80 条/页</option><option value="90">90 条/页</option></select></span></div>
        </div>
    </div>
    <style>.laytable-cell-1-0-0 {
        width: 48px;
    }

    .laytable-cell-1-0-1 {
        width: 80px;
    }

    .laytable-cell-1-0-2 {
        width: 120px;
    }

    .laytable-cell-1-0-3 {
        width: 150px;
    }

    .laytable-cell-1-0-4 {
        width: 80px;
    }

    .laytable-cell-1-0-5 {
        width: 100px;
    }

    .laytable-cell-1-0-6 {
    }

    .laytable-cell-1-0-7 {
        width: 80px;
    }

    .laytable-cell-1-0-8 {
        width: 120px;
    }

    .laytable-cell-1-0-9 {
        width: 100px;
    }

    .laytable-cell-1-0-10 {
        width: 120px;
    }

    .laytable-cell-1-0-11 {
        width: 150px;
    }</style>
</div>--%>


<%--<HTML>
<HEAD>
    <meta charset = “UTF-8” >
    <title> DataGrid中的冻结列 -  jQuery EasyUI演示</title>
    <link rel = “stylesheet” type = “text/css” href = “${pageContext.request.contextPath}/jquery-easyui-1.7.0/themes/ default/ easyui.css” >
    <link rel = “stylesheet” type = “text/css” href = “${pageContext.request.contextPath}/jquery-easyui-1.7.0/themes/ icon.css” >
    <link rel = “stylesheet” type = “text/css” href = “${pageContext.request.contextPath}/jquery-easyui-1.7.0/demo/demo.css” >
    <script type = “text/javascript” src = “${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.min.js” > </ script>
<script type = “text/javascript” src = “${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.easyui.min.js” > </ script>
</HEAD>
<BODY>
<h2> DataGrid中的冻结列</h2>
<p> 您可以冻结某些无法滚出视图的列。</p>
<div style="margin: 20px 0;"> </div>
<table class = “easyui-datagrid” title = “DataGrid中的冻结列” style="width :700px ; height :250px"
       data-options = “rownumbers：true，singleSelect：true，url：'datagrid_data1.json'，方法：'get'” >
    <thead data-options = “frozen：true” >
    <TR>
        <th data-options = “field：'itemid'，width：100” > 项目ID </th>
        <th data-options = “field：'productid'，width：120” > 产品</th>
    </TR>
    </THEAD>
    <THEAD>
    <TR>
        <th data-options = “field：'listprice'，width：90，align：'right'” > 清单价格</th>
        <th data-options = “field：'unitcost'，width：90，align：'right'” > 单位成本</th>
        <th data-options = “field：'attr1'，width：250” > 属性</th>
        <th data-options = “field：'status'，width：60，align：'center'” > 状态</th>
    </TR>
    </THEAD>
</TABLE>

</BODY>
</HTML>--%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Frozen Columns in DataGrid - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>



</head>
<body>
<h2>Frozen Columns in DataGrid</h2>
<p>You can freeze some columns that can't scroll out of view.</p>
<div style="margin:20px 0;"></div>
<table id="dg" class="easyui-datagrid" title="Frozen Columns in DataGrid" style="width:750px;height:250px"
       data-options="
                rownumbers:true,
                url:'${pageContext.request.contextPath}/jquery-easyui-1.7.0/demo/datagrid/datagrid_data1.json',
                method:'post',
                autoRowHeight:false,
				pagination:true,
				pageSize:10">
    <thead data-options="frozen:true">
    <tr>
        <th data-options="field:'itemid',width:100">Item ID</th>

    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'productid',width:120,formatter:formatCellTooltip">Product</th>
        <th data-options="field:'listprice',width:90,align:'right'">List Price</th>
        <th data-options="field:'unitcost',width:90,align:'right'">Unit Cost</th>
        <th data-options="field:'attr1',width:250">Attribute</th>
        <th data-options="field:'status',width:60,align:'center'">Status</th>
    </tr>
    </thead>
</table>


<script>
    (function ($) {
        function pagerFilter(data) {
            if ($.isArray(data)) {	// is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var target = this;
            var dg = $(target);
            var state = dg.data('datagrid');
            var opts = dg.datagrid('options');
            if (!state.allRows) {
                state.allRows = (data.rows);
            }
            if (!opts.remoteSort && opts.sortName) {
                var names = opts.sortName.split(',');
                var orders = opts.sortOrder.split(',');
                state.allRows.sort(function (r1, r2) {
                    var r = 0;
                    for (var i = 0; i < names.length; i++) {
                        var sn = names[i];
                        var so = orders[i];
                        var col = $(target).datagrid('getColumnOption', sn);
                        var sortFunc = col.sorter || function (a, b) {
                            return a == b ? 0 : (a > b ? 1 : -1);
                        };
                        r = sortFunc(r1[sn], r2[sn]) * (so == 'asc' ? 1 : -1);
                        if (r != 0) {
                            return r;
                        }
                    }
                    return r;
                });
            }
            var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = state.allRows.slice(start, end);
            return data;
        }

        var loadDataMethod = $.fn.datagrid.methods.loadData;
        var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
        $.extend($.fn.datagrid.methods, {
            clientPaging: function (jq) {
                return jq.each(function () {
                    var dg = $(this);
                    var state = dg.data('datagrid');
                    var opts = state.options;
                    opts.loadFilter = pagerFilter;
                    var onBeforeLoad = opts.onBeforeLoad;
                    opts.onBeforeLoad = function (param) {
                        state.allRows = null;
                        return onBeforeLoad.call(this, param);
                    }
                    var pager = dg.datagrid('getPager');
                    pager.pagination({
                        onSelectPage: function (pageNum, pageSize) {
                            opts.pageNumber = pageNum;
                            opts.pageSize = pageSize;
                            pager.pagination('refresh', {
                                pageNumber: pageNum,
                                pageSize: pageSize,
                            });
                            dg.datagrid('loadData', state.allRows);
                        }
                    });
                    $(this).datagrid('loadData', state.data);
                    if (opts.url) {
                        $(this).datagrid('reload');
                    }
                });
            },
            loadData: function (jq, data) {
                jq.each(function () {
                    $(this).data('datagrid').allRows = null;
                });
                return loadDataMethod.call($.fn.datagrid.methods, jq, data);
            },
            deleteRow: function (jq, index) {
                return jq.each(function () {
                    var row = $(this).datagrid('getRows')[index];
                    deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                    var state = $(this).data('datagrid');
                    if (state.options.loadFilter == pagerFilter) {
                        for (var i = 0; i < state.allRows.length; i++) {
                            if (state.allRows[i] == row) {
                                state.allRows.splice(i, 1);
                                break;
                            }
                        }
                        $(this).datagrid('loadData', state.allRows);
                    }
                });
            },
            getAllRows: function (jq) {
                return jq.data('datagrid').allRows;
            }
        })
    })(jQuery);

    function getData() {
        var rows = [];
        for (var i = 1; i <= 800; i++) {
            var amount = Math.floor(Math.random() * 1000);
            var price = Math.floor(Math.random() * 1000);
            rows.push({
                inv: 'Inv No ' + i,
                date: $.fn.datebox.defaults.formatter(new Date()),
                name: 'Name ' + i,
                amount: amount,
                price: price,
                cost: amount * price,
                note: 'Note ' + i
            });
        }
        return rows;
    }

    $(function () {
        $('#dg').datagrid({data: getData()}).datagrid('clientPaging');
    });


    //格式化单元格提示信息
    function formatCellTooltip(value){
        return "<span title='" + value + "'>" + value + "</span>";
    }
</script>

</body>


</html>
