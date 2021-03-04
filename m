Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2405D32CB2B
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 04:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhCDDzS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 22:55:18 -0500
Received: from mail.ilitek.com ([60.251.199.109]:52819 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233192AbhCDDzQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Mar 2021 22:55:16 -0500
X-UUID: adc10bf23dc547acaee4c2e02f031f11-20210304
X-UUID: adc10bf23dc547acaee4c2e02f031f11-20210304
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1008977872; Thu, 04 Mar 2021 11:54:04 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 4 Mar 2021
 11:54:03 +0800
Received: from EX2.ili.com.tw ([fe80::89a8:5a29:1f3a:8b1f]) by EX2.ili.com.tw
 ([fe80::89a8:5a29:1f3a:8b1f%4]) with mapi id 15.01.2176.002; Thu, 4 Mar 2021
 11:54:03 +0800
From:   =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To:     Rob Herring <robh@kernel.org>
CC:     =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?= <luca_hsu@ilitek.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v4 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Topic: [PATCH v4 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Thread-Index: AQHXD0E5a5Jxy0VEwUyRnk27YImOdKpyYVUAgADTDMA=
Date:   Thu, 4 Mar 2021 03:54:03 +0000
Message-ID: <5c15b74df7a9441aaa7dd3a4ff40bca4@ilitek.com>
References: <20210302085130.2558297-1-joe_hung@ilitek.com>
 <1614813276.356288.846309.nullmailer@robh.at.kernel.org>
In-Reply-To: <1614813276.356288.846309.nullmailer@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.30.49]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGVsbG8gUm9iLA0KDQpTb3JyeSwgSSB0aGluayBJIHJhbiBkdF9iaW5kaW5fY2hlY2sgbWlzdGFr
ZW5seS4NCkVycm9yIHNob3VsZCBiZSBjb3JyZWN0ZWQgaW4gdjUgc2hvcnRseS4NCg0KT24gV2Vk
LCAwMyBNYXIgMjAyMSAxNzoxNDozNiAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFR1
ZSwgMDIgTWFyIDIwMjEgMTY6NTE6MjkgKzA4MDAsIEpvZSBIdW5nIHdyb3RlOg0KPiA+IEFkZCBi
aW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIElMSVRFSyB0b3VjaCBkZXZpY2VzLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvZSBIdW5nIDxqb2VfaHVuZ0BpbGl0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gICAtIENoYW5nZSBJUlEgZmxhZyB0byBsZXZlbCBpbnRl
cnJ1cHQNCj4gPiAgIC0gQWRkIHN1cHBvcnQgZm9yIGNvbW1vbiB0b3VjaHNjcmVlbi1yZWxhdGVk
IHByb3BlcnRpZXMNCj4gPiAgIC0gTW9kaWZ5IHJlc2V0IGdwaW8gdG8gYWN0aXZlIGxvdw0KPiA+
ICAgLSBNb2RpZnkgaXJxIHR5cGUgdG8gTEVWRUxfTE9XDQo+ID4gICAtIEFkZCBjb21wYXRpYmxl
IGZvciBMZWdvIHNlcmllcyBJQ3MNCj4gPiANCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+ICAgLSBB
ZGQgaW5jbHVkZSBoZWFkZXIgaW4gZXhhbXBsZXMsIGFuZCBwYXNzIHRoZSBkdCBiaW5kaW5nIGNo
ZWNrDQo+ID4gDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgIC0gQ29udmVydCB0byBEVCBzY2hl
bWEgZm9ybWF0DQo+ID4gICAtIFVzaW5nIGludGVycnVwdHMgaW5zdGVhZCBvZiBpcnEtZ3Bpb3MN
Cj4gPiANCj4gPiAgLi4uL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMueWFtbCAgICAg
IHwgNjggKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0
aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMueWFtbA0KPiA+IA0KPiAN
Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9u
IHlvdXIgcGF0Y2g6DQo+IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19p
MmMueWFtbDo2MDoxOiBbZXJyb3JdIHN5bnRheCBlcnJvcjogZm91bmQgY2hhcmFjdGVyICdcdCcg
dGhhdCBjYW5ub3Qgc3RhcnQgYW55IHRva2VuIChzeW50YXgpDQo+IA0KPiBkdHNjaGVtYS9kdGMg
d2FybmluZ3MvZXJyb3JzOg0KPiBtYWtlWzFdOiAqKiogRGVsZXRpbmcgZmlsZSAnRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMu
ZXhhbXBsZS5kdHMnDQo+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCj4gICBG
aWxlICIvdXNyL2xvY2FsL2Jpbi9kdC1leHRyYWN0LWV4YW1wbGUiLCBsaW5lIDQ1LCBpbiA8bW9k
dWxlPg0KPiAgICAgYmluZGluZyA9IHlhbWwubG9hZChvcGVuKGFyZ3MueWFtbGZpbGUsIGVuY29k
aW5nPSd1dGYtOCcpLnJlYWQoKSkNCj4gICBGaWxlICIvdXNyL2xvY2FsL2xpYi9weXRob24zLjgv
ZGlzdC1wYWNrYWdlcy9ydWFtZWwveWFtbC9tYWluLnB5IiwgbGluZSAzNDMsIGluIGxvYWQNCj4g
ICAgIHJldHVybiBjb25zdHJ1Y3Rvci5nZXRfc2luZ2xlX2RhdGEoKQ0KPiAgIEZpbGUgIi91c3Iv
bG9jYWwvbGliL3B5dGhvbjMuOC9kaXN0LXBhY2thZ2VzL3J1YW1lbC95YW1sL2NvbnN0cnVjdG9y
LnB5IiwgbGluZSAxMTEsIGluIGdldF9zaW5nbGVfZGF0YQ0KPiAgICAgbm9kZSA9IHNlbGYuY29t
cG9zZXIuZ2V0X3NpbmdsZV9ub2RlKCkNCj4gICBGaWxlICJfcnVhbWVsX3lhbWwucHl4IiwgbGlu
ZSA3MDYsIGluIF9ydWFtZWxfeWFtbC5DUGFyc2VyLmdldF9zaW5nbGVfbm9kZQ0KPiAgIEZpbGUg
Il9ydWFtZWxfeWFtbC5weXgiLCBsaW5lIDcyNCwgaW4gX3J1YW1lbF95YW1sLkNQYXJzZXIuX2Nv
bXBvc2VfZG9jdW1lbnQNCj4gICBGaWxlICJfcnVhbWVsX3lhbWwucHl4IiwgbGluZSA3NzUsIGlu
IF9ydWFtZWxfeWFtbC5DUGFyc2VyLl9jb21wb3NlX25vZGUNCj4gICBGaWxlICJfcnVhbWVsX3lh
bWwucHl4IiwgbGluZSA4ODksIGluIF9ydWFtZWxfeWFtbC5DUGFyc2VyLl9jb21wb3NlX21hcHBp
bmdfbm9kZQ0KPiAgIEZpbGUgIl9ydWFtZWxfeWFtbC5weXgiLCBsaW5lIDc3MywgaW4gX3J1YW1l
bF95YW1sLkNQYXJzZXIuX2NvbXBvc2Vfbm9kZQ0KPiAgIEZpbGUgIl9ydWFtZWxfeWFtbC5weXgi
LCBsaW5lIDg0OCwgaW4gX3J1YW1lbF95YW1sLkNQYXJzZXIuX2NvbXBvc2Vfc2VxdWVuY2Vfbm9k
ZQ0KPiAgIEZpbGUgIl9ydWFtZWxfeWFtbC5weXgiLCBsaW5lIDkwNCwgaW4gX3J1YW1lbF95YW1s
LkNQYXJzZXIuX3BhcnNlX25leHRfZXZlbnQNCj4gcnVhbWVsLnlhbWwuc2Nhbm5lci5TY2FubmVy
RXJyb3I6IHdoaWxlIHNjYW5uaW5nIGEgYmxvY2sgc2NhbGFyDQo+ICAgaW4gIjx1bmljb2RlIHN0
cmluZz4iLCBsaW5lIDUzLCBjb2x1bW4gNQ0KPiBmb3VuZCBhIHRhYiBjaGFyYWN0ZXIgd2hlcmUg
YW4gaW5kZW50YXRpb24gc3BhY2UgaXMgZXhwZWN0ZWQNCj4gICBpbiAiPHVuaWNvZGUgc3RyaW5n
PiIsIGxpbmUgNjAsIGNvbHVtbiAxDQo+IG1ha2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL01ha2VmaWxlOjIwOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vaWxpdGVrX3RzX2kyYy5leGFtcGxlLmR0c10gRXJyb3Ig
MQ0KPiBtYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPiAuL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtf
dHNfaTJjLnlhbWw6ICB3aGlsZSBzY2FubmluZyBhIGJsb2NrIHNjYWxhcg0KPiAgIGluICI8dW5p
Y29kZSBzdHJpbmc+IiwgbGluZSA1MywgY29sdW1uIDUNCj4gZm91bmQgYSB0YWIgY2hhcmFjdGVy
IHdoZXJlIGFuIGluZGVudGF0aW9uIHNwYWNlIGlzIGV4cGVjdGVkDQo+ICAgaW4gIjx1bmljb2Rl
IHN0cmluZz4iLCBsaW5lIDYwLCBjb2x1bW4gMQ0KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgt
ZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90b3VjaHNj
cmVlbi9pbGl0ZWtfdHNfaTJjLnlhbWw6IGlnbm9yaW5nLCBlcnJvciBwYXJzaW5nIGZpbGUNCj4g
d2FybmluZzogbm8gc2NoZW1hIGZvdW5kIGluIGZpbGU6IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMueWFtbA0KPiBtYWtl
OiAqKiogW01ha2VmaWxlOjEzODA6IGR0X2JpbmRpbmdfY2hlY2tdIEVycm9yIDINCj4gDQo+IFNl
ZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzE0NDYyNzQNCj4gDQo+IFRoaXMg
Y2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZv
ciBhIHBhdGNoDQo+IHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIG1vc3QgcmVjZW50IHJjMS4NCj4g
DQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0
IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMg
aW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5z
dGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0
Lg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoLg0KLS0NCg0KSm9lIEh1bmcNCg==

