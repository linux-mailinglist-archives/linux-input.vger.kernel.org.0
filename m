Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1517332068
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 09:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhCIIVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Mar 2021 03:21:54 -0500
Received: from mail.ilitek.com ([211.72.159.213]:34971 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229515AbhCIIVq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Mar 2021 03:21:46 -0500
X-UUID: 0490fee1abe34da9a67f3318c0c7acd1-20210309
X-UUID: 0490fee1abe34da9a67f3318c0c7acd1-20210309
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 2046096492; Tue, 09 Mar 2021 16:21:31 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 9 Mar 2021
 16:21:30 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Tue, 9 Mar 2021
 16:21:30 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Rob Herring <robh@kernel.org>
CC:     =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Topic: [PATCH v5 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Index: AQHXELs9PgS+TEFot0ejaiTtLG+k7qp6B2+AgAFQ7UA=
Date:   Tue, 9 Mar 2021 08:21:30 +0000
Message-ID: <8f8577d7aed143fda0e9f940b1bc48ba@ilitek.com>
References: <20210304055724.63695-1-joe_hung@ilitek.com>
 <20210308201329.GA2886497@robh.at.kernel.org>
In-Reply-To: <20210308201329.GA2886497@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.44]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGVsbG8gUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgdGltZSBhbmQgcmV2aWV3Lg0KU2hvdWxkIHVw
ZGF0ZSBpbiB2NiBzaG9ydGx5Lg0KDQo+IE9uIFRodSwgMDQgTWFyIDIwMjEgMTM6NTc6MjMgKzA4
MDAsIEpvZSBIdW5nIHdyb3RlOg0KPiA+IEFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIElM
SVRFSyB0b3VjaCBkZXZpY2VzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBIdW5nIDxq
b2VfaHVuZ0BpbGl0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjU6DQo+ID4gICAt
IFJlbW92ZSB0YWIgaW4geWFtbA0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gICAtIENo
YW5nZSBJUlEgZmxhZyB0byBsZXZlbCBpbnRlcnJ1cHQNCj4gPiAgIC0gQWRkIHN1cHBvcnQgZm9y
IGNvbW1vbiB0b3VjaHNjcmVlbi1yZWxhdGVkIHByb3BlcnRpZXMNCj4gPiAgIC0gTW9kaWZ5IHJl
c2V0IGdwaW8gdG8gYWN0aXZlIGxvdw0KPiA+ICAgLSBNb2RpZnkgaXJxIHR5cGUgdG8gTEVWRUxf
TE9XDQo+ID4gICAtIEFkZCBjb21wYXRpYmxlIGZvciBMZWdvIHNlcmllcyBJQ3MNCj4gPiANCj4g
PiBDaGFuZ2VzIGluIHYzOg0KPiA+ICAgLSBBZGQgaW5jbHVkZSBoZWFkZXIgaW4gZXhhbXBsZXMs
IGFuZCBwYXNzIHRoZSBkdCBiaW5kaW5nIGNoZWNrDQo+ID4gDQo+ID4gQ2hhbmdlcyBpbiB2MjoN
Cj4gPiAgIC0gQ29udmVydCB0byBEVCBzY2hlbWEgZm9ybWF0DQo+ID4gICAtIFVzaW5nIGludGVy
cnVwdHMgaW5zdGVhZCBvZiBpcnEtZ3Bpb3MNCj4gPiANCj4gPiAgLi4uL2lucHV0L3RvdWNoc2Ny
ZWVuL2lsaXRla190c19pMmMueWFtbCAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2ls
aXRla190c19pMmMueWFtbA0KPiA+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+DQoNCkpvZSBIb25nDQo=

