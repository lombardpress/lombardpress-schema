---
layout: page
title:  Introduction to the LombardPress-Schema
date:   2017-01-13
categories: schema
---

Editors:

* Jeffrey C. Witt (Loyola University Maryland)
* Michael Stenskjær Christensen (University of Copenhagen)
* Nicolas Vaughan (Universidad de los Andes)

# The Function and Purpose of the LombardPress-Schema

The [Textual Encoding Initiative](http://www.tei-c.org/) is—for many good reasons—considered the gold standard for textual editing. Despite holding such a privileged position, it is occasionally criticized for failing to make possible what many people hope to find in it: the silver bullet for achieving interoperability. But this criticism is misplaced as TEI has never claimed to provide a standard that by itself will ensure global interoperability. Rather TEI is better understood as first step towards interoperability: a tool box of diverse elements highly pertinent to a wide variety of textual projects. This tool box helps create a first level of uniformity by ensuring that diverse and scattered groups can adopt common nomenclature for so called 'low hanging fruit'. For example, TEI helps ensure that we all use `<p>` for paragraph rather than some groups using `<para>` and other groups using `<paragraph>`.

However, such cases of 'low hanging fruit' only constitute the first and easiest level of decision making when it comes to semantic markup of a complex text. The TEI consortium is the first to acknowledge this. It is precisely for this reason that the TEI guidelines include an astounding number (when compared to other XML schemas) of available elements. The TEI guidelines offers such a vast array of elements precisely because they expect further schema customization and documentation by smaller groups that aim to provide field standards for particular genres of texts and problem domains. Such customizations happen within the TEI consortium (for example, TEI-Simple, TEILite) and without (for example [EpiDoc](http://www.stoa.org/epidoc/gl/latest/)).

The LombardPress-Schema is an attempt to provide one such customized schema for a particular problem domain. The primary focus of the LombardPress-Schema is to provide a uniform encoding standard for the editing of the medieval scholastic corpus (though its adoption is not limited to this domain), with a special emphasis on supporting critical and (semi) diplomatic transcriptions.

The ultimate goal of providing such a standard is the ideal of text interoperability within the domain of scholastic texts so that any text edited according to this standard can be immediately displayed on the web (via web clients such as the LombardPress-Web application) or in print (via print clients such as the LombardPress-Print application and available print stylesheet packages).

Further, the LombardPress-Schema is not only concerned with facilitating the ease of presentation of an individual text or text fragment, but is also concerned to help facilitate, through the adoption of the ontology and guidelines of the Scholastic Commentaries and Texts Archive, the construction of a network corpus from previously isolated text fragments.

# Relationship to the Scholastic Commentaries and Texts Archive

While the LombardPress-Schema has been conceived and built alongside the development of the [Scholastic Commentaries and Texts Archive (SCTA)](http://scta.info), it is important that these two components are understood as distinct and modular parts of a larger ecosystem.

The *Scholastic Commentaries and Texts Archive* is, at its core, an ontology and schema for a set of ideas that, taken together, constitute a text-network. Manuscripts, books, images, and digital transcriptions (as well as authors, editors, references, quotations, and citations) occupy distinct places within this vast network. The SCTA ontology aims to organize all of these distinct but related resources into a connected whole. As part of this process, it offers a series of resource ids that editors can make use of when editing to add more information to this network. In turn the SCTA build script can crawl semantically encoded editions to extract required metadata. However, in order to perform this aggregation, the SCTA crawler must be able to understand ahead of time the semantic structure of the data it is crawling. Such understanding requires that data be prepared according to a known standard.

The LombardPress-Schema is one such known standard. The LombardPress-Schema pays close attention to the ontology, resource ids, and general recommendations of the SCTA and offers explicit guidelines about how these resources ids should be employed in the editing process. But the LombardPress-Schema need not be the only standard that the SCTA build script can accommodate. It is quite possible that someday a subdomain of scholastic texts will demand a schema that the LombardPress-Schema cannot accommodate. This new schema can make its own provisions for how to use the SCTA ontology to connect to the wider corpus. The SCTA build script can then be modified to crawl two distinct, but standardized and documented, data serializations. Nevertheless, the LombardPress-Schema is, at the present, the most mature attempt both to provide a detailed encoding standard for all scholastic texts and to offer guidelines about how to prepare a text in such a way that it can be easily absorbed within the *Scholastic Commentaries and Texts Archive*.

# Status and Future Development

The development of a text-network for the scholastic corpus is a long term project that will always be in need of editorial maintenance and care. The LombardPress-Schema is just one component of that maintenance. The schema, like the more general TEI schema, will always require a group of committed editors to keep the schema up-to-date with changes in the TEI schema itself and in sync with ongoing development of the SCTA. It is critical that this ongoing development occur according to a number of best practices. The LombardPress-Schema editors are committed to the following development principles.

- Wherever possible LombardPress-Schema will always be developing towards common standards. This means first and foremost that the LombardPress-Schema should work within the confines of the TEI schema. But further this means attempting to adopt wider standards and follow established practices wherever possible. Colloquially this means: do no re-invent the wheel. Thus, where possible, it is our goal to either follow or help develop similar standards used by projects like EpiDoc or the Digital Latin Library. In some cases, clear best practices will not yet exist. In such cases, it is our aim to develop well documented standards and justifications that might encourage wider adoption. Moreover, in cases where multiple approaches are at one time permissible, but later a clear best practice emerges, we will aim to move the LombardPress-Schema toward such a best practice in subsequent editions, even if we originally took a different approach.

- Development will offer stable version controlled releases of development progress. Following our [statement on version](statement-on-versioning.md), we aim to follow the best practices of semantic versioning so that processors relying on the LombardPress-Schema standard can have a clear and transparent understanding of the encoding principles underlying any particular schema version.

- Development will be open. Following the best practices of open source development, our github issues list will be open, public, and courteous place for anyone to ask questions, raise concerns, or offer suggestions. The issues may inspire subsequent development. Editors will work to modify the existing standards in light of the issues raised. Editors welcome new contributors and pull-requests.
