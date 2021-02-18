Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5AB31E668
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 07:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhBRGoa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 01:44:30 -0500
Received: from mail.ilitek.com.tw ([60.248.80.92]:35802 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230356AbhBRGn4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 01:43:56 -0500
X-UUID: 5bff7317fc42452e8f88364af8636b0a-20210218
X-UUID: 5bff7317fc42452e8f88364af8636b0a-20210218
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1386561797; Thu, 18 Feb 2021 14:42:06 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 18 Feb
 2021 14:42:05 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Thu, 18 Feb 2021
 14:42:05 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Rob Herring <robh@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Index: AQHXBPf9PybegLxGyEe8+VhgKrSsdqpcRdeAgAEx+mA=
Date:   Thu, 18 Feb 2021 06:42:05 +0000
Message-ID: <602435815397464fafdaca7d1a353a83@ilitek.com>
References: <20210217064155.126173-1-joe_hung@ilitek.com>
 <1613593491.484171.2681064.nullmailer@robh.at.kernel.org>
In-Reply-To: <1613593491.484171.2681064.nullmailer@robh.at.kernel.org>
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

SGVsbG8gUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVwbHkuDQpBbHJlYWR5IGZvdW5k
IHRoZSByZWFzb24sIGFuZCBwYXNzZWQgdGhlIGNoZWNrLg0KU2hvdWxkIHVwZGF0ZSBhbmQgcmUt
c3VibWl0IGluIHYzLg0KDQpPbiBXZWQsIDE3IEZlYiAyMDIxIDE0OjQxOjU0ICswODAwLCBKb2Ug
SHVuZyB3cm90ZToNCj4gQWRkIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgSUxJVEVLIHRvdWNo
IGRldmljZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgSHVuZyA8am9lX2h1bmdAaWxpdGVr
LmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAgLSBDb252ZXJ0IGJpbmRpbmdzIGZp
bGUgdG8gRFQgc2NoZW1hIGZvcm1hdA0KPiAgIC0gVXNpbmcgaW50ZXJydXB0cyBpbnN0ZWFkIG9m
IGlycS1ncGlvcw0KPiANCj4gIC4uLi9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLnlh
bWwgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NSBp
bnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMueWFtbA0KPiANCg0K
TXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlv
dXIgcGF0Y2g6DQoNCnlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCg0KZHRzY2hlbWEvZHRjIHdh
cm5pbmdzL2Vycm9yczoNCkVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW5wdXQvdG91Y2hzY3JlZW4vaWxpdGVrX3RzX2kyYy5leGFtcGxlLmR0czoyOC40NS00NiBzeW50
YXggZXJyb3INCkZBVEFMIEVSUk9SOiBVbmFibGUgdG8gcGFyc2UgaW5wdXQgdHJlZQ0KbWFrZVsx
XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmxpYjozNDQ6IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLmV4YW1wbGUuZHQueWFt
bF0gRXJyb3IgMQ0KbWFrZTogKioqIFtNYWtlZmlsZToxMzcwOiBkdF9iaW5kaW5nX2NoZWNrXSBF
cnJvciAyDQoNClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzE0NDExODEN
Cg0KVGhpcyBjaGVjayBjYW4gZmFpbCBpZiB0aGVyZSBhcmUgYW55IGRlcGVuZGVuY2llcy4gVGhl
IGJhc2UgZm9yIGEgcGF0Y2gNCnNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIG1vc3QgcmVjZW50IHJj
MS4NCg0KSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRu
J3Qgc2VlIHRoZSBhYm92ZQ0KZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMg
aW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCmRhdGU6DQoNCnBpcDMgaW5zdGFsbCBk
dHNjaGVtYSAtLXVwZ3JhZGUNCg0KUGxlYXNlIGNoZWNrIGFuZCByZS1zdWJtaXQuDQoNCg==

