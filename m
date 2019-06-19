Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 713094B781
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 13:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfFSL4B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 07:56:01 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:50316 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSL4B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 07:56:01 -0400
X-IronPort-AV: E=Sophos;i="5.63,392,1557180000"; 
   d="scan'208";a="1982610"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 19 Jun 2019 13:55:59 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x5JBtcx6009055;
        Wed, 19 Jun 2019 13:55:40 +0200
Received: from SUMMBX01.UMK.KLS.zentral ([172.25.1.64]) by
 SUMMAIL01.UMK.KLS.zentral ([172.25.1.63]) with mapi id 14.03.0439.000; Wed,
 19 Jun 2019 13:55:53 +0200
From:   "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch
 window configuration
Thread-Topic: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add
 touch window configuration
Thread-Index: AQHVFKZfWxtzY275Mkuldb4w1Urs/KabiWYAgAdXhIA=
Date:   Wed, 19 Jun 2019 11:55:57 +0000
Message-ID: <b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
         <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
         <20190614194818.GA22146@bogus>
In-Reply-To: <20190614194818.GA22146@bogus>
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
Content-ID: <F791AFFBA85D014F9C23CDA6F60B44D0@klsmartin.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDE0LjA2LjIwMTksIDEzOjQ4IC0wNjAwIHNjaHJpZWIgUm9iIEhlcnJp
bmc6DQo+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDA2OjA3OjI3UE0gKzAyMDAsIExlaWYgTWlk
ZGVsc2NodWx0ZSB3cm90ZToNCj4gPiBUaGUgU1RNUEU4MTEgaXMgYWJsZSB0byBvbmx5IG1vbml0
b3IgYSBzdWJ3aW5kb3cgb2YgdGhlDQo+ID4gZW50aXJlIHNjcmVlbi4gVG91Y2hlcyBvdXRzaWRl
IG9mIHRoaXMgd2luZG93IGFyZSBuZWdsZWN0ZWQuDQo+ID4gVGhpcyBjaGFuZ2UgYWRkcyB0aGUg
Y29ycmVzcG9uZGluZyBkb2N1bWVudGF0aW9uLg0KPiANCj4gVW5sZXNzIHlvdSBhcmUgdHJ5aW5n
IHRvIGp1c3QgZmlsdGVyIG91dCB0aGUgZWRnZSB2YWx1ZXMgDQpJJ20gdHJ5aW5nIHRvICJqdXN0
IGZpbHRlciBvdXQgdGhlIGVkZ2UgdmFsdWVzIiBieSBmaWx0ZXJpbmcgdGhlIHZhbHVlcw0Kcmln
aHQgb24gdGhlIHNtcHRlIG1pY3JvY29udHJvbGxlci4gSXQgaXMgYSBkZXZpY2Ugc3BlY2lmaWMg
ZmVhdHVyZSwgdGhhdCBpcw0Kd2h5IEkgaW1wbGVtZW50ZWQgYW5kIGRvY3VtZW50ZWQgdGhlIHN1
cHBvcnQuDQoNCkJ1dCBzdXJlLCBvbmUgY291bGQgbGVhdmUgdGhhdCB0byBhIGNvcnJlc3BvbmRp
bmcgZW50cnkgaW4gdGhlIGh3ZGIgdGhhdA0Kd291bGQgbWFuaXB1bGF0ZSBhYnNpbmZvIHRvIGdh
aW4gY2FsaWJyYXRlZCBpbnB1dCBbMV0uDQoNCj4gd2hpY2ggSSB0aGluayB3ZSBhbHJlYWR5IGhh
dmUgcHJvcGVydGllcyBmb3IsDQpXaGlsZSB0aGVyZSBbMF0gaXMgInRvdWNoc2NyZWVuLW1pbi17
eCx5fSIsIEkgY291bGQgbm90IHNwb3QgYSBjb3JyZXNwb25kaW5nDQoidG91Y2hzY3JlZW4tbWF4
LXt4LHl9Ii4gQ291bGQgeW91IHBvaW50IG1lIHRvIHRoZSByaWdodCBwcm9wZXJ0eT8NCg0KPiB3
b3VsZG4ndCB0aGlzIGJlIHNvbWV0aGluZyB0aGUgdXNlciBtYXkgd2FudCB0byBhZGp1c3QvbW92
ZSBhdCBydW50aW1lPw0KSXQgaXMgYWRqdXN0YWJsZSBhdCBydW50aW1lIHZpYSB0aGUgaHdkYiBv
ciBjYWxsaW5nIGlvY3RsIG9uIHRoZSBldmRldiBkZXZpY2UgZGlyZWN0bHkuDQoNCg0KWzBdIGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnB1dC90b3VjaHNjcmVlbi90b3VjaHNjcmVlbi50eHQNClsxXSBodHRwczovL3doby10LmJs
b2dzcG90LmNvbS8yMDE4LzA4L2hvdy02MC1ldmRldmh3ZGItd29ya3MuaHRtbA0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMZWlmIE1pZGRlbHNjaHVsdGUgPA0KPiA+IGxlaWYubWlkZGVsc2NodWx0
ZUBrbHNtYXJ0aW4uY29tDQo+ID4gPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS50eHQgICAgICB8IDkgKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBl
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVl
bi9zdG1wZS50eHQNCj4gPiBpbmRleCBjNTQ5OTI0NjAzZDIuLjA0OTYyZTJlMWFkMCAxMDA2NDQN
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hz
Y3JlZW4vc3RtcGUudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLnR4dA0KPiA+IEBAIC0zMyw2ICszMywxMyBAQCBP
cHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICAtIHN0LGktZHJpdmUJCTogY3VycmVudCBsaW1pdCB2
YWx1ZSBvZiB0aGUgdG91Y2hzY3JlZW4gZHJpdmVycw0KPiA+ICAJCQkJMCAtPiAyMCBtQSAodHlw
aWNhbCAzNW1BIG1heCkNCj4gPiAgCQkJCTEgLT4gNTAgbUEgKHR5cGljYWwgODAgbUEgbWF4KQ0K
PiA+ICstIHN0LHdpbmRvdy10cmFja2luZwk6IEFuIHUxMiBhcnJheSB0aGF0IGFsbG93cyB0byBw
cmUtc2V0IGEgc3ViLXdpbmRvdyBpbiB0aGUgdG91Y2hzY3JlZW4uDQo+IA0KPiB1MTY/DQo+IA0K
PiA+ICsJCQkJQW55IHRvdWNoIHBvc2l0aW9uIHRoYXQgaXMgb3V0c2lkZSB0aGUgc3ViLXdpbmRv
dyBpcyBkaXNjYXJkZWQNCj4gPiArCQkJCSh0b3AtcmlnaHQgeCwgdG9wLXJpZ2h0IHksIGJvdHRv
bS1sZWZ0IHgsIGJvdHRvbS1sZWZ0IHkpLg0KPiA+ICsJCQkJVGhlIGdpdmVuIHdpbmRvdyBhbHNv
IGFmZmVjdHMgdGhlIHZhbHVlIHJhbmdlIChsaW1pdHMpIHNldA0KPiA+ICsJCQkJd2l0aGluIHRo
ZSBpbnB1dCBzdWJzeXN0ZW0gd2hpY2gsIGluIHR1cm4sIGFmZmVjdHMNCj4gPiArCQkJCXRoZSBp
bnB1dCByZXNvbHV0aW9uIGNhbGN1bGF0aW9uIG9uIGJvdGggYXhlcy4NCj4gPiArDQo+ID4gIA0K
PiA+ICBPcHRpb25hbCBwcm9wZXJ0aWVzIGNvbW1vbiB3aXRoIE1GRCAoZGVwcmVjYXRlZCk6DQo+
ID4gICAtIHN0LHNhbXBsZS10aW1lCTogQURDIGNvbnZlcnNpb24gdGltZSBpbiBudW1iZXIgb2Yg
Y2xvY2suDQo+ID4gQEAgLTEwMSw2ICsxMDgsOCBAQCBzdG1wZTgxMUA0MSB7DQo+ID4gIAkJICog
Y3VycmVudCBsaW1pdCB2YWx1ZQ0KPiA+ICAJCSAqLw0KPiA+ICAJCXN0LGktZHJpdmUgPSA8MT47
DQo+ID4gKwkJLyogZW5hYmxlIGVudGlyZSB3aW5kb3cgKi8NCj4gPiArCQlzdCx3aW5kb3ctdHJh
Y2tpbmcgPSAvYml0cy8gMTYgPDQwOTUgNDA5NSAwIDA+Ow0KPiA+ICAJfTsNCj4gPiAgCXN0bXBl
X2FkYyB7DQo+ID4gIAkJY29tcGF0aWJsZSA9ICJzdCxzdG1wZS1hZGMiOw0KPiA+IC0tIA0KPiA+
IDIuMjEuMA0KPiA+IA0K
