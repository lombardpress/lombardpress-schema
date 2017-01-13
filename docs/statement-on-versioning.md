---
layout: page
title:  Statement on Versioning
date:   2017-01-13
categories: schema
---

In general, LombardPress-Schema version numbers follow the standards for semantic versioning outlined here: [http://semver.org/](http://semver.org/)

Following the principles of semantic version, backward breaking changes should increment the first number (from 1.0.0 to 2.0.0), while any backward compatible changes should only increment the second number (from 1.0.0 to 1.1.0). Patch fixes, such as typos or minor points of clarifications will increment the third number (from 1.0.0 to 1.0.1).

With this in mind, some clarity is need on precisely what constitutes a backward breaking change. The best way to describe this is by discussing a concrete example of a processing client that aims to support text editions according to the the LombardPress-Schema. Once such example is the LombardPress-Web application.

The LombardPress-Web application makes different sets of stylesheets for each XML schema that the platform supports. These stylesheets transform the source edition to a common HTML format used for display within the framework and manipulation by the framework's javascript code. This allows the framework to support multiple XML schemas while at the same time allowing javascript code to be written in expectation of a single uniform DOM.

A non-breaking change to the LombardPress-Schema (that is a move from version 1.0.0 to 1.1.0) would be a change to the schema that does not require the LombardPress-Web application to create a new set of style sheets to handle the new schema or to code conditionals within the existing style sheet. Rather, supporting such changes would only require (typically) the addition of new templates within existing XSLT stylesheet to handle the new features introduced in the 1.1.0 schema. A test of this compatibility is that this same stylesheet--now updated to handle 1.1.0 features--should be able to operate seamlessly on source files that remain at the 1.0.0 level.

However, a breaking change (that is a move from 1.0.0 to 2.0.0) is a change that would mean existing stylesheets could no longer handle simultaneously operate on files validated against the new 2.0.0 schema and the older 1.0.0 schema without the introduction of conditionals and decision trees (e.g. choice->when->otherwise).

Patch changes (moves from 1.0.0 to 1.0.1) are generally corrections to typos or inconsistencies within the documentation or bugs within the schema itself. Thus, they should require no adjustment on the part of processor implementations.
