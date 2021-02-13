---
title: Time ago
layout: page
---

> Demo of the [jekyll-timeago](https://rubygems.org/gems/jekyll-timeago) gem. This is not in the GitHub Pages supported list but used here through GH Actions.

{% assign date = '2016-03-23T10:20:00Z' %}

- Original value
    - `{{ date }}`
- Time ago filter
    - `{{ date | timeago }}`
- Time ago filter with YYYY-MM-DD format set using `'2020-1-1'`
    - `{{ date | timeago: '2020-1-1' }}`
