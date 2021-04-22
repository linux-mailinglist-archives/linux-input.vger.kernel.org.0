Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B378367EB8
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 12:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbhDVKgR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 06:36:17 -0400
Received: from mail.ilitek.com.tw ([60.248.80.92]:50101 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235810AbhDVKgQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 06:36:16 -0400
X-UUID: 403fd36c74a14baea1fe7450dc3dfbf6-20210422
X-UUID: 403fd36c74a14baea1fe7450dc3dfbf6-20210422
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1925279029; Thu, 22 Apr 2021 18:30:39 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 Apr
 2021 18:30:37 +0800
Received: from EX1.ili.com.tw ([fe80::b4c1:326d:b115:6052]) by EX1.ili.com.tw
 ([fe80::b4c1:326d:b115:6052%8]) with mapi id 15.01.2242.004; Thu, 22 Apr 2021
 18:30:37 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>
Subject: RE: [RESEND v7 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Thread-Topic: [RESEND v7 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Thread-Index: AQHXNNq7nU4GZlH9T0mK0/JUP5S+s6q98cYAgAJM3hA=
Date:   Thu, 22 Apr 2021 10:30:37 +0000
Message-ID: <c6b70b8e98fd4648bfdaf940f4b1576b@ilitek.com>
References: <20210419051325.147314-1-joe_hung@ilitek.com>
 <20210419051325.147314-2-joe_hung@ilitek.com> <YH+6vHUf12roZPP+@google.com>
In-Reply-To: <YH+6vHUf12roZPP+@google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.97]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGVsbG8gRG1pdHJ5LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHksIGFncmVlZCBvbiB5b3Vy
IGNvbW1lbnRzLg0KDQpJIGRpZG4ndCBub3RpY2UgdGhlIHBhdGNoZXMgeW91IGFwcGxpZWQgYmVm
b3JlLg0KUGxlYXNlIGlnbm9yZWQgdGhlIFBBVENIIHY4LCBJIGp1c3QgbWFpbGVkLg0KDQpBcHBy
ZWNpYXRlIHlvdXIgdGltZSwgdGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KT24gVHVlLCBBcHIgMjAs
IDIwMjEgYXQgMjI6NDA6MTJQTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOg0KPiBIaSBK
b2UsDQo+IA0KPiBPbiBNb24sIEFwciAxOSwgMjAyMSBhdCAwMToxMzoyNVBNICswODAwLCBKb2Ug
SHVuZyB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgSUxJVEVLIExlZ28gc2VyaWVzIG9mIHRv
dWNoIGRldmljZXMuDQo+ID4gTGVnbyBzZXJpZXMgaW5jbHVkZXMgSUxJVEVLIDIxM1gvMjNYWC8y
NVhYLg0KPiA+IA0KPiA+IFRlc3RlZC9wYXNzZWQgd2l0aCBldmFsdWF0aW9uIGJvYXJkIHdpdGgg
SUxJMjUyMC8yMzIyIElDLg0KPiANCj4gU29ycnksIEkgbWVhbiB0byBzZW5kIHRoZSBlbWFpbCBl
YXJsaWVyLCBidXQgSSBkaWQgYXBwbHkgdGhlIHBhdGNoZXMNCj4gd2l0aCBzb21lIG1pbm9yIGZv
cm1hdHRpbmcgY2hhbmdlcyBhbmQgLi4uDQo+IA0KPiA+ICsNCj4gPiArCS8qIFNpbmdsZSB0b3Vj
aCBpbnB1dCBzZXR1cCAqLw0KPiA+ICsJaW5wdXRfc2V0X2Fic19wYXJhbXMoaW5wdXQsIEFCU19Y
LCB0cy0+c2NyZWVuX21pbl94LA0KPiA+ICsJCQkgICAgIHRzLT5zY3JlZW5fbWF4X3gsIDAsIDAp
Ow0KPiA+ICsJaW5wdXRfc2V0X2Fic19wYXJhbXMoaW5wdXQsIEFCU19ZLCB0cy0+c2NyZWVuX21p
bl95LA0KPiA+ICsJCQkgICAgIHRzLT5zY3JlZW5fbWF4X3ksIDAsIDApOw0KPiANCj4gWW91IGRv
IG5vdCBuZWVkIHRvIHNldCB1cCBzaW5nbGUtYXhpcyBhcyAuLi4NCj4gDQo+ID4gKw0KPiA+ICsJ
LyogTXVsdGktdG91Y2ggaW5wdXQgc2V0dXAgKi8NCj4gPiArCWlucHV0X3NldF9hYnNfcGFyYW1z
KGlucHV0LCBBQlNfTVRfUE9TSVRJT05fWCwNCj4gPiArCQkJICAgICB0cy0+c2NyZWVuX21pbl94
LA0KPiA+ICsJCQkgICAgIHRzLT5zY3JlZW5fbWF4X3gsIDAsIDApOw0KPiA+ICsJaW5wdXRfc2V0
X2Fic19wYXJhbXMoaW5wdXQsIEFCU19NVF9QT1NJVElPTl9ZLA0KPiA+ICsJCQkgICAgIHRzLT5z
Y3JlZW5fbWluX3ksDQo+ID4gKwkJCSAgICAgdHMtPnNjcmVlbl9tYXhfeSwgMCwgMCk7DQo+ID4g
Kw0KPiA+ICsJdG91Y2hzY3JlZW5fcGFyc2VfcHJvcGVydGllcyhpbnB1dCwgdHJ1ZSwgJnRzLT5w
cm9wKTsNCj4gPiArDQo+ID4gKwllcnJvciA9IGlucHV0X210X2luaXRfc2xvdHMoaW5wdXQsIHRz
LT5tYXhfdHAsDQo+ID4gKwkJCQkgICAgSU5QVVRfTVRfRElSRUNUIHwgSU5QVVRfTVRfRFJPUF9V
TlVTRUQpOw0KPiANCj4gdGhpcyB3aWxsIGRvIGl0IGZvciB5b3UuDQo+IA0KPiBUaGFua3MuDQo+
IA0KPiAtLSANCj4gRG1pdHJ5DQoNCi0tDQpKb2UgSHVuZw0K

