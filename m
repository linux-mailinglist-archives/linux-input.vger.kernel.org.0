Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39212F27E6
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 06:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732166AbhALFdI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 00:33:08 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2352 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732165AbhALFdI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 00:33:08 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DFK133FdGz13fgN;
        Tue, 12 Jan 2021 13:30:47 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 12 Jan 2021 13:32:25 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 12 Jan 2021 13:32:24 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Tue, 12 Jan 2021 13:32:25 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm]  Re: [PATCH] input - mk712: fix the kernel crash while
 mk712 is selected
Thread-Topic: [Linuxarm]  Re: [PATCH] input - mk712: fix the kernel crash
 while mk712 is selected
Thread-Index: AQHW5VblkPp/l4ZUx0SCD/lXVnnB36oi9ryAgACFBqA=
Date:   Tue, 12 Jan 2021 05:32:24 +0000
Message-ID: <85cb0ffd55194388b9d5fb1b7385fe9a@hisilicon.com>
References: <20210108003527.25800-1-song.bao.hua@hisilicon.com>
 <X/0zf+n85sbXbKu+@google.com>
In-Reply-To: <X/0zf+n85sbXbKu+@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.73]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IFRvcm9raG92
IFttYWlsdG86ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgSmFu
dWFyeSAxMiwgMjAyMSA2OjI5IFBNDQo+IFRvOiBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIDxz
b25nLmJhby5odWFAaGlzaWxpY29uLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVs
Lm9yZzsgbGludXhhcm1Ab3BlbmV1bGVyLm9yZw0KPiBTdWJqZWN0OiBbTGludXhhcm1dIFJlOiBb
UEFUQ0hdIGlucHV0IC0gbWs3MTI6IGZpeCB0aGUga2VybmVsIGNyYXNoIHdoaWxlIG1rNzEyDQo+
IGlzIHNlbGVjdGVkDQo+IA0KPiBPbiBGcmksIEphbiAwOCwgMjAyMSBhdCAwMTozNToyN1BNICsx
MzAwLCBCYXJyeSBTb25nIHdyb3RlOg0KPiA+IFdoaWxlIGRlYnVnZ2luZyBvdGhlciBpc3N1ZXMs
IEkgZW5hYmxlZCBtazcxMiB0aGVuIEkgZ290IHRoZSBiZWxvdyBjcmFzaA0KPiA+IGR1cmluZyBh
cm02NCBsaW51eCBib290Og0KPiA+IFsgICAgMS4xNTA0MTJdIHBzdGF0ZTogODAwMDAwMDUgKE56
Y3YgZGFpZiAtUEFOIC1VQU8gLVRDTyBCVFlQRT0tLSkNCj4gPiBbICAgIDEuMTUwNTQxXSBwYyA6
IGxvZ2ljX291dGIrMHgzYy8weGE4DQo+ID4gWyAgICAxLjE1MDY1N10gbHIgOiBtazcxMl9pbml0
KzB4NzQvMHgxZWMNCj4gPiBbICAgIDEuMTUwNzQ1XSBzcCA6IGZmZmY4MDAwMTFlZmJkNDANCj4g
PiBbICAgIDEuMTUwOTUwXSB4Mjk6IGZmZmY4MDAwMTFlZmJkNDAgeDI4OiAwMDAwMDAwMDAwMDAw
MDAwDQo+ID4gWyAgICAxLjE1MTA5OF0geDI3OiBmZmZmODAwMDExNjgxMDc4IHgyNjogZmZmZjgw
MDAxMTVkMDRiOA0KPiA+IFsgICAgMS4xNTExOTJdIHgyNTogZmZmZjgwMDAxMTZmZjZiNCB4MjQ6
IGZmZmY4MDAwMTE1YmFjMTANCj4gPiBbICAgIDEuMTUxMjg3XSB4MjM6IGZmZmY4MDAwMTFkZmEw
MDAgeDIyOiBmZmZmODAwMDExYjhkYmUwDQo+ID4gWyAgICAxLjE1MTQyMV0geDIxOiBmZmZmODAw
MDExZWFjMDAwIHgyMDogMDAwMDAwMDAwMDAwMDAwMA0KPiA+IFsgICAgMS4xNTE1MjddIHgxOTog
ZmZmZmZiZmZmZTgwMDI2NiB4MTg6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiBbICAgIDEuMTUxNjc0
XSB4MTc6IGZmZmY4MDAwMTBhN2JjMzggeDE2OiBmZmZmODAwMDEwYTdiMGUwDQo+ID4gWyAgICAx
LjE1MTk0NF0geDE1OiAwMDAwYTBkNjY1ZTdlZTU4IHgxNDogMDAwMDAwMDAwMDAwMDExYQ0KPiA+
IFsgICAgMS4xNTIwNjBdIHgxMzogMDAwMDAwMDAwMDAwMDAwMSB4MTI6IDAwMDAwMDAwMDAwMDAw
MDANCj4gPiBbICAgIDEuMTUyMTQ5XSB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAwMDAw
MDAwMDAwYTYwDQo+ID4gWyAgICAxLjE1MjI5MV0geDkgOiAwMDAwMDAwMDAwMDAwMDAwIHg4IDog
ZmZmZjAwMDBjMGEyYTQ4MA0KPiA+IFsgICAgMS4xNTI0MjldIHg3IDogMDAwMDAwMDAwMDAwMDAw
MCB4NiA6IGZmZmYwMDAwYzBiMGM5YjgNCj4gPiBbICAgIDEuMTUyNTIyXSB4NSA6IDAwMDAwMDAw
MDAwMDEwMDAgeDQgOiBmZmZmMDAwMGMwMzYxM2IwDQo+ID4gWyAgICAxLjE1MjYxNF0geDMgOiAw
MDAwMDAwMDAwMDAwMjY3IHgyIDogMDAwMDAwMDAwMDAwMDI2MA0KPiA+IFsgICAgMS4xNTI3MzFd
IHgxIDogZmZmZmZiZmZmZTgwMDAwMCB4MCA6IDAwMDAwMDAwMDBmZmJmZmUNCj4gPiBbICAgIDEu
MTUzMTM1XSBDYWxsIHRyYWNlOg0KPiA+IFsgICAgMS4xNTMzNDJdICBsb2dpY19vdXRiKzB4M2Mv
MHhhOA0KPiA+IFsgICAgMS4xNTM0MzRdICBtazcxMl9pbml0KzB4NzQvMHgxZWMNCj4gPiBbICAg
IDEuMTUzNTcxXSAgZG9fb25lX2luaXRjYWxsKzB4NTQvMHgxYjgNCj4gPiBbICAgIDEuMTUzNzA1
XSAga2VybmVsX2luaXRfZnJlZWFibGUrMHgxZDAvMHgyMzgNCj4gPiBbICAgIDEuMTUzODYwXSAg
a2VybmVsX2luaXQrMHgxNC8weDExOA0KPiA+IFsgICAgMS4xNTM5NjBdICByZXRfZnJvbV9mb3Jr
KzB4MTAvMHgzMA0KPiA+IFsgICAgMS4xNTQzMDRdIENvZGU6IGQyYmZkMDAxIGYyZGY3ZmUxIGYy
ZmZmZmUxIDhiMDEwMjczICgzOTAwMDI3NCkNCj4gPiBbICAgIDEuMTU1MDEzXSAtLS1bIGVuZCB0
cmFjZSBmOWIxNTdjMzExZDIwZWRkIF0tLS0NCj4gPiBbICAgIDEuMTU1ODU0XSBLZXJuZWwgcGFu
aWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCENCj4gZXhpdGNvZGU9MHgw
MDAwMDAwYg0KPiA+IFsgICAgMS4xNTYyMzZdIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMN
Cj4gPg0KPiA+IFRoZSBkcml2ZXIgaXMgdmVyeSBvbGQgYW5kIHJlc291cmNlcyBhcmUgdG90YWxs
eSBoYXJkY29kZWQsIG5vIGJ1cyBtb2RlbC4NCj4gPiBJdCBzZWVtcyB0aGUgc2ltcGxlc3Qgd2F5
IHRvIGZpeCB0aGlzIGlzc3VlIGlzIGRpc2FibGluZyBpdCBieSBwYXJhbWV0ZXIuDQo+ID4gSWYg
c29tZW9uZSByZWFsbHkgbmVlZHMgdGhlIG9sZCBkcml2ZXIsIGl0IHNob3VsZCBlbmFibGUgdGhl
IHBhcmFtZXRlcg0KPiA+IGJ5IGNtZGxpbmUuDQo+IA0KPiBJIHdvbmRlciBpZiB3ZSBhcmUgbm90
IGJldHRlciBvZmYgc2ltcGx5IHJlbW92aW5nIHRoZSBkcml2ZXIuIEkgZG91YnQNCj4gdGhlcmUg
YXJlIGFueSAiR2F0ZXdheSBBT0wgQ29ubmVjdGVkIFRvdWNocGFkIGNvbXB1dGVycyBsZWZ0LCBl
c3BlY2lhbGx5DQo+IG9uZXMgdGhhdCBydW4gNS54IGtlcm5lbHMuDQoNCg0KU2FtZSBoZXJlLiBP
bmNlIGEgcGxhdGZvcm0gc2VsZWN0cyB0aGlzIGRyaXZlciwgdGhlIHBsYXRmb3JtIHdpbGwgY3Jh
c2ggZHVyaW5nDQpib290LiBJdCBzZWVtcyB3ZSBoYXZlIG5vIHdheSB0byBzdG9wIHVzZXJzIGZy
b20gc2VsZWN0aW5nIGl0IGluIEtjb25maWcuDQoNClRoYW5rcw0KQmFycnkNCg0K
