Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A893650A01
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 13:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfFXLoz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 07:44:55 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:8504 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbfFXLoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 07:44:55 -0400
X-IronPort-AV: E=Sophos;i="5.63,412,1557180000"; 
   d="scan'208";a="2042169"
Received: from unknown (HELO ares.klsmartin.com) ([172.30.5.65])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 24 Jun 2019 13:44:53 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by ares.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x5OBiSjv015526;
        Mon, 24 Jun 2019 13:44:31 +0200
Received: from SUMMBX01.UMK.KLS.zentral ([172.25.1.64]) by
 SUMMAIL01.UMK.KLS.zentral ([172.25.1.63]) with mapi id 14.03.0439.000; Mon,
 24 Jun 2019 13:44:45 +0200
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
Thread-Index: AQHVFKgSrFJUMQ2uSUStv0GNP+ne0qabjF6AgAdi/ICAABB8gIAHuZyA
Date:   Mon, 24 Jun 2019 11:44:49 +0000
Message-ID: <4139715591ec75d8ae1bacfe0a66fafc26703607.camel@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
         <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
         <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
         <20190614195859.GA6351@bogus>
         <aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
         <CAL_JsqJBqxfSJh0Htm3esnF9DnbnNHKFMxj=iLyGcuL88qepBw@mail.gmail.com>
