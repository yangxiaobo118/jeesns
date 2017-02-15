<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>微博模块首页 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link href="${base}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${base}/res/common/css/jeesns.css">
    <link rel="stylesheet" href="${base}/res/common/css/jeesns-skin.css">
    <!--[if lt IE 9]>
    <script src="${base}/res/common/js/html5shiv.min.js"></script>
    <script src="${base}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${base}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/res/common/js/bootstrap.min.js"></script>
    <script src="${base}/res/plugins/metisMenu/metisMenu.js"></script>
    <script src="${base}/res/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${base}/res/plugins/layer/layer.js"></script>
    <script src="${base}/res/common/js/jeesns.js"></script>
    <script src="${base}/res/common/js/manage.js"></script>
    <script src="${base}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>微博列表(${model.page.totalCount})</h5>
                    <div class="col-sm-3 pull-right list-search">
                        <form method="post" action="${managePath}/weibo/index">
                            <div class="input-group">
                                <input type="text" name="key" placeholder="请输入关键词" class="input-sm form-control">
                                <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"> <i class="fa fa-search"></i></button>
                                    </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th style="width: 10px">#</th>
                                <th>用户名</th>
                                <th width="70%">内容</th>
                                <th>赞</th>
                                <th>发布时间</th>
                                <th>状态</th>
                                <th width="50px">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list model.data as weibo>
                            <tr>
                                <td>${weibo.id}</td>
                                <td>${weibo.member.name}</td>
                                <td>${weibo.content}</td>
                                <td>${weibo.favor}</td>
                                <td>${weibo.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <td>
                                    <#if weibo.status=-1>
                                        禁用
                                    <#else>
                                        正常
                                    </#if>
                                </td>
                                <td>
                                    <a class="marg-l-5" target="_jeesnsLink"
                                       href="${managePath}/weibo/delete/${weibo.id}" confirm="确定要删除微博吗？">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right"
                            url="${managePath}/weibo/index?key=${key}"
                            currentPage="${model.page.pageNo}"
                            pageCount="${model.page.totalPage}">
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>
