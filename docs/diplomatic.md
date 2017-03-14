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
  * [encodingDesc](#encodingdesc)
  * [revisionDesc](#revisiondesc)
* [text](#text)
  * [front](#front)
  * [body](#body)
  * [div](#div)
  * [head](#head)
  * [p](#p)
* [Editorial Emendations](#editorial-emendations)
  * [Expansions](#expansions)
  * [Corrections](#corrections)
  * [Normalizations](#normalizations)
* [Unclear and Illegible Readings](#unclear-and-illegible-readings)
* [Scribal Corrections](#scribal-corrections)
* [References and Quotations](references-and-quotations)
* [Punctuation](#punctuation)
* [Milestones](#milestones)
* [Marginalia](#marginalia)

# Preamble

The goal of the LombardPress Diplomatic Transcription specification is to offer a set of guidelines for the markup of medieval scholastic commentaries and texts that conform as much as possible to existing standards. In the case of diplomatic transcriptions, this means following as closely as possible the [EpiDoc](https://sourceforge.net/p/epidoc/wiki/Home/) specification. In most cases, we aim only to expand the EpiDoc specifications and offer a detailed list of available attributes and attribute values. Where specifications are not stated, the EpiDoc guidelines should be followed. Where EpiDoc does not state a specification, the more general [TEI](http://tei-c.org) specification should be followed.

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

1. `titleStmt` **MUST** have a `title`.
2. `titleStmt` **MUST** have an `author`.
3. `titleStmt` **SHOULD** have an `editor`.
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


### editionStmt

#### Description

`editionStmt` indicates the edition of the document within the context of its source history.

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

### publicationStmt

#### Description

`publicationStmt` indicates the authority supporting this edition (usually a sponsoring or funding research group). It should also list the license and availability of the text.

#### Rules

1. `publicationStmt` **MUST** contain an `authority` element.
  * We suggest that `authority` states the entity that makes the creation of the current document possible or the context where it belongs. See example below.
2. `authority` tag **MAY** contain a `ref` to provide an external link to the authority entity.
3. `publicationStmt` **MUST** contain `availability`.
4. `availability` **SHOULD** contain `@status`.
5. `availability` **SHOULD** contain a `p` describing the license under which the edition is published.

#### Examples

##### Example 1

``` xml
<publicationStmt>
  <authority>Scholastic Commentaries and Texts Archive Project</authority>
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

`sourceDesc` should list the witnesses and sources used to construct the edition.

#### Description

#### Rules

1. `sourceDesc` **MUST** contain either a `listWit` or `listBibl`, but NOT both.
2. `listWit` **MUST** contain only one `wit`.
3. `listBibl` **MUST** contain only one `bibl`.
4. `witness` **MUST** have a `@xml:id`.
5. `witness` **SHOULD** have a `n` giving a short id of the witness.
  * The value of `@n` **SHOULD** correspond to the short id for the manuscript or codex in the SCTA database. If the value is not known, leave it out. It will be added later during processing.
6. For adding `handDesc`, follow TEI guidelines.

#### Examples

##### Example 1

``` xml
<listWit>
  <witness xml:id="P" n="bnf15705">Paris, Lat 15705</witness>
</listWit>
```

#### Example 2

``` xml
<listBibl>
  <bibl xml:id="Q" n="quaracchi1924">Quaracchi 1924 Edition</bibl>
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

## encodingDesc

### Description

`encodingDesc` provides details about the encoding methods used in the text and the schema followed. In a diplomatic edition the `encodingDesc` only serves to declare which schema the edition should be validated against.

### Rules

1. `encodingDesc` **MUST** be stated.
2. `encodingDesc` **MAY NOT** contain `variantEncoding`.
3. `encodingDesc` **MUST** contain a `schemaRef`.
4. `schemaRef` **MUST** contain a `@url` that points to the URL of the LBP schema.
5. `schemaRef` **MUST** contain an `@n` pointing to the version number of the LBP schema.
6. `encodingDesc` **MAY** take an `editorialDecl` that contains a `p` with a prose description of the guidelines followed in the preparation of this edition.


### Examples

```xml
<encodingDesc>
  <schemaRef
    n="lbp-diplomatic-1.0.0"
    url="https://raw.githubusercontent.com/lombardpress/lombardpress-schema/master/src/diplomatic.rng">
  </schemaRef>
  <editorialDecl>
    <p>Encoding of this text has followed the recommendations of the LombardPress 1.0.0 guidelines for a diplomatic edition</p>
  </editorialDecl>
</encodingDesc>
```

## revisionDesc

### Description

The `revisionDesc` contains a description of the current and previous versions of the current edition.
The individual editor would usually not be responsible for maintaining the `revisionDesc`, as it should (ideally) be generated as part of the publication workflow.


### Rules

1. `revisionDesc` **MUST** be stated.
2. `revisionDesc` **MUST** contain `@status`.
3. `revisionDesc` **MUST** contain `listChange`.
4. `listChange` **MUST** contain at least one `change`.
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

# text

## Description

`text` is the main wrapper of the edition and sibling to the `teiHeader`.

## Rules

1. `text` **SHOULD** take an `@type` attribute the value of which is "diplomatic".
  * The possible values for `text@type` are:
    * critical
    * diplomatic
    * translation
2. `text` **SHOULD** take an `@xml:lang` attribute indicating the dominant language of the edition, usually `la` for "latin".

## front

### Description

`front` is used to make prefatory declarations about the text. For now that only includes the starting location of the text in the witness.

### Rules

1. `front` **MUST** take a `div` with the `xml:id="starts-on"`.
  * The content of this div should only be `pb`, `cb`, and `lb` elements indicating the page, column, and line on which the text begins in the different witnesses. For the encoding of `pb`, `cb` and `lb` see [the relevant section below](#milestones).

### Examples

```xml
<front>
  <div xml:id="starts-on">
    <pb ed="#V" n="5-r"/><cb ed="#V" n="b"/><lb ed="#V" n="13"/> <!-- V5rb -->
  </div>
</front>
```

## body

### Description

`body` is the primary wrapper of the edited text.

### Rules

1. `body` **MUST** immediately follow `front`.
2. `body` **MUST** take a `div` as an immediate child.

## div

### Description

`div` is the fundamental section unit of an edition.

### Rules

1. There **MUST** be one `div` in each edition as a direct child of `body`.
2. `div` **MAY** only contain `head` and `p` as children.
3. `div` **MAY NOT** contain any text nodes as direct children.

## head

`head` is the wrapper heading declaration for a `div`.

### Rules

1. `head` **MUST** be an immediate child of a `div`.
2. `head` **MUST** precede `p` elements in parent `div`.
3. `head` **MAY** take an `@type` attribute.
  * `@type` values include:
    * subtitle
    * question-title

## p

### Description

`p` (along with `head`) is the wrapper of all text nodes within the `body` element.

### Rules

1. All text nodes of the edition, other than those that are descendants of the `head` element, **MUST** be descendants of a `p` element.
2. `p` **MUST** be an immediate child of a `div`.

# Editorial Emendations

## Expansions

### Description

If it is not a priority to encode every abbreviation and expansion, the editor might want to indicate several possible expansions in cases of doubt.

See the examples below for the relation between `ex` and `expan`. Generally `ex` only gives the content that is added by the editor while `expan` gives the whole word, including the characters that constitute the abbreviation.

### Rules

1. `expan` **MUST** include an `abbr` and at least one `ex` as children.
2. `abbr` not contained within a `expan` **MUST** be wrapped in a `choice` element.
3. If more than one `ex` is present, they **MUST** be wrapped in a `choice` element.
4. If more than one `expan` is present, they **MUST** be wrapped in a `choice` element.

In the examples below, option 2 is preferred in cases dealing with characters glyphs that stand for an entire word.

### Examples

Option 1

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

Corrections mark places where an erroneous word has been marked as present in the text alongside its corrected form.

### Rules

1. The form to be corrected **MUST** first be wrapped in a `choice` element.
2. The form to be corrected **MUST** be wrapped in a `sic` element which is a child of `choice`.
3. The correct form **MUST** be wrapped in a `corr` element following the `sic` element and a child of the `choice` element.

### Examples

```xml
<choice>
  <sic>fidei</sic>
  <corr>fide</corr>
</choice>
```

## Normalizations

### Description

Normalizations mark places where an original orthographic form has been preserved alongside its normalized form.

### Rules

1. The form to be normalized **MUST** first be wrapped in a `choice` element.
2. The form to be normalized **MUST** be wrapped in a `orig` element which is a child of `choice`.
3. The correct form **MUST** be wrapped in a `reg` element following the `orig` element and a child of the `choice` element.

### Examples

```xml
<choice>
  <orig>sicud</orig>
  <reg>sicut</reg>
</choice>
```

# Unclear and Illegible Readings

## Description

The situation where the editor has difficulties reading the text might be caused by a physical damage to the manuscript or by the editor's inability to interpret the text although it is perfectly visible on the page. The difference between those two situations is indicated with the `@reason` tag added to the `unclear` element.

If the editor has a suggestion for a reading, the `unclear` element is used, otherwise the `gap` is used.

## Rules

1. `unclear` and `gap` **MAY** contain `@reason` to indicate the reason for the difficult reading. The possible values are:
  * `difficult` (default, assumed when nothing is stated)
  * `damage` (referring to a physical damage of the manuscript)
  * `reproduction` (referring to the quality of the reproduction)
2. Two or more `unclear` elements **MAY** be wrapped in a `choice` element to indicate any number of possible but mutually exclusive suggestions.
3. In the case of several suggestions, `unclear` **SHOULD** contain `@cert` to indicate the relative certainty of the suggestions.
  * Available values are
    * high
    * low
    * medium
    * unknown
4. In the case of several suggestions, the editor **SHOULD** put the suggestion that she deems most likely at the top of the list.
5. `gap` **MUST** contain `@quantity` and `@unit` indicating the extent of the gap.
6. `unclear` **MAY** contain `note` for discussing the difficulty.
7. `choice` **MAY** contain `note` for discussing the different possible suggestions.

## Examples

A simple case where the editor has a suggestion:

``` xml
<unclear>suggestion</unclear>
```

A simple case where the editor has no suggestion:

``` xml
<gap extent="5" unit="characters"/>
```

In both of the above examples, the `@reason` is assumed to be *difficult*. If the problem is caused by a physical damage, it should be indicated like so:

```xml
<unclear reason="damage">suggestion</unclear>
```

Or

``` xml
<gap reason="damage" extent="5" unit="characters"/>
```

A case where multiple possibilities are noted could appear as follows. The `@reason` is assumed to hold for all sibling nodes as the difficulty has the same cause.

``` xml
<choice>
  <unclear cert="high" reason="damage">scilicet</unclear>
  <unclear cert="medium">sicud</unclear>
  <unclear cert="low">sed</unclear>
</choice>
```

A case where multiple possibilities and the `note` element is used:

```xml
<choice>
  <unclear cert="high" reason="damage">scilicet
     <note>This is the best choice if what looks like a descender is a stray ink mark</note>
  </unclear>
  <unclear cert="low">sicud</unclear>
  <note>I prefer the second because ...</note>
</choice>
```

A case where the editor has no suggestion for a difficult reading.

```xml
<gap reason="damage" quantity="5" unit="word"/>
```

Or

``` xml
<gap reason="difficult" quantity="5" unit="word"/>

```

# Scribal Corrections

## add

### Description

`add` indicates a place where a word or phrase has been inserted, typically inter-linearly or in the margin.

### Rules

1. `add` **MUST** have an `@place` attribute.

### Examples

``` xml
<add place="above-line" hand="#N1">fides</add>
```

## del

### Description

`del` indicates a place where a word or phrase has been deleted.

### Rules

1. `del` **MUST** have an `@rend` attribute.
  * Possible values of `@rend`:
    * erasure
    * expunctuation
    * underline
    * strikethrough
    * blackout
    * vacat
    * Combinations are possible, e.g. `rend="strikethrough vacat"`

### Examples
``` xml
<del rend="erasure" hand="#N1">fides</del>
```

## subst

### Description

`subst` indicates a place where a word has been deleted and another word has been added as a replacement

### Rules

1. `subst` **MUST** contain an `add` and `del` element as children.
2. `add` and `del` elements **MUST** follow above outlined rules.

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

## seg@type=correction

### Description

`seg@type="correction"` is used to wrap a word that is being corrected through an addition, deletion, or substitution of only part of the word.

### Rules

1. `seg@type="correction"` **MUST** must contain a `add`, `del`, or `subst` as a child element.
2. `seg@type="correction"` **MUST** also contain text nodes as direct children (otherwise `seg` is unnecessary and `add`, `del`, or `subst` alone are sufficient).
3. `add`, `del`, and `subst` **MUST** follow above outlined rules.

### Examples

``` xml
<seg type="correction">
carit
  <subst>
    <del>as</del>
    <add>atis</add>
  </subst>
</seg>

```

# References and Quotations

References and quotations are marked with `ref` and `quote` elements.

## ref

### Description

`ref` is used when the author makes an internal or external reference. The whole reference to the target may contain several elements, normally `title` and `name`.

### Rules

1. `ref` **MAY** contain `name` to indicate the author of the referenced work.
2. `ref` **MAY** contain `title` to indicate the title of the referenced work.

### Examples

```xml
Ut dicit <ref><name>Augustinus</name> in <title>De civitate dei</title></ref>
```

## quote

### Description

`quote` is used when the author makes a direct quote from another text (or a different passage of his/her own text).

### Rules

1. `quote` element **MUST** surround the quoted text.

### Examples

Simple indication of a quote:

``` xml
Librum sic incipitur <quote>In principio Deus creavit caelum</quote> et cetera
```

Recommended indication with `xml:id`:

``` xml
Librum sic incipitur
<quote xml:id="mockid-1">In principio Deus creavit caelum</quote>
et cetera
```

Use of the `@ana` attribute:

``` xml
Librum sic incipitur
<quote ana="#gen1_1" xml:id="mockid-1">
  In principio Deus creavit caelum
</quote>
et cetera
```

# Punctuation

## pc

### Description

`pc` is reserved for the use of marking punctuation characters within the text.

### Rules

1. `pc` **MAY** take a `@type` attribute indicating the type of punctuation that corresponds to the punctuation character inserted as a child text node.
  * Possible values of the `@type` attribute are:
    * pilcrow
    * punctus
    * punctus-elevatus
    * punctus-medius
    * punctus-interrogativus
    * virgula

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

Aficionados for medieval font encoding will find glyphs and font suggestions at http://folk.uib.no/hnooh/mufi/.

### Examples

``` xml
<pc type="pilcrow">¶</pc>
<pc type="virgula">/</pc>
<pc type="punctus">.</pc>
<pc type="punctus-elevatus">;</pc>
<pc type="punctus-interrogativus">?</pc>
<pc type="punctus-medius">·</pc>
```

Alternative examples that do not write the glyphs explicitly but only encode their presence:
``` xml
<pc type="pilcrow"/>
<pc type="virgula"/>
<pc type="punctus"/>
<pc type="punctus-elevatus"/>
<pc type="punctus-interrogativus"/>
<pc type="punctus-medius"/>
```




# Milestones

## lb

### Description

`lb` is a milestone element used to mark line breaks in a material witness to the edition in question. `lb` elements are used to indicate the *start* of a new line.

### Rules

1. `@ed` **MUST** indicate the source text in which the line break occurs.
2. `@n` **MAY** be used to indicate the line number.

### Examples

``` xml
<lb n="1"/> line content word<lb n="2" break="no">break
new line content
<lb n="3"> new line content
<lb n="4"> new line content
<lb n="5"> new line content

```

## `cb`

### Description

`cb` is a milestone element used to mark column breaks in a material witness to the edition in question. `cb` elements are used to indicate the *start* of a new column.

### Rules

1. `@ed` **MUST** indicate the source text in which the column break occurs.
2. `@n` **MUST** be used indicate the start of the column in question, e.g. "a" or "b".

### Examples

```xml
<cb ed="#W" n="a"/>
```

## `pb`

### Description

`pb` is a milestone element used to mark page breaks in a material witness to the edition in question. `pb` elements are used to indicate the *start* of a new page.

### Rules

1. `@ed` **MUST** indicate the source text in which the page break occurs.
2. `@n` **MUST** indicate the page or folio number (determined by `@type`). In the case of `type="folio"`, the side of the folio is delimited by a `-`.
  * `@type` **MAY** explicitly indicate the type of numbering as either paginated ("page") or foliated ("folio"). If none is given, `@type="folio"` is assumed.
  * If an `-` is used in the value of `@n`, `folio` is assumed.
  * If no `-` appears in the value of `@n`, type `page` is assumed.

### Examples

Page break in folio format

```xml
<pb ed="#W" n="15-v"/>
```

Page break in paged format

```xml
<pb ed="#W" n="15" type="page" />
```

# Marginalia

## Description

Marginalia in a material witness are encoded using the element `note@type='marginal-note'`

## Rules

1. `note` **MUST** have an `@type='marginal-note'`.
2. `note` **MUST** have an `@place` attribute.
3. `note` **MAY** have contain `lb` elements to indicate the line breaks of the marginal note.
  * Note that a processor should ignore all `//note//lb` when attempting to count the lines in a main column.

## Examples

Example where marginal note is simply in the vicinity of a paragraph or line.

```xml
<p>
  <lb ed="#A"/>
  <note type="marginal-note" place="margin-right" hand="#N1">
    <lb ed="#A"/>this marginal note
    <lb ed="#A"/>is in the right margin
    <lb ed="#A"/>and spans three lines in the margin
  </note>
  The main text is here and
  <lb ed="#A"/>there is a marginal note
  <lb ed="#A"/>in the margin near
  <lb ed="#A"/>this line. And now the text continues.
</p>
```

Example where a marginal note is made about a word or phrase in the text, such as in a gloss.

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

Example where a marginal note is best seen as a note about a quotation in the text.

``` xml
<p>
  <lb ed="#A"/>Augustine says
  <quote>the commonwealth is united by a common love
    <note type="marginal-note" place="margin-right" hand="#N1">
      <lb ed="#A"/><ref>Augustine, City of God</ref>
    </note>
  </quote>
  this is still part of the first line of the main text,
  <lb ed="#A"/> and this is then a new line in the main text
</p>
```