In-Reply-To: <CAL_JsqJBqxfSJh0Htm3esnF9DnbnNHKFMxj=iLyGcuL88qepBw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.2.60]
x-kse-serverinfo: SUMMAIL01.UMK.KLS.zentral, 9
x-kse-attachmentfiltering-interceptor-info: protection disabled
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 24.06.2019 08:53:00
Content-Type: text/plain; charset="utf-8"
Content-ID: <58CDC9E453CE3540BEF615D35A056583@klsmartin.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QW0gTWl0dHdvY2gsIGRlbiAxOS4wNi4yMDE5LCAwNzo0NiAtMDYwMCBzY2hyaWViIFJvYiBIZXJy
aW5nOg0KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA2OjQ3IEFNIE1pZGRlbHNjaHVsdGUsIExl
aWYNCj4gPA0KPiBMZWlmLk1pZGRlbHNjaHVsdGVAa2xzbWFydGluLmNvbQ0KPiA+IHdyb3RlOg0K
PiA+IEFtIEZyZWl0YWcsIGRlbiAxNC4wNi4yMDE5LCAxMzo1OCAtMDYwMCBzY2hyaWViIFJvYiBI
ZXJyaW5nOg0KPiA+ID4gT24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDY6MTk6MzdQTSArMDIwMCwg
TGVpZiBNaWRkZWxzY2h1bHRlIHdyb3RlOg0KPiA+ID4gPiBUaGUgdHJhY2tpbmcgaW5kZXggaXMg
YSAibWluaW11bSIgZGlzdGFuY2UgdHdvIHRvdWNoDQo+ID4gPiA+IHBvaW50cyBuZWVkIHRvIGhh
dmUgaW4gb3JkZXIgZm9yIHRoZSBzZWNvbmQgdG8gYmUgdmFsaWQuDQo+ID4gPiA+IFRoaXMgYWRk
cyB0aGUgY29ycmVzcG9uZGluZyBiaW5kaW5nIHByb3BlcnR5IGRvY3VtZW50YXRpb24uDQo+ID4g
PiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWlmIE1pZGRlbHNjaHVsdGUgPA0KPiA+ID4g
PiBsZWlmLm1pZGRlbHNjaHVsdGVAa2xzbWFydGluLmNvbQ0KPiA+ID4gPiANCj4gPiA+ID4gDQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBl
LnR4dCAgICAgICAgICB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vc3RtcGUudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0
bXBlLnR4dA0KPiA+ID4gPiBpbmRleCAwOWQyZDRmMjg4Y2MuLjg2OTZhZjM1YTdiOCAxMDA2NDQN
Cj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3Rv
dWNoc2NyZWVuL3N0bXBlLnR4dA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vc3RtcGUudHh0DQo+ID4gPiA+IEBAIC00Miw2
ICs0MiwyMSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVGhlIGdpdmVuIHdpbmRvdyBhbHNvIGFmZmVjdHMgdGhlIHZhbHVlIHJhbmdl
IChsaW1pdHMpIHNldA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd2l0aGlu
IHRoZSBpbnB1dCBzdWJzeXN0ZW0gd2hpY2gsIGluIHR1cm4sIGFmZmVjdHMNCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRoZSBpbnB1dCByZXNvbHV0aW9uIGNhbGN1bGF0aW9u
IG9uIGJvdGggYXhlcy4NCj4gPiA+ID4gKy0gc3QsdHJhY2tpbmctaW5kZXggICAgICAgIDogTWlu
aW1hbCBkaXN0YW5jZSBiZXR3ZWVuIHRoZSBjdXJyZW50IHRvdWNoIHBvc2l0aW9uIGFuZCB0aGUg
cHJldmlvdXMNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvdWNoIHBvc2l0
aW9uLiBJZiB0aGUgZGlzdGFuY2UgaXMgc2hvcnRlciB0aGFuIHRoZSB0cmFja2luZw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5kZXgsIGl0IGlzIGRpc2NhcmRlZC4gVGhl
IHRyYWNraW5nIGlzIGNhbGN1bGF0ZWQgYnkgc3VtbWF0aW9uDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvZiB0aGUgaG9yaXpvbnRhbCBhbmQgdmVydGljYWwgbW92ZW1lbnQu
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBJZiBwcmVzc3VyZSByZXBvcnRp
bmcgaXMgZW5hYmxlZCAoWC9ZL1opLCBhbiBpbmNyZWFzZSBpbiBwcmVzc3VyZQ0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb3ZlcnJpZGUgdGhlIG1vdmVtZW50IHRyYWNraW5n
IGFuZCByZXBvcnQgdGhlIG5ldyBkYXRhIHNldCwgZXZlbg0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgWC9ZIGlzIHdpdGhpbiB0aGUgcHJldmlvdXMgdHJhY2tpbmcgaW5k
ZXguDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAwIC0+IGRpc2FibGVkDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAxIC0+IDQNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDQgLT4gOA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMyAtPiAxNg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgNCAt
PiAzMg0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgNSAtPiA2NA0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgNiAtPiA5Mg0KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgNyAtPiAxMjcNCj4gPiA+IA0KPiA+ID4gVGhpcyBpcyB3aGF0IHRv
dWNoc2NyZWVuLWZ1enoteC95IGlzIGZvci4NCj4gPiANCj4gPiBUaGUgc3RtcGUgdG91Y2hjb250
cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgaGFuZGxpbmcgZWFjaCBheGlzIHNlcGFyYXRlbHkuDQo+
ID4gQWxzbyBpdCBpcyBub3QgdG8gYmUgbWlzdGFrZW4gaW4gaXRzIHNwZWNpZmljIGJlaGF2aW9y
IChpLmUuIG92ZXJyaWRlKQ0KPiA+IGZvciB0aGUgZ2VuZXJhbCBgZnV6emAgcGFyYW1ldGVyLiBI
b3dldmVyLCBzaG91bGQgSSByZW5hbWUgaXQgdG8gYHN0LGZ1enoteC15YCBvciBzaW1pbGFyPw0K
PiA+IA0KPiA+IEFGQUlDUyB0aGVyZVswXSBpcyBubyBnZW5lcmljIGNvbWJpbmVkIGRldmljZXRy
ZWUgcHJvcGVydHksIGlzIHRoZXJlPw0KPiANCj4gQ2FuJ3QgeW91IHNldCBib3RoIHByb3BlcnRp
ZXMgYW5kIHJlcXVpcmUgdGhlbSB0byBiZSB0aGUgc2FtZSB2YWx1ZT8NClRoZSBkb2N1bWVudGF0
aW9uIHdvdWxkIGhhdmUgdG8gbWVudGlvbiB0aGUgKGRldmlhdGluZykgYmVoYXZpb3IgcG9zc2li
bHkgbGlrZSBmb2xsb3dzOg0KYGBgIFRoaXMgc25pcHBldCBpcyBhZGFwdGVkIGZyb20gZWV0aS50
eHRbMF0NClRoZSBmb2xsb3dpbmcgb3B0aW9uYWwgcHJvcGVydGllcyBkZXNjcmliZWQgaW4gdG91
Y2hzY3JlZW4udHh0IGFyZQ0KYWxzbyBzdXBwb3J0ZWQ6DQoNCi0gdG91Y2hzY3JlZW4tZnV6ei14
OiBUaGlzIHZhbHVlIG5lZWRzIHRvIGJlIHRoZSBzYW1lIGFzIHRvdWNoc2NyZWVuLWZ1enoteS4N
CiAgICAgICAgICAgICAgICAgICAgICBJdCBpcyBmdXRoZXJtb3JlIGlnbm9yZWQsIGlmIHRoZSBa
LWF4aXMgaXMgYWNxdWlyZWQgdG9vIGFuZCBhbiBpbmNyZWFzZSBpbiBwcmVzc3VyZSBpcyBkZXRl
Y3RlZC4NCiAgICAgIA0KVGhlIGdpdmVuIHZhbHVlIGlzIGEgc3VtIG9mIHRoZSBkaXN0YW5jZXMg
b2YgYm90aCBheGlzLg0KLSB0b3VjaHNjcmVlbi1mdXp6LXk6IFRoaXMgdmFsdWUgbmVlZHMgdG8g
YmUgdGhlIHNhbWUgYXMgdG91Y2hzY3JlZW4tZnV6ei14Lg0KICAgICAgICAgICAgICAgICAgICAg
IEl0IGlzIGZ1dGhlcm1vcmUgaWdub3JlZCwgaWYgdGhlIFotYXhpcyBpcyBhY3F1aXJlZCB0b28g
YW5kIGFuIGluY3JlYXNlIGluIHByZXNzdXJlIGlzIGRldGVjdGVkLg0KICAgICAgICAgICAgICAg
ICAgICAgIFRoZSBnaXZlbiB2YWx1ZSBpcyBhIHN1bSBvZiB0aGUgZGlzdGFuY2VzIG9mIGJvdGgg
YXhpcy4NCmBgYA0KU2VlbXMgYSBiaXQgb2RkIHRvIGltYWdpbmUuIEhvdyB3b3VsZCB5b3Ugc3Vn
Z2VzdCB0byBpdCB0byBsb29rIGxpa2U/DQoNCg0KSXQgc2VlbXMsIHRvIG1lLCB0aGF0IGVpdGhl
ciBhIGdlbmVyYWwgY29tYmluZWQgdmFsdWUgc2hvdWxkIGJlIGludHJvZHVjZWQgb3IgdGhpcyBz
aG91bGQgYmUgbGVmdCBzdG1wZSBzcGVjaWZpYyAoZXNwZWNpYWxseSB3aGVuIGNvbnNpZGVyaW5n
IHRoZSBvdmVycmlkZSBiZWhhdmlvcikuDQoNClswXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vZWV0
aS50eHQNCg0KTGVpZg0KDQo+IA0KPiBSb2INCj4gDQo=
