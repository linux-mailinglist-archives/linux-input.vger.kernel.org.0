Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B522F3DEE
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 01:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390180AbhALVz0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 16:55:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2330 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732381AbhALVzW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 16:55:22 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DFklq2KDQz67RjJ;
        Wed, 13 Jan 2021 05:50:47 +0800 (CST)
Received: from lhreml726-chm.china.huawei.com (10.201.108.77) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 12 Jan 2021 22:54:38 +0100
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 lhreml726-chm.china.huawei.com (10.201.108.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 12 Jan 2021 21:54:38 +0000
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Wed, 13 Jan 2021 05:54:36 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     John Garry <john.garry@huawei.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        Daniel Quinlan <quinlan@pathname.com>,
        Vojtech Pavlik <vojtech@suse.cz>
Subject: RE: [Linuxarm] [PATCH v2] input - mk712: remove the driver as it is
 obsolete and causes kernel crash
Thread-Topic: [Linuxarm] [PATCH v2] input - mk712: remove the driver as it is
 obsolete and causes kernel crash
Thread-Index: AQHW6Ke3syLQaE0JUUyxTeMVB5BbzaojSzsAgAE6y+A=
Date:   Tue, 12 Jan 2021 21:54:36 +0000
Message-ID: <1758f0370ffc46499077d4e261dbde53@hisilicon.com>
References: <20210112055129.7840-1-song.bao.hua@hisilicon.com>
 <7094caf0-4faf-4958-e1cf-fdf1d2a8cec9@huawei.com>
In-Reply-To: <7094caf0-4faf-4958-e1cf-fdf1d2a8cec9@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9obiBHYXJyeQ0KPiBT
ZW50OiBUdWVzZGF5LCBKYW51YXJ5IDEyLCAyMDIxIDExOjU1IFBNDQo+IFRvOiBTb25nIEJhbyBI
dWEgKEJhcnJ5IFNvbmcpIDxzb25nLmJhby5odWFAaGlzaWxpY29uLmNvbT47DQo+IGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb207IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGlu
dXhhcm1Ab3BlbmV1bGVyLm9yZzsgRGFuaWVsIFF1aW5sYW4gPHF1aW5sYW5AcGF0aG5hbWUuY29t
PjsgVm9qdGVjaA0KPiBQYXZsaWsgPHZvanRlY2hAc3VzZS5jej4NCj4gU3ViamVjdDogUmU6IFtM
aW51eGFybV0gW1BBVENIIHYyXSBpbnB1dCAtIG1rNzEyOiByZW1vdmUgdGhlIGRyaXZlciBhcyBp
dCBpcw0KPiBvYnNvbGV0ZSBhbmQgY2F1c2VzIGtlcm5lbCBjcmFzaA0KPiANCj4gT24gMTIvMDEv
MjAyMSAwNTo1MSwgQmFycnkgU29uZyB3cm90ZToNCj4gPiBXaGlsZSBkZWJ1Z2dpbmcgb3RoZXIg
aXNzdWVzLCBJIGVuYWJsZWQgbWs3MTIgdGhlbiBJIGdvdCB0aGUgYmVsb3cgY3Jhc2gNCj4gPiBk
dXJpbmcgYXJtNjQgbGludXggYm9vdDoNCj4gPiBbICAgIDEuMTUwNDEyXSBwc3RhdGU6IDgwMDAw
MDA1IChOemN2IGRhaWYgLVBBTiAtVUFPIC1UQ08gQlRZUEU9LS0pDQo+ID4gWyAgICAxLjE1MDU0
MV0gcGMgOiBsb2dpY19vdXRiKzB4M2MvMHhhOA0KPiA+IFsgICAgMS4xNTA2NTddIGxyIDogbWs3
MTJfaW5pdCsweDc0LzB4MWVjDQo+ID4gWyAgICAxLjE1MDc0NV0gc3AgOiBmZmZmODAwMDExZWZi
ZDQwDQo+ID4gWyAgICAxLjE1MDk1MF0geDI5OiBmZmZmODAwMDExZWZiZDQwIHgyODogMDAwMDAw
MDAwMDAwMDAwMA0KPiA+IFsgICAgMS4xNTEwOThdIHgyNzogZmZmZjgwMDAxMTY4MTA3OCB4MjY6
IGZmZmY4MDAwMTE1ZDA0YjgNCj4gPiBbICAgIDEuMTUxMTkyXSB4MjU6IGZmZmY4MDAwMTE2ZmY2
YjQgeDI0OiBmZmZmODAwMDExNWJhYzEwDQo+ID4gWyAgICAxLjE1MTI4N10geDIzOiBmZmZmODAw
MDExZGZhMDAwIHgyMjogZmZmZjgwMDAxMWI4ZGJlMA0KPiA+IFsgICAgMS4xNTE0MjFdIHgyMTog
ZmZmZjgwMDAxMWVhYzAwMCB4MjA6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiBbICAgIDEuMTUxNTI3
XSB4MTk6IGZmZmZmYmZmZmU4MDAyNjYgeDE4OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gWyAgICAx
LjE1MTY3NF0geDE3OiBmZmZmODAwMDEwYTdiYzM4IHgxNjogZmZmZjgwMDAxMGE3YjBlMA0KPiA+
IFsgICAgMS4xNTE5NDRdIHgxNTogMDAwMGEwZDY2NWU3ZWU1OCB4MTQ6IDAwMDAwMDAwMDAwMDAx
MWENCj4gPiBbICAgIDEuMTUyMDYwXSB4MTM6IDAwMDAwMDAwMDAwMDAwMDEgeDEyOiAwMDAwMDAw
MDAwMDAwMDAwDQo+ID4gWyAgICAxLjE1MjE0OV0geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDog
MDAwMDAwMDAwMDAwMGE2MA0KPiA+IFsgICAgMS4xNTIyOTFdIHg5IDogMDAwMDAwMDAwMDAwMDAw
MCB4OCA6IGZmZmYwMDAwYzBhMmE0ODANCj4gPiBbICAgIDEuMTUyNDI5XSB4NyA6IDAwMDAwMDAw
MDAwMDAwMDAgeDYgOiBmZmZmMDAwMGMwYjBjOWI4DQo+ID4gWyAgICAxLjE1MjUyMl0geDUgOiAw
MDAwMDAwMDAwMDAxMDAwIHg0IDogZmZmZjAwMDBjMDM2MTNiMA0KPiA+IFsgICAgMS4xNTI2MTRd
IHgzIDogMDAwMDAwMDAwMDAwMDI2NyB4MiA6IDAwMDAwMDAwMDAwMDAyNjANCj4gPiBbICAgIDEu
MTUyNzMxXSB4MSA6IGZmZmZmYmZmZmU4MDAwMDAgeDAgOiAwMDAwMDAwMDAwZmZiZmZlDQo+ID4g
WyAgICAxLjE1MzEzNV0gQ2FsbCB0cmFjZToNCj4gPiBbICAgIDEuMTUzMzQyXSAgbG9naWNfb3V0
YisweDNjLzB4YTgNCj4gPiBbICAgIDEuMTUzNDM0XSAgbWs3MTJfaW5pdCsweDc0LzB4MWVjDQo+
ID4gWyAgICAxLjE1MzU3MV0gIGRvX29uZV9pbml0Y2FsbCsweDU0LzB4MWI4DQo+ID4gWyAgICAx
LjE1MzcwNV0gIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWQwLzB4MjM4DQo+ID4gWyAgICAxLjE1
Mzg2MF0gIGtlcm5lbF9pbml0KzB4MTQvMHgxMTgNCj4gPiBbICAgIDEuMTUzOTYwXSAgcmV0X2Zy
b21fZm9yaysweDEwLzB4MzANCj4gPiBbICAgIDEuMTU0MzA0XSBDb2RlOiBkMmJmZDAwMSBmMmRm
N2ZlMSBmMmZmZmZlMSA4YjAxMDI3MyAoMzkwMDAyNzQpDQo+ID4gWyAgICAxLjE1NTAxM10gLS0t
WyBlbmQgdHJhY2UgZjliMTU3YzMxMWQyMGVkZCBdLS0tDQo+ID4gWyAgICAxLjE1NTg1NF0gS2Vy
bmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhDQo+IGV4aXRj
b2RlPTB4MDAwMDAwMGINCj4gPiBbICAgIDEuMTU2MjM2XSBTTVA6IHN0b3BwaW5nIHNlY29uZGFy
eSBDUFVzDQo+ID4NCj4gPiBUaGUgZHJpdmVyIGlzIHZlcnkgb2xkIGFuZCByZXNvdXJjZXMgYXJl
IHRvdGFsbHkgaGFyZGNvZGVkLCBubyBidXMgbW9kZWwuDQo+ID4gQW5kIGl0IHNlZW1zIHRoZXJl
IGlzIG5vIHdheSB0byBzdG9wIHVzZXJzIGZyb20gZW5hYmxpbmcgaXQgaW4gS2NvbmZpZy4NCj4g
PiBQbHVzLCBpdCBpcyBsaWtlbHkgdGhhdCB0aGVyZSBpcyBubyAiR2F0ZXdheSBBT0wgQ29ubmVj
dGVkIFRvdWNocGFkDQo+ID4gY29tcHV0ZXJzIiBydW5uaW5nIDUueCBrZXJuZWwgYW55IG1vcmUu
IFNvIHJlbW92ZSB0aGlzIGRyaXZlci4NCj4gPg0KPiA+IENjOiBEYW5pZWwgUXVpbmxhbjxxdWlu
bGFuQHBhdGhuYW1lLmNvbT4NCj4gPiBDYzogVm9qdGVjaCBQYXZsaWs8dm9qdGVjaEBzdXNlLmN6
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnJ5IFNvbmc8c29uZy5iYW8uaHVhQGhpc2lsaWNvbi5j
b20+DQo+IA0KPiBKRllJLCB0aGlzIGlzIGEgY29tbW9uIHByb2JsZW0gZm9yIG1hbnkgSU8gcG9y
dCBkcml2ZXJzIG9uIGFyY2hpdGVjdHVyZXMNCj4gd2hpY2ggZG9uJ3QgbmF0aXZlbHkgc3VwcG9y
dCBJTyBwb3J0cywgbGlrZSBhcm02NCBhbmQgcG93ZXJwYy4gU29tZQ0KPiBkcml2ZXJzIGd1YXJk
IGFnYWluc3QgaXQgc2ltcGx5IGJ5IGRlcGVuZGluZyBvbiAhQVJDSF9YWFgsIGxpa2U6DQo+IA0K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9kcg0KPiBpdmVycy9od21vbi9LY29uZmlnP2g9djUuMTEtcmMzI241
NTENCj4gDQo+IEJ1dCBub3QgYSBncmVhdCBzb2x1dGlvbi4NCg0KWWVwLiBJdCBsb29rcyBidWdn
eSBhcyBwb3dlcnBjIGFuZCBhcm02NCBjb3VsZCBoYXZlIHRoZSBkZXZpY2UgbGl0ZXJhbGx5DQp0
aG91Z2ggcHJhY3RpY2FsbHkgcGVvcGxlIG1pZ2h0IG5vdCB1c2UgdGhlbS4NCg0KPiANCj4gSSB0
cmllZCB0byBndWFyZCBhZ2FpbnN0IGl0IGluIHRoaXMgc2VyaWVzLCBidXQgbmV2ZXIgZ290IGl0
IG92ZXIgdGhlIGxpbmU6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8xNTYw
MjYyMzc0LTY3ODc1LTEtZ2l0LXNlbmQtZW1haWwtam9obi5nDQo+IGFycnlAaHVhd2VpLmNvbS8N
Cg0KQ29vbC4gSSBkaWRuJ3QgcmVhbGl6ZSB5b3UgaGF2ZSB0cmllZCB0byBmaWd1cmUgb3V0IGEg
cGF0Y2hzZXQNCnRvIGZpeCBpdCBpbiBjb21tb24gY29kZS4gSXQgc2VlbXMgaXQgaXMgd29ydGgg
cmV2aXNpdGluZyB0aGUNCnBhdGNoc2V0Pw0KDQo+IA0KPiBUaGFua3MsDQo+IEpvaG4NCg0KVGhh
bmtzDQpCYXJyeQ0K
