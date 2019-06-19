Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042034B90B
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 14:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731591AbfFSMro (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 08:47:44 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:32166 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSMrn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 08:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.63,392,1557180000"; 
   d="scan'208";a="1983886"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 19 Jun 2019 14:47:42 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x5JClLlw008794;
        Wed, 19 Jun 2019 14:47:23 +0200
Received: from SUMMBX01.UMK.KLS.zentral ([172.25.1.64]) by
 SUMMAIL01.UMK.KLS.zentral ([172.25.1.63]) with mapi id 14.03.0439.000; Wed,
 19 Jun 2019 14:47:36 +0200
From:   "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
Thread-Topic: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
Thread-Index: AQHVFKgSrFJUMQ2uSUStv0GNP+ne0qabjF6AgAdi/IA=
Date:   Wed, 19 Jun 2019 12:47:41 +0000
Message-ID: <aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
         <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
         <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
         <20190614195859.GA6351@bogus>
In-Reply-To: <20190614195859.GA6351@bogus>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.2.60]
x-kse-serverinfo: SUMMAIL01.UMK.KLS.zentral, 9
x-kse-attachmentfiltering-interceptor-info: protection disabled
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 19.06.2019 07:52:00
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FBB7F766A7F414A9637986EBB808931@klsmartin.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDE0LjA2LjIwMTksIDEzOjU4IC0wNjAwIHNjaHJpZWIgUm9iIEhlcnJp
bmc6DQo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDA2OjE5OjM3UE0gKzAyMDAsIExlaWYgTWlk
ZGVsc2NodWx0ZSB3cm90ZToNCj4gPiBUaGUgdHJhY2tpbmcgaW5kZXggaXMgYSAibWluaW11bSIg
ZGlzdGFuY2UgdHdvIHRvdWNoDQo+ID4gcG9pbnRzIG5lZWQgdG8gaGF2ZSBpbiBvcmRlciBmb3Ig
dGhlIHNlY29uZCB0byBiZSB2YWxpZC4NCj4gPiBUaGlzIGFkZHMgdGhlIGNvcnJlc3BvbmRpbmcg
YmluZGluZyBwcm9wZXJ0eSBkb2N1bWVudGF0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IExlaWYgTWlkZGVsc2NodWx0ZSA8DQo+ID4gbGVpZi5taWRkZWxzY2h1bHRlQGtsc21hcnRpbi5j
b20NCj4gPiA+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9z
dG1wZS50eHQgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS50eHQN
Cj4gPiBpbmRleCAwOWQyZDRmMjg4Y2MuLjg2OTZhZjM1YTdiOCAxMDA2NDQNCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vc3RtcGUu
dHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3Rv
dWNoc2NyZWVuL3N0bXBlLnR4dA0KPiA+IEBAIC00Miw2ICs0MiwyMSBAQCBPcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPiA+ICAJCQkJVGhlIGdpdmVuIHdpbmRvdyBhbHNvIGFmZmVjdHMgdGhlIHZhbHVl
IHJhbmdlIChsaW1pdHMpIHNldA0KPiA+ICAJCQkJd2l0aGluIHRoZSBpbnB1dCBzdWJzeXN0ZW0g
d2hpY2gsIGluIHR1cm4sIGFmZmVjdHMNCj4gPiAgCQkJCXRoZSBpbnB1dCByZXNvbHV0aW9uIGNh
bGN1bGF0aW9uIG9uIGJvdGggYXhlcy4NCj4gPiArLSBzdCx0cmFja2luZy1pbmRleAk6IE1pbmlt
YWwgZGlzdGFuY2UgYmV0d2VlbiB0aGUgY3VycmVudCB0b3VjaCBwb3NpdGlvbiBhbmQgdGhlIHBy
ZXZpb3VzDQo+ID4gKwkJCQl0b3VjaCBwb3NpdGlvbi4gSWYgdGhlIGRpc3RhbmNlIGlzIHNob3J0
ZXIgdGhhbiB0aGUgdHJhY2tpbmcNCj4gPiArCQkJCWluZGV4LCBpdCBpcyBkaXNjYXJkZWQuIFRo
ZSB0cmFja2luZyBpcyBjYWxjdWxhdGVkIGJ5IHN1bW1hdGlvbg0KPiA+ICsJCQkJb2YgdGhlIGhv
cml6b250YWwgYW5kIHZlcnRpY2FsIG1vdmVtZW50Lg0KPiA+ICsJCQkJSWYgcHJlc3N1cmUgcmVw
b3J0aW5nIGlzIGVuYWJsZWQgKFgvWS9aKSwgYW4gaW5jcmVhc2UgaW4gcHJlc3N1cmUNCj4gPiAr
CQkJCW92ZXJyaWRlIHRoZSBtb3ZlbWVudCB0cmFja2luZyBhbmQgcmVwb3J0IHRoZSBuZXcgZGF0
YSBzZXQsIGV2ZW4NCj4gPiArCQkJCWlmIFgvWSBpcyB3aXRoaW4gdGhlIHByZXZpb3VzIHRyYWNr
aW5nIGluZGV4Lg0KPiA+ICsJCQkJMCAtPiBkaXNhYmxlZA0KPiA+ICsJCQkJMSAtPiA0DQo+ID4g
KwkJCQk0IC0+IDgNCj4gPiArCQkJCTMgLT4gMTYNCj4gPiArCQkJCTQgLT4gMzINCj4gPiArCQkJ
CTUgLT4gNjQNCj4gPiArCQkJCTYgLT4gOTINCj4gPiArCQkJCTcgLT4gMTI3DQo+IA0KPiBUaGlz
IGlzIHdoYXQgdG91Y2hzY3JlZW4tZnV6ei14L3kgaXMgZm9yLg0KDQpUaGUgc3RtcGUgdG91Y2hj
b250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgaGFuZGxpbmcgZWFjaCBheGlzIHNlcGFyYXRlbHku
DQpBbHNvIGl0IGlzIG5vdCB0byBiZSBtaXN0YWtlbiBpbiBpdHMgc3BlY2lmaWMgYmVoYXZpb3Ig
KGkuZS4gb3ZlcnJpZGUpDQpmb3IgdGhlIGdlbmVyYWwgYGZ1enpgIHBhcmFtZXRlci4gSG93ZXZl
ciwgc2hvdWxkIEkgcmVuYW1lIGl0IHRvIGBzdCxmdXp6LXgteWAgb3Igc2ltaWxhcj8NCg0KQUZB
SUNTIHRoZXJlWzBdIGlzIG5vIGdlbmVyaWMgY29tYmluZWQgZGV2aWNldHJlZSBwcm9wZXJ0eSwg
aXMgdGhlcmU/DQoNClswXWh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi90b3VjaHNjcmVlbi50eHQNCg0K
PiANCj4gPiAgLSB0b3VjaHNjcmVlbi1pbnZlcnRlZC14OiBYIGF4aXMgaXMgaW52ZXJ0ZWQgKGJv
b2xlYW4pDQo+ID4gIC0gdG91Y2hzY3JlZW4taW52ZXJ0ZWQteTogWSBheGlzIGlzIGludmVydGVk
IChib29sZWFuKQ0KPiA+ICAtIHRvdWNoc2NyZWVuLXN3YXBwZWQteC15OiBYIGFuZCBZIGF4aXMg
YXJlIHN3YXBwZWQgKGJvb2xlYW4pDQo+ID4gLS0gDQo+ID4gMi4yMS4wDQo+ID4gDQo=
