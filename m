Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9735508FB
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 12:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbfFXKdT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 06:33:19 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:54343 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfFXKdT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 06:33:19 -0400
X-IronPort-AV: E=Sophos;i="5.63,411,1557180000"; 
   d="scan'208";a="2040921"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 24 Jun 2019 12:33:16 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x5OAWqsc023339;
        Mon, 24 Jun 2019 12:32:55 +0200
Received: from SUMMBX01.UMK.KLS.zentral ([172.25.1.64]) by
 SUMMAIL01.UMK.KLS.zentral ([172.25.1.63]) with mapi id 14.03.0439.000; Mon,
 24 Jun 2019 12:33:09 +0200
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
Thread-Index: AQHVFKZfWxtzY275Mkuldb4w1Urs/KabiWYAgAdXhICAACBQAIAHpDkA
Date:   Mon, 24 Jun 2019 10:33:12 +0000
Message-ID: <8b9d362f16b817e828b774c6ac6532c6f2efb821.camel@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
         <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
         <20190614194818.GA22146@bogus>
         <b1f40349dced90ea2ab0c9e5dc528db883e62e8d.camel@klsmartin.com>
         <CAL_JsqLrMk9yNAzHWCgOFaOqnHKiwSjLOfbhU5+DzLCNBD+H_w@mail.gmail.com>
In-Reply-To: <CAL_JsqLrMk9yNAzHWCgOFaOqnHKiwSjLOfbhU5+DzLCNBD+H_w@mail.gmail.com>
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
Content-ID: <2ED71AB4C8924248A52584C5413D964D@klsmartin.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QW0gTWl0dHdvY2gsIGRlbiAxOS4wNi4yMDE5LCAwNzo1MSAtMDYwMCBzY2hyaWViIFJvYiBIZXJy
aW5nOg0KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA1OjU2IEFNIE1pZGRlbHNjaHVsdGUsIExl
aWYNCj4gPA0KPiBMZWlmLk1pZGRlbHNjaHVsdGVAa2xzbWFydGluLmNvbQ0KPiA+IHdyb3RlOg0K
PiA+IEFtIEZyZWl0YWcsIGRlbiAxNC4wNi4yMDE5LCAxMzo0OCAtMDYwMCBzY2hyaWViIFJvYiBI
ZXJyaW5nOg0KPiA+ID4gT24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDY6MDc6MjdQTSArMDIwMCwg
TGVpZiBNaWRkZWxzY2h1bHRlIHdyb3RlOg0KPiA+ID4gPiBUaGUgU1RNUEU4MTEgaXMgYWJsZSB0
byBvbmx5IG1vbml0b3IgYSBzdWJ3aW5kb3cgb2YgdGhlDQo+ID4gPiA+IGVudGlyZSBzY3JlZW4u
IFRvdWNoZXMgb3V0c2lkZSBvZiB0aGlzIHdpbmRvdyBhcmUgbmVnbGVjdGVkLg0KPiA+ID4gPiBU
aGlzIGNoYW5nZSBhZGRzIHRoZSBjb3JyZXNwb25kaW5nIGRvY3VtZW50YXRpb24uDQo+ID4gPiAN
Cj4gPiA+IFVubGVzcyB5b3UgYXJlIHRyeWluZyB0byBqdXN0IGZpbHRlciBvdXQgdGhlIGVkZ2Ug
dmFsdWVzDQo+ID4gDQo+ID4gSSdtIHRyeWluZyB0byAianVzdCBmaWx0ZXIgb3V0IHRoZSBlZGdl
IHZhbHVlcyIgYnkgZmlsdGVyaW5nIHRoZSB2YWx1ZXMNCj4gPiByaWdodCBvbiB0aGUgc21wdGUg
bWljcm9jb250cm9sbGVyLiBJdCBpcyBhIGRldmljZSBzcGVjaWZpYyBmZWF0dXJlLCB0aGF0IGlz
DQo+ID4gd2h5IEkgaW1wbGVtZW50ZWQgYW5kIGRvY3VtZW50ZWQgdGhlIHN1cHBvcnQuDQo+ID4g
DQo+ID4gQnV0IHN1cmUsIG9uZSBjb3VsZCBsZWF2ZSB0aGF0IHRvIGEgY29ycmVzcG9uZGluZyBl
bnRyeSBpbiB0aGUgaHdkYiB0aGF0DQo+ID4gd291bGQgbWFuaXB1bGF0ZSBhYnNpbmZvIHRvIGdh
aW4gY2FsaWJyYXRlZCBpbnB1dCBbMV0uDQo+ID4gDQo+ID4gPiB3aGljaCBJIHRoaW5rIHdlIGFs
cmVhZHkgaGF2ZSBwcm9wZXJ0aWVzIGZvciwNCj4gPiANCj4gPiBXaGlsZSB0aGVyZSBbMF0gaXMg
InRvdWNoc2NyZWVuLW1pbi17eCx5fSIsIEkgY291bGQgbm90IHNwb3QgYSBjb3JyZXNwb25kaW5n
DQo+ID4gInRvdWNoc2NyZWVuLW1heC17eCx5fSIuIENvdWxkIHlvdSBwb2ludCBtZSB0byB0aGUg
cmlnaHQgcHJvcGVydHk/DQo+IA0KPiBQZXJoYXBzIGFkZCB0aGVtLiBJZiB3ZSBoYXZlIG1pbiwg
YWRkaW5nIGEgbWF4IHNlZW1zIGxvZ2ljYWwuDQpUaGVyZSBhcmUgYHRvdWNoc2NyZWVuLXNpemUt
eGAgYW5kIGB0b3VjaHNjcmVlbi1zaXplLXlgLCB3aGljaCBhcmUgZGVzY3JpYmVkWzBdIGFzDQoi
aG9yaXpvbnRhbCByZXNvbHV0aW9uIG9mIHRvdWNoc2NyZWVuIChtYXhpbXVtIHggY29vcmRpbmF0
ZSByZXBvcnRlZCArIDEpIg0KDQpUaGUgcG90ZW50aWFsbHkgbWlzbGVhZGluZyBwcm9wZXJ0eSBu
YW1lIGFzaWRlLCB0aGUgZ2VuZXJhbA0KaW1wbGVtZW50YXRpb24gaW4gb2ZfdG91Y2hzY3JlZW4u
Y1sxXSBhcHBsaWVzIGl0IGFzIG1heGltdW0gdmFsdWUuDQpJdCBpcyBub3QgYXBwbGllZCBhcyBy
ZXNvbHV0aW9uIGFzIGluIHRoZSBjb250ZXh0IG9mIGlucHV0IGRldmljZXNbMl0uDQoNClNvIGhl
cmUgYXJlIHRoZSBvcHRpb25zOg0KIEEpIEkgZ28gd2l0aCBgdG91Y2hzY3JlZW4tbWluLXt4LHl9
YCBmb3IgbWluaW11bSB2YWx1ZXMgYW5kDQogICAgYHRvdWNoc2NyZWVuLXNpemUte3gseX1gIGZv
ciBtYXhpbXVtIHZhbHVlcy4NCiBCKSBEZXByZWNhdGUgYHRvdWNoc2NyZWVuLXNpemUte3gseX1g
IGZvciBuYW1lZCByZWFzb25zIGFuZA0KICAgIGludHJvZHVjZSBgdG91Y2hzY3JlZW4tbWF4LXt4
LHl9YC4NCg0KSW4gbXkgY2FzZSwgSSBkbyBuZWVkIHRvIHNldCB0aGUgcmVzb2x1dGlvbiB0b28g
dGhvdWdoLg0KDQpTbywgYW5vdGhlciBxdWVzdGlvbiB3b3VsZCBiZSBob3cgdG8gZ28gYWJvdXQg
aGFuZGxpbmcgdGhlIHJlc29sdXRpb246DQogSSkgSW50cm9kdWNpbmcgYW4gZXhwbGljaXQgcmVz
b2x1dGlvbiB0dXBsZT8gVGhpcyB3b3VsZCBiZSBiYWQNCiAgICBiZWNhdXNlIG9mIG11bHRpcGxl
IGludmFsaWQgY29uc3RlbGF0aW9ucy4NCiBJSSkgSW1wbGljaXRseSBhcHBseWluZyBhIHJlc29s
dXRpb24gaWYgYSBjb3Jyc3BvbmRpbmcNCiAgICAgYHRvdWNoc2NyZWVuLXt4LHl9LW1tYCBpcyBw
cm92aWRlZCB0b28uIFRoaXMgYXBwcm9hY2ggd291bGQgY2hhbmdlDQogICAgIGJlaGF2aW9yIHRo
b3VnaC4NCg0KDQpbMF0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3RvdWNoc2NyZWVuLnR4dA0KWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vb2ZfdG91Y2hzY3JlZW4u
Yz9oPXY1LjItcmM2I244MQ0KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2luY2x1ZGUvdWFwaS9saW51eC9p
bnB1dC5oI245NQ0KDQpMZWlmDQoNCj4gDQo+IFJvYg0KPiANCg==
