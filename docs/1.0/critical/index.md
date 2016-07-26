---
layout: page
title:  "Lombard Press Schema 1.0.0 - Critical Transcription Guidelines"
date:   2016-07-015
categories: schema
---

# LombardPress Critical Transcription Guidelines

Editors: 

* Jeffrey C. Witt (Loyola University Maryland)
* Michael Stenskjær Christensen (University of Copenhagen)
* Nicolas Vaughan (Universidad de los Andes)

Document Status: Draft

# Outline

* [Preamble](#preamble)
* [teiHeader](#teiheader)
  * [fileDesc](#filedesc) 
    * [titleStmt](#titlestmt)
    * [editionStmt](#editionstmt)
    * [publicationStmt](#publicationstmt)
    * [sourceDesc](#sourcedesc)
  * [encodingDesc](#encodingdesc)
  * [revisionDesc](#revisiondesc)
* [Facsimile](#facsimile)
* [Text](#text)
  * [Front](#front)
  * [Text](#text)
  * [Body](#body)
  * [Div](#div)
  * [P](#p)
* [Apparatus Criticus](#apparatus-criticus)
  - [variation](#variation)
  - [correction](#correction)
  - [conjecture](#conjecture)
  - [connected apparatus entries](#connected-apparatus-entries)
  - [manual](#manual)
* [Apparatus Fontium](#apparatus-fontium)
  - [Citation](#citation)
  - [Reference](#reference)
  - [Quotation](#quotation)
* [Milestones](#milestones)


# Preamble

The goal of the LombardPress critical transcription specification is to offer a set of guidelines for the markup of medieval Scholastic Commentaries and Texts that conform as much as possible to existing standards. In the case of critical editions and transcriptions, this means following as closely as possible the specifications and recommendations of the Digital Latin Library. In most cases, we aim only to expand the Digital Latin Library specifications and offer a detailed list of available attributes and attribute values. Where specifications are not stated, the Digital Latin Library guidelines should be followed. Where the Digital Latin Library does not state a specification, the more general TEI specification should be followed.


# teiHeader

## fileDesc

### Description

The `fileDesc` contains the full bibliographic description of an electronic file.

### Rules

1. `fileDesc` **MUST** contain `titleStmt`.
2. `fileDesc` **MUST** contain `editionStmt`.
3. `fileDesc` **MUST** contain `publicationStmt`.


### titleStmt

#### Description

The `titleStmt` determines the bibliographical information of the encoded file. 

#### Rules

1. **MUST** have a title
2. **MUST** have an author
3. **SHOULD** have editor
4. **MAY** have responseStmt

#### Examples

``` xml
<titleStmt>
  <title>Dicta super librum De anima</title>
  <author>Simon Magister</author>
  <editor>Michael Stenskjær Christensen</editor>
  <respStmt>
    <name xml:id="comments-JJ">John Johnson</name>
    <resp>Editorial suggestions</resp>
  </respStmt>
</titleStmt>
```


### editionStmt

#### Description

`editionStmt` indicates the edition of the document within the context of its source history.

#### Rules

1. `editionStmt` **MUST** contain an `edition` element.
2. `edition@n` **MUST** be `n=X.X.X-dev`; usually, when starting a new document it should be listed as `n=0.0.0-dev`
3. `edition` **MUST** contain a `date` element 
  * **MUST** include a machine-formatted `date@when` element corresponding to the date in the text node.
4. `edition` **SHOULD NOT** contain any other children besides the date. 


#### Examples

```xml
<editionStmt>
  <edition n="0.0.0-dev">
    <date when="2016-06-18">June 18, 2016</date>
  </edition>
</editionStmt>
```

### publicationStmt

#### Description

`publicationStmt` indicates the authority supporting this edition (usually a sponsoring or funding research group). It should also list the license and availability of the text. 

#### Rules

1. **MUST** contain an `authority` element.
  * We suggest to let the `authority` state the entity that makes the creation of the current document possible or the context where it belongs. See examples below.
2. The `authority` tag **MAY** contain a `ref` to provide an external link to the authority entity.
3. **MUST** contain `availability`
4. `availability` **MUST** contain `@status`
5. `availability` **SHOULD** contain a `p` describing the license under which the edition is published.

#### Examples

##### Example 1

``` xml
<publicationStmt>
  <authority>Sentences Commentary Project</authority>
  <availability status="free">
    <p>Published under a <ref target="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 License</ref></p>
    </availability>
  </publicationStmt>
``` 

##### Example 2

``` xml
<publicationStmt>
  <authority>
    <ref target="http://representationandreality.gu.se">
      Representation and Reality: Historical and Contemporary Perspectives on the Aristotelian Tradition
    </ref>
  </authority>
  <availability status="free">
    <p>Published under a <ref target="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 License</ref></p>
    </availability>
  </publicationStmt>
``` 

##### Example 3

``` xml
<publicationStmt>
  <authority>
    <ref target="http://petrushispanusproject.po">Petrus Hispanus Project</ref></authority>
  <availability status="free">
    <p>Published under a <ref target="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 License</ref></p>
    </availability>
  </publicationStmt>
``` 

### sourceDesc

#### Description

`sourceDesc` should list the witnesses and sources used to construct the edition.

#### Rules

1. `sourceDesc` **MUST** contain either a `listWit` or `listBibl` or both
2. `listWit` **MUST** contain at least one `wit`
3. `listBibl` **MUST** contain at least on `bibl`
4. `witness` **MUST** have a `@xml:id`
5. `witness` **SHOULD** have a `n` giving a short id of the witness.
  * The value of `@n` **SHOULD** correspond to the short id for the manuscript in the SCTA database. If the value is not known, leave it out. It will be added later during processing.
6. For adding `handDesc`, follow TEI guidelines.

#### Examples

##### Example 1

```xml
<listWit>
  <witness xml:id="P" n="bnf15705">Paris, Lat 15705
    <msDesc>
      <physDesc>
        <handDesc hands="2">
          <handNote sameAs='#P'>This is the main hand of the text. German hand of the XIIIc with an inclination toward particularly complex majuscules.</handNote>
          <handNote xml:id="#P1">Flemish hand of the XVc written in mauve ink. Used for minor corrections.</handNote>
        </handDesc>
      </physDesc>
    </msDesc>
  </witness>witness>
  <witness xml:id="Pb" n="bda446">Paris, Bibliotheque de l'Arsenal, ms. lat. 446</witness>
  <witness xml:id="Z" n="zbsSII72" xml:base="http://www.e-codices.unifr.ch/metadata/iiif/zbs-SII-0072/canvas/">Solothurn, Zentralbibliothek, Cod. S II 72</witness>
</listWit>
```

##### Example 2

``` xml
<listBibl>
  <bibl></bibl>
    <!-- Info about id's for the `@source` goes here-->
</listBibl>
```

## encodingDesc

### Description

`encodingDesc` provides details about the encoding methods used in the text and the schema followed.

### Rules

1. `encodingDesc` **MUST** be stated. 
2. `encodingDesc` **MUST** contain `variantEncoding`.
3. `variantEncoding` **MUST** contain `@method` which confirms that the method of variant encoding is *parallel-segmentation*.
4. `encodingDesc` **MUST** contain a `schemaRef`.
5. `schemaRef` **MUST** contain a `target` that points to the URL of the LBP schema.
6. `schemaRef` **MUST** contain an `@n` pointing to the version number of the LBP schema.
7. `encodingDesc` **MAY** take an `editorialDecl` that contains a `p` with a prose description of the guidelines followed in the preparation of this edition.

NOTE: The rules concerning the `schemaRef` are subject to revision based on the exact implementation in the TEI schema.

### Examples

```xml
<encodingDesc>
  <variantEncoding method="parallel-segmentation"
    location="internal"/>
  <schemaRef
    n="lbp-critical-1.0.0"
    target="https://raw.githubusercontent.com/lombardpress/lombardpress-schema/master/src/1.0/critical.rng">
  </schemaRef>
  <editorialDecl>
    <p>Encoding of this text has followed the recommendations of the LombardPress 1.0.0 guidelines for a critical edition</p>
  </editorialDecl>
</encodingDesc>
```

## revisionDesc

### Description

The `revisionDesc` contains a description of the current and previous versions of the current edition.
The individual editor would usually not be responsible for maintaining the `revisionDesc`, as it should (ideally) be generated as part of the publication workflow. 

### Rules

1. `revisionDesc` **SHOULD** be stated.
2. `revisionDesc` **MUST** contain `@status`
3. `revisionDesc` **MUST** contain `listChange` 
4. `listChange` **MUST** contain at least one `change`
5. `change` **MUST** contain `@when`
6. `change` **MUST** contain `@status`. Possible values of the attribute are:
  * private-draft
  * public-draft (alias: draft)
  * out-for-review
  * peer-reviewed (alias: published)
7. `change` **MUST** contain `@n`
8. `change` **MUST** contain either `@corresp` pointing to a description of the change in another file or a `p` describing the change.

### Examples

#### Example 1

```xml
<revisionDesc status="draft">
  <listChange>
    <change when="2015-11-11" status="draft" n="0.0.0">
      <p>Created file for the first time.</p>  
    </change>
  </listChange>
</revisionDesc>
```

#### Example 2

```xml
<revisionDesc status="draft">
  <listChange>
    <change when="2015-12-24" status="draft" n="0.1.0" corresp="versionlog.xml#v0.1.0" />
    <change when="2015-11-11" status="draft" n="0.0.0">
      <p>Created file for the first time</p>
    </change>
  </listChange>
</revisionDesc>
```
# Facsimile

## Description

The Facsimile tag is used to record information about images or image regions that correspond to the various parts of the edition.

Our specifications may differ from examples used in the TEI guidelines because we currently only support image connections via the IIIF API. This first and foremost means that image references and coordinate regions only apply to the idea of a IIIF canvas, rather than any particular image. 

This means that that no `graphic` element is allowed within the `surface` element. It also means that coordinates actually refer to the coordinates of the abstract canvas rather than any actual image.

The full canvas id is always expected to be constructed from the `xml:base` of the targeted `witness` and the short canvas id which should be the same as the id of the surface.

## Rules

* the `witness` in the `sourceDesc` **SHOULD** have a `@xml:base` attribute
* `facsimile` **MUST** have at least one `surface` element as a child
* the `surface` element **MUST** have an `xml:id` which is identical to the short id of the IIIF canvas.
* the `surface` **SHOULD NOT** have a `graphic` element.
* the `surface` **MUST** have a `corresp` element pointing to the `witness` it is a `surface` of.
* the `surface` **MAY** take an `n` attribute as helpful label for the surface. Following the same pattern as used in the `pb@n` is recommended. 
* `surface` **SHOULD** take `zones` as children
* `zones` **MAY** either have an `xml:id` or a `start` attribute or both
* the value of `start` attribute **SHOULD** be the `xml:id` of the element the zones in question refer to. 
  - Because elements representing the "content hierarchy" (rather than the material hierarchy, such as `pb`, `cb`, or `lb`) can run onto multiple surfaces, and therefore have more than one zone, they **MUST** have an `@n` attribute indicating their sequence order.
  - `zones` for content hierarchy elements **SHOULD** be recorded in the diplomatic transcription for each witness, but they **MAY** be recorded in the critical transcription file if deemed necessary.
* elements in the body text **MAY** point to a zone or surface via the `@facs` attribute with a pointer `#` to the id of the zone or surface
* an element, usually a `pb`, **MAY** short cut to the canvas id by using the `@facs` attribute and providing the value of the IIIF canvas short id without using a pointer `#`. See the examples below. 

## Examples

Example using e-codices IIIF canvas id

```xml
<!-- witness in sourceDesc -->
<witness xml:id="A" n="wettf15" xml:base="http://www.e-codices.unifr.ch/metadata/iiif/kba-WettF0015/canvas/">Aarau, Aargauer Kantonsbibliothek, MsWettF 15</witness>

<!-- surface block in facsimile element -->
  <surface xml:id="kba-WettF0015_107v.json" corresp="#A" n="107-v">
<!-- zones for paragraphs -->
    <zone start="#l1-scoesi" ulx="220" uly="1648" lrx="870" lry="1809" n="1"/>
    <zone start="#l1-scoesi" ulx="870" uly="107" lrx="1520" lry="268" n="2"/>
    <zone start="#l1-chpnpn" ulx="870" uly="104" lrx="1520" lry="361" n="1"/>
<!-- zones referred to via a @facs attribute -->
    <zone xml:id="zone-of-column-1" ulx="0" uly="0" lrx="750" lry="1500"/>
  </surface>

<!-- examples of reference to zones in the text -->    
  <cb ed='#A' n="a" facs="#zone-of-column-1">
<!-- two ways a page break can point to the canvas -->
<!--It can point to the surface element with a pointer -->
  <pb ed="#A" n="1-v" facs="#kba-WettF0015_107v.json"/>
<!-- or it can point directly to the canvas id without a pointer -->
  <pb ed="#A" n="1-v" facs="kba-WettF0015_107v.json"/>
<!-- content hierarchy elements require no facs attribute, because they are connected via the `zone@start` attribute -->
  <p xml:id="l1-scoesi">
```

# text

## Description

`text` is the main wrapper of the edition and sibling to the teiHeader

## Rules

* `text` **MUST** take an `@type` attribute the value of which is "critical"
  - the possible values for `text@type` are "critical", "diplomatic", and "translation"
* `text` **SHOULD** take an `@xml:lang` attribute indicating the dominant language of the edition, usually `la` for "latin"

## front

### Description

`front` is used to make prefatory declarations about the text. For now that only includes the starting location of the text in the witnesses.

### Rules

* `front` **MUST** take a `div` with the `xml:id="starts-on"`
  - The content of this div should only be `pb` and `cb` elements indicating the page and column on which the text begins in the different witnesses.

### Examples

```xml
<front>
  <div xml:id="starts-on">
    <pb ed="#V" n="5-r" facs="V5r"/><cb ed="#V" n="b"/> <!-- V5rb -->
    <pb ed="#S" n="2-r" facs="S2r"/><cb ed="#S" n="a"/> <!-- S2ra -->
    <pb ed="#R" n="1-r" facs="R1r"/><cb ed="#R" n="a"/> <!-- R1ra -->
    <pb ed="#SV" n="187-r" facs="SV187r"/><cb ed="#SV" n="a"/> <!-- SV187ra -->
  </div>
</front>
```

## body

## div

## head

## p

# Apparatus Criticus

## General Rules

Below are the basic reading and lemma types in three main categories, variation, correction, and conjecture. Before detailing those types, the general rules of any apparatus entry are described here.

The general rules of any `app` element are:

1. `app` **MUST** contain `lem` element.
2. `app` **MUST** contain at least one `rdg` element.
3. `app` **MAY** contain a `note` element.
4. `app` **MAY** contain a `witDetail` element.
  * the `witDetail` **MUST** take a pointer `@wit` 
5. `lem` **MAY** be empty.
6. If `lem` is empty, it **MUST** contain the `@n` element.
  * When one or more witnesses contain readings that are not adopted in the critical text, the `lem` element **MUST** be left empty. But since there is then no lemma to anchor the apparatus entry in the critical text, another label is needed. `@n` gives the processor a label for this purpose. Usually the word preceding the apparatus would be used for that. An example of that could look like this:

```xml
Praeterea, sicut oculus
<app>
  <lem n="oculus"/>
  <rdg wit="#B">nicticoracis</rdg>
</app>
ad lumen solis
```
This would make it easy to create this apparatus entry:

> nicticoracis *post* oculus A

7. A `lem` **MUST** have `@wit` when its parent `app` is contained within another `app` element.

## Basic rdg types

The basic structure of the `rdg` typology can be described as follows

* variation
  - varation-substance
  - variation-orthography
  - variation-inversion
  - variation-present
  - variation-absent
* correction
  - correction-addition
  - correction-deletion
  - correction-substitution
    + correction-transposition
  - correction-cancellation
    + deletion-of-addition
    + deletion-of-deletion
    + deletion-of-substitution
    + substitution-of-addition
* conjecture
  - conjecture-supplied
  - conjecture-removed
  - conjecture-corrected
* manual

## variation

### General Definition

A variation is meant as any reading that varies from the indicated lemma. At present, we have identified five main variation types listed below.

### variation-substance

#### Description

A `variation-substance` is generally the most common type of variant, in which an editor simply wants to show that the witness has a different word or phrase than what is included in the critical text.

This kind of variant is most commonly seen in an apparatus as something like: 

> 10 fides] spes *A*

#### Rules

1. It **MUST** have `lem`.
2. `lem` **MAY NOT** have a `@wit` or `@source` when it is contained by no other `app` element. It **MUST** have `@wit` when it is contained by a parent `app` element.
3. `rdg` **MAY** have `@type=variation-substance`.
  * The requirement for `@type` is only a "**MAY**" because this `@type` is so common and can be inferred by a processor from the following encoding pattern. Thus it is not necessary for an editor to state it on every reading.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either `@wit` or `@source`.


#### Example

```xml
<app>
  <lem wit="#B">fides</lem>
  <rdg wit="#A" type="variation-substance">spes</rdg>
</app>

```

On a negative apparatus:

> 10 fides] spes *A*

On a positive apparatus:

> 10 fides] *BCD* spes *A*

### variation-orthography

#### Definition

The `variation-orthography` class is meant to identify a class of variant instances where there is no actual variation in the substance of the word or phrase in question but simply an orthographic difference.

#### Rules

1. It **MUST** have `lem`.
2. `lem` **MAY** have a `@wit` or `@source` when it is contained by no other `app` element. It **MUST** have `@wit` when it is contained by a parent `app` element.
3. `rdg` **MUST** have `@type=variation-orthography`.
  * The requirement for `@type` is "**MUST**" because without the `@type` value, the encoding pattern is indistinguishable from the `@type="variation-substance` encoding pattern.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either @wit or @source.

#### Example

```xml
<app>
  <lem>sicut</lem>
  <rdg wit="#A" type="variation-orthography">sicud</rdg>
</app>
est
```

> 10 sicut] sicud *A*

### variation-inversion

#### Definition

`variation-inversion` is meant to indicate a variant reading where two or more words have been inverted relative to the critical text.

#### Rules

1. It **MUST** have a `lem`.
2. The `lem` **MUST** not be empty
3. `rdg` **MUST** have `@type=variation-inversion`.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either `@wit` or `@source`. 

#### Example

```xml
fides non
<app>
  <lem>bona fides</lem>
  <rdg wit="#A" type="variation-inversion">fides bona</rdg>
</app>
```

> 10 bona fides] fides bona *A*

### `variation-present`

#### Description

The `variation-present` type should be used to indicate that a word or phrase is present in a witness but has not been included in the critical text. It is important that this be distinguished from the type `correction-addition` which is meant to indicate that a word or phrase has been actively added as a conscious correction to the witness text.

#### Rules

1. It **MUST** have `lem`.
2. `lem` **MUST** be an empty node. 
  * As stated above in the general rules, when a `lem` is empty it should have an `@n="suggested-lemma-value"` attribute, the value of which should be the word to appear in the critical text that immediately proceeds the `app`. 
3. `lem` **MAY** have `@wit` or `@source` attribute.
4. `rdg` **MUST** have `@wit` or `@source`.
5. `rdg` **MUST** have `@type=present`.
7. `rdg` **MAY** include `@cause` with the following available enumerated values:
  * `repetition`
  * ...

#### Examples

##### Example 1

```xml
fides
<app>
  <lem n="fides"/>
  <rdg wit="#A" type="variation-present">spes</rdg>
</app>
```

> 10 fides] spes *in textu* *A* 

> 10 spes *post* fides *hab./scr./inest* *A*


##### Example 2

Another example of the present type where the present word is caused by an (erroneous) repetition. 

```xml
spes
<app>
  <lem n="spes"/>
  <rdg wit="#A" type="variation-present" cause="repetition">spes</rdg>
</app>
```

> 10 spes *iter.* *A*

### variation-absent

#### Description

A word or phrase is absent from a witness but present in the transmitted text. This is most often rendered as simple "omission".

> 10 fides] *om.* *A*

#### Rules

1. The `lem` **MUST** be present.
2. The `lem` **MUST** have a text node.
3. The `lem` **MAY** include `@wit` or `@source` attributes.
4. The `rdg` **MUST** include `@wit` or `@source` attributes.
5. The `rdg` **MUST** have no descendant text nodes. 
6. The `rdg` **MAY** have a child `space` element. 
  * A `space` may be used when attempting to indicate a space left by the scribe intended to be filled in later.
6. The `rdg` **SHOULD** include `@type=variation-absent`.
  * The reason this is not a **MUST** is because the pattern of a present `lem` with a text value and a present but empty `rdg` element is a unique pattern that corresponds to the `variation-absent` type.
7. The `rdg` **MAY** include `@type=cause` with the following available enumerated values:
  * `homeoteleuton`
  * `homeoarchon` 
  * ...
  
  
#### Examples

##### Example 1

```xml
<app>
  <lem>fides</lem>
  <rdg wit="#A" type="variation-absent"/>
</app>
```

In a positive apparatus this could be presented like this:

> 10 fides] *B* *om.* *A*

In a negative apparatus it would be like this:

> 10 fides] *om.* *A*


##### Example 2

The following is an example of a conjecture where a word is added to the edition but missing in the transmitted text. For more on conjectures [see below](#conjecture).

```xml
<app>
  <lem type="conjecture-supplied"><supplied>fides</supplied></lem>
  <rdg wit="#A" type="variation-absent"/>
</app>
est
```

##### Example 3

```xml
fides 
<app>
  <lem>non semper sic, sed non</lem>
  <rdg wit="#A" type="variation-absent" cause="homeoteleuton"/>
</app>
```

> 10 non semper sic, sed non] *om.* *A* *(hom.)*


##### Example 4

```xml
<app>
  <lem>fides</lem>
  <rdg wit="#A" type="variation-absent"><space extent="5" unit="characters" /></rdg>
</app>
```

> 10 fides] *lac. (5 litt.)* *A*


## correction

### General Definition

A correction is meant as any reading where it is assumed that the witness corrects a perceived error in the transmitted text.

This is *not* used to represent corrections made by the edition. That is reserved for the conjecture class [below](#conjecture).

### correction-addition

#### Definition

This indicates that a scribe (either the original or a later scribe) has realized that a word or phrase is missing in his text and subsequently added it. This should be clearly distinguished from `variation-present` above where the editor only means to indicate that a word is present in a witness, but has not been added through a conscious correction.

#### Rules

1. It **MUST** have `lem`.
2. The `lem` **MAY** be empty.
  * In this case, an editor may not want to include the `correction-addition` in the critical text, but still indicate that the correction has been made in a witness. This is an instance where the `correction-addition` is also taking on the form parallel to that of a `variation-present`. In such a case the additional `varation-present` type can be inferred from the empty lemma.
3. The `rdg` **SHOULD** have `@type="correction-addition"`.
4. The `rdg` **MUST** contain an `add` element.
5. The `rdg` **MUST NOT** contain any content outside of the `add` element.
5. The `add` **MUST** have a `@place` attribute.
6. The `add` **MAY** have a `@hand` attribute.

#### Examples

##### Example 1

``` xml
<app>
  <lem>fides</lem>
  <rdg wit="#A" type="correction-addition">
    <add place="margin-left">fides</add>
  </rdg>
</app>
```

> 10 fides] *add. in mg.* *A*

##### Example 2

A scribe wrote "in nomine Patri et Spiritus Sancti", but a later hand (#L1) realized the mistake and added the missing phrase "Filii et" above the line.

```xml
in nomine Patri et
<app>
  <lem>Filii et</lem>
    <rdg wit="#L" type="correction-addition">
      <add place="above-line" hand="#L1">Filii et</add>
  </rdg>
</app>
Spiritus Sancti.
```

> Filii et] *add. s.l.* *L1*

> Filii et] *add. s.l. alia manu* *L*

> Filli et] *om.* *L* *(corr. L1)*

### correction-deletion

#### Definition

This indicates that a scribe (either the original or a later scribe) has realized that a word or phrase is erroneously present in the text and subsequently deleted it. 

#### Rules

1. It **MUST** have a `lem`.
2. The `lem` **MAY** be empty.
  * In most cases, the `lem` will be empty, since it is normal to note a deletion of word that does not appear in the critical text. However, an editor might want to include a word in the critical text that has been deleted in one or more witnesses. In this case, the `lem` **MUST NOT** be empty.
3. The `rdg` **SHOULD** have `@type="correction-deletion"`.
4. The `rdg` **MUST** contain an `del` element.
5. The `rdg` **MUST NOT** contain any content outside of the `del` element.
5. The `del` **MAY** have a `@place` attribute.
  * generally, it is assumed that a deletiong happines `in-line`. A deletion of something not `in-line` should generally be treated as a `correction-cancellation`, [see below](#correction-cancellation).
6. The `del` **SHOULD** have a `@rend` attribute.
6. The `del` **MAY** have a `@hand` attribute.

#### Examples
 
##### Example 1

``` xml
fides
<app>
  <lem n="fides"/>
  <rdg wit="#A" type="correction-deletion">
    <del>non</del>
  </rdg>
</app>
est
```

> 10 non *post* fides *del.* *A*
 
> 10 fides] non *scr. sed del.* *A*

##### Example 2

``` xml
sicut
<app>
  <lem>dicit</lem>
  <rdg wit="#A" type="correction-deletion">
    <del>dicit</del>
  </rdg>
</app>
Aristoteles
```

> 10 sicut] dicit *scr. sed del.* *S*
 
> 10 dicit *post* sicut *del.* *S*

### correction-substitution

#### Definition

This indicates that a scribe (either the original or a later scribe) wants to correct one word or phrase with another.

#### Rules

1. It **MUST** have a `lem`.
2. The `lem` **MAY** be empty.
  * In most cases the lemma would be included, but the editor might want to include the substitution made in the witness without including either of the possible readings in the edited text.
3. It **MUST** have a `rdg`.
4. `rdg` **MUST** have a `@wit`.
5. `rdg` **SHOULD** have `@type="correction-substitution"`.
6. `rdg` **MUST** contain a `subst` element as a direct child.
7. The `subst` element **MUST** contain a `del` and a `add` element.
8. `subst` **MUST NOT** contain any nodes other than the `del` and `add` elements.
9. The smallest unit of substitution **MUST** be a word.
10. The `add` **MAY** have a `@place`.
11. The `del` **MAY** have a `@rend`.
12. A `@hand` attribute **MAY** be placed on either the `subst` element or on the `add` and `del` elements. 

#### Extended Commentary

A possible argument against rule 9 is that an editor might desire to produce the following rendering for a correction to a particular word.

> insidia N (s *add.* *N1*)

However, we find this rendering ambiguous and therefore somewhat problematic. 

Does this mean N1 has added the letter "s" after "insidia" or to the word itself? 

While in the case of "s", it is probably obvious to an editor that "s" is not a word by itself and therefore the editor probably meant that "s" was added to "insidia". 

However, what if the added letter were "a"? Then it would be much less clear. 

Likewise, scholastic texts use a lot of variables, so it is possible that a scribe could have been adding "b" or "c" as a separate word or character, and did not mean to add a new letter to the preceding word. 
                
So for example, the following would be very ambiguous in a sequence where variables a, b, c, d, and e were in use: 
                
> insidia] *N* (e *add.* *N2*)

Does this mean that the correction was to "insidiae" or "insidia e"?
 
Thus we think it would be best to handle this with a `correction-substitution`, which could render to:
                
> insidias] *corr. ex* insidia *alia manu* *N* 
 
It is true that with something like 

```xml
<app>
  <lem>insidias</lem>
  <rdg wit="#N" type="correction-substitution">
    <subst>
      <del>insidia</del>
      <add>insidias</add>
    <subst>
  </rdg>
</app>
```  

we certainly sacrifice some specificity about how the correction was made (namely, by simply adding an "s" rather that crossing out the whole word and replacing it with the new word). However, we gain considerable clarity about the meaning of the correction.
      
**In sum**: The problem we face with the language of "addition, correction, substitution" etc. is that it becomes tempting to record two distinct types of phenomena: 1) the ultimate meaning of the correction and 2) the material way in which that correction was made. 
                
In the example above the addition of "s" to "insidias" is, in meaning, really a `correction-substitution`, even though the way that the correction was materially made makes it look like a simple `correction-addition`. 

By adding "s" the scribe, did not meant to simply add an "s", but rather meant to replace the word "insidia" with "insidias".
                
In its rendering, it looks equivalent to the addition of a missing word or letter, but the effect or meaning of the correction is to substitute one word with another.
                
In our view, complex detail about a how correction was precisely made is best left recorded in a `@witDetail` and in an accompanying diplomatic transcription of the witness.

#### Examples

##### Example 1

``` xml
<app>
  <lem>fidem</lem>
  <rdg wit="#A" type="correction-substitution">
    <subst>
      <del>spem</del>
      <add>fidem</add>
    </subst>
</app>
```

> 10 fidem] *corr. ex* spem *A*

##### Example 2
``` xml
<app>
  <lem>fides</lem>
  <rdg wit="#A" type="correction-substitution">
    <subst>
      <del>fidem</del>
      <add hand="#A1" place="margin-right">fides</add>
    </subst>
  </rdg>
</app>
est
```

> 10 fides] fidem *A* (*ante corr.* *A1*)

> 10 fides] *corr. ex* fidem *in mg.* *A1*
 
> 10 fides] *corr. ex* fidem *in alia manu* *A*

##### Example 3

``` xml
<app>
  <lem>insidias</lem>
  <rdg wit="#N" type="correction-substitution">
    <subst hand="#N1">
      <del>insidia</del>
      <add>insidias</add>
    <subst>
  </rdg>
</app>
```

> insidias] *corr. ex* insidia *alia manu* *N* 

> insidias] *corr. ex* insidia *N¹*

### correction-transposition

#### Definition

A `correction-transposition` is a special kind of `correction-substitution` and should follow the same rules and basic encoding pattern of a `correction-substitution`. The designation `correction-transposition` only serves to further specify the kind of substitution taking place.

#### Rules

1. See the above rules for `correction-substitution`
2. the `del` element within the `rdg/subst` element **MAY** take `seg` elements with `@n` attributes indicating the boundaries of the transposed words or phrases. 
  - The `@n` indicates the relative order of the segments *after* the transposition has taken place.
  - This is required for a more complicated rendering such as "sanctus *ante* spiritus *transp.* A"

#### Examples

##### Example 1

A correction that simply inverts the order of two words.

``` xml
<app>
  <lem>spiritus sanctus</lem>
  <rdg wit="#A" type="correction-transposition">
    <subst>
      <del><seg n="2">sanctus</seg> <seg n="1">spiritus</seg></del>
      <add>spiritus sanctus</add>
    </subst>
  </rdg>
</app>
```

> sanctus *ante* spiritus *transp.* A

##### Example 2

A correction where a word is moved more than a single word.

``` xml
<app>
  <lem>et spiritus sanctus</lem>
  <rdg wit="#A" type="correction-transposition">
    <subst>
      <del><seg n="2">spiritus sanctus<seg/> <seg n="1">et</seg></del>
      <add>et spiritus sanctus</add>
    </subst>
  </rdg>
</app>
```

> et *ante* spiritus sanctus *transp.* A

### `correction-cancellation`

#### Definition

*note: correction-cancellation is a particularly complicated variation type and should be considered very likely to recieve change and alteration in the next release of the guidelines*

A cancellation is a correction of a correction. This gives us nine theoretical types (resulting from the combination of `correction-addition`, `correction-deletion`, and `correction-substitution`) following the logic of the corrections described above. Thus a correction of a correction would simply be a correction wrapped in a parent correction. Some of those nine permutations are not materially possible, and thus we support the following 4 types of *corrections of corrections* :

1. deletion-of-addition
2. deletion-of-deletion
3. deletion-of-substitution
4. substitution-of-addition 
  * similar to `deletion-of-addition`, but the cancellation also adds a new word in the place of the now deleted addition.

#### Rules

1. `rdg` **MUST** take `@type=<value-of-cancellation-type>`
2. children of `rdg` must follow the logic of one of 4 accepted patterns described in the examples below.

#### Examples


1. `deletion-of-addition` 

``` xml
<rdg wit="#A" type="deletion-of-addition">
  <del>
    <add place="above-line">fides</add>
  </del>
</rdg>
```

2. `deletion-of-deletion`

``` xml
<rdg wit="#A" type="deletion-of-deletion">
  <del>
    <del>fides</del>
  </del>
</rdg>
```

3. `deletion-of-substitution`

``` xml
<rdg wit="#A" wit="deletion-of-substitution">
  <del>
    <subst>
      <add>fidem</add>
      <del>fides</del>
    </subst>
  </del>
</rdg>

```
4. `substitution-of-addition`

``` xml
<rdg wit="#A" type="substitution-of-addition">
  <subst>
    <del>
      <add>spes</add>
    </del>
    <add>fides</add>
  </subst>
</rdg>
```

## conjecture

### Description

These types refer to the situation where a (current or previous) editor suggests or introduces an emendation to the text that is not supported by the textual tradition.

Terminologically, one might consider an improvement that is adopted in the text (i.e. it is placed in the `<lem>` element) to be an *emendation*, while an improvement that is merely suggested but not adopted in the text (and therefore put in a `<rdg>` element) can be referred to as a *conjecture*. To maintain a higher degree of flexibility and reduce the amount of necessary types, we adopt the term *conjecture* in the typology to signify both emendations and conjectures in the more restricted sense.

General rules for conjectures:

1. `@resp` **MAY** be used to indicate an internal editor responsible for suggesting or including the conjecture.
2. `@source` **MAY** be used to indicate an external scholar who has suggested the conjecture.

Notice that both of these attributes are pointers. If they do not point to an existing `xml:id`, the string after `#` will generally be used in processing.

### conjecture-supplied

#### Definition

According to the the judgement of the editor, an expression is missing from the transmitted text. Ideas for improvement of the text may then either be added to the edited text itself or indicated in an apparatus note.

#### Rules

1. Either `lem` or a `rdg` **MUST** contain `@type="conjecture-supplied"`.
2. The `lem` or `rdg` element **MUST** contain a `supplied` element as its first child.
3. The `supplied` element **MUST** contain the added text.

#### Examples

##### Example 1

An emendation is introduced into the edited text. The text is absent from the textual tradition but added by an editor.

``` xml
Utrum fides semper
<app>
  <lem type="conjecture-supplied" resp="#Michael">
    <supplied>sit</supplied>
  </lem>
  <rdg type="variation-absent" wit="#P #V #L"/>
</app>
acquisita
```

> 10 *post* semper sit *suppl.*, *om*. PVL

##### Example 2

A scholar has suggested one conjecture for the passage, but the editor suggests another conjecture, which is adopted.

``` xml
Utrum fides semper
<app>
  <lem type="conjecture-supplied" resp="#John">
    <supplied>sit</supplied>
  </lem
  <rdg type="absent" wit="#P #V #L"/>
  <rdg type="conjecture-supplied" source="#James">
    <supplied>erit</supplied>
  </rdg>
</app>
acquisita
```

> 10 *post* semper *suppl.* sit John, *om.* PVL, erit *conj.* James

##### Example 3

The editor suspects that a word is missing from the text, but is not certain enough to add it to the text. This might as well have been another scholar, and in that case, the `@source` should be indicated

``` xml
Utrum fides
<app>
  <lem n="fides"/>
  <rdg type="absent" wit="#P #V #L"/>
  <rdg type="conjecture-supplied" source="#other-scholar">
    <supplied>semper</supplied>
  </rdg>
</app>
sit
```

> 10 semper *post* fides *conj.*

Alternative:

> 10 *num* semper *post* fides *scribendum*?

### conjecture-removed

#### Definition

A word or phrase is transmitted in some or all of the textual tradition, but the editor or another scholar has suspected that it does not belong in the text and suggests it be removed.

#### Rules

1. Either `lem` or a `rdg` **MUST** contain `@type="conjecture-removed"`.
2. The `lem` or `rdg` element **MUST** contain a `surplus` element as its first child.
3. The `surplus` element **MUST** contain the removed text.

#### Examples

##### Example 1

Simple example with a unanimous transmission. The editor removes the word from the edited text.

``` xml
ut
<app>
  <lem type="conjecture-removed"><surplus>cum</surplus></lem>
  <rdg wit="#A #B #C">cum</rdg>
</app>
dicit Aristoteles
```

If the printed text reads "ut [cum] dicit Aristoteles":

> 10 [cum] ] *del.*, cum *in textu* ABC

Alternative, if the printed text reads "ut dicit Aristoteles":

> 10 cum *post* ut *del.*, cum *in textu* ABC

##### Example 2

Another scholar has suggested that a word be removed, but it is supported by the textual tradition and the editor chooses to keep it in the text.

``` xml
ut
<app>
  <lem wit="#A #B #C">cum</lem>
  <rdg src="#James" type="conjecture-removed"><surplus>cum</surplus></rdg>
</app>
dicit Aristoteles
```

> 10 cum ] ABC, *del.* James

### `conjecture-corrected`

#### Definition

Parts of all of the textual tradition supports one reading, but an editor or scholar suggests an alternative reading in its place.

#### Rules

1. Either `lem` or a `rdg` **MUST** contain `@type="conjecture-corrected"`.
2. The `lem` or `rdg` element **MUST** contain a `corr` element as its first child.
3. The `corr` element **MUST** contain the corrected text.

#### Examples

##### Example 1

The tradition is unambiguous, but the editor deems it useless and prints an emendation in the text.

``` xml
Utrum fides
<app>
  <lem type="conjecture-corrected">sit</lem>
  <rdg wit="#P #V #L"><corr>servus</corr></rdg>
</app>
acquisita
```

> 10 sit ] servus PVL

The note might be more explict:

> 10 sit ] *scr.*, servus PVL

