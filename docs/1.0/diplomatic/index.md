---
layout: page
title:  "Lombard Press Schema 1.0.0: Diplomatic File Specifications"
date:   2016-04-01 09:46:33 -0400
categories: schema
---

Editors: 
    * Jeffrey C. Witt
    * Nicolas Vaughan

Document Status: Draft

# Preamble

The goal of the LombardPress diplomatic transcription specification is offer a set of guidelines for the markup of medieval Sentences commentary that conform as much as possible to existing standards. In this case of diplomatic transcriptions, this means following as closely as possible the EpiDoc specification. In most cases, we aim only to expand the EpiDoc specifications and offer a detailed list of available attributes and specificy where @xml:id and other attributes and elements are required, preferred, or simply available. Where specifications are not stated, the EpiDoc guidelines should be followed. Where the EpiDoc does not state a specification, the more general TEI specification should be followed.

# teiHeader elements

## sourceDesc

* **MUST** list the witness being used in the edition via `<listWit>` 
    - Since this is a diplomatic transcriptions there should only be one witness listed.
* example:
      
        <listWit>
          <witness xml:id="P" n="bnf15705">Paris, Lat 15705</witness>
        </listWit>

* `sourceDesc/listWit/witness` **MUST** have an `@xml:id` attribute
* `sourceDesc/listWit/witness` **MUST** have an `@n` attribute that points to the short id for the manuscript resource in the SCTA database
* `sourceDesc/listWit/witness` **MAY** provide an `@xml:base` which corresponds to the base url for the IIIF canvases id for the folios within this witness

## revisionDesc

* **MUST** have a `@status` 
    - "draft"
    - "public-draft"
    - "review-draft"
    - "embargoed"
    - "published"
* **MUST** have a listChange/change for each GIT tagged version
* **MAY** have a listChange/change/p note about the changes made or `list/change` may 
* **MAY** have a listChange/change/@corresp="versionlog.xml#v0.1.0" pointing to an external version log describing the change.
* example

        <revisionDesc status="draft">
          <listChange>
            <change when="2016-01-01" who="#JW" status="review-draft" n="0.1.0" @corresp="versionlog.xml#v0.1.0"/>
            <change when="2015-11-11" who="#JW" status="draft" n="0.0.1">
                <p>Created file for the first time.</p>
            </change>
          </listChange>
        </revisionDesc>

# encodingDesc

* encodingDesc seem the most appropriate place to specify what version lbp-schema this file is validated against and what kind of transcription this is.
* TEI P5 severely limits the available elements with the encoding description, but it does allow an `editorialDecl/p/note` element.
* encodingDesc **MUST** have a an editorialDecl/p/note[@type='validating-schema']
    - The value of this element should indicate the version number of the LBP this transcription is validated against.
* encodingDesc **MUST** have a an editorialDecl/p/note[@type='transcription-type']. 
    - Current available values are:
        + critical
        + diplomatic
* example:
        <encodingDesc>
            <editorialDecl>
                <p>
                    <note type="validating-schema">1.0.0</note>
                    <note type="transcription-type">diplomatic</note>
                </p>
            </editorialDecl>
          </encodingDesc>

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
    
    - `<name>`
    - `<title>`
    - `<mentioned>`
    - `<ref>`
    - `<pc>`
    - `<quote>`
    - `<ref`>

## name

* `<name>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list

## title

* `<title>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list

## quote

* `<quote>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when has `@type=commentary` `<quote>` **MAY** have a `@target` that points to SCTA URL

## ref

* `<ref>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when has `@type=commentary` `<ref>` **MAY** have a `@target` that points to SCTA URL

## cb

* **MUST** indicate via `@ed` the source text in which the column breaks occur
* **MUST** indicate via `@n` the folio, side, and column, e.g. 15rb
    - in version 1.0.0, it may be preferable to provide a clear delimeter between these parts, e.g. 15-r-b
* **MAY** have an `@select` attribute that points to the short canvas id of the folio in question
    - the short canvas id should be combined in processing with the `@xml:base` attribute of the `<witness>` element declared in the `sourceDesc/listWitness/witness`

## lb

* **MUST** indicate via `@ed` the source text in which the column breaks occur
* **MAY** indicate via `@n` the number of the line.

