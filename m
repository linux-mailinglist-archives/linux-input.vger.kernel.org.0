Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B6A322624
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 08:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhBWHFv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 02:05:51 -0500
Received: from mail.ilitek.com ([60.248.80.92]:44188 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229991AbhBWHFu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 02:05:50 -0500
X-UUID: 0c0bf5c8665d47b281791dc94129cb4b-20210223
X-UUID: 0c0bf5c8665d47b281791dc94129cb4b-20210223
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 2052928658; Tue, 23 Feb 2021 15:04:32 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 23 Feb
 2021 15:04:31 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Tue, 23 Feb 2021
 15:04:31 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Topic: [PATCH v3 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Index: AQHXBcGF6Xt7d3szF0eh5/I/mV/6daphjCqAgAPJFZA=
Date:   Tue, 23 Feb 2021 07:04:31 +0000
Message-ID: <9031804bb84c4b5cbb7690753cbc2ec2@ilitek.com>
References: <20210218064435.1360483-1-joe_hung@ilitek.com>
 <YDHpoReQXjOvEXoH@google.com>
In-Reply-To: <YDHpoReQXjOvEXoH@google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.53]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpNYW55IHRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQpTaG91bGQgYmUgdXBk
YXRlZCBpbiB2NCBzaG9ydGx5Lg0KDQpPbiBTYXQsIEZlYiAyMCwgMjAyMSAyMTowMzoyOVBNIC0w
ODAwLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6DQo+IEhpIEpvZSwNCj4gDQo+IE9uIFRodSwgRmVi
IDE4LCAyMDIxIGF0IDAyOjQ0OjM0UE0gKzA4MDAsIEpvZSBIdW5nIHdyb3RlOg0KPiA+IEFkZCBi
aW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIElMSVRFSyB0b3VjaCBkZXZpY2VzLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvZSBIdW5nIDxqb2VfaHVuZ0BpbGl0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gICAtIEFkZCBpbmNsdWRlIGhlYWRlciBpbiBleGFtcGxl
cywgYW5kIHBhc3MgdGhlIGR0IGJpbmRpbmcgY2hlY2sNCj4gPiANCj4gPiBDaGFuZ2VzIGluIHYy
Og0KPiA+ICAgLSBDb252ZXJ0IHRvIERUIHNjaGVtYSBmb3JtYXQNCj4gPiAgIC0gVXNpbmcgaW50
ZXJydXB0cyBpbnN0ZWFkIG9mIGlycS1ncGlvcw0KPiA+IA0KPiA+ICAuLi4vaW5wdXQvdG91Y2hz
Y3JlZW4vaWxpdGVrX3RzX2kyYy55YW1sICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4v
aWxpdGVrX3RzX2kyYy55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vaWxp
dGVrX3RzX2kyYy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjVkYTkwMjBlZDI3Mg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vaWxpdGVrX3Rz
X2kyYy55YW1sDQo+ID4gQEAgLTAsMCArMSw0NiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+
ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lucHV0L3Rv
dWNoc2NyZWVuL2lsaXRla190c19pMmMueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogSWxp
dGVrIEkyQyBUb3VjaHNjcmVlbiBDb250cm9sbGVyDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoN
Cj4gPiArICAtIERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4g
PiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06
DQo+ID4gKyAgICAgIC0gaWxpdGVrLGlsaTI1MjANCj4gPiArICAgICAgLSBpbGl0ZWssaWxpMjUx
MA0KPiA+ICsgIHJlZzoNCj4gPiArICAgIGNvbnN0OiAweDQxDQo+ID4gKyAgaW50ZXJydXB0czoN
Cj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgcmVzZXQtZ3Bpb3M6DQo+ID4gKyAgICBtYXhJ
dGVtczogMQ0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBJ
IHRoaW5rIHlvdSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHdha2V1cC1zb3VyY2UgYW5kIHZhcmlv
dXMNCj4gdG91Y2hzY3JlZW4tKiBwcm9wZXJ0aWVzIGNhbiBiZSB1c2VkIGluIHRoaXMgYmluZGlu
Zy4NCj4gDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiAr
ICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gcmVzZXQtZ3Bpb3MNCj4gPiAr
DQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiA+ICsgICAgaTJjIHsNCj4gPiArICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAg
ICAgICB0b3VjaHNjcmVlbkA0MSB7DQo+ID4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImlsaXRlayxpbGkyNTIwIjsNCj4gPiArICAgICAgICAgICAgICAgIHJlZyA9IDwweDQxPjsNCj4g
PiArICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8xPjsNCj4gPiArICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8NyBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW8xIDggR1BJT19BQ1RJVkVfSElH
SD47DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4g
PiANCj4gPiANCj4gDQo+IFRoYW5rcy4NCj4gDQo+IC0tIA0KPiBEbWl0cnkNCg0KTWFueSB0aGFu
a3MuDQoNCi0tDQpKb2UgSHVuZw0K