##### Example 2

The tradition is mixed and the editor has a conjecture that he does not dare put in the edited text, so he chooses the most appropriate of the transmitted readings (in light of his general editorial principles), which is also supported by another scholar.

``` xml
Utrum fides
<app>
  <lem wit="#C" source="#John">semper</lem>
  <rdg wit="#A #B">servus</rdg>
  <rdg resp="#Ed" type="conjecture-corrected"><corr>sit</corr></rdg>
</app>
acquisita
```

> 10 semper ] C John, servus AB, sit *conj.*

## connected apparatus entries

### Overlapping Elements

While parallel-segmentation encoding comes with a number of advantages, an editor invariably faces the challenge of overlapping lemmas and XML's prohibition against cross-nesting elements. Here we offer guidelines of how to handles such cases. 

#### Rules

1. all connected `apps` **MUST** have an `@xml:id` 
2. The first `app` **MUST** contain a `@next` pointing to the next connected `app` element.
3. the last `app` **MUST** contain a `@prev` pointing to the last connected `app`

#### Examples

In this complex example, we imagine an omission in witness A that begins with the last word of paragraph 1 and continues into paragraph 2. But the last word of paragraph 1 is also the lemma for a variant between witness B and C.

```xml
<p xml:id="paragraph1">lorum 
  <app xml:id="app1" next="#app2">
    <lem>
      <app>
        <lem wit="#C">ipsum</lem>
        <rdg wit="#B">ipsam</rdg>
      </app>
    </lem>
    <rdg wit="#A" type="variation-absent" cause="homeoteleuton"/>
  </app>
</p>
<p xml:id="paragraph2">
  <app xml:id="app2" prev="#app1">
    <lem>this is the text</lem>
    <rdg wit="#A" type="variation-absent" cause="homeoteleuton"/>
  </app> 
  of the second paragraph. The first part of which continues the homeoteleuton started in the previous paragraph
</p> 
```

A processor is expected to handle the above example as follows. 

Whenever an `app` is encountered with a `@next` attribute, the processor should begin looping through each connected `app` until it reaches an `app` that no longer has a `@next` attribute but only a `@prev` attribute. Throughout this loop it should concatenate the `lem` from each `app` and then concatenate the available readings, matching `rdg` by the value of the `@wit` attribute. (In complicated cases, it is advisable to give each witness a separate `rdg` to make the connection of `rdg` elements as easy as possible.) Once having looped through all connected apps. The processor should ignore all subsequent apps that have an `@prev` attribute because these have presumably been dealt with in the previous loop.

A processor can also choose to create this loop in the opposite direction, first ignoring all `apps` with a `@next` attribute until it comes to an `app` that only has a `@prev` attribute. It can then loop up to each connected app until it reaches an `app` without a `@prev` attribute.

### Generic App Connections

#### Description

Sometimes it is desirable to connect readings even if an editor is not trying to avoid overlapping lemmas. The most likely scenario for this is when it is ideal for an `app` with a lemma and a second `app` with a blank lemma to be rendered together. Despite the different motivation, this should be handled in the same way as the method used to deal with overlapping lemmas.

#### Examples

```xml
<app xml:id="app1" next="#app2">
  <lem>ars</lem>
  <rdg wit="#E" next="#app2">ars artium</rdg>
  <rdg wit="#Y #H" type="variation-present">ars artium et scientia scientiarum</rdg>
</app>
<app xml:id="app2" prev="#app1">
  <lem n="ars"/>
  <rdg wit="#E" type="correction-addition">
    <add place="above-line" hand="#E1">et scientia scientiarum</add>
  </rdg>
</app>
```

This could render as: 

>10 ars] ars artium E + et scientia scientiarum *add. interl.* E1 ars artium et scientia scientiarum Y H

```xml
non
<app xml:id="app1" next="#app2">
  <lem n="non"/>
  <rdg wit="#E" type="variation-present">ars</rdg>
  <rdg wit="#Y #H" type="variation-present">ars artium</rdg>
</app>
<app xml:id="app2" prev="#app1">
  <rdg wit="#E" type="correction-addition">
    <add place="above-line" hand="#E1">artium</add>
  <rdg>
```

This could be rendered as: 

>10 non] ars *in textu* E + artium *add. interl.* E1 ars artium *in textu* Y H

## Manual

### Description

Because we recognize there may be cases where an editor feels that a reading is so unique that it fits into no existing typology, we support the use of a `rdg@type="manual"`, despite highly discouraging its use. 

The use of the `manual` type should be avoided at all costs, and in subsequent versions of the lbp schema we aim to identify all instances of `manual` and either explain how these cases fit into the existing typology or expand the typology to encompass this instance.

### Rules

1. the `rdg` must have an `@type="manual`.
2. The rdg should include precisely what the editors hope will appear after the lemma
3. The description of the variant (normally the part of the reading placed in italics) should be wrapped in an `desc` element
4. The sigla should be wrapped in a `wit` element.

### Examples

*Note: for both of the examples below, there are appropriate type categorizes for these rdg types, and thus there is no need for a manual override here. These are provided just for the sake of example.*

```xml
<app>
  <lem>fides</lem>
  <rdg wit="#V" type="manual">
    fides <desc>corr. interl. ex</desc> fide <wit>V</wit>
  </rdg>
</app>
```

This would likely be redered as: 

> 10 fides] fides *corr. interl. ex* fide V

```xml
<app>
  <lem>fides</lem>
  <rdg wit="#V" type="manual">
    <desc>om.</desc> <wit>V</wit>
  </rdg>
</app>
```

This would likely be rendered as: 

> 10 fides] *om.* V

# Apparatus Fontium

## Citation

### Description

The `cit` element creates an entry in the apparatus fontium. The `bibl` element can be used to write the target of the reference or quotation directly into the encoded document. The `note` tag can be used for writing any arbitrary note about the reference or quotation.

### Rules

1. `cit` **MUST** contain either a `quote` or `ref`. 
2. `cit` **MAY** contain a `bibl` element.
3. `cit` **MAY** contain a `note` element.

### Examples

``` xml
<cit>
  <!-- May contain either a `quote` or `ref` element. 
       About those, see below -->
</cit>
```

A `cit` element that has a `quote` and includes `bibl` and `note`:

``` xml
<cit>
  <quote>In the beginning God created a world</quote>
  <bibl>Genesis 1:1</bibl>
  <note>And so it begins...</note>
</cit>
```

## Quotation

### Description

A quote, following the TEI guidelines, is intended to identify anything that is considered a quotation of another source or test. The value of quotation is most often rendered within quotation marks, i.e. "This is a quote".

### Rules

1. `quote` **MAY** stand alone, i.e. it **MAY** not be a child of an `cit` element and thus not appear in the *apparatus fontium*
2. `quote` **MAY** be the immediate child of a `cit` element thus appear in the *apparatus fontium*
3. `quote` **MAY** contain `seg` elements.
  * This would be used to indicate segments of a quote that are interrupted by an *inquit*. 
4. `quote` **MAY** take an `@type` attribute, the values of which can be:
  * direct (this is the same as simply not declaring an @type)
  * paraphrase 

### Examples

The following example is not expected to generate an apparatus fontium entry:

```xml 
<quote>In principio</quote> etc.
``` 

The following example is expected to generate an *apparatus fontium* entry

``` xml
<cit>
  <quote xml:id="quote1" ana="#gen1_1--gen2_1">In principio creavit Deus caelum</quote>
  <note>I can't find this.</note>
</cit>
```

A `cit` element with just a `quote` tag, but where the quote consists of two quote segments and an *inquit*:

``` xml
<cit>
  <quote>
    <seg type="qs">lorum</seg>, 
    inquit, 
    <seg type="qs">ipsum</seg>
  <bibl>Sample text</bibl>
<cit>
```

The following is another, equivalent way, of doing the same thing:

```xml
<cit>
  <quote 
    xml:id="quote-part-1" 
    next="#quote-part-2" 
    ana="#gen1_1" 
    n="1">
  In principio creavit Deus caelum
  </quote>
  <bibl>Genesis 1_1</bibl>
</cit> 
scilicet angelicam naturam, 
sed adhuc informem, ut quibusdam placet: 
<quote 
  xml:id="quote-part-2" 
  prev="#quote-part-1" 
  n="2">
et terram
</quote>
```

## Reference

### Description

A reference, following the TEI guidelines, is intended to identify anything that is considered a reference to another source. 

### Rules

1. `ref` **MAY** stand alone, i.e. it **MAY** not be a child of an `cit` element and thus not appear in the *apparatus fontium*
2. `ref` **MAY** be the immediate child of a `cit` element and thus appear in the *apparatus fontium*.
3. `ref` **MAY** contain a `title`, `name`, and `num` element
4. `ref` **MAY** contain a `seg@type="incipit"` for references that include a incipit for the referenced section.

