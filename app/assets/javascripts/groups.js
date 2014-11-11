(function($) {
  $(function() {
    $('.github-link').on('mouseenter', function() {
      var $a = $(this);
      var $container = $a.prev('.git-tooltip');
      $container.show();
      if($container.data('commits-loaded')) {
        return;
      }
      $.get('/proxy/get_commits/' + $a.data('group-id'), function(data) {
        commits = data.slice(0, 5);
        var $result = $('<ul></ul>');
        $.each(commits, function(index, value) {
          $('<li></li>').html(value.author.login + ": " + value.commit.message).appendTo($result);
        });
        $container.html($result);
        $container.data('commits-loaded', true);
      });
    });
    $('.github-link').on('mouseleave', function() {
      var $container = $(this).prev('.git-tooltip');
      // si queremos programar la desaparición luego de un cierto tiempo
      // tenemos estas funciones disponibles:
      //var id = window.setTimeout(function, 1000);
      //var id = window.setInterval
      // y si queremos detener un timeout o interval:
      //window.clearInterval(id)
      //window.clearTimeout(id)
      $container.hide();
    });

    $('article button.show-stats').on('click', function() {
      $.get("https://api.github.com/repos/" + $(this).data('repo') + "/stats/contributors", function(data) {
        console.log(data);
      });
    });
  });
})(jQuery);
