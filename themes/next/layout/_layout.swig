<!DOCTYPE html> {% set html_class = 'theme-next ' + theme.scheme %} {% if theme.motion.enable %} {% set html_class = html_class + ' use-motion' %} {% endif %}
<html class="{{ html_class | lower }}" lang="{{ config.language }}">

<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  <link rel="stylesheet" href="https://pengqiangsheng.github.io/uploads/default.css">
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  {% set container_class = "container " %} {% if theme.sidebar.position %} {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %} {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <div class="headband"></div>
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
         
          <div id="container"></div>
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
  <script src="/js/src/gitment.browser.js"></script>
  <script>
  var gitment = new Gitment({
    id: 'location.href', // 可选。默认为 location.href
    owner: 'pengqiangsheng',
    repo: 'message',
    oauth: {
      client_id: '7267b0f4df041dd7f88c',
      client_secret: 'fe5fb2e83345dcdc840773a377f3c6a488629abf',
    },
  })
  gitment.render('container')

  </script>
  <!-- 页面点击小红心 -->
  <script type="text/javascript" src="/js/src/love.js"></script>
  <!-- is_coding -->
  <script type="text/javascript" src="/js/src/mycoding.js"></script>
</body>

</html>