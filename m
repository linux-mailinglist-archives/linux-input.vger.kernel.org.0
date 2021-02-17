Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3617831D56B
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 07:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhBQGkR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 01:40:17 -0500
Received: from mail.ilitek.com.tw ([60.248.80.92]:54466 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231383AbhBQGkR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 01:40:17 -0500
X-UUID: 04ca3f8035984a2a8662e6be1e16209a-20210217
X-UUID: 04ca3f8035984a2a8662e6be1e16209a-20210217
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1458632520; Wed, 17 Feb 2021 14:32:59 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 17 Feb
 2021 14:32:58 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Wed, 17 Feb 2021
 14:32:58 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Rob Herring <robh@kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>,
        =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
Subject: RE: [RESEND PATCH 1/2] dt-bindings: input: touchscreen:
 ilitek_ts_i2c: Add bindings
Thread-Topic: [RESEND PATCH 1/2] dt-bindings: input: touchscreen:
 ilitek_ts_i2c: Add bindings
Thread-Index: AQHW+vK0ZhZ25rjYLEigOGid97xiQKpRhCcAgApxfFA=
Date:   Wed, 17 Feb 2021 06:32:58 +0000
Message-ID: <edfc6f354bbe435a95407b9bbd2f89f8@ilitek.com>
References: <20210204123902.18813-1-joe_hung@ilitek.com>
 <20210210225718.GA2971881@robh.at.kernel.org>
In-Reply-To: <20210210225718.GA2971881@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgUm9iLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3OyBhZ3JlZWQgb24gYWxsIGNvbW1l
bnRzLg0KU2hvdWxkIGFkZHJlc3MgeW91ciBmZWVkYmFjayBpbiB2Mi4NCg0KT24gVGh1LCBGZWIg
MDQsIDIwMjEgYXQgMDg6Mzk6MDFQTSArMDgwMCwgSm9lIEh1bmcgd3JvdGU6DQo+IEFkZCBiaW5k
aW5nIGRvY3VtZW50YXRpb24gZm9yIElMSVRFSyB0b3VjaCBkZXZpY2VzLg0KDQpCaW5kaW5ncyBh
cmUgaW4gRFQgc2NoZW1hIGZvcm1hdCBub3cuIFBsZWFzZSBjb252ZXJ0Lg0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2UgSHVuZyA8am9lX2h1bmdAaWxpdGVrLmNvbT4NCj4gLS0tDQo+ICAuLi4v
aW5wdXQvdG91Y2hzY3JlZW4vaWxpdGVrX3RzX2kyYy50eHQgICAgICAgfCAyMyArKysrKysrKysr
KysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3Vj
aHNjcmVlbi9pbGl0ZWtfdHNfaTJjLnR4dA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9p
bGl0ZWtfdHNfaTJjLnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwMDAuLmViOTBkM2JkN2VlNw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLnR4
dA0KPiBAQCAtMCwwICsxLDIzIEBADQo+ICtJbGl0ZWsgSTJDIDIzWFgvMjVYWC9MZWdvIFNlcmll
cyBUb3VjaCBJQ3MNCj4gKw0KPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gKy0gY29tcGF0aWJs
ZQkJOiBNdXN0IGJlIGVxdWFsIHRvIG9uZSBvZiBmb2xsb3dpbmc6DQo+ICsJCQkgICJpbGl0ZWss
aWxpMjUyMCINCj4gKwkJCSAgImlsaXRlayxpbGkyNTEwIg0KPiArLSByZWcJCQk6IEkyQyBzbGF2
ZSBhZGRyZXNzIGZvciB0b3VjaCBkZXZpY2UuDQo+ICstIHJlc2V0LWdwaW9zCQk6IEdQSU8gb3V0
cHV0IGhpZ2ggdG8gcmVzZXQgcGluIG9mIHRvdWNoIGRldmljZS4NCj4gKy0gaXJxLWdwaW9zCQk6
IEdQSU8gYXMgYWN0aXZlIGxvdyBpbnB1dCBmcm9tIHRvdWNoIGlycSBwaW4uDQoNClVzZSAnaW50
ZXJydXB0cycgaW5zdGVhZC4NCg0KPiArDQo+ICtFeGFtcGxlOg0KPiArCSZpMmMxIHsNCj4gKwkJ
LyogLi4uICovDQo+ICsNCj4gKwkJdG91Y2hzY3JlZW5ANDEgew0KPiArCQkJY29tcGF0aWJsZSA9
ICJpbGl0ZWssaWxpMjUyMCI7DQo+ICsJCQlyZWcgPSA8MHg0MT47DQo+ICsJCQlpcnEtZ3Bpb3Mg
PSA8JmdwaW8xIDEzIDA+Ow0KPiArCQkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8xIDE0IEdQSU9fQUNU
SVZFX0hJR0g+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCS8qIC4uLiAqLw0KPiArCX07DQo+IC0tIA0K
PiAyLjI1LjENCj4gDQo+IA0K

