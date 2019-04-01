<!DOCTYPE html> {% set html_class = 'theme-next ' + theme.scheme %} {% if theme.motion.enable %} {% set html_class = html_class + ' use-motion' %} {% endif %}
<html class="{{ html_class | lower }}" lang="{{ config.language }}">

<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  <!-- gitalk评论插件css -->
  <link rel="stylesheet"  href="/js/src/gitalk.css">
  <!-- 看板娘插件css -->
  <link rel="stylesheet" href="/js/live2d/css/live2d.css" />
  <style>
  body {
    user-select: none;
  }
  </style>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  {% set container_class = "container " %} {% if theme.sidebar.position %} {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %} {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <div class="headband"></div>
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>
    <div id="landlord">
    <div class="message" style="opacity:0"></div>
    <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
    <div class="hide-button">隐藏</div>
</div>
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
         
          <div id="gitalk-container"></div>
          {% include '_third-party/duoshuo-hot-articles.swig' %} {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %} {% block sidebar %}{% endblock %} {% endif %}
      </div>
    </main>
    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %} {% include '_third-party/analytics/analytics-with-widget.swig' %} {% block footer %}{% endblock %}
      </div>
    </footer>
    {% if not theme.sidebar.b2t %}
    <div class="back-to-top">
      <i class="fa fa-arrow-up"></i> {% if theme.sidebar.scrollpercent %}
      <span id="scrollpercent"><span>0</span>%</span>
      {% endif %}
    </div>
    {% endif %} {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
    <div id="needsharebutton-float">
      <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
    </div>
    {% endif %}
  </div>
  {% include '_scripts/vendors.swig' %} {% include '_scripts/commons.swig' %} {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %} {% include scheme_script %} {% block script_extra %}{% endblock %} {% include '_scripts/boostrap.swig' %} {% include '_third-party/comments/index.swig' %} {% include '_third-party/search/index.swig' %} {% include '_third-party/analytics/lean-analytics.swig' %} {% include '_third-party/analytics/firestore.swig' %} {% include '_third-party/seo/baidu-push.swig' %} {% include '_third-party/needsharebutton.swig' %} {% include '_third-party/rating.swig' %} {% include '_third-party/mathjax.swig' %} {% include '_third-party/scroll-cookie.swig' %} {% include '_third-party/exturl.swig' %}
  <!-- gitalk评论插件 -->
  <script type="text/javascript" src="/js/src/gitalk.min.js"></script>
  <script src="/js/src/md5.js" type="text/javascript"></script>
  <script>
  let id = location.href
  id = hex_md5(id)
  const gitalk = new Gitalk({
    clientID: '871b33fddf76276d91aa',
    clientSecret: '946e58b00919856b957a8b134b18e232b44af6a5',
    repo: 'hexo',
    owner: 'pengqiangsheng',
    admin: ['pengqiangsheng'],
    id: id,      // Ensure uniqueness and length less than 50
    distractionFreeMode: true  // Facebook-like distraction free mode
  })
  gitalk.render('gitalk-container')
  </script>
  <!-- live2d看板娘 -->
  <script type="text/javascript">
    var message_Path = '/js/live2d/'
    var home_Path = 'https://forever.netlify.com/'  //此处修改为你的域名，必须带斜杠
  </script>
  <script type="text/javascript" src="/js/live2d/js/live2d.js"></script>
  <script type="text/javascript" src="/js/live2d/js/message.js"></script>
  <script type="text/javascript">
      loadlive2d("live2d", "/js/live2d/model/tia/model.json");
  </script>
  <!-- 页面点击小红心 -->
  <script type="text/javascript" src="/js/src/love.js"></script>
  <!-- is_coding -->
  <script type="text/javascript" src="/js/src/mycoding.js"></script>
</body>

</html>
