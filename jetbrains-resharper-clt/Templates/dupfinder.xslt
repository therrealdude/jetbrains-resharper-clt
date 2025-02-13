<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:template match="/">
    <html>

    <head>
      <title>ReSharper DupFinder Report</title>
      <style>
        
        .is-unselectable {
          -webkit-touch-callout: none;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none
        }

        .table:not(:last-child),
        .table-container:not(:last-child),
        .title:not(:last-child),
        .subtitle:not(:last-child),
        .level:not(:last-child) {
          margin-bottom: 1.5rem
        }

        .is-overlay,
        .hero-video {
          bottom: 0;
          left: 0;
          position: absolute;
          right: 0;
          top: 0
        }

        /*! minireset.css v0.0.6 | MIT License | github.com/jgthms/minireset.css */
        html,
        body,
        p,
        ol,
        ul,
        li,
        dl,
        dt,
        dd,
        blockquote,
        figure,
        fieldset,
        legend,
        textarea,
        pre,
        iframe,
        hr,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
          margin: 0;
          padding: 0
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
          font-size: 100%;
          font-weight: normal
        }

        ul {
          list-style: none
        }

        button,
        input,
        select,
        textarea {
          margin: 0
        }

        html {
          box-sizing: border-box
        }

        *,
        *::before,
        *::after {
          box-sizing: inherit
        }

        img,
        video {
          height: auto;
          max-width: 100%
        }

        iframe {
          border: 0
        }

        table {
          border-collapse: collapse;
          border-spacing: 0
        }

        td,
        th {
          padding: 0
        }

        td:not([align]),
        th:not([align]) {
          text-align: left
        }

        html {
          background-color: #fff;
          font-size: 16px;
          -moz-osx-font-smoothing: grayscale;
          -webkit-font-smoothing: antialiased;
          min-width: 300px;
          overflow-x: hidden;
          overflow-y: scroll;
          text-rendering: optimizeLegibility;
          text-size-adjust: 100%
        }

        article,
        aside,
        figure,
        footer,
        header,
        hgroup,
        section {
          display: block
        }

        body,
        button,
        input,
        select,
        textarea {
          font-family: BlinkMacSystemFont, -apple-system, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif
        }

        code,
        pre {
          -moz-osx-font-smoothing: auto;
          -webkit-font-smoothing: auto;
          font-family: monospace
        }

        body {
          color: #4a4a4a;
          font-size: 1em;
          font-weight: 400;
          line-height: 1.5
        }

        a {
          color: #3273dc;
          cursor: pointer;
          text-decoration: none
        }

        a strong {
          color: currentColor
        }

        a:hover {
          color: #363636
        }

        code {
          background-color: #f5f5f5;
          color: #f14668;
          font-size: .875em;
          font-weight: normal;
          padding: 0.25em 0.5em 0.25em
        }

        hr {
          background-color: #f5f5f5;
          border: none;
          display: block;
          height: 2px;
          margin: 1.5rem 0
        }

        img {
          height: auto;
          max-width: 100%
        }

        input[type="checkbox"],
        input[type="radio"] {
          vertical-align: baseline
        }

        small {
          font-size: .875em
        }

        span {
          font-style: inherit;
          font-weight: inherit
        }

        strong {
          color: #363636;
          font-weight: 700
        }

        fieldset {
          border: none
        }

        pre {
          -webkit-overflow-scrolling: touch;
          background-color: #f5f5f5;
          color: #4a4a4a;
          font-size: .875em;
          overflow-x: auto;
          padding: 1.25rem 1.5rem;
          white-space: pre;
          word-wrap: normal
        }

        pre code {
          background-color: transparent;
          color: currentColor;
          font-size: 1em;
          padding: 0
        }

        table td,
        table th {
          vertical-align: top
        }

        table td:not([align]),
        table th:not([align]) {
          text-align: left
        }

        table th {
          color: #363636
        }

        .is-clearfix::after {
          clear: both;
          content: " ";
          display: table
        }

        .is-pulled-left {
          float: left !important
        }

        .is-pulled-right {
          float: right !important
        }

        .is-clipped {
          overflow: hidden !important
        }

        .is-size-1 {
          font-size: 3rem !important
        }

        .is-size-2 {
          font-size: 2.5rem !important
        }

        .is-size-3 {
          font-size: 2rem !important
        }

        .is-size-4 {
          font-size: 1.5rem !important
        }

        .is-size-5 {
          font-size: 1.25rem !important
        }

        .is-size-6 {
          font-size: 1rem !important
        }

        .is-size-7 {
          font-size: .75rem !important
        }

        @media screen and (max-width: 768px) {
          .is-size-1-mobile {
            font-size: 3rem !important
          }

          .is-size-2-mobile {
            font-size: 2.5rem !important
          }

          .is-size-3-mobile {
            font-size: 2rem !important
          }

          .is-size-4-mobile {
            font-size: 1.5rem !important
          }

          .is-size-5-mobile {
            font-size: 1.25rem !important
          }

          .is-size-6-mobile {
            font-size: 1rem !important
          }

          .is-size-7-mobile {
            font-size: .75rem !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-size-1-tablet {
            font-size: 3rem !important
          }

          .is-size-2-tablet {
            font-size: 2.5rem !important
          }

          .is-size-3-tablet {
            font-size: 2rem !important
          }

          .is-size-4-tablet {
            font-size: 1.5rem !important
          }

          .is-size-5-tablet {
            font-size: 1.25rem !important
          }

          .is-size-6-tablet {
            font-size: 1rem !important
          }

          .is-size-7-tablet {
            font-size: .75rem !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-size-1-touch {
            font-size: 3rem !important
          }

          .is-size-2-touch {
            font-size: 2.5rem !important
          }

          .is-size-3-touch {
            font-size: 2rem !important
          }

          .is-size-4-touch {
            font-size: 1.5rem !important
          }

          .is-size-5-touch {
            font-size: 1.25rem !important
          }

          .is-size-6-touch {
            font-size: 1rem !important
          }

          .is-size-7-touch {
            font-size: .75rem !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-size-1-desktop {
            font-size: 3rem !important
          }

          .is-size-2-desktop {
            font-size: 2.5rem !important
          }

          .is-size-3-desktop {
            font-size: 2rem !important
          }

          .is-size-4-desktop {
            font-size: 1.5rem !important
          }

          .is-size-5-desktop {
            font-size: 1.25rem !important
          }

          .is-size-6-desktop {
            font-size: 1rem !important
          }

          .is-size-7-desktop {
            font-size: .75rem !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-size-1-widescreen {
            font-size: 3rem !important
          }

          .is-size-2-widescreen {
            font-size: 2.5rem !important
          }

          .is-size-3-widescreen {
            font-size: 2rem !important
          }

          .is-size-4-widescreen {
            font-size: 1.5rem !important
          }

          .is-size-5-widescreen {
            font-size: 1.25rem !important
          }

          .is-size-6-widescreen {
            font-size: 1rem !important
          }

          .is-size-7-widescreen {
            font-size: .75rem !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-size-1-fullhd {
            font-size: 3rem !important
          }

          .is-size-2-fullhd {
            font-size: 2.5rem !important
          }

          .is-size-3-fullhd {
            font-size: 2rem !important
          }

          .is-size-4-fullhd {
            font-size: 1.5rem !important
          }

          .is-size-5-fullhd {
            font-size: 1.25rem !important
          }

          .is-size-6-fullhd {
            font-size: 1rem !important
          }

          .is-size-7-fullhd {
            font-size: .75rem !important
          }
        }

        .has-text-centered {
          text-align: center !important
        }

        .has-text-justified {
          text-align: justify !important
        }

        .has-text-left {
          text-align: left !important
        }

        .has-text-right {
          text-align: right !important
        }

        @media screen and (max-width: 768px) {
          .has-text-centered-mobile {
            text-align: center !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .has-text-centered-tablet {
            text-align: center !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .has-text-centered-tablet-only {
            text-align: center !important
          }
        }

        @media screen and (max-width: 1023px) {
          .has-text-centered-touch {
            text-align: center !important
          }
        }

        @media screen and (min-width: 1024px) {
          .has-text-centered-desktop {
            text-align: center !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .has-text-centered-desktop-only {
            text-align: center !important
          }
        }

        @media screen and (min-width: 1216px) {
          .has-text-centered-widescreen {
            text-align: center !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .has-text-centered-widescreen-only {
            text-align: center !important
          }
        }

        @media screen and (min-width: 1408px) {
          .has-text-centered-fullhd {
            text-align: center !important
          }
        }

        @media screen and (max-width: 768px) {
          .has-text-justified-mobile {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .has-text-justified-tablet {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .has-text-justified-tablet-only {
            text-align: justify !important
          }
        }

        @media screen and (max-width: 1023px) {
          .has-text-justified-touch {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 1024px) {
          .has-text-justified-desktop {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .has-text-justified-desktop-only {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 1216px) {
          .has-text-justified-widescreen {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .has-text-justified-widescreen-only {
            text-align: justify !important
          }
        }

        @media screen and (min-width: 1408px) {
          .has-text-justified-fullhd {
            text-align: justify !important
          }
        }

        @media screen and (max-width: 768px) {
          .has-text-left-mobile {
            text-align: left !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .has-text-left-tablet {
            text-align: left !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .has-text-left-tablet-only {
            text-align: left !important
          }
        }

        @media screen and (max-width: 1023px) {
          .has-text-left-touch {
            text-align: left !important
          }
        }

        @media screen and (min-width: 1024px) {
          .has-text-left-desktop {
            text-align: left !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .has-text-left-desktop-only {
            text-align: left !important
          }
        }

        @media screen and (min-width: 1216px) {
          .has-text-left-widescreen {
            text-align: left !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .has-text-left-widescreen-only {
            text-align: left !important
          }
        }

        @media screen and (min-width: 1408px) {
          .has-text-left-fullhd {
            text-align: left !important
          }
        }

        @media screen and (max-width: 768px) {
          .has-text-right-mobile {
            text-align: right !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .has-text-right-tablet {
            text-align: right !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .has-text-right-tablet-only {
            text-align: right !important
          }
        }

        @media screen and (max-width: 1023px) {
          .has-text-right-touch {
            text-align: right !important
          }
        }

        @media screen and (min-width: 1024px) {
          .has-text-right-desktop {
            text-align: right !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .has-text-right-desktop-only {
            text-align: right !important
          }
        }

        @media screen and (min-width: 1216px) {
          .has-text-right-widescreen {
            text-align: right !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .has-text-right-widescreen-only {
            text-align: right !important
          }
        }

        @media screen and (min-width: 1408px) {
          .has-text-right-fullhd {
            text-align: right !important
          }
        }

        .is-capitalized {
          text-transform: capitalize !important
        }

        .is-lowercase {
          text-transform: lowercase !important
        }

        .is-uppercase {
          text-transform: uppercase !important
        }

        .is-italic {
          font-style: italic !important
        }

        .has-text-white {
          color: #fff !important
        }

        a.has-text-white:hover,
        a.has-text-white:focus {
          color: #e6e6e6 !important
        }

        .has-background-white {
          background-color: #fff !important
        }

        .has-text-black {
          color: #0a0a0a !important
        }

        a.has-text-black:hover,
        a.has-text-black:focus {
          color: #000 !important
        }

        .has-background-black {
          background-color: #0a0a0a !important
        }

        .has-text-light {
          color: #f5f5f5 !important
        }

        a.has-text-light:hover,
        a.has-text-light:focus {
          color: #dbdbdb !important
        }

        .has-background-light {
          background-color: #f5f5f5 !important
        }

        .has-text-dark {
          color: #363636 !important
        }

        a.has-text-dark:hover,
        a.has-text-dark:focus {
          color: #1c1c1c !important
        }

        .has-background-dark {
          background-color: #363636 !important
        }

        .has-text-primary {
          color: #00d1b2 !important
        }

        a.has-text-primary:hover,
        a.has-text-primary:focus {
          color: #009e86 !important
        }

        .has-background-primary {
          background-color: #00d1b2 !important
        }

        .has-text-link {
          color: #3273dc !important
        }

        a.has-text-link:hover,
        a.has-text-link:focus {
          color: #205bbc !important
        }

        .has-background-link {
          background-color: #3273dc !important
        }

        .has-text-info {
          color: #3298dc !important
        }

        a.has-text-info:hover,
        a.has-text-info:focus {
          color: #207dbc !important
        }

        .has-background-info {
          background-color: #3298dc !important
        }

        .has-text-success {
          color: #48c774 !important
        }

        a.has-text-success:hover,
        a.has-text-success:focus {
          color: #34a85c !important
        }

        .has-background-success {
          background-color: #48c774 !important
        }

        .has-text-warning {
          color: #ffdd57 !important
        }

        a.has-text-warning:hover,
        a.has-text-warning:focus {
          color: #ffd324 !important
        }

        .has-background-warning {
          background-color: #ffdd57 !important
        }

        .has-text-danger {
          color: #f14668 !important
        }

        a.has-text-danger:hover,
        a.has-text-danger:focus {
          color: #ee1742 !important
        }

        .has-background-danger {
          background-color: #f14668 !important
        }

        .has-text-black-bis {
          color: #121212 !important
        }

        .has-background-black-bis {
          background-color: #121212 !important
        }

        .has-text-black-ter {
          color: #242424 !important
        }

        .has-background-black-ter {
          background-color: #242424 !important
        }

        .has-text-grey-darker {
          color: #363636 !important
        }

        .has-background-grey-darker {
          background-color: #363636 !important
        }

        .has-text-grey-dark {
          color: #4a4a4a !important
        }

        .has-background-grey-dark {
          background-color: #4a4a4a !important
        }

        .has-text-grey {
          color: #7a7a7a !important
        }

        .has-background-grey {
          background-color: #7a7a7a !important
        }

        .has-text-grey-light {
          color: #b5b5b5 !important
        }

        .has-background-grey-light {
          background-color: #b5b5b5 !important
        }

        .has-text-grey-lighter {
          color: #dbdbdb !important
        }

        .has-background-grey-lighter {
          background-color: #dbdbdb !important
        }

        .has-text-white-ter {
          color: #f5f5f5 !important
        }

        .has-background-white-ter {
          background-color: #f5f5f5 !important
        }

        .has-text-white-bis {
          color: #fafafa !important
        }

        .has-background-white-bis {
          background-color: #fafafa !important
        }

        .has-text-weight-light {
          font-weight: 300 !important
        }

        .has-text-weight-normal {
          font-weight: 400 !important
        }

        .has-text-weight-medium {
          font-weight: 500 !important
        }

        .has-text-weight-semibold {
          font-weight: 600 !important
        }

        .has-text-weight-bold {
          font-weight: 700 !important
        }

        .is-family-primary {
          font-family: BlinkMacSystemFont, -apple-system, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif !important
        }

        .is-family-secondary {
          font-family: BlinkMacSystemFont, -apple-system, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif !important
        }

        .is-family-sans-serif {
          font-family: BlinkMacSystemFont, -apple-system, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif !important
        }

        .is-family-monospace {
          font-family: monospace !important
        }

        .is-family-code {
          font-family: monospace !important
        }

        .is-block {
          display: block !important
        }

        @media screen and (max-width: 768px) {
          .is-block-mobile {
            display: block !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-block-tablet {
            display: block !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-block-tablet-only {
            display: block !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-block-touch {
            display: block !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-block-desktop {
            display: block !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-block-desktop-only {
            display: block !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-block-widescreen {
            display: block !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-block-widescreen-only {
            display: block !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-block-fullhd {
            display: block !important
          }
        }

        .is-flex {
          display: flex !important
        }

        @media screen and (max-width: 768px) {
          .is-flex-mobile {
            display: flex !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-flex-tablet {
            display: flex !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-flex-tablet-only {
            display: flex !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-flex-touch {
            display: flex !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-flex-desktop {
            display: flex !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-flex-desktop-only {
            display: flex !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-flex-widescreen {
            display: flex !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-flex-widescreen-only {
            display: flex !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-flex-fullhd {
            display: flex !important
          }
        }

        .is-inline {
          display: inline !important
        }

        @media screen and (max-width: 768px) {
          .is-inline-mobile {
            display: inline !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-inline-tablet {
            display: inline !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-inline-tablet-only {
            display: inline !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-inline-touch {
            display: inline !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-inline-desktop {
            display: inline !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-inline-desktop-only {
            display: inline !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-inline-widescreen {
            display: inline !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-inline-widescreen-only {
            display: inline !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-inline-fullhd {
            display: inline !important
          }
        }

        .is-inline-block {
          display: inline-block !important
        }

        @media screen and (max-width: 768px) {
          .is-inline-block-mobile {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-inline-block-tablet {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-inline-block-tablet-only {
            display: inline-block !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-inline-block-touch {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-inline-block-desktop {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-inline-block-desktop-only {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-inline-block-widescreen {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-inline-block-widescreen-only {
            display: inline-block !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-inline-block-fullhd {
            display: inline-block !important
          }
        }

        .is-inline-flex {
          display: inline-flex !important
        }

        @media screen and (max-width: 768px) {
          .is-inline-flex-mobile {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-inline-flex-tablet {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-inline-flex-tablet-only {
            display: inline-flex !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-inline-flex-touch {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-inline-flex-desktop {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-inline-flex-desktop-only {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-inline-flex-widescreen {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-inline-flex-widescreen-only {
            display: inline-flex !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-inline-flex-fullhd {
            display: inline-flex !important
          }
        }

        .is-hidden {
          display: none !important
        }

        .is-sr-only {
          border: none !important;
          clip: rect(0, 0, 0, 0) !important;
          height: 0.01em !important;
          overflow: hidden !important;
          padding: 0 !important;
          position: absolute !important;
          white-space: nowrap !important;
          width: 0.01em !important
        }

        @media screen and (max-width: 768px) {
          .is-hidden-mobile {
            display: none !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-hidden-tablet {
            display: none !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-hidden-tablet-only {
            display: none !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-hidden-touch {
            display: none !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-hidden-desktop {
            display: none !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-hidden-desktop-only {
            display: none !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-hidden-widescreen {
            display: none !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-hidden-widescreen-only {
            display: none !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-hidden-fullhd {
            display: none !important
          }
        }

        .is-invisible {
          visibility: hidden !important
        }

        @media screen and (max-width: 768px) {
          .is-invisible-mobile {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 769px),
        print {
          .is-invisible-tablet {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .is-invisible-tablet-only {
            visibility: hidden !important
          }
        }

        @media screen and (max-width: 1023px) {
          .is-invisible-touch {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 1024px) {
          .is-invisible-desktop {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .is-invisible-desktop-only {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 1216px) {
          .is-invisible-widescreen {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .is-invisible-widescreen-only {
            visibility: hidden !important
          }
        }

        @media screen and (min-width: 1408px) {
          .is-invisible-fullhd {
            visibility: hidden !important
          }
        }

        .is-marginless {
          margin: 0 !important
        }

        .is-paddingless {
          padding: 0 !important
        }

        .is-radiusless {
          border-radius: 0 !important
        }

        .is-shadowless {
          box-shadow: none !important
        }

        .is-relative {
          position: relative !important
        }

        .container {
          flex-grow: 1;
          margin: 0 auto;
          position: relative;
          width: auto
        }

        .container.is-fluid {
          max-width: none;
          padding-left: 32px;
          padding-right: 32px;
          width: 100%
        }

        @media screen and (min-width: 1024px) {
          .container {
            max-width: 960px
          }
        }

        @media screen and (max-width: 1215px) {
          .container.is-widescreen {
            max-width: 1152px
          }
        }

        @media screen and (max-width: 1407px) {
          .container.is-fullhd {
            max-width: 1344px
          }
        }

        @media screen and (min-width: 1216px) {
          .container {
            max-width: 1152px
          }
        }

        @media screen and (min-width: 1408px) {
          .container {
            max-width: 1344px
          }
        }

        .table {
          background-color: #fff;
          color: #363636
        }

        .table td,
        .table th {
          border: 1px solid #dbdbdb;
          border-width: 0 0 1px;
          padding: 0.5em 0.75em;
          vertical-align: top
        }

        .table td.is-white,
        .table th.is-white {
          background-color: #fff;
          border-color: #fff;
          color: #0a0a0a
        }

        .table td.is-black,
        .table th.is-black {
          background-color: #0a0a0a;
          border-color: #0a0a0a;
          color: #fff
        }

        .table td.is-light,
        .table th.is-light {
          background-color: #f5f5f5;
          border-color: #f5f5f5;
          color: rgba(0, 0, 0, 0.7)
        }

        .table td.is-dark,
        .table th.is-dark {
          background-color: #363636;
          border-color: #363636;
          color: #fff
        }

        .table td.is-primary,
        .table th.is-primary {
          background-color: #00d1b2;
          border-color: #00d1b2;
          color: #fff
        }

        .table td.is-link,
        .table th.is-link {
          background-color: #3273dc;
          border-color: #3273dc;
          color: #fff
        }

        .table td.is-info,
        .table th.is-info {
          background-color: #3298dc;
          border-color: #3298dc;
          color: #fff
        }

        .table td.is-success,
        .table th.is-success {
          background-color: #48c774;
          border-color: #48c774;
          color: #fff
        }

        .table td.is-warning,
        .table th.is-warning {
          background-color: #ffdd57;
          border-color: #ffdd57;
          color: rgba(0, 0, 0, 0.7)
        }

        .table td.is-danger,
        .table th.is-danger {
          background-color: #f14668;
          border-color: #f14668;
          color: #fff
        }

        .table td.is-narrow,
        .table th.is-narrow {
          white-space: nowrap;
          width: 1%
        }

        .table td.is-selected,
        .table th.is-selected {
          background-color: #00d1b2;
          color: #fff
        }

        .table td.is-selected a,
        .table td.is-selected strong,
        .table th.is-selected a,
        .table th.is-selected strong {
          color: currentColor
        }

        .table th {
          color: #363636
        }

        .table th:not([align]) {
          text-align: left
        }

        .table tr.is-selected {
          background-color: #00d1b2;
          color: #fff
        }

        .table tr.is-selected a,
        .table tr.is-selected strong {
          color: currentColor
        }

        .table tr.is-selected td,
        .table tr.is-selected th {
          border-color: #fff;
          color: currentColor
        }

        .table thead {
          background-color: transparent
        }

        .table thead td,
        .table thead th {
          border-width: 0 0 2px;
          color: #363636
        }

        .table tfoot {
          background-color: transparent
        }

        .table tfoot td,
        .table tfoot th {
          border-width: 2px 0 0;
          color: #363636
        }

        .table tbody {
          background-color: transparent
        }

        .table tbody tr:last-child td,
        .table tbody tr:last-child th {
          border-bottom-width: 0
        }

        .table.is-bordered td,
        .table.is-bordered th {
          border-width: 1px
        }

        .table.is-bordered tr:last-child td,
        .table.is-bordered tr:last-child th {
          border-bottom-width: 1px
        }

        .table.is-fullwidth {
          width: 100%
        }

        .table.is-hoverable tbody tr:not(.is-selected):hover {
          background-color: #fafafa
        }

        .table.is-hoverable.is-striped tbody tr:not(.is-selected):hover {
          background-color: #fafafa
        }

        .table.is-hoverable.is-striped tbody tr:not(.is-selected):hover:nth-child(even) {
          background-color: #f5f5f5
        }

        .table.is-narrow td,
        .table.is-narrow th {
          padding: 0.25em 0.5em
        }

        .table.is-striped tbody tr:not(.is-selected):nth-child(even) {
          background-color: #fafafa
        }

        .table-container {
          -webkit-overflow-scrolling: touch;
          overflow: auto;
          overflow-y: hidden;
          max-width: 100%
        }

        .title,
        .subtitle {
          word-break: break-word
        }

        .title em,
        .title span,
        .subtitle em,
        .subtitle span {
          font-weight: inherit
        }

        .title sub,
        .subtitle sub {
          font-size: .75em
        }

        .title sup,
        .subtitle sup {
          font-size: .75em
        }

        .title .tag,
        .subtitle .tag {
          vertical-align: middle
        }

        .title {
          color: #363636;
          font-size: 2rem;
          font-weight: 600;
          line-height: 1.125
        }

        .title strong {
          color: inherit;
          font-weight: inherit
        }

        .title+.highlight {
          margin-top: -0.75rem
        }

        .title:not(.is-spaced)+.subtitle {
          margin-top: -1.25rem
        }

        .title.is-1 {
          font-size: 3rem
        }

        .title.is-2 {
          font-size: 2.5rem
        }

        .title.is-3 {
          font-size: 2rem
        }

        .title.is-4 {
          font-size: 1.5rem
        }

        .title.is-5 {
          font-size: 1.25rem
        }

        .title.is-6 {
          font-size: 1rem
        }

        .title.is-7 {
          font-size: .75rem
        }

        .subtitle {
          color: #4a4a4a;
          font-size: 1.25rem;
          font-weight: 400;
          line-height: 1.25
        }

        .subtitle strong {
          color: #363636;
          font-weight: 600
        }

        .subtitle:not(.is-spaced)+.title {
          margin-top: -1.25rem
        }

        .subtitle.is-1 {
          font-size: 3rem
        }

        .subtitle.is-2 {
          font-size: 2.5rem
        }

        .subtitle.is-3 {
          font-size: 2rem
        }

        .subtitle.is-4 {
          font-size: 1.5rem
        }

        .subtitle.is-5 {
          font-size: 1.25rem
        }

        .subtitle.is-6 {
          font-size: 1rem
        }

        .subtitle.is-7 {
          font-size: .75rem
        }

        .level {
          align-items: center;
          justify-content: space-between
        }

        .level code {
          border-radius: 4px
        }

        .level img {
          display: inline-block;
          vertical-align: top
        }

        .level.is-mobile {
          display: flex
        }

        .level.is-mobile .level-left,
        .level.is-mobile .level-right {
          display: flex
        }

        .level.is-mobile .level-left+.level-right {
          margin-top: 0
        }

        .level.is-mobile .level-item:not(:last-child) {
          margin-bottom: 0;
          margin-right: .75rem
        }

        .level.is-mobile .level-item:not(.is-narrow) {
          flex-grow: 1
        }

        @media screen and (min-width: 769px),
        print {
          .level {
            display: flex
          }

          .level>.level-item:not(.is-narrow) {
            flex-grow: 1
          }
        }

        .level-item {
          align-items: center;
          display: flex;
          flex-basis: auto;
          flex-grow: 0;
          flex-shrink: 0;
          justify-content: center
        }

        .level-item .title,
        .level-item .subtitle {
          margin-bottom: 0
        }

        @media screen and (max-width: 768px) {
          .level-item:not(:last-child) {
            margin-bottom: .75rem
          }
        }

        .level-left,
        .level-right {
          flex-basis: auto;
          flex-grow: 0;
          flex-shrink: 0
        }

        .level-left .level-item.is-flexible,
        .level-right .level-item.is-flexible {
          flex-grow: 1
        }

        @media screen and (min-width: 769px),
        print {

          .level-left .level-item:not(:last-child),
          .level-right .level-item:not(:last-child) {
            margin-right: .75rem
          }
        }

        .level-left {
          align-items: center;
          justify-content: flex-start
        }

        @media screen and (max-width: 768px) {
          .level-left+.level-right {
            margin-top: 1.5rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .level-left {
            display: flex
          }
        }

        .level-right {
          align-items: center;
          justify-content: flex-end
        }

        @media screen and (min-width: 769px),
        print {
          .level-right {
            display: flex
          }
        }

        .column {
          display: block;
          flex-basis: 0;
          flex-grow: 1;
          flex-shrink: 1;
          padding: .75rem
        }

        .columns.is-mobile>.column.is-narrow {
          flex: none
        }

        .columns.is-mobile>.column.is-full {
          flex: none;
          width: 100%
        }

        .columns.is-mobile>.column.is-three-quarters {
          flex: none;
          width: 75%
        }

        .columns.is-mobile>.column.is-two-thirds {
          flex: none;
          width: 66.6666%
        }

        .columns.is-mobile>.column.is-half {
          flex: none;
          width: 50%
        }

        .columns.is-mobile>.column.is-one-third {
          flex: none;
          width: 33.3333%
        }

        .columns.is-mobile>.column.is-one-quarter {
          flex: none;
          width: 25%
        }

        .columns.is-mobile>.column.is-one-fifth {
          flex: none;
          width: 20%
        }

        .columns.is-mobile>.column.is-two-fifths {
          flex: none;
          width: 40%
        }

        .columns.is-mobile>.column.is-three-fifths {
          flex: none;
          width: 60%
        }

        .columns.is-mobile>.column.is-four-fifths {
          flex: none;
          width: 80%
        }

        .columns.is-mobile>.column.is-offset-three-quarters {
          margin-left: 75%
        }

        .columns.is-mobile>.column.is-offset-two-thirds {
          margin-left: 66.6666%
        }

        .columns.is-mobile>.column.is-offset-half {
          margin-left: 50%
        }

        .columns.is-mobile>.column.is-offset-one-third {
          margin-left: 33.3333%
        }

        .columns.is-mobile>.column.is-offset-one-quarter {
          margin-left: 25%
        }

        .columns.is-mobile>.column.is-offset-one-fifth {
          margin-left: 20%
        }

        .columns.is-mobile>.column.is-offset-two-fifths {
          margin-left: 40%
        }

        .columns.is-mobile>.column.is-offset-three-fifths {
          margin-left: 60%
        }

        .columns.is-mobile>.column.is-offset-four-fifths {
          margin-left: 80%
        }

        .columns.is-mobile>.column.is-0 {
          flex: none;
          width: 0%
        }

        .columns.is-mobile>.column.is-offset-0 {
          margin-left: 0%
        }

        .columns.is-mobile>.column.is-1 {
          flex: none;
          width: 8.3333333333%
        }

        .columns.is-mobile>.column.is-offset-1 {
          margin-left: 8.3333333333%
        }

        .columns.is-mobile>.column.is-2 {
          flex: none;
          width: 16.6666666667%
        }

        .columns.is-mobile>.column.is-offset-2 {
          margin-left: 16.6666666667%
        }

        .columns.is-mobile>.column.is-3 {
          flex: none;
          width: 25%
        }

        .columns.is-mobile>.column.is-offset-3 {
          margin-left: 25%
        }

        .columns.is-mobile>.column.is-4 {
          flex: none;
          width: 33.3333333333%
        }

        .columns.is-mobile>.column.is-offset-4 {
          margin-left: 33.3333333333%
        }

        .columns.is-mobile>.column.is-5 {
          flex: none;
          width: 41.6666666667%
        }

        .columns.is-mobile>.column.is-offset-5 {
          margin-left: 41.6666666667%
        }

        .columns.is-mobile>.column.is-6 {
          flex: none;
          width: 50%
        }

        .columns.is-mobile>.column.is-offset-6 {
          margin-left: 50%
        }

        .columns.is-mobile>.column.is-7 {
          flex: none;
          width: 58.3333333333%
        }

        .columns.is-mobile>.column.is-offset-7 {
          margin-left: 58.3333333333%
        }

        .columns.is-mobile>.column.is-8 {
          flex: none;
          width: 66.6666666667%
        }

        .columns.is-mobile>.column.is-offset-8 {
          margin-left: 66.6666666667%
        }

        .columns.is-mobile>.column.is-9 {
          flex: none;
          width: 75%
        }

        .columns.is-mobile>.column.is-offset-9 {
          margin-left: 75%
        }

        .columns.is-mobile>.column.is-10 {
          flex: none;
          width: 83.3333333333%
        }

        .columns.is-mobile>.column.is-offset-10 {
          margin-left: 83.3333333333%
        }

        .columns.is-mobile>.column.is-11 {
          flex: none;
          width: 91.6666666667%
        }

        .columns.is-mobile>.column.is-offset-11 {
          margin-left: 91.6666666667%
        }

        .columns.is-mobile>.column.is-12 {
          flex: none;
          width: 100%
        }

        .columns.is-mobile>.column.is-offset-12 {
          margin-left: 100%
        }

        @media screen and (max-width: 768px) {
          .column.is-narrow-mobile {
            flex: none
          }

          .column.is-full-mobile {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters-mobile {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds-mobile {
            flex: none;
            width: 66.6666%
          }

          .column.is-half-mobile {
            flex: none;
            width: 50%
          }

          .column.is-one-third-mobile {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter-mobile {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth-mobile {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths-mobile {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths-mobile {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths-mobile {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters-mobile {
            margin-left: 75%
          }

          .column.is-offset-two-thirds-mobile {
            margin-left: 66.6666%
          }

          .column.is-offset-half-mobile {
            margin-left: 50%
          }

          .column.is-offset-one-third-mobile {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter-mobile {
            margin-left: 25%
          }

          .column.is-offset-one-fifth-mobile {
            margin-left: 20%
          }

          .column.is-offset-two-fifths-mobile {
            margin-left: 40%
          }

          .column.is-offset-three-fifths-mobile {
            margin-left: 60%
          }

          .column.is-offset-four-fifths-mobile {
            margin-left: 80%
          }

          .column.is-0-mobile {
            flex: none;
            width: 0%
          }

          .column.is-offset-0-mobile {
            margin-left: 0%
          }

          .column.is-1-mobile {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1-mobile {
            margin-left: 8.3333333333%
          }

          .column.is-2-mobile {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2-mobile {
            margin-left: 16.6666666667%
          }

          .column.is-3-mobile {
            flex: none;
            width: 25%
          }

          .column.is-offset-3-mobile {
            margin-left: 25%
          }

          .column.is-4-mobile {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4-mobile {
            margin-left: 33.3333333333%
          }

          .column.is-5-mobile {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5-mobile {
            margin-left: 41.6666666667%
          }

          .column.is-6-mobile {
            flex: none;
            width: 50%
          }

          .column.is-offset-6-mobile {
            margin-left: 50%
          }

          .column.is-7-mobile {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7-mobile {
            margin-left: 58.3333333333%
          }

          .column.is-8-mobile {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8-mobile {
            margin-left: 66.6666666667%
          }

          .column.is-9-mobile {
            flex: none;
            width: 75%
          }

          .column.is-offset-9-mobile {
            margin-left: 75%
          }

          .column.is-10-mobile {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10-mobile {
            margin-left: 83.3333333333%
          }

          .column.is-11-mobile {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11-mobile {
            margin-left: 91.6666666667%
          }

          .column.is-12-mobile {
            flex: none;
            width: 100%
          }

          .column.is-offset-12-mobile {
            margin-left: 100%
          }
        }

        @media screen and (min-width: 769px),
        print {

          .column.is-narrow,
          .column.is-narrow-tablet {
            flex: none
          }

          .column.is-full,
          .column.is-full-tablet {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters,
          .column.is-three-quarters-tablet {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds,
          .column.is-two-thirds-tablet {
            flex: none;
            width: 66.6666%
          }

          .column.is-half,
          .column.is-half-tablet {
            flex: none;
            width: 50%
          }

          .column.is-one-third,
          .column.is-one-third-tablet {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter,
          .column.is-one-quarter-tablet {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth,
          .column.is-one-fifth-tablet {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths,
          .column.is-two-fifths-tablet {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths,
          .column.is-three-fifths-tablet {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths,
          .column.is-four-fifths-tablet {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters,
          .column.is-offset-three-quarters-tablet {
            margin-left: 75%
          }

          .column.is-offset-two-thirds,
          .column.is-offset-two-thirds-tablet {
            margin-left: 66.6666%
          }

          .column.is-offset-half,
          .column.is-offset-half-tablet {
            margin-left: 50%
          }

          .column.is-offset-one-third,
          .column.is-offset-one-third-tablet {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter,
          .column.is-offset-one-quarter-tablet {
            margin-left: 25%
          }

          .column.is-offset-one-fifth,
          .column.is-offset-one-fifth-tablet {
            margin-left: 20%
          }

          .column.is-offset-two-fifths,
          .column.is-offset-two-fifths-tablet {
            margin-left: 40%
          }

          .column.is-offset-three-fifths,
          .column.is-offset-three-fifths-tablet {
            margin-left: 60%
          }

          .column.is-offset-four-fifths,
          .column.is-offset-four-fifths-tablet {
            margin-left: 80%
          }

          .column.is-0,
          .column.is-0-tablet {
            flex: none;
            width: 0%
          }

          .column.is-offset-0,
          .column.is-offset-0-tablet {
            margin-left: 0%
          }

          .column.is-1,
          .column.is-1-tablet {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1,
          .column.is-offset-1-tablet {
            margin-left: 8.3333333333%
          }

          .column.is-2,
          .column.is-2-tablet {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2,
          .column.is-offset-2-tablet {
            margin-left: 16.6666666667%
          }

          .column.is-3,
          .column.is-3-tablet {
            flex: none;
            width: 25%
          }

          .column.is-offset-3,
          .column.is-offset-3-tablet {
            margin-left: 25%
          }

          .column.is-4,
          .column.is-4-tablet {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4,
          .column.is-offset-4-tablet {
            margin-left: 33.3333333333%
          }

          .column.is-5,
          .column.is-5-tablet {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5,
          .column.is-offset-5-tablet {
            margin-left: 41.6666666667%
          }

          .column.is-6,
          .column.is-6-tablet {
            flex: none;
            width: 50%
          }

          .column.is-offset-6,
          .column.is-offset-6-tablet {
            margin-left: 50%
          }

          .column.is-7,
          .column.is-7-tablet {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7,
          .column.is-offset-7-tablet {
            margin-left: 58.3333333333%
          }

          .column.is-8,
          .column.is-8-tablet {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8,
          .column.is-offset-8-tablet {
            margin-left: 66.6666666667%
          }

          .column.is-9,
          .column.is-9-tablet {
            flex: none;
            width: 75%
          }

          .column.is-offset-9,
          .column.is-offset-9-tablet {
            margin-left: 75%
          }

          .column.is-10,
          .column.is-10-tablet {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10,
          .column.is-offset-10-tablet {
            margin-left: 83.3333333333%
          }

          .column.is-11,
          .column.is-11-tablet {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11,
          .column.is-offset-11-tablet {
            margin-left: 91.6666666667%
          }

          .column.is-12,
          .column.is-12-tablet {
            flex: none;
            width: 100%
          }

          .column.is-offset-12,
          .column.is-offset-12-tablet {
            margin-left: 100%
          }
        }

        @media screen and (max-width: 1023px) {
          .column.is-narrow-touch {
            flex: none
          }

          .column.is-full-touch {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters-touch {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds-touch {
            flex: none;
            width: 66.6666%
          }

          .column.is-half-touch {
            flex: none;
            width: 50%
          }

          .column.is-one-third-touch {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter-touch {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth-touch {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths-touch {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths-touch {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths-touch {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters-touch {
            margin-left: 75%
          }

          .column.is-offset-two-thirds-touch {
            margin-left: 66.6666%
          }

          .column.is-offset-half-touch {
            margin-left: 50%
          }

          .column.is-offset-one-third-touch {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter-touch {
            margin-left: 25%
          }

          .column.is-offset-one-fifth-touch {
            margin-left: 20%
          }

          .column.is-offset-two-fifths-touch {
            margin-left: 40%
          }

          .column.is-offset-three-fifths-touch {
            margin-left: 60%
          }

          .column.is-offset-four-fifths-touch {
            margin-left: 80%
          }

          .column.is-0-touch {
            flex: none;
            width: 0%
          }

          .column.is-offset-0-touch {
            margin-left: 0%
          }

          .column.is-1-touch {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1-touch {
            margin-left: 8.3333333333%
          }

          .column.is-2-touch {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2-touch {
            margin-left: 16.6666666667%
          }

          .column.is-3-touch {
            flex: none;
            width: 25%
          }

          .column.is-offset-3-touch {
            margin-left: 25%
          }

          .column.is-4-touch {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4-touch {
            margin-left: 33.3333333333%
          }

          .column.is-5-touch {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5-touch {
            margin-left: 41.6666666667%
          }

          .column.is-6-touch {
            flex: none;
            width: 50%
          }

          .column.is-offset-6-touch {
            margin-left: 50%
          }

          .column.is-7-touch {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7-touch {
            margin-left: 58.3333333333%
          }

          .column.is-8-touch {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8-touch {
            margin-left: 66.6666666667%
          }

          .column.is-9-touch {
            flex: none;
            width: 75%
          }

          .column.is-offset-9-touch {
            margin-left: 75%
          }

          .column.is-10-touch {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10-touch {
            margin-left: 83.3333333333%
          }

          .column.is-11-touch {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11-touch {
            margin-left: 91.6666666667%
          }

          .column.is-12-touch {
            flex: none;
            width: 100%
          }

          .column.is-offset-12-touch {
            margin-left: 100%
          }
        }

        @media screen and (min-width: 1024px) {
          .column.is-narrow-desktop {
            flex: none
          }

          .column.is-full-desktop {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters-desktop {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds-desktop {
            flex: none;
            width: 66.6666%
          }

          .column.is-half-desktop {
            flex: none;
            width: 50%
          }

          .column.is-one-third-desktop {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter-desktop {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth-desktop {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths-desktop {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths-desktop {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths-desktop {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters-desktop {
            margin-left: 75%
          }

          .column.is-offset-two-thirds-desktop {
            margin-left: 66.6666%
          }

          .column.is-offset-half-desktop {
            margin-left: 50%
          }

          .column.is-offset-one-third-desktop {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter-desktop {
            margin-left: 25%
          }

          .column.is-offset-one-fifth-desktop {
            margin-left: 20%
          }

          .column.is-offset-two-fifths-desktop {
            margin-left: 40%
          }

          .column.is-offset-three-fifths-desktop {
            margin-left: 60%
          }

          .column.is-offset-four-fifths-desktop {
            margin-left: 80%
          }

          .column.is-0-desktop {
            flex: none;
            width: 0%
          }

          .column.is-offset-0-desktop {
            margin-left: 0%
          }

          .column.is-1-desktop {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1-desktop {
            margin-left: 8.3333333333%
          }

          .column.is-2-desktop {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2-desktop {
            margin-left: 16.6666666667%
          }

          .column.is-3-desktop {
            flex: none;
            width: 25%
          }

          .column.is-offset-3-desktop {
            margin-left: 25%
          }

          .column.is-4-desktop {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4-desktop {
            margin-left: 33.3333333333%
          }

          .column.is-5-desktop {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5-desktop {
            margin-left: 41.6666666667%
          }

          .column.is-6-desktop {
            flex: none;
            width: 50%
          }

          .column.is-offset-6-desktop {
            margin-left: 50%
          }

          .column.is-7-desktop {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7-desktop {
            margin-left: 58.3333333333%
          }

          .column.is-8-desktop {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8-desktop {
            margin-left: 66.6666666667%
          }

          .column.is-9-desktop {
            flex: none;
            width: 75%
          }

          .column.is-offset-9-desktop {
            margin-left: 75%
          }

          .column.is-10-desktop {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10-desktop {
            margin-left: 83.3333333333%
          }

          .column.is-11-desktop {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11-desktop {
            margin-left: 91.6666666667%
          }

          .column.is-12-desktop {
            flex: none;
            width: 100%
          }

          .column.is-offset-12-desktop {
            margin-left: 100%
          }
        }

        @media screen and (min-width: 1216px) {
          .column.is-narrow-widescreen {
            flex: none
          }

          .column.is-full-widescreen {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters-widescreen {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds-widescreen {
            flex: none;
            width: 66.6666%
          }

          .column.is-half-widescreen {
            flex: none;
            width: 50%
          }

          .column.is-one-third-widescreen {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter-widescreen {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth-widescreen {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths-widescreen {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths-widescreen {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths-widescreen {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters-widescreen {
            margin-left: 75%
          }

          .column.is-offset-two-thirds-widescreen {
            margin-left: 66.6666%
          }

          .column.is-offset-half-widescreen {
            margin-left: 50%
          }

          .column.is-offset-one-third-widescreen {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter-widescreen {
            margin-left: 25%
          }

          .column.is-offset-one-fifth-widescreen {
            margin-left: 20%
          }

          .column.is-offset-two-fifths-widescreen {
            margin-left: 40%
          }

          .column.is-offset-three-fifths-widescreen {
            margin-left: 60%
          }

          .column.is-offset-four-fifths-widescreen {
            margin-left: 80%
          }

          .column.is-0-widescreen {
            flex: none;
            width: 0%
          }

          .column.is-offset-0-widescreen {
            margin-left: 0%
          }

          .column.is-1-widescreen {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1-widescreen {
            margin-left: 8.3333333333%
          }

          .column.is-2-widescreen {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2-widescreen {
            margin-left: 16.6666666667%
          }

          .column.is-3-widescreen {
            flex: none;
            width: 25%
          }

          .column.is-offset-3-widescreen {
            margin-left: 25%
          }

          .column.is-4-widescreen {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4-widescreen {
            margin-left: 33.3333333333%
          }

          .column.is-5-widescreen {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5-widescreen {
            margin-left: 41.6666666667%
          }

          .column.is-6-widescreen {
            flex: none;
            width: 50%
          }

          .column.is-offset-6-widescreen {
            margin-left: 50%
          }

          .column.is-7-widescreen {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7-widescreen {
            margin-left: 58.3333333333%
          }

          .column.is-8-widescreen {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8-widescreen {
            margin-left: 66.6666666667%
          }

          .column.is-9-widescreen {
            flex: none;
            width: 75%
          }

          .column.is-offset-9-widescreen {
            margin-left: 75%
          }

          .column.is-10-widescreen {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10-widescreen {
            margin-left: 83.3333333333%
          }

          .column.is-11-widescreen {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11-widescreen {
            margin-left: 91.6666666667%
          }

          .column.is-12-widescreen {
            flex: none;
            width: 100%
          }

          .column.is-offset-12-widescreen {
            margin-left: 100%
          }
        }

        @media screen and (min-width: 1408px) {
          .column.is-narrow-fullhd {
            flex: none
          }

          .column.is-full-fullhd {
            flex: none;
            width: 100%
          }

          .column.is-three-quarters-fullhd {
            flex: none;
            width: 75%
          }

          .column.is-two-thirds-fullhd {
            flex: none;
            width: 66.6666%
          }

          .column.is-half-fullhd {
            flex: none;
            width: 50%
          }

          .column.is-one-third-fullhd {
            flex: none;
            width: 33.3333%
          }

          .column.is-one-quarter-fullhd {
            flex: none;
            width: 25%
          }

          .column.is-one-fifth-fullhd {
            flex: none;
            width: 20%
          }

          .column.is-two-fifths-fullhd {
            flex: none;
            width: 40%
          }

          .column.is-three-fifths-fullhd {
            flex: none;
            width: 60%
          }

          .column.is-four-fifths-fullhd {
            flex: none;
            width: 80%
          }

          .column.is-offset-three-quarters-fullhd {
            margin-left: 75%
          }

          .column.is-offset-two-thirds-fullhd {
            margin-left: 66.6666%
          }

          .column.is-offset-half-fullhd {
            margin-left: 50%
          }

          .column.is-offset-one-third-fullhd {
            margin-left: 33.3333%
          }

          .column.is-offset-one-quarter-fullhd {
            margin-left: 25%
          }

          .column.is-offset-one-fifth-fullhd {
            margin-left: 20%
          }

          .column.is-offset-two-fifths-fullhd {
            margin-left: 40%
          }

          .column.is-offset-three-fifths-fullhd {
            margin-left: 60%
          }

          .column.is-offset-four-fifths-fullhd {
            margin-left: 80%
          }

          .column.is-0-fullhd {
            flex: none;
            width: 0%
          }

          .column.is-offset-0-fullhd {
            margin-left: 0%
          }

          .column.is-1-fullhd {
            flex: none;
            width: 8.3333333333%
          }

          .column.is-offset-1-fullhd {
            margin-left: 8.3333333333%
          }

          .column.is-2-fullhd {
            flex: none;
            width: 16.6666666667%
          }

          .column.is-offset-2-fullhd {
            margin-left: 16.6666666667%
          }

          .column.is-3-fullhd {
            flex: none;
            width: 25%
          }

          .column.is-offset-3-fullhd {
            margin-left: 25%
          }

          .column.is-4-fullhd {
            flex: none;
            width: 33.3333333333%
          }

          .column.is-offset-4-fullhd {
            margin-left: 33.3333333333%
          }

          .column.is-5-fullhd {
            flex: none;
            width: 41.6666666667%
          }

          .column.is-offset-5-fullhd {
            margin-left: 41.6666666667%
          }

          .column.is-6-fullhd {
            flex: none;
            width: 50%
          }

          .column.is-offset-6-fullhd {
            margin-left: 50%
          }

          .column.is-7-fullhd {
            flex: none;
            width: 58.3333333333%
          }

          .column.is-offset-7-fullhd {
            margin-left: 58.3333333333%
          }

          .column.is-8-fullhd {
            flex: none;
            width: 66.6666666667%
          }

          .column.is-offset-8-fullhd {
            margin-left: 66.6666666667%
          }

          .column.is-9-fullhd {
            flex: none;
            width: 75%
          }

          .column.is-offset-9-fullhd {
            margin-left: 75%
          }

          .column.is-10-fullhd {
            flex: none;
            width: 83.3333333333%
          }

          .column.is-offset-10-fullhd {
            margin-left: 83.3333333333%
          }

          .column.is-11-fullhd {
            flex: none;
            width: 91.6666666667%
          }

          .column.is-offset-11-fullhd {
            margin-left: 91.6666666667%
          }

          .column.is-12-fullhd {
            flex: none;
            width: 100%
          }

          .column.is-offset-12-fullhd {
            margin-left: 100%
          }
        }

        .columns {
          margin-left: -0.75rem;
          margin-right: -0.75rem;
          margin-top: -0.75rem
        }

        .columns:last-child {
          margin-bottom: -0.75rem
        }

        .columns:not(:last-child) {
          margin-bottom: calc(1.5rem - .75rem)
        }

        .columns.is-centered {
          justify-content: center
        }

        .columns.is-gapless {
          margin-left: 0;
          margin-right: 0;
          margin-top: 0
        }

        .columns.is-gapless>.column {
          margin: 0;
          padding: 0 !important
        }

        .columns.is-gapless:not(:last-child) {
          margin-bottom: 1.5rem
        }

        .columns.is-gapless:last-child {
          margin-bottom: 0
        }

        .columns.is-mobile {
          display: flex
        }

        .columns.is-multiline {
          flex-wrap: wrap
        }

        .columns.is-vcentered {
          align-items: center
        }

        @media screen and (min-width: 769px),
        print {
          .columns:not(.is-desktop) {
            display: flex
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-desktop {
            display: flex
          }
        }

        .columns.is-variable {
          --columnGap: 0.75rem;
          margin-left: calc(-1 * var(--columnGap));
          margin-right: calc(-1 * var(--columnGap))
        }

        .columns.is-variable .column {
          padding-left: var(--columnGap);
          padding-right: var(--columnGap)
        }

        .columns.is-variable.is-0 {
          --columnGap: 0rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-0-mobile {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-0-tablet {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-0-tablet-only {
            --columnGap: 0rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-0-touch {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-0-desktop {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-0-desktop-only {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-0-widescreen {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-0-widescreen-only {
            --columnGap: 0rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-0-fullhd {
            --columnGap: 0rem
          }
        }

        .columns.is-variable.is-1 {
          --columnGap: .25rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-1-mobile {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-1-tablet {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-1-tablet-only {
            --columnGap: .25rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-1-touch {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-1-desktop {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-1-desktop-only {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-1-widescreen {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-1-widescreen-only {
            --columnGap: .25rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-1-fullhd {
            --columnGap: .25rem
          }
        }

        .columns.is-variable.is-2 {
          --columnGap: .5rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-2-mobile {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-2-tablet {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-2-tablet-only {
            --columnGap: .5rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-2-touch {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-2-desktop {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-2-desktop-only {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-2-widescreen {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-2-widescreen-only {
            --columnGap: .5rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-2-fullhd {
            --columnGap: .5rem
          }
        }

        .columns.is-variable.is-3 {
          --columnGap: .75rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-3-mobile {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-3-tablet {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-3-tablet-only {
            --columnGap: .75rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-3-touch {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-3-desktop {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-3-desktop-only {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-3-widescreen {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-3-widescreen-only {
            --columnGap: .75rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-3-fullhd {
            --columnGap: .75rem
          }
        }

        .columns.is-variable.is-4 {
          --columnGap: 1rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-4-mobile {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-4-tablet {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-4-tablet-only {
            --columnGap: 1rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-4-touch {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-4-desktop {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-4-desktop-only {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-4-widescreen {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-4-widescreen-only {
            --columnGap: 1rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-4-fullhd {
            --columnGap: 1rem
          }
        }

        .columns.is-variable.is-5 {
          --columnGap: 1.25rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-5-mobile {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-5-tablet {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-5-tablet-only {
            --columnGap: 1.25rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-5-touch {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-5-desktop {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-5-desktop-only {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-5-widescreen {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-5-widescreen-only {
            --columnGap: 1.25rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-5-fullhd {
            --columnGap: 1.25rem
          }
        }

        .columns.is-variable.is-6 {
          --columnGap: 1.5rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-6-mobile {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-6-tablet {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-6-tablet-only {
            --columnGap: 1.5rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-6-touch {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-6-desktop {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-6-desktop-only {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-6-widescreen {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-6-widescreen-only {
            --columnGap: 1.5rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-6-fullhd {
            --columnGap: 1.5rem
          }
        }

        .columns.is-variable.is-7 {
          --columnGap: 1.75rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-7-mobile {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-7-tablet {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-7-tablet-only {
            --columnGap: 1.75rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-7-touch {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-7-desktop {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-7-desktop-only {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-7-widescreen {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-7-widescreen-only {
            --columnGap: 1.75rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-7-fullhd {
            --columnGap: 1.75rem
          }
        }

        .columns.is-variable.is-8 {
          --columnGap: 2rem
        }

        @media screen and (max-width: 768px) {
          .columns.is-variable.is-8-mobile {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .columns.is-variable.is-8-tablet {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 769px) and (max-width: 1023px) {
          .columns.is-variable.is-8-tablet-only {
            --columnGap: 2rem
          }
        }

        @media screen and (max-width: 1023px) {
          .columns.is-variable.is-8-touch {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 1024px) {
          .columns.is-variable.is-8-desktop {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 1024px) and (max-width: 1215px) {
          .columns.is-variable.is-8-desktop-only {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 1216px) {
          .columns.is-variable.is-8-widescreen {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 1216px) and (max-width: 1407px) {
          .columns.is-variable.is-8-widescreen-only {
            --columnGap: 2rem
          }
        }

        @media screen and (min-width: 1408px) {
          .columns.is-variable.is-8-fullhd {
            --columnGap: 2rem
          }
        }

        .tile {
          align-items: stretch;
          display: block;
          flex-basis: 0;
          flex-grow: 1;
          flex-shrink: 1;
          min-height: min-content
        }

        .tile.is-ancestor {
          margin-left: -.75rem;
          margin-right: -.75rem;
          margin-top: -.75rem
        }

        .tile.is-ancestor:last-child {
          margin-bottom: -.75rem
        }

        .tile.is-ancestor:not(:last-child) {
          margin-bottom: .75rem
        }

        .tile.is-child {
          margin: 0 !important
        }

        .tile.is-parent {
          padding: .75rem
        }

        .tile.is-vertical {
          flex-direction: column
        }

        .tile.is-vertical>.tile.is-child:not(:last-child) {
          margin-bottom: 1.5rem !important
        }

        @media screen and (min-width: 769px),
        print {
          .tile:not(.is-child) {
            display: flex
          }

          .tile.is-1 {
            flex: none;
            width: 8.3333333333%
          }

          .tile.is-2 {
            flex: none;
            width: 16.6666666667%
          }

          .tile.is-3 {
            flex: none;
            width: 25%
          }

          .tile.is-4 {
            flex: none;
            width: 33.3333333333%
          }

          .tile.is-5 {
            flex: none;
            width: 41.6666666667%
          }

          .tile.is-6 {
            flex: none;
            width: 50%
          }

          .tile.is-7 {
            flex: none;
            width: 58.3333333333%
          }

          .tile.is-8 {
            flex: none;
            width: 66.6666666667%
          }

          .tile.is-9 {
            flex: none;
            width: 75%
          }

          .tile.is-10 {
            flex: none;
            width: 83.3333333333%
          }

          .tile.is-11 {
            flex: none;
            width: 91.6666666667%
          }

          .tile.is-12 {
            flex: none;
            width: 100%
          }
        }

        .hero {
          align-items: stretch;
          display: flex;
          flex-direction: column;
          justify-content: space-between
        }

        .hero .navbar {
          background: none
        }

        .hero .tabs ul {
          border-bottom: none
        }

        .hero.is-white {
          background-color: #fff;
          color: #0a0a0a
        }

        .hero.is-white a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-white strong {
          color: inherit
        }

        .hero.is-white .title {
          color: #0a0a0a
        }

        .hero.is-white .subtitle {
          color: rgba(10, 10, 10, 0.9)
        }

        .hero.is-white .subtitle a:not(.button),
        .hero.is-white .subtitle strong {
          color: #0a0a0a
        }

        @media screen and (max-width: 1023px) {
          .hero.is-white .navbar-menu {
            background-color: #fff
          }
        }

        .hero.is-white .navbar-item,
        .hero.is-white .navbar-link {
          color: rgba(10, 10, 10, 0.7)
        }

        .hero.is-white a.navbar-item:hover,
        .hero.is-white a.navbar-item.is-active,
        .hero.is-white .navbar-link:hover,
        .hero.is-white .navbar-link.is-active {
          background-color: #f2f2f2;
          color: #0a0a0a
        }

        .hero.is-white .tabs a {
          color: #0a0a0a;
          opacity: 0.9
        }

        .hero.is-white .tabs a:hover {
          opacity: 1
        }

        .hero.is-white .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-white .tabs.is-boxed a,
        .hero.is-white .tabs.is-toggle a {
          color: #0a0a0a
        }

        .hero.is-white .tabs.is-boxed a:hover,
        .hero.is-white .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-white .tabs.is-boxed li.is-active a,
        .hero.is-white .tabs.is-boxed li.is-active a:hover,
        .hero.is-white .tabs.is-toggle li.is-active a,
        .hero.is-white .tabs.is-toggle li.is-active a:hover {
          background-color: #0a0a0a;
          border-color: #0a0a0a;
          color: #fff
        }

        .hero.is-white.is-bold {
          background-image: linear-gradient(141deg, #e8e3e4 0%, #fff 71%, #fff 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-white.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #e8e3e4 0%, #fff 71%, #fff 100%)
          }
        }

        .hero.is-black {
          background-color: #0a0a0a;
          color: #fff
        }

        .hero.is-black a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-black strong {
          color: inherit
        }

        .hero.is-black .title {
          color: #fff
        }

        .hero.is-black .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-black .subtitle a:not(.button),
        .hero.is-black .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-black .navbar-menu {
            background-color: #0a0a0a
          }
        }

        .hero.is-black .navbar-item,
        .hero.is-black .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-black a.navbar-item:hover,
        .hero.is-black a.navbar-item.is-active,
        .hero.is-black .navbar-link:hover,
        .hero.is-black .navbar-link.is-active {
          background-color: #000;
          color: #fff
        }

        .hero.is-black .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-black .tabs a:hover {
          opacity: 1
        }

        .hero.is-black .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-black .tabs.is-boxed a,
        .hero.is-black .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-black .tabs.is-boxed a:hover,
        .hero.is-black .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-black .tabs.is-boxed li.is-active a,
        .hero.is-black .tabs.is-boxed li.is-active a:hover,
        .hero.is-black .tabs.is-toggle li.is-active a,
        .hero.is-black .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #0a0a0a
        }

        .hero.is-black.is-bold {
          background-image: linear-gradient(141deg, #000 0%, #0a0a0a 71%, #181616 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-black.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #000 0%, #0a0a0a 71%, #181616 100%)
          }
        }

        .hero.is-light {
          background-color: #f5f5f5;
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-light a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-light strong {
          color: inherit
        }

        .hero.is-light .title {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-light .subtitle {
          color: rgba(0, 0, 0, 0.9)
        }

        .hero.is-light .subtitle a:not(.button),
        .hero.is-light .subtitle strong {
          color: rgba(0, 0, 0, 0.7)
        }

        @media screen and (max-width: 1023px) {
          .hero.is-light .navbar-menu {
            background-color: #f5f5f5
          }
        }

        .hero.is-light .navbar-item,
        .hero.is-light .navbar-link {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-light a.navbar-item:hover,
        .hero.is-light a.navbar-item.is-active,
        .hero.is-light .navbar-link:hover,
        .hero.is-light .navbar-link.is-active {
          background-color: #e8e8e8;
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-light .tabs a {
          color: rgba(0, 0, 0, 0.7);
          opacity: 0.9
        }

        .hero.is-light .tabs a:hover {
          opacity: 1
        }

        .hero.is-light .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-light .tabs.is-boxed a,
        .hero.is-light .tabs.is-toggle a {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-light .tabs.is-boxed a:hover,
        .hero.is-light .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-light .tabs.is-boxed li.is-active a,
        .hero.is-light .tabs.is-boxed li.is-active a:hover,
        .hero.is-light .tabs.is-toggle li.is-active a,
        .hero.is-light .tabs.is-toggle li.is-active a:hover {
          background-color: rgba(0, 0, 0, 0.7);
          border-color: rgba(0, 0, 0, 0.7);
          color: #f5f5f5
        }

        .hero.is-light.is-bold {
          background-image: linear-gradient(141deg, #dfd8d9 0%, #f5f5f5 71%, #fff 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-light.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #dfd8d9 0%, #f5f5f5 71%, #fff 100%)
          }
        }

        .hero.is-dark {
          background-color: #363636;
          color: #fff
        }

        .hero.is-dark a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-dark strong {
          color: inherit
        }

        .hero.is-dark .title {
          color: #fff
        }

        .hero.is-dark .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-dark .subtitle a:not(.button),
        .hero.is-dark .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-dark .navbar-menu {
            background-color: #363636
          }
        }

        .hero.is-dark .navbar-item,
        .hero.is-dark .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-dark a.navbar-item:hover,
        .hero.is-dark a.navbar-item.is-active,
        .hero.is-dark .navbar-link:hover,
        .hero.is-dark .navbar-link.is-active {
          background-color: #292929;
          color: #fff
        }

        .hero.is-dark .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-dark .tabs a:hover {
          opacity: 1
        }

        .hero.is-dark .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-dark .tabs.is-boxed a,
        .hero.is-dark .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-dark .tabs.is-boxed a:hover,
        .hero.is-dark .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-dark .tabs.is-boxed li.is-active a,
        .hero.is-dark .tabs.is-boxed li.is-active a:hover,
        .hero.is-dark .tabs.is-toggle li.is-active a,
        .hero.is-dark .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #363636
        }

        .hero.is-dark.is-bold {
          background-image: linear-gradient(141deg, #1f191a 0%, #363636 71%, #46403f 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-dark.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #1f191a 0%, #363636 71%, #46403f 100%)
          }
        }

        .hero.is-primary {
          background-color: #00d1b2;
          color: #fff
        }

        .hero.is-primary a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-primary strong {
          color: inherit
        }

        .hero.is-primary .title {
          color: #fff
        }

        .hero.is-primary .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-primary .subtitle a:not(.button),
        .hero.is-primary .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-primary .navbar-menu {
            background-color: #00d1b2
          }
        }

        .hero.is-primary .navbar-item,
        .hero.is-primary .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-primary a.navbar-item:hover,
        .hero.is-primary a.navbar-item.is-active,
        .hero.is-primary .navbar-link:hover,
        .hero.is-primary .navbar-link.is-active {
          background-color: #00b89c;
          color: #fff
        }

        .hero.is-primary .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-primary .tabs a:hover {
          opacity: 1
        }

        .hero.is-primary .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-primary .tabs.is-boxed a,
        .hero.is-primary .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-primary .tabs.is-boxed a:hover,
        .hero.is-primary .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-primary .tabs.is-boxed li.is-active a,
        .hero.is-primary .tabs.is-boxed li.is-active a:hover,
        .hero.is-primary .tabs.is-toggle li.is-active a,
        .hero.is-primary .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #00d1b2
        }

        .hero.is-primary.is-bold {
          background-image: linear-gradient(141deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-primary.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #009e6c 0%, #00d1b2 71%, #00e7eb 100%)
          }
        }

        .hero.is-link {
          background-color: #3273dc;
          color: #fff
        }

        .hero.is-link a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-link strong {
          color: inherit
        }

        .hero.is-link .title {
          color: #fff
        }

        .hero.is-link .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-link .subtitle a:not(.button),
        .hero.is-link .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-link .navbar-menu {
            background-color: #3273dc
          }
        }

        .hero.is-link .navbar-item,
        .hero.is-link .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-link a.navbar-item:hover,
        .hero.is-link a.navbar-item.is-active,
        .hero.is-link .navbar-link:hover,
        .hero.is-link .navbar-link.is-active {
          background-color: #2366d1;
          color: #fff
        }

        .hero.is-link .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-link .tabs a:hover {
          opacity: 1
        }

        .hero.is-link .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-link .tabs.is-boxed a,
        .hero.is-link .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-link .tabs.is-boxed a:hover,
        .hero.is-link .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-link .tabs.is-boxed li.is-active a,
        .hero.is-link .tabs.is-boxed li.is-active a:hover,
        .hero.is-link .tabs.is-toggle li.is-active a,
        .hero.is-link .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #3273dc
        }

        .hero.is-link.is-bold {
          background-image: linear-gradient(141deg, #1577c6 0%, #3273dc 71%, #4366e5 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-link.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #1577c6 0%, #3273dc 71%, #4366e5 100%)
          }
        }

        .hero.is-info {
          background-color: #3298dc;
          color: #fff
        }

        .hero.is-info a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-info strong {
          color: inherit
        }

        .hero.is-info .title {
          color: #fff
        }

        .hero.is-info .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-info .subtitle a:not(.button),
        .hero.is-info .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-info .navbar-menu {
            background-color: #3298dc
          }
        }

        .hero.is-info .navbar-item,
        .hero.is-info .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-info a.navbar-item:hover,
        .hero.is-info a.navbar-item.is-active,
        .hero.is-info .navbar-link:hover,
        .hero.is-info .navbar-link.is-active {
          background-color: #238cd1;
          color: #fff
        }

        .hero.is-info .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-info .tabs a:hover {
          opacity: 1
        }

        .hero.is-info .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-info .tabs.is-boxed a,
        .hero.is-info .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-info .tabs.is-boxed a:hover,
        .hero.is-info .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-info .tabs.is-boxed li.is-active a,
        .hero.is-info .tabs.is-boxed li.is-active a:hover,
        .hero.is-info .tabs.is-toggle li.is-active a,
        .hero.is-info .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #3298dc
        }

        .hero.is-info.is-bold {
          background-image: linear-gradient(141deg, #159dc6 0%, #3298dc 71%, #4389e5 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-info.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #159dc6 0%, #3298dc 71%, #4389e5 100%)
          }
        }

        .hero.is-success {
          background-color: #48c774;
          color: #fff
        }

        .hero.is-success a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-success strong {
          color: inherit
        }

        .hero.is-success .title {
          color: #fff
        }

        .hero.is-success .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-success .subtitle a:not(.button),
        .hero.is-success .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-success .navbar-menu {
            background-color: #48c774
          }
        }

        .hero.is-success .navbar-item,
        .hero.is-success .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-success a.navbar-item:hover,
        .hero.is-success a.navbar-item.is-active,
        .hero.is-success .navbar-link:hover,
        .hero.is-success .navbar-link.is-active {
          background-color: #3abb67;
          color: #fff
        }

        .hero.is-success .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-success .tabs a:hover {
          opacity: 1
        }

        .hero.is-success .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-success .tabs.is-boxed a,
        .hero.is-success .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-success .tabs.is-boxed a:hover,
        .hero.is-success .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-success .tabs.is-boxed li.is-active a,
        .hero.is-success .tabs.is-boxed li.is-active a:hover,
        .hero.is-success .tabs.is-toggle li.is-active a,
        .hero.is-success .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #48c774
        }

        .hero.is-success.is-bold {
          background-image: linear-gradient(141deg, #29b342 0%, #48c774 71%, #56d296 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-success.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #29b342 0%, #48c774 71%, #56d296 100%)
          }
        }

        .hero.is-warning {
          background-color: #ffdd57;
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-warning a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-warning strong {
          color: inherit
        }

        .hero.is-warning .title {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-warning .subtitle {
          color: rgba(0, 0, 0, 0.9)
        }

        .hero.is-warning .subtitle a:not(.button),
        .hero.is-warning .subtitle strong {
          color: rgba(0, 0, 0, 0.7)
        }

        @media screen and (max-width: 1023px) {
          .hero.is-warning .navbar-menu {
            background-color: #ffdd57
          }
        }

        .hero.is-warning .navbar-item,
        .hero.is-warning .navbar-link {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-warning a.navbar-item:hover,
        .hero.is-warning a.navbar-item.is-active,
        .hero.is-warning .navbar-link:hover,
        .hero.is-warning .navbar-link.is-active {
          background-color: #ffd83d;
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-warning .tabs a {
          color: rgba(0, 0, 0, 0.7);
          opacity: 0.9
        }

        .hero.is-warning .tabs a:hover {
          opacity: 1
        }

        .hero.is-warning .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-warning .tabs.is-boxed a,
        .hero.is-warning .tabs.is-toggle a {
          color: rgba(0, 0, 0, 0.7)
        }

        .hero.is-warning .tabs.is-boxed a:hover,
        .hero.is-warning .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-warning .tabs.is-boxed li.is-active a,
        .hero.is-warning .tabs.is-boxed li.is-active a:hover,
        .hero.is-warning .tabs.is-toggle li.is-active a,
        .hero.is-warning .tabs.is-toggle li.is-active a:hover {
          background-color: rgba(0, 0, 0, 0.7);
          border-color: rgba(0, 0, 0, 0.7);
          color: #ffdd57
        }

        .hero.is-warning.is-bold {
          background-image: linear-gradient(141deg, #ffaf24 0%, #ffdd57 71%, #fffa70 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-warning.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #ffaf24 0%, #ffdd57 71%, #fffa70 100%)
          }
        }

        .hero.is-danger {
          background-color: #f14668;
          color: #fff
        }

        .hero.is-danger a:not(.button):not(.dropdown-item):not(.tag):not(.pagination-link.is-current),
        .hero.is-danger strong {
          color: inherit
        }

        .hero.is-danger .title {
          color: #fff
        }

        .hero.is-danger .subtitle {
          color: rgba(255, 255, 255, 0.9)
        }

        .hero.is-danger .subtitle a:not(.button),
        .hero.is-danger .subtitle strong {
          color: #fff
        }

        @media screen and (max-width: 1023px) {
          .hero.is-danger .navbar-menu {
            background-color: #f14668
          }
        }

        .hero.is-danger .navbar-item,
        .hero.is-danger .navbar-link {
          color: rgba(255, 255, 255, 0.7)
        }

        .hero.is-danger a.navbar-item:hover,
        .hero.is-danger a.navbar-item.is-active,
        .hero.is-danger .navbar-link:hover,
        .hero.is-danger .navbar-link.is-active {
          background-color: #ef2e55;
          color: #fff
        }

        .hero.is-danger .tabs a {
          color: #fff;
          opacity: 0.9
        }

        .hero.is-danger .tabs a:hover {
          opacity: 1
        }

        .hero.is-danger .tabs li.is-active a {
          opacity: 1
        }

        .hero.is-danger .tabs.is-boxed a,
        .hero.is-danger .tabs.is-toggle a {
          color: #fff
        }

        .hero.is-danger .tabs.is-boxed a:hover,
        .hero.is-danger .tabs.is-toggle a:hover {
          background-color: rgba(10, 10, 10, 0.1)
        }

        .hero.is-danger .tabs.is-boxed li.is-active a,
        .hero.is-danger .tabs.is-boxed li.is-active a:hover,
        .hero.is-danger .tabs.is-toggle li.is-active a,
        .hero.is-danger .tabs.is-toggle li.is-active a:hover {
          background-color: #fff;
          border-color: #fff;
          color: #f14668
        }

        .hero.is-danger.is-bold {
          background-image: linear-gradient(141deg, #fa0a62 0%, #f14668 71%, #f7595f 100%)
        }

        @media screen and (max-width: 768px) {
          .hero.is-danger.is-bold .navbar-menu {
            background-image: linear-gradient(141deg, #fa0a62 0%, #f14668 71%, #f7595f 100%)
          }
        }

        .hero.is-small .hero-body {
          padding: 1.5rem
        }

        @media screen and (min-width: 769px),
        print {
          .hero.is-medium .hero-body {
            padding: 9rem 1.5rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .hero.is-large .hero-body {
            padding: 18rem 1.5rem
          }
        }

        .hero.is-halfheight .hero-body,
        .hero.is-fullheight .hero-body,
        .hero.is-fullheight-with-navbar .hero-body {
          align-items: center;
          display: flex
        }

        .hero.is-halfheight .hero-body>.container,
        .hero.is-fullheight .hero-body>.container,
        .hero.is-fullheight-with-navbar .hero-body>.container {
          flex-grow: 1;
          flex-shrink: 1
        }

        .hero.is-halfheight {
          min-height: 50vh
        }

        .hero.is-fullheight {
          min-height: 100vh
        }

        .hero-video {
          overflow: hidden
        }

        .hero-video video {
          left: 50%;
          min-height: 100%;
          min-width: 100%;
          position: absolute;
          top: 50%;
          transform: translate3d(-50%, -50%, 0)
        }

        .hero-video.is-transparent {
          opacity: 0.3
        }

        @media screen and (max-width: 768px) {
          .hero-video {
            display: none
          }
        }

        .hero-buttons {
          margin-top: 1.5rem
        }

        @media screen and (max-width: 768px) {
          .hero-buttons .button {
            display: flex
          }

          .hero-buttons .button:not(:last-child) {
            margin-bottom: 0.75rem
          }
        }

        @media screen and (min-width: 769px),
        print {
          .hero-buttons {
            display: flex;
            justify-content: center
          }

          .hero-buttons .button:not(:last-child) {
            margin-right: 1.5rem
          }
        }

        .hero-head,
        .hero-foot {
          flex-grow: 0;
          flex-shrink: 0
        }

        .hero-body {
          flex-grow: 1;
          flex-shrink: 0;
          padding: 3rem 1.5rem
        }

        .section {
          padding: 3rem 1.5rem
        }

       

        .footer {
          background-color: #fafafa;
          padding: 3rem 1.5rem 6rem
        }
      </style>
    </head>

    <body>
      <section class="hero">
        <div class="hero-body">
          <div class="container">
            <h1 class="title">
              Resharper DupFinder Report
            </h1>
            <nav class="level">
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Total codebase size:</p>
                  <p class="title">
                    <xsl:value-of select="//CodebaseCost" />
                  </p>
                </div>
              </div>
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Code to analyze:</p>
                  <p class="title">
                    <xsl:value-of select="//TotalDuplicatesCost" />
                  </p>
                </div>
              </div>
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Total size of duplicated fragments:</p>
                  <p class="title">
                    <xsl:value-of select="//TotalFragmentsCost" />
                  </p>
                </div>
              </div>
            </nav>
          </div>
        </div>
      </section>
      <section class="section">
        <div class="container">
          <h1 class="title">
            Detected Duplicates
          </h1>
          <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
            <thead>
              <tr>
                <th>Code Size</th>
                <th>Fragments</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="//Duplicates/Duplicate">
                <xsl:if test="(@Cost &gt; 100 and @Cost &lt; 400)">

                  <tr>
                    <td>
                      <xsl:value-of select="@Cost" />
                    </td>
                    <th>File</th>
                    <th>Line Range Start</th>
                    <th>Line Range End</th>
                  </tr>

                  <xsl:for-each select="Fragment">
                    <xsl:variable name="i" select="position()" />
                    <tr>
                      <td></td>
                      <td>
                        <xsl:value-of select="FileName" />
                      </td>
                      <td>
                        <xsl:value-of select="LineRange/@Start" />
                      </td>
                      <td>
                        <xsl:value-of select="LineRange/@End" />
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </section>
    </body>

    </html>
  </xsl:template>
</xsl:stylesheet>