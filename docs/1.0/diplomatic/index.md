---
layout: page
title:  "Lombard Press Schema 1.0.0 - Diplomatic Transcription Guidelines"
date:   2016-07-15
categories: schema
---
# LombardPress Diplomatic Transcription Guidelines

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
  * [revisionDesc](#revisiondesc)
  * [encodingDesc](#encodingdesc)
* [Text](#text)
  * [Front](#front)
* [Editorial Emendations](#editorial-emendations)
  * [Expansions](#expansions)
  * [Corrections](#corrections)
  * [Normalizations](#normalizations)
* [Unclear and Illegible Readings](#unclear-and-illegibile-readings)
* [Scribal Corrections](#scribal-corrections)
* [References and Quotations](references-and-quotations)
* [Punctuation](#punctuation)
* [Milestones](#milestones)
* [Marginalia](#marginalia)

# Preamble

The goal of the LombardPress diplomatic transcription specification is to offer a set of guidelines for the markup of medieval Sentences Commentary (and other genres of texts that may find the specification useful) that conform as much as possible to existing standards. In this case of diplomatic transcriptions, this means following as closely as possible the EpiDoc specification. In most cases, we aim only to expand the EpiDoc specifications and offer a detailed list of available attributes and attribute values. Where specifications are not stated, the EpiDoc guidelines should be followed. Where the EpiDoc does not state a specification, the more general TEI specification should be followed.

# `teiHeader`

## `fileDesc`

### Description

The `fileDesc` contains the full bibliographic description of an electronic file.

### Rules

1. `fileDesc` **MUST** contain `titleStmt`.
2. `fileDesc` **MUST** contain `editionStmt`.
3. `fileDesc` **MUST** contain `publicationStmt`.


### `titleStmt`

#### Description

The `titleStmt` determines the bibliographical information of the encoded file.

#### Rules

1. `titleStmt` **MUST** have a title.
2. `titleStmt` **MUST** have an author.
3. `titleStmt` **SHOULD** have an editor.
  * [reconsider this?]
4. `titleStmt` **MAY** have `responseStmt`.

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


### `editionStmt`

#### Description

#### Rules

1. `editionStmt` **MUST** contain an `edition` element.
2. `edition@n` **MUST** be `n=X.X.X-dev`; usually, when starting a new document it should be listed as `n=0.0.0-dev`.
3. `edition` **MUST** contain a `date` element.
4. The `date` that is the child of `edition` **MUST** include a machine-formatted `@when` attribute corresponding to the date in the text node.
5. `edition` **SHOULD NOT** contain any other children besides the date.


#### Examples

```xml
<editionStmt>
  <edition n="0.0.0-dev">
    <date when="2016-06-18">June 18, 2016</date>
  </edition>
</editionStmt>
```

### `publicationStmt`

#### Description

#### Rules

1. `publicationStmt` **MUST** contain an `authority` element.
  * We suggest that `authority` states the entity that makes the creation of the current document possible or the context where it belongs. See example below.
2. The `authority` tag **MAY** contain a `ref` to provide an external link to the authority entity.
3. **MUST** contain `availability`.
4. `availability` **MUST** containt `@status`.
5. `availability` **SHOUL** contain a `p` describing the license under which the edition is published.

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

## `sourceDesc`

### Description

### Rules

1. `SourceDesc` **MUST** contain either a `listWit` or `listBibl` not both.
2. `listWit` **MUST** contain only one `wit`.
3. `listBibl` **MUST** contain only one `bibl`.
4. `witness` **MUST** have a `@xml:id`.
5. `witness` **SHOULD** have a `n` giving a short id of the witness.
  * The value of `@n` **SHOULD** correspond to the short id for the manuscript in the SCTA database. If the value is not known, leave it out. It will be added later during processing.
6. For adding `handDesc`, follow TEI guidelines.

### Examples

#### Example 1

``` xml
<listWit>
  <witness xml:id="P" n="bnf15705">Paris, Lat 15705</witness>
</listWit>
```

#### Example 2

``` xml
<listBibl>
  <bibl></bibl>
	<!-- Info about id's for the `@source` goes here-->
</listBibl>
```

#### Example 3

``` xml
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
  </witness>
</listWit>
```

## `revisionDesc`

### Description

The `revisionDesc` contains a description of the current and previous versions of the current edition.
The individual editor would usually not be responsible for maintaining the `revisionDesc`, as it should (ideally) be generated as part of the publication workflow.


### Rules

1. `revisionDesc` **SHOULD** be stated.
2. `revisionDesc` **MUST** contain `@status`
3. `revisionDesc` **MUST** contain `listChange`
4. `listChange` **MUST** contain at least one `change`
5. `change` **MUST** contain `@when`.
6. `change` **MUST** contain `@status`. Possible values of the attribute are:
  * private-draft
  * public-draft (alias: draft)
  * out-for-review
  * peer-reviewed (alias: published)
7. `change` **MUST** contain `@n`.
8. `change` **MUST** contain either `@corresp` pointing to a description of the change or a `p` describing the change.

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

## `encodingDesc`

### Description

In a diplomatic edition the `encodingDesc` only serves to declare which schema the edition should be validated against.

### Rules

1. `encodingDesc` **MUST** be stated.
2. `encodingDesc` **MAY NOT** contain `variantEncoding`.
3. `encodingDesc` **MUST** contain a `schemaRef`.
4. `schemaRef` **MUST** contain a `target` that points to the URL of the LBP schema.
5. `schemaRef` **MUST** contain an `@n` pointing to the version number of the LBP schema.
6. `encodingDesc` **MAY** take an `editorialDecl` that contains a `p` with a prose description of the guidelines followed in the preparation of this edition.

NOTE: The rules concerning the `schemaRef` are subject to revision based on the exact implementation in the TEI schema.

### Examples

```xml
<encodingDesc>
  <schemaRef
    n="lbp-diplomatic-1.0.0"
    target="https://raw.githubusercontent.com/lombardpress/lombardpress-schema/master/src/1.0/diplomatic.rng"
    type="diplomatic">
  </schemaRef>
  <editorialDecl>
    <p>Encoding of this text has followed the recommendations of the LombardPress 1.0.0 guidelines for a diplomatic edition</p>
  </editorialDecl>
</encodingDesc>
```

# text

## Description

`text` is the main wrapper of the edition and sibling to the `teiHeader`

## Rules

* `text` **MUST** take an `@type` attribute the value of which is "diplomatic"
  - the possible values for `text@type` are "critical", "diplomatic", and "translation"
* `text` **SHOULD** take an `@xml:lang` attribute indicating the dominant language of the edition, usually `la` for "latin"

## front

### Description

`front` is used to make prefatory declarations about the text. For now that only includes the starting location of the text in the witness.

### Rules

* `front` **MUST** take a `div` with the `xml:id="starts-on"`
  - The content of this div should only be `pb` and `cb` indicating the page and column on which the text begins in the witness of the edition.

### Examples

```xml
<front>
  <div xml:id="starts-on">
    <pb ed="#V" n="5-r" facs="V5r"/><cb ed="#V" n="b"/> <!-- V5rb -->
  </div>
</front>
```

## body

## div

## head

## p


# Editorial Emendations

## Expansions

### Description

If it is not a priority to encode every abbreviation and expansion, the editor might want to indicate several possible expansions in cases of doubt.

See the examples for the relation between `ex` and `expan`. Generally `ex` only gives the content that is added by the editor while `expan` gives the whole word, including the characters that constitute the abbreviation.

### Rules

Option 2 is preferred in cases dealing with characters glyphs that stand for an entire word.

### Examples

Options 1

``` xml
<expan>
  <abbr>Aug</abbr>
  <choice>
    <ex cert="high">ustinus</ex>
    <ex cert="low">usta</ex>
  </choice>
</expan>
```

Option 2

``` xml
<choice>
  <abbr>Aug</abbr>
  <choice>
    <expan cert="high">Augustinus</expan>
    <expan cert="low">Augusta</expan>
  </choice>
</choice>
```

``` xml
<choice>
  <abbr>sᵈ</abbr>
  <expan>sicud</expan>
</choice>
```

``` xml
<choice>
  <abbr>sᵈ</abbr>
  <expan>
    <choice>
      <orig>sicud</orig>
      <reg>sicut</reg>
    </choice>
  </expan>
</choice>
```


## Corrections

### Description

### Rules

### Examples

```xml
<choice>
  <sic></sic>
  <corr></corr>
</choice>
```

## Normalizations

### Description

### Rules

### Examples

```xml
<choice>
  <orig></orig>
  <reg></reg>
</choice>
```

# Unclear and Illegible Readings

## Description

The situation where the editor has difficulties reading the text, it might either be caused by a physical damage to the manuscript or to the eidtor's inability to interpret the text although it is perfectly visible on the page. The difference between those two situations is indicated with the `@reason` tag.

If the editor has a suggestion for a reading, the `unclear` element is used, otherwise the `gap` is used.

## Rules

1. `unclear` and `gap` **MAY** contain `@reason` to indicate the reason for the difficult reading. The possible values are:
  * `difficult` (default, assumed when nothing is stated)
  * `damage` (referring to a physical damage of the manuscript)
  * `reproduction` (referring to the quality of the reproduction)
2. Two or more `unclear` elements **MAY** be wrapped in a `choice` element to indicate any number of possible but mutually exclusive suggestions.
3. In the case of several suggestions, `unclear` **SHOULD** contain `@cert` to indicate the relative certainty of the suggestions. Possible values are ??? [TODO: values, here?]
4. In the case of several suggestions, the editor **SHOULD** put the suggestion that she deems most likely at the top of the list.
5. `gap` **MUST** contain `@quantity` and `@unit` indicating the extent of the gap. The values of `@unit` are given in the appendix. [TODO: check the reference and the values.]
6. `unclear` **MAY** contain `note` for discussing the difficulty.
7. `choice` **MAY** contain `note` for discussing the different possible suggestions.

## Examples

Simple case where the editor has a suggestion:

``` xml
<unclear>suggestion</unclear>
```

Simple case where the editor has no suggestion:
``` xml
<gap extent="5" unit="characters"/>
```

In both of the above examples, the `@reason` is assumed to be *difficult*. If the problem is caused by a physical damage, it should be indicated like so:

```xml
<unclear reason="damage">suggestion</unclear>
<gap reason="damage" extent="5" unit="characters"/>
```


A case where multiple possibilities are noted could look as follows. The `@reason` is assumed to hold for all sibling nodes as the difficulties have the same cause.

``` xml
<choice>
  <unclear cert="high" reason="damage">scilicet</unclear>
  <unclear cert="mid">sicud</unclear>
  <unclear cert="low">sed</unclear>
</choice>
```

A case where multiple possibilities and the `note` is used:

```xml
<choice>
  <unclear cert="high" reason="damage">scilicet
     <note>If what looks like a descender is a blotch</note>
  </unclear>
  <unclear>sicud</unclear>
  <note>I prefer the second because ...</note>
</choice>
```

Situation where the editor has no suggestion for a difficult reading.

```xml
  <unclear reason="damage">Fides et spes et caritas</unclear>
 <gap reason="damage" quantity="5" unit="word"/>

  <gap reason="difficult" quantity="5" unit="word"/>

```

# Scribal Corrections

## add

``` xml
<add place="above-line" hand="#N1">fides</add>
```

## del

Possible values of `@rend`:
* erasure
* expunctuate (alias: expunctuated)
* underline
* strike-through (alias: strikethrough, strikeout)
* black-out (alias: blackout)
* vacat
* [Combinations are always possible, e.g. `rend="strikethrough vacat"`]

``` xml
<del rend="erasure" hand="#N1">fides</del>
```

## subst

### Description

### Rules
Possible values of `@rend`:
* erasure
* expunctuate (alias: expunctuated)
* underline
* overwrite
* strike-through (alias: strikethrough, strikeout)
* blackout (alias: black-out)
* vacat
* [Combinations are always possible, e.g. `rend="strikethrough vacat"`]

### Examples

```xml
<subst hand="#N1">
  <del rend="strikethrough">fides</del>
  <add place="margin-right">spes</add>
</subst>
```

```xml
<subst>
  <del rend="strikethrough" hand="#N1">fides</del>
  <add place="margin-right" hand="#N2">spes</add>
</subst>
```

## `seg@type=correction`

### Description

`seg@type` correction is used to wrap word that is being corrected through an addition, deletion, or substitution of only part of the word.

### Rules



### Examples

``` xml
<seg type="correction">
carit
  <subst>
    <del>as</del>
    <add>atis</add>
  </subst>
  <add place="above-line">m</add>
</seg>

```

# References and Quotations

References and quotations are simply marked `ref` and `quote` elements.

## References


### Description

Reference is used when the author makes an internal or external reference. The whole reference to the target may contain several elements, which would usually be `title` and `name`, which we support here.

### Rules

1. `ref` **MAY** contain `name` to indicate the author of the referenced work.
2. `ref` **MAY** contain `title` to indicate the title of the referenced work.

### examples

```xml
Ut dicit <ref><name>Augustinus</name> in <title>De civitate dei</title></ref>
```

## Quotation

### Description
Reference is used when the author makes direct quote from another text (or a different passage of his own text).


### Rules
1. **SHOULD** contain an `@xml:id`.
2. **MAY** contain an `@ana` to point to external reference targets specifying or describing the passage in question.

### Examples

Simple indication of a quote:

``` xml
Librum sic incipitur <quote>In principio Deus creavit caelum</quote> et cetera
```

Recommended indication with id:

``` xml
Librum sic incipitur
<quote xml:id="mockid-1">In principio Deus creavit caelum</quote>
et cetera
```

Use of the `ana` attribute:

``` xml
Librum sic incipitur
<quote ana="#gen1_1" xml:id="mockid-1">
  In principio Deus creavit caelum
</quote>
et cetera
```

# Punctuation

## `pc`

### Rules

For now, we recommend a small subset of the many possible punctuation marks are included by the unicode glyph. Any unicode code point can be encoded, but not all media will be able to represent the adequately, so here we include some that are in a standard font set.

Names, code points and renderings of the punctuation marks:

| Name      | Code point    | Rend  | Note    |
| ----------|:-------------:|:-----:|:--------------|
| pilcrow   | U+00B6        | ¶     |                |
| punctus   | U+002E        | .     | regular full stop |
| punctus elevatus | U+003B | ;     | regular semi colon |
| punctus medius | U+00B7   | ·     | middle dot |
| virgula   | U+002F        | /     | solidus, regular slash |
| punctus interrogativus | U+003F | ? | regular question mark |

Afficionados for medieval font encoding will find glyphs and font suggestions to satisfy many of their heart's desires at http://folk.uib.no/hnooh/mufi/

### Examples

``` xml
<pc type="pilcrow">¶</pc>
<pc type="virgula">/</pc>
<pc type="punctus">.</pc>
<pc type="punctus-elevatus">;</pc>
<pc type="punctus-interrogativus">?</pc>
<pc type="punctus-medius">·</pc>
```

# Milestones

## `lb`

``` xml

<lb n="1"/> line content word<lb n="2" break="no">break
new line content
<lb n="3"> new line content
<lb n="4"> new line content
<lb n="5"> new line content


line content word<lb n="1"/>break
new line content <lb n="2">
new line content <lb n="3">
new line content <lb n="4">
new line content <lb n="5">
```

## `cb`

### Rules
- `@ed` **MUST** indicate the source text in which the column break occurs.
- `@n` **MUST** indicate the column, e.g. a
- `@facs` JEFF TODO: describe how to add IIIF id

### Examples

```xml
<cb ed="#W" n="a"/>
```

## `pb`

### Rules
- `@ed` **MUST** indicate the source text in which the page break occurs.
- `@n` **MUST** indicate the page or folio number (determined by `@type`). In the case of `type="folio"`, the side of the folio is delimited by a `-`.
- `@corresp` JEFF TODO: describe IIIF id connection here
- `@type` **MAY**: Indicate the type of numbering as either paginated or foliated. If none is given, `type="folio"` is assumed.

### Examples

Folio break example:

@type=
* folio (default)
* page

page break in folio format

```xml
<pb ed="#W" n="15-v"/>
```

page break in paged format

```xml
<pb ed="#W" n="15" type="page" />
```

# Marginalia

## Description

## Rules

## Examples

Example where marginal note is simply in the vicinity of a paragraph or line

```xml
<p>
  <lb ed="#A"/>
  <note type="marginal-note" place="margin-right" hand="#N1">
      <lb ed="#A"/>this marginal note
      <lb ed="#A"/>is in the right margin
      <lb ed="#A"/>and spans three liens in the margin
    </note>
  The main text is here and
  <lb ed="#A"/>there is a marginal note
  <lb ed="#A"/>in the margin near
  <lb ed="#A"/>this line. And now the text continues.
</p>
```

Example of where a marginal note is made about a word or phrase in the text, such as in a gloss.

``` xml
<p>
  <lb ed="#A"/>The word
  <seg>fides
    <note type="marginal-note" place="margin-right "hand="#N1">
      <lb ed="#A"/>this is a gloss on the
      <lb ed="#A"/>word fides that spans
      <lb ed="#A"/>three lines
    </note>
  </seg>
  this is still part of the first line
  <lb ed="#A"/>more lines continue
  <lb ed="#A"/>in the margin near
  <lb ed="#A"/>this line. And now the text continues.
</p>
```

Example of where a marginal note that is best seen as a note about a quotation in the text.

``` xml
<p>
  <lb ed="#A"/>Augustine says
  <quote>the commonwealth is united by a common love
    <note type="marginal-note" place="margin-right" hand="#N1">
      <lb ed="#A"/>
      <ref>Augustine, City of God</ref>
    </note>
  </quote>
  this is still part of the first line
  <lb ed="#A"/>more lines continue
  <lb ed="#A"/>in the margin near
  <lb ed="#A"/>this line. And now the text continues.
</p>
```
