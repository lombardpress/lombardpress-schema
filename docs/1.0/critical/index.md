---
layout: page
title:  "Lombard Press Schema 1.0.0: Critical File Specifications"
date:   2016-04-01 09:46:33 -0400
categories: schema
---

Editors: 

* Jeffrey C. Witt
* Nicolas Vaughan
* Michael Stenskjær Christensen

Document Status: Draft

# Preamble

The goal of the LombardPress critical transcription specification is to offer a set of guidelines for the markup of medieval Sentences commentary that conform as much as possible to existing standards. In the case of critical editions and transcriptions, this means following as closely as possible the specifications and recommendations of the Digital Latin Library. In most cases, we aim only to expand the Digital Latin Library specifications and offer a detailed list of available attributes and attribute values. Where specifications are not stated, the Digitial Latin Library guidelines should be followed. Where the Digital Latin Library does not state a specification, the more general TEI specification should be followed.

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
* if the division in question corresponds to the one of the available expressionTypes in the SCTA Ontology, this should be declared with an `@type` attribute. Otherwise no `@type` attribute should be added.
    - For example: "quaestio" "articulus", "dubium"
* the DIV **MAY** contain a secondary header with the `attribute type='questionTitle'`

## head

* every `<head>` **SHOULD** have an `@xml:id` attribute.
* generic main titles for a given division **SHOULD** be represented with an `<head>` and should not include an `@type`
* for questionTitle header a second `<head>` **SHOULD** be added with an `@type=questionTitle`

## p

* every `<p>` **SHOULD** have an `@xml:id` attribute.
* a `<p>` element can contain the following elements as direct children
    - `<name>`
    - `<title>`
    - `<cit>`
    - `<quote>`
    - `<ref>` 
    - `<note>`
    - `<mentioned>`
    - `<c>`
    - `<supplied>`
    - `<app>`
    
## name

* `<name>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list
* if `<name>` is being used to encode a name being used purely as a "variable", often "Sortes", "Plato", or "Socrates", the `<name>` element **SHOULD** take an `@type="variable` attribute (analogous to use the of the `<c type="variable">` structure described below)

## title

* `<title>` elements shoud have an `@ref` that points to a name id in the xincluded prosopography list

## cit

* **MUST** contain a `<quote>` or `<ref>` element
* **MUST** contain a `<bibl>` element

## cit/quote

* `<quote>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when has `@type=commentary` `<quote>` **MAY** have a `@source` that points to SCTA URL

## cit/ref

* `<ref>` **MAY** have an `@ana` atttribute pointing a known quotation that is being referred to
* when `<ref>` has an `@type=commentary` `<ref>` **MAY** have a `@target` that points to SCTA URL
* if the ref corresponds to a `<quote>`. The `<ref>` should take a `@corresp` element that points to the id of the `<quote>`. In this way the bibliographical information associated with the quotation will also be associated with the `<ref>` element without redundancy.

## cit/note

* if an additional note is required to explain the citation, this should go in a `<note>` element in ordered to be separate from the strictly bibliograph information.

## cit/bibl or ref/bibl

* `<bibl>` **MAY** contain a `<ref>`

## mention

* `<mention>` should be used as specified in the TEI guidelines to identify words as phrases under discussion. In general these phrases correspond to words or phrases placed within single quotations.

## c

* `<c>` **SHOULD** be used to encapsulate characters functioning as variables. This normally occurs in a syllogism or argument of some kind
* `<c>` used to encode a variable **SHOULD** take an `@type="variable"` attribute indicating that this character is an attribute.

## supplied

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

* **MUST** have childe `<add>` containing a text node of the value of the addition
* the `<add>` element **MUST** include an `@place` attribute indicating the place of the addition.
    - Current values for place are:
        + inLine
        + aboveLine
        + belowLine
        + marginTop
        + marginRight
        + marginBottom
        + marginLeft
        + marginCenter
            * marginCenter is a sufficient indication for texts divided into two columns. 
            * On the rare occasion that the text is in three or more columns, the center margin where the addition was made should be identified as: 
                - marginCenter-1, marginCenter-2, counting from left to right, so that the the furthest left center margin is 1.
        
## rdg[@type="corrDeletion"]

* **MUST** have a  `<del>`
* `<del>` **MAY** indicate the kind of deltion using the `@rend` attribute. `@rend values include`:
    - strikethrough
    - expunctuated
    - stikethrough/expunctuated
    - blackout
    - erasure
    
## rdg[@type="corrReplace"]

* **MUST** have a `<subst>` wrapper with the child elements `<add>` and `<del>`
    
## cb

* **MUST** indicate via `@ed` the source text in which the column breaks occur
* **MUST** indicate via `@n` the folio, side, and column, e.g. 15rb
    - in version 1.0.0, it may be preferable to provide a clear delimeter between these parts, e.g. 15-r-b
* **MAY** have an `@select` attribute that points to the short canvas id of the folio in question
    - the short canvas id should be combined in processing with the `@xml:base` attribute of the `<witness>` element declared in the `sourceDesc/listWitness/witness`

## lb

* `<lb>` should not be used in a critial transcription.