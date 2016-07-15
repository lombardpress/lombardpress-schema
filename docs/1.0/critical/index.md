---
layout: page
title:  "Lombard Press Schema 1.0.0 - Critical Transcription Guidelines"
date:   2016-07-015
categories: schema
---

# LombardPress Critical Transcription Guidelines

Editors: 

* Jeffrey C. Witt
* Nicolas Vaughan
* Michael Stenskjær Christensen

Document Status: Draft

Outline

* [Preamble](#preamble)
* [teiHeader](#teiheader)
  * [fileDesc](#filedesc) 
    * [titleStmt](#titlestmt)
    * [editionStmt](#editionstmt)
    * [publicationStmt](#publicationstmt)
    * [sourceDesc](#sourcedesc)
  * [revisionDesc](#revisiondesc)
  * [encodingDesc](#encodingdesc)
* [Apparatus Criticus](#apparatus-criticus)
* [Apparatus Fontium](#apparatus-fontium)


# Preamble

The goal of the LombardPress critical transcription specification is to offer a set of guidelines for the markup of medieval Sentences commentary that conform as much as possible to existing standards. In the case of critical editions and transcriptions, this means following as closely as possible the specifications and recommendations of the Digital Latin Library. In most cases, we aim only to expand the Digital Latin Library specifications and offer a detailed list of available attributes and attribute values. Where specifications are not stated, the Digitial Latin Library guidelines should be followed. Where the Digital Latin Library does not state a specification, the more general TEI specification should be followed.


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

1. **MUST** have a title
2. **MUST** have an author
3. **SHOULD** have editor
  * [reconsider this]
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


### `editionStmt`

#### Description

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

### `publicationStmt`

#### Description

#### Rules

1. **MUST** contain an `authority` element.
  * We suggest to let the `authority` state the entity that makes the creation of the current document possible or the context where it belongs. See example below.
2. The `authority` tag **MAY** contain a `ref` to provide an external link to the authority entity.
3. **MUST** contain `availability`
4. `availability` **MUST** containt `@status`
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

### `sourceDesc`

#### Description

#### Rules

1. `SourceDesc` **MUST** contain either a `listWit` or `listBibl` or both
2. `listWit` **MUST** contain at least one `wit`
3. `listBibl` **MUST** contain at least on `bibl`
4. `witness` **MUST** have a `@xml:id`
5. `witness` **SHOULD** have a `n` giving a short id of the witness.
  * The value of `@n` **SHOULD** correspond to the short id for the manuscript in the SCTA database. If the value is not known, leave it out. It will be added later during processing.
6. For adding `handDesc`, follow TEI guidelines.

#### Examples

##### Example 1

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

## `revisionDesc`

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

### Rules

1. `encodingDesc` **MUST** be stated. 
2. `encodingDesc` **MUST** contain `variantEncoding`.
3. `variantEncoding` **MUST** contain `@method` which confirms that the method of variant encoding is *parallel-segmentation*.
4. `encodingDesc` **MUST** contain a `schemaRef`.
5. `schemaRef` **MUST** contain a `target` that points to the URL of the LBP schema.
6. `schemaRef` **MUST** contain an `@n` pointing to the version number of the LBP schema.

NOTE: The rules concerning the `schemaRef` are subject to revision based on the exact implementation in the TEI schema.

### Examples

```xml
<encodingDesc>
 <variantEncoding method="parallel-segmentation"
 location="internal"/> 
 <schemaRef 
   n="lbp-critical-1.0.0"
   target="https://raw.githubusercontent.com/lombardpress/lombardpress-schema/master/src/1.0/critical.rng" 
   type="critical">
</schemaRef>
</encodingDesc>
```

# Apparatus Criticus

Below are basic reading and lemma types divided intro three main categories, variation, correction, and conjecture.

## `variation`
### General Definition
A variation is meant as any reading that varies from the indicated lemma. At present we have identified six main variation times listed below.

### `variation-substance`
#### Description
A `variation-substance` is generally the most common type of variant, in which an editor simply wants to show that witness has a different word or phrase than what is included in the critical text.
This kind of variant is most commonly seen in an apparatus as something like: 

> 10 fides] spes *A*

#### Rules
1. It **MUST** have `lem`.
2. `lem` **MAY** have a `@wit` or `@source` when it is contained by no other `app` element. It **MUST** have `@wit` when it is contained by a parent `app` element.
3. `rdg` **MAY** have `@type=variation-substance`.
  * The requirement for `@type` is only a "**MAY**" because this `@type` is so common and can be inferred by a processor from the following encoding pattern, that it is not necessary for an editor to state it on every reading.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either `@wit` or `@source`.


#### Example
``` xml
<app>
  <lem wit>fides</lem>
  <rdg wit="#A" type="variation-substance">spes</rdg>
</app>

```

On a negative apparatus:
> 10 fides] spes *A*

On a positive apparatus:
> 10 fides] *BCD* spes *A*

### `variation-orthography`
#### Definition
The `variation-orthography` class is meant to separate variant instances, where there is no actual variation in the substance of the word or phrase in question, but simply an orthographic difference.

#### Rules
1. It **MUST** have `lem`.
2. `lem` **MAY** have a `@wit` or `@source` when it is contained by no other `app` element. It **MUST** have `@wit` when it is contained by a parent `app` element.
3. `rdg` **MAY** have `@type=variation-orthographic`.
  * The requirement for `@type` is only a "**MAY**" because this `@type` is so common and can be inferred by a processor from the following encoding pattern, that it is not necessary for an editor to state it on every reading.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either @wit or @source.


#### Example
``` xml
<app>
  <lem>sicut</lem>
  <rdg wit="#A" type="variation-orthography">sicud</rdg>
</app>
est
```
> 10 sicut] sicud *A*


### `variation-present`
#### Description
The `variation-present` type should be used to indicate that a word or phrase is present in a witness, but has not been included in the critical text. It is important that this be distinguished from the type `correction-addition` which is meant to indicate that a word or phrase has been actively added as a conscious correction to the witness text.

#### Rules
1. It **MUST** have `lem`.
  * The `lem` must be present because a processor might render one of the readings in an `app` as the printed text. 
2. `lem` **MUST** be an empty node.
3. `lem` **MAY** have `@wit` or `@source` attribute.
4. `rdg` **MUST** have `@wit` or `@source`.
5. `rdg` **MUST** have `@type=present`.
7. `rdg` **MAY** include `@type=cause` with the following available enumerated values:
  * `repetition`
  * ... 


#### Examples
##### Example 1
``` xml
fides
<app>
  <lem/>
  <rdg wit="#A" type="variation-present">spes</rdg>
</app>
```

> 10 fides] spes *in textu* *A* 
> 10 spes *post* fides *hab./scr./inest* *A*


##### Example 2
Another example of the present type where the present word is caused by an (erroneous) repetition. 

``` xml
spes
<app>
  <lem/>
  <rdg wit="#A" type="variation-present" cause="repetition">spes</rdg>
</app>

```
> 10 spes *iter.* *A*



### `variation-absent`
#### Description
A word or phrase is absent from a witness but present in the transmitted text. This is most often rendered as simple "omission".

> 10 fides] *om.* *A*

#### Rules
1. The `lem` **MUST** be present.
2. The `lem` **MUST** have text node.
3. The `lem` **MAY** include `@wit` or `@source` attributes.
    4. The `rdg` **MUST** include `@wit` or `@source` attributes.
5. The `rdg` **MUST** have no descendant text nodes. 
6. The `rdg` **MAY** have a child space element. 
  * A `<space>` may be used when attempting to indicate a space left by the scribe intended to be filled in later.
6. The `rdg` **SHOULD** include `@type=absent`.
  * The reason this is not a **MUST** is because the pattern of a present `lem` with a text value and a present but empty `rdg` element is a unique pattern that corresponds to the `variation-absent` type.
7. The `rdg` **MAY** include `@type=cause` with the following available enumerated values:
  * `homeoteleuton`
  * `homeoarchon` 
  * ...
  
  
#### Examples
##### Example 1
``` xml
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
This would be an example of a conjecture where a word is added to the edition but missing in the transmitted text. For more on conjectures see below

``` xml
<app>
  <lem type="conjecture-supplied"><supplied>fides</supplied></lem>
  <rdg wit="#A" type="absent"/>
</app>
est
```


##### Example 3
``` xml
fides 
<app>
  <lem>non semper sic, sed non</lem>
  <rdg wit="#A" type="variation-absent" cause="homeoteleuton"/>
</app>
```
> 10 non semper sic, sed non] *om.* *A* *(hom.)*


##### Example 4
``` xml
<app>
  <lem>fides</lem>
  <rdg wit="#A" type="variation-absent"><space extent="5" unit="characters" /></rdg>
</app>

```
> 10 fides] *lac. (5 litt.)* *A*


### `variation-inversion`
#### Definition
`Variation-inversion` is meant to indicate a variant reading where two or more words have are inverted relative to the critical text.

#### Rules
1. It **MUST** have `lem`.
2. `lem` **MAY** have a `@wit` or `@source` when it is contained by no other `app` element. It **MUST** have `@wit` when it is contained by a parent `app` element.
3. `rdg` **MUST** have `@type=variation-inversion`.
4. `rdg` text node **MUST** be present.
5. `rdg` **MUST** have either `@wit` or `@source`. 

#### Example
``` xml
fides non
<app>
  <lem>bona fides</lem>
  <rdg wit="#A" type="variation-inversion">fides bona</rdg>
</app>
```
> 10 bona fides] fides bona *A*


## `correction`
### General Definition
A correction is meant as any reading where it is assumed that the scribe/text/witness? corrects a perceived error in his transmitted text.
This is *not* used to represent corrections made by the edition. That is reserved for the *conjecture* class (below).


### `correction-addition`
#### Definition
This indicates that a scribe (either the original or a later scribe) has realized that a word or phrase is missing in his text and subsequently added it. This be clearly distinguished from `variation-present` above where the editor only means to indicate that a word is present in a witness, but has not been added through a conscious correction.

#### Rules
1. It **MUST** have `lem`.
2. The `lem` **MAY** be empty.
  * You may not want to include the `correction-addition` in the critical text but still indicate that the correction has been made in a witness. This is an instance where the correction-addition is also taking on the form parallel to that of a `variation-present`.
3. The `rdg` **SHOULD** have `@type=correction-addition`.
4. The `rdg` **MUST** contain an `add` element.
5. The `rdg` **MUST NOT** contain any content outside of the `add` element.
5. The `add` **MUST** have a `@place` attribute.
6. The `add` **MAY** have a `@hand` attribute.

#### Examples
##### Example 1
``` xml
<app>
  <lem>fides</lem>1
  <rdg wit="#A" type="correction-addition">
    <add place="margin-left">fides</add>
  </rdg>
</app>

```

> 10 fides] *add. in mg.* *A*


##### Example 2
Our scribe wrote "in nomine Patri et Spiritus Sancti", but a later hand (#L¹) realized the mistake and adds the missing phrase "Filii et" above the line.

``` xml
in nomine Patri et
<app>
  <lem>Filii et</lem>
    <rdg wit="#L" type="correction-addition">
      <add place="above-line" hand="#L¹">Filii et</add>
  </rdg>
</app>
Spiritus Sancti.
```

> Filii et] *add. s.l.* *L¹*
> Filii et] *add. s.l. alia manu* *L*
> Filli et] *om.* *L* *(corr. L¹)*



### `correction-deletion`
#### Definition

This indicates that a scribe (either the original or a later scribe) has realized that a word or phrase is erroneously present in his text and subsequently deleted it. 

#### Rules
1. It **MUST** have `lem`.
2. The `lem` **MAY** be empty.
  * In most cases, the `lem` will be empty, since it is normal to note a deletion of word that does not appear in the critical text. However, an editor might want to include a word in the critical text that has been deleted in one or more witnesses. In this case, the `lem` **MUST NOT** be empty.
3. The `rdg` **SHOULD** have `@type=correction-deletion`.
4. The `rdg` **MUST** contain an `del` element.
5. The `rdg` **MUST NOT** contain any content outside of the `del` element.
5. The `del` **MUST** have a `@place` attribute.
6. The `del` **MAY** have a `@hand` attribute.


#### Examples
 
##### Example 1
``` xml
fides
<app>
  <lem/>
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

### `correction-substitution`

#### Definition

This indicates that a scribe (either the original or a later scribe) wants to correct one word or phrase with another.

#### Rules

1. It **MAY** have a `lem`.
  * In most cases the lemma would be included, but the editor might want to include the substitution made in the witness without including either of the possible readings in the edited text.
2. It **MUST** have a `rdg`.
3. `rdg` **MUST** have a `@wit`.
4. `rdg` **SHOULD** have `@type=correction-substitution`.
5. `rdg` **MUST** contain a `subst` element as a direct child.
6. The `subst` element **MUST** contain a `del` and a `add` element.
7. `subst` **MUST NOT** contain any nodes other than the `del` and `add` elements.
8. The smallest unit of substitution **MUST** be a word.
9. 8. The `add` **MAY** have a `@place`.
9. The `del` **MAY** have a `@rend`.
10. A `@hand` attribute **MAY** be placed on the `subst` or on the `add` and `del`. 


#### Extended Commentary

A possible argument against rule 8 is that an editor might desire to produce the following rendering for a correction to a particular word.

> insidia N (s *add.* *N¹*)
                
However, we find this rendering ambiguous and therefore somewhat problematic. 

Does this mean N1 has added the letter "s" after "insidia" or to the word itself? 

While in the case of "s", it is probably obvious to an editor that "s" is not a word by itself and therefore the editor probably meant that "s" was added to "insidia". 

However, what if the added letter were "a"? Then it would be much less clear. 

Likewise scholastic text use a lot of variables, so its possible that a scribe could have been adding "b" or "c" as a separate word or character, and did not mean to add a new letter to the preceding word. 
                
So for example this would be very ambiguous in a sequence where variable a, b, c, d, and e were in use: 
                
> insidia] *N* (e *add.* *N²*)
                
Does this mean that the correction was to "insidiae" or "insidia e"?
                
Thus I think would be best to handle this with a correction-substitution, which could render to 
                
> insidias] *corr. ex alia manu* insidia *N* 
                
or something else.
                
It's true that with something like: 
                
``` xml
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
                
In the example above the addition of "s" to "insidias" is, in meaning, really a correction-substitution, even though the way that the correction was materially made looks like a simple "addition". 

By adding "s" the scribe, did not meant to simply add and "s", but to replace the word "insidia" with "insidias".
                
In its rendering it looks equivalent to the addition of a missing word, but the effect or meaning of the correction, is to substitute one word with another.
                
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
    <del>fidem</del>
    <add hand="#A¹" place="margin-right">fides</add>
  </rdg>
</app>
est
```

> 10 fides] fidem *A* (*ante corr.* *A¹*)
> 10 fides] *corr. ex* fidem *in mg.* *A¹*
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

### `correction-cancellation`
#### Definition

A cancellation is a correction of a correction. This gives us nine theoretical types following the logic of the corrections as described above. The correction of a correction would simply be a correction wrapped in a correction. Some of those nine permutations are not materially possible. We consider the following corrections of corrections to be possible.

#### Rules

1. `rdg` **MUST** take `@type=correction-cancellation`
2. chilren of `rdg` must follow the logic of one of 4 or 5 accepted patterns described in
 

#### Examples

TODO: review 9 possibilities one more time
possibility 1

``` xml
<del><add place="above-line">fides</add></del>
```
possibility 2
``` xml
<del><del>fides</del></del>
```

possible alias: 
``` xml
<add><del>fides</del></add>
```
possibility 3
``` xml
<del>
  <subst>
    <add>fidem</add>
    <del>fides</del>
  </subst>
</del>
```
possibility 4
``` xml
<subst>
  <del>
      <subst>
          <add>spes</add>
            <del>fides</del>
        </subst>
    </del>
  <add>fides</add>
</subst>
```

### conjecture
#### Definition
These types refer to the situation where a (current or previous) editor suggests or introduces a emendation to the text that is not supported by the textual tradition.

The relation between emendation and conjecture: When a suggestion for improvement is in the `<lem>`, it is an emendation, when it is in the `<rdg>` it is a conjecture.

#### Rules
#### Examples


### conjecture-supplied

#### Definition

According to the the judgement of the editor, an expression is missing from transmitted text. Ideas for improvement of the text may then either be added to the edited text itself or indicated in apparatus note.

#### Rules
#### Examples
##### Example 1
``` xml
Utrum fides semper
<app>
  <lem type="conjecture-supplied" resp="#Michael">
      <supplied>sit</supplied
    </lem>
    <rdg type="absent" wit="#P #V #L"/>
</app>
acquisita
```

### conjecture-removed
#### Definition
#### Rules
#### Examples
##### Example 1

### conjecture-corrected
#### Definition
#### Rules
#### Examples
##### Example 1



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

A quote, following the TEI guidelines, is intended to identify anything that is considered a quotation of another source or test. The value of quotation is most often rendered as within quotation marks, i.e. "This is a quote".

### Rules

1. `quote` **MAY** stand alone, i.e. it **MAY** not be a child of an `cit` element and thus not appear in the *apparatus fontium*
2. `quote` **MAY** be the immediate child of a `cit` element thus appear in the *apparatus fontium*
3. `quote` **MAY** contain `seg` elements.
  * This would be used to indicate segments of a quote that are interrupted by an *inquit*. 

### Examples

The following example is not expected to generate an apparatus fontium entry
```xml 
<quote>In principio</quote> etc.
``` 

The following example is expected to generate an *apparatus fontium* entry
``` xml
<cit>
  <quote xml:id="quote1" ana="#gen1_1--gen2_1">In principio creavit Deus caelum</quote>
  <note>I can't find this shit.</note>
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

This is another, equivalent way of doing the same:
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
4. `ref` **MAY** contain a `seg@type="incipit"` for references that include a incipit for the referenced section

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

## Milestones

### `cb`

#### Rules

- `@ed` **MUST** indicate the source text in which the column break occurs.
- `@n` **MUST** indicate the column, e.g. a
- `@facs` JEFF TODO: describe how to add IIIF id

#### Examples

<cb ed="#W" n="a"/>

### `pb`

#### Rules

- `@ed` **MUST** indicate the source text in which the page break occurs.
- `@n` **MUST** indicate the page or folio number (determined by `@type`). In the case of `type="folio"`, the side of the folio is delimited by a `-`. 
- `@corresp` JEFF TODO: describe IIIF id connection here
- `@type` **MAY**: Indicate the type of numbering as either paginated or foliated. If none is given, `type="folio"` is assumed.

#### Examples

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

# Appendix

## possible enumerated values in attributes

space@unit
* word(s)
* letter(s)
* line(s)

@place
* margin
* margin-right
* margin-left
* margin-top
* margin-bottom
* margin-center
* inline
* above-line
* below-line

@hand

del@rend
* strikethrough
* expunctuation
* erasure
* blackout