### Examples

The following example is not expected to generate an *apparatus fontium*

```xml
<ref corresp="#quote-id">
Ockham dicit in prologo
</ref>
```

The following example is expected to generate an *apparatus fontium* entry

``` xml
<cit>
  <ref xml:id="ref1" ana="#gen1_1">
    <title ref="#gen">Genesis</title> 
    1:1
  </ref>
  <bibl>Genesis 1:1</bibl>
  <note></note>
</cit>
```

# Milestones

## cb

### Rules

- `@ed` **MUST** indicate the source text in which the column break occurs.
- `@n` **MUST** indicate the column, e.g. a
- `@facs` **MAY** be present. If it contains a "hash" pointer, it is expected to refer to a surface or zone in the the `facsimile` element. If it does not contain a "hash" it is expected to be the last part of the IIIF image canvas id. See the [Facsimile](#facsimile) section above.

### Examples

```xml
<cb ed="#W" n="a"/>
```

### pb

### Rules

- `@ed` **MUST** indicate the source text in which the page break occurs.
- `@n` **MUST** indicate the page or folio number (determined by `@type`). In the case of `type="folio"`, the side of the folio is delimited by a `-`. 
- `@facs` **MAY** be present. If it contains a "hash" pointer, it is expected to refer to a surface or zone in the the `facsimile` element. If it does not contain a "hash" it is expected to be the last part of the IIIF image canvas id. See the [Facsimile](#facsimile) section above.
- `@type` **MAY**: Indicate the type of numbering as either paginated ("page") or foliated ("folio"). If none is given, `type="folio"` is assumed.

### Examples

Folio break example: 

@type=
* folio (default)
* page

page break in folio format

```xml 
<pb ed="#W" n="15-b"/>
```

page break in paged format

```xml
<pb ed="#W" n="15" type="page" />
```
