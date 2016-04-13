---
layout: page
title:  "Lombard Press Schema 0.0.0: Critical File Specifications"
date:   2016-04-01 09:46:33 -0400
categories: schema
---

Version 0.0.0 is being depreciated. We provide a list of basic decisions made here to offer and transparency and clarity about past decisions, so as to aid in graduation of all files to version 1.0.0

# teiHeader elements

## sourceDesc

* **MUST** list witnesses being used in edition via `<listWit>` 
* example:
      
        <listWit>
          <witness xml:id="P" n="bnf15705">Paris, Lat 15705</witness>
          <witness xml:id="Pb" n="bda446">Paris, Bibliotheque de l'Arsenal, ms. lat. 446</witness>
          <witness xml:id="Z" n="zbsSII72" xml:base="http://www.e-codices.unifr.ch/metadata/iiif/zbs-SII-0072/canvas/">Solothurn, Zentralbibliothek, Cod. S II 72</witness>
        </listWit>
      
## sourceDesc/listWit/witness

* **MUST** have an `@xml:id` attribute
* **MUST** have an `@n` attribute that points to the short id for the manuscript resource in the SCTA database
* **MAY** provide an `@xml:base` which corresponds to the base url for the IIIF canvases id for the folios within this witness

## revisionDesc

        <revisionDesc status="draft">
          <listChange>
            <change when="2015-11-11" who="#JW" status="draft" n="0.0.1">
                <p>Created file for the first time.</p>
                <note type="validating-schema">0.0.1</note>
                <note type="transcription-type">critical</note>
            </change>
          </listChange>
        </revisionDesc>

# text elements

## front

* **SHOULD** have a `<div xml:id="includeList">`
    - this will likely be changed in 1.0.0 to `<div type="includeList">`
    - `front/div` should include the following includes:
        + `<xi:include href="https://bitbucket.org/lombardpress/lombardpress-lists/raw/master/workscited.xml" xpointer="worksCited"/>`
        + `<xi:include href="https://bitbucket.org/lombardpress/lombardpress-lists/raw/master/Prosopography.xml" xpointer="prosopography"/>`
* **SHOULD** have a `<div type="startsOn">`
    - should include `<cb` elements that indicate the column on which the text beings

## body

## body/div

* the first div in the body **MUST** have an xmlid that matches the id for the expression part that this div represents.
    - For example: if the file name is pl-l1d2d3.xml the div must have the attribute `<div @xml:id="pl-l1d2d3">`
* the DIV **MUST** contain a `<head>` element
* the DIV **MAY** contain a secondary header with the `attribute type='questionTitle'`

## div

* every div **SHOULD** contain an `@xml:id` that corresponds to the short id for the Expression Part that this div represents.
* if the division in question corresponds to the one of the available expressTypes in the SCTA Ontology, this should be declared with an `@type` attribute. Otherwise no `@type` attribute should be added.
    - For example: "quaestio" "articulus", "dubium"
* the DIV **MAY** contain a secondary header with the `attribute type='questionTitle'`

## head

* every `<head>` **SHOULD** have an `@xml:id` attribute.
* generic main titles for a given division **SHOULD** be represented with an `<head>` and should not include an `@type`
* for questionTitle subtypes a second `<head>` **SHOULD** be added with an `@type=questionTitle`

## p

* every `<p>` **SHOULD** have an `@xml:id` attribute.
* a `<p>` element can contain the following elements as direct children
    - `<cit>`
    - `<name>`
    - `<title>`
    - `<app>`
    - `<supplied>`
    - `<mentioned>`
    - `<ref>`
* The reason that `<quote>` is not listed here is because we expect every quote in a critical transcription to be wrapped in a `<cit>` element.

## name

* `<name>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list

## title

* `<title>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list

## cit

* **MUST** contain a `<quote` element
* **MUST** contain a `<bibl>` element

## cit/quote

* `<quote>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when has `@type=commentary` `<quote>` **MAY** have a `@source` that points to SCTA URL

## ref

* in 0.0.0 ref contain contain a `<seg>` and sibling `<bibl>`. This is being depreciated in 1.0.0 and `<cit>` will be able to contain and `<ref>` and `<bibl` in the same way that it can contain a `<quote>` and `<bibl>`
* `<ref>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when has `@type=commentary` `<ref>` **MAY** have a `@target` that points to SCTA URL

## cit/bibl or ref/bibl

* `<bibl>` **MAY** contain a `<ref>`

## app

## lem
* **MAY** have `@wit`

## rdg

* **MUST** have an `@wit`
* **MAY** have an `@type`    
    - default `@type` is `alternate` and does not need to be specified but  may be
* available `@type` include
    - intextu
        + possibly to be replaced by "add" in v. 1.0.0
    - om.
    - corrAddition
    - corrReplace
    - corrDeletion
    - alternate
* **MAY** have `@cause` 

## rdg[@type="om."]
    
* **MUST** be an empty element with no text node

## rdg[@type="corrAddition"]

* **MUST** have a `<corr>` wrapper with the child element `<add>`
    - this will be depreciated in 1.0.0 because `<corr>` is being used improperly as "correction" rather than as "correct"
    
## rdg[@type="corrDeletion"]

* **MUST** have a `<corr>` wrapper with the child element `<del>`
    - this will be depreciated in 1.0.0 because `<corr>` is being used improperly as "correction" rather than as "correct"

## rdg[@type="corrReplace"]

* **MUST** have a `<corr>` wrapper with the child elements `<add>` and `<del>`
    - this will be depreciated in 1.0.0 because `<corr>` is being used improperly as "correction" rather than as "correct". It will like be changed to `<subst>`

## cb

* **MUST** indicate via `@ed` the source text in which the column breaks occur
* **MUST** indicate via `@n` the folio, side, and column, e.g. 15rb
    - in version 1.0.0, it may be preferable to provide a clear delimeter between these parts, e.g. 15-r-b
* **MAY** have an `@select` attribute that points to the short canvas id of the folio in question
    - the short canvas id should be combined in processing with the `@xml:base` attribute of the `<witness>` element declared in the `sourceDesc/listWitness/witness`

## lb

* **MUST** indicate via `@ed` the source text in which the column breaks occur
* **MAY** indicate via `@n` the number of the line.