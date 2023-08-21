---
layout: page
title: Guides
template_engine: liquid
paginate:
  collection: guides
  per_page: 10
  sort_reverse: true
---

{% if paginator.total_pages > 1 %}
  <ul class="pagination">
    {% if paginator.previous_page %}
    <li>
      <a href="{{ paginator.previous_page_path }}">Previous Page</a>
    </li>
    {% endif %}
    {% if paginator.next_page %}
    <li>
      <a href="{{ paginator.next_page_path }}">Next Page</a>
    </li>
    {% endif %}
  </ul>
{% endif %}
