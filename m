Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0574B8A5
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFSMdu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 08:33:50 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:37970 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731829AbfFSMdu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 08:33:50 -0400
X-IronPort-AV: E=Sophos;i="5.63,392,1557180000"; 
   d="scan'208";a="1983562"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 19 Jun 2019 14:33:48 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x5JCXRNj000379;
        Wed, 19 Jun 2019 14:33:29 +0200
Received: from SUMMBX01.UMK.KLS.zentral ([172.25.1.64]) by
 SUMMAIL01.UMK.KLS.zentral ([172.25.1.63]) with mapi id 14.03.0439.000; Wed,
 19 Jun 2019 14:33:42 +0200
From:   "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add
 resolution support
Thread-Topic: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add
 resolution support
Thread-Index: AQHVFKZiSNiCaHUC7UKcS7H8WZkpLKabi02AgAdgL4A=
Date:   Wed, 19 Jun 2019 12:33:47 +0000
Message-ID: <f90b0a81834f84ecf933ca79c3fd345cbbdf9361.camel@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
         <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
         <20190614195507.GA27083@bogus>
In-Reply-To: <20190614195507.GA27083@bogus>
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
Content-ID: <4AE61BA318EB014D9001390EA0849F99@klsmartin.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDE0LjA2LjIwMTksIDEzOjU1IC0wNjAwIHNjaHJpZWIgUm9iIEhlcnJp
bmc6DQo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDA2OjA3OjI5UE0gKzAyMDAsIExlaWYgTWlk
ZGVsc2NodWx0ZSB3cm90ZToNCj4gPiBUaGlzIGRvY3VtZW50cyB0aGUgc3VwcG9ydCBmb3Igc3Bl
Y2lmeWluZyB0aGUgc2NyZWVuIHNpemUgaW4gbWlsaW1ldGVyDQo+ID4gYW5kIGl0cyBpbXBhY3Qg
b24gcmVzb2x1dGlvbiBjYWxjdWxhdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWlm
IE1pZGRlbHNjaHVsdGUgPA0KPiA+IGxlaWYubWlkZGVsc2NodWx0ZUBrbHNtYXJ0aW4uY29tDQo+
ID4gPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5w
dXQvdG91Y2hzY3JlZW4vc3RtcGUudHh0IHwgNCArKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS50eHQNCj4gPiBp
bmRleCAwNDk2MmUyZTFhZDAuLmQyMGRjNWE3ZDhhZCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vc3RtcGUudHh0DQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2Ny
ZWVuL3N0bXBlLnR4dA0KPiA+IEBAIC0zOSw2ICszOSwxMCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVz
Og0KPiA+ICAJCQkJVGhlIGdpdmVuIHdpbmRvdyBhbHNvIGFmZmVjdHMgdGhlIHZhbHVlIHJhbmdl
IChsaW1pdHMpIHNldA0KPiA+ICAJCQkJd2l0aGluIHRoZSBpbnB1dCBzdWJzeXN0ZW0gd2hpY2gs
IGluIHR1cm4sIGFmZmVjdHMNCj4gPiAgCQkJCXRoZSBpbnB1dCByZXNvbHV0aW9uIGNhbGN1bGF0
aW9uIG9uIGJvdGggYXhlcy4NCj4gPiArLSB0b3VjaHNjcmVlbi14LW1tCTogaG9yaXpvbnRhbCBs
ZW5ndGggaW4gbW0gb2YgdGhlIHRvdWNoc2NyZWVuLiBJdCBhZmZlY3RzDQo+ID4gKwkJCQl0aGUg
aW5wdXQgcmVzb2x1dGlvbiBjYWxjdWxhdGlvbiBvbiB0aGUgaG9yaXpvbnRhbCBheGlzLg0KPiA+
ICstIHRvdWNoc2NyZWVuLXktbW0JOiB2ZXJ0aWNhbCBsZW5ndGggaW4gbW0gb2YgdGhlIHRvdWNo
c2NyZWVuLiBJdCBhZmZlY3RzDQo+ID4gKwkJCQl0aGUgaW5wdXQgcmVzb2x1dGlvbiBjYWxjdWxh
dGlvbiBvbiB0aGUgdmVydGljYWwgYXhpcy4NCj4gDQo+IE5vIG5lZWQgdG8gZGVmaW5lIHRoaXMg
YWdhaW4uIEp1c3QgcmVmZXJlbmNlIHRoZSBjb21tb24gZGVmaW5pdGlvbi4gSWYgDQo+IHlvdSBo
YXZlIGFueSBhZGRpdGlvbmFsIGNvbnN0cmFpbnRzLCB0aGVuIGFkZCB0aGVtLg0KDQpJIGFzc3Vt
ZWQgaXQgc2hvdWxkIG5vdCBiZSByZWRlZmluZWQuIEkgbWVyZWx5IHdhbnRlZCB0byBkb2N1bWVu
dCB0aGUgaW1wbGljYXRpb24NCnRoaXMgdmFsdWUgaGFzIG9uIHRoZSBhdXRvbWF0aWNhbGx5IGNv
bmZpZ3VyZWQgcmVzb2x1dGlvbiB3aXRoaW4gYGFic19pbmZvYC4NCk90aGVyIGRyaXZlcnMgbWln
aHQgbm90IHVzZSBpdCBpbiB0aGF0IHdheSwgYXMgdGhlIGdlbmVyYWwgZG9jdW1lbnRhdGlvblsw
XSBkb2VzIG5vdA0KZG9jdW1lbnQgc3VjaCBhIGJlaGF2aW9yLg0KDQpbMF0gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3Rv
dWNoc2NyZWVuL3RvdWNoc2NyZWVuLnR4dA0KDQo+IFJvYg0K
