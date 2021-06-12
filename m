Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2693A4D08
	for <lists+linux-input@lfdr.de>; Sat, 12 Jun 2021 07:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhFLFyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Jun 2021 01:54:09 -0400
Received: from mail.ilitek.com ([60.248.80.92]:41766 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230095AbhFLFyI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Jun 2021 01:54:08 -0400
X-UUID: 262bdf1980d34c6ba79c3e8786eb79c0-20210612
X-UUID: 262bdf1980d34c6ba79c3e8786eb79c0-20210612
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1790632648; Sat, 12 Jun 2021 13:52:03 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 12 Jun
 2021 13:52:01 +0800
Received: from EX1.ili.com.tw ([fe80::a0a2:6b83:b4ce:7ab1]) by EX1.ili.com.tw
 ([fe80::a0a2:6b83:b4ce:7ab1%8]) with mapi id 15.01.2242.004; Sat, 12 Jun 2021
 13:52:01 +0800
From:   =?utf-8?B?Sm9lIEh1bmcgKOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
To:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?utf-8?B?THVjYSBIc3UgKOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: RE: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
Thread-Topic: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
Thread-Index: AQHXXslRFmrcUvyaMUGTGc+sD7d/e6sOVjMAgABDyACAAAKmgIAANxwAgAEGmbA=
Date:   Sat, 12 Jun 2021 05:52:01 +0000
Message-ID: <b30e65d0847949b497c635dd1d5035ac@ilitek.com>
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
 <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
 <CAMuHMdXE0kipUm6wqHsrFurFkviU_nRJJB7cg6z1XwEvpEewGQ@mail.gmail.com>
 <YMOsRzfDnZ/iApwD@google.com> <9d901eb1-6408-6b4f-1377-03c394d440c4@denx.de>
In-Reply-To: <9d901eb1-6408-6b4f-1377-03c394d440c4@denx.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.9.252]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgTWFyZWssDQoNCkknbSB0aGUgY29tbWl0dGVyIG9mICJpbGl0ZWtfdHNfaTJjLmMiIGRyaXZl
ci4NClRoZSBzby1jYWxsZWQgIkxlZ28iIHNlcmllcyB3YXMgbGlzdGVkIGJlbG93LCBhcyBsaXN0
ZWQgaW4gaWxpdGVrX3RzX2kyYy55YW1sDQpJdCdzIHRoZSBuZXdlciBzZXJpZXMgd2l0aCBkaWZm
ZXJlbnQgcHJvdG9jb2wgYW5kIGNvbnRyb2wgZmxvdyB0byBJTElURUsgSUMgRlcuDQoNCi0gaWxp
dGVrLGlsaTIxMzANCi0gaWxpdGVrLGlsaTIxMzENCi0gaWxpdGVrLGlsaTIxMzINCi0gaWxpdGVr
LGlsaTIzMTYNCi0gaWxpdGVrLGlsaTIzMjINCi0gaWxpdGVrLGlsaTIzMjMNCi0gaWxpdGVrLGls
aTIzMjYNCi0gaWxpdGVrLGlsaTI1MjANCi0gaWxpdGVrLGlsaTI1MjENCg0KPiBUaGUgb2xkZXIg
ZHJpdmVyIGFsc28gc3VwcG9ydHMgMjUxeCAuIFdoYXQgZXhhY3RseSBpcyAiTGVnbyIgc2VyaWVz
ID8NCk1vcmUgc3BlY2lmaWNhbGx5LCBMZWdvIHNlcmllcyBzdXBwb3J0ICIyNTJ4Iiwgbm90ICIy
NTEwIi4NClRoZSBvbGRlciBkcml2ZXIgc3VwcG9ydCAyMTB4IGFuZCAyNTF4LCB3aGljaCBoYXMg
b2xkZXIgcHJvdG9jb2wuDQoNCj4gSW4gZmFjdCwgaXMgdGhlcmUgZG9jdW1lbnRhdGlvbiBmb3Ig
dGhlIGRpZmZlcmVudCBJTEkyeHh4IHRvdWNoc2NyZWVuIGNvbnRyb2xsZXJzID8gU28gZmFyLCBh
bGwgdGhlIGluZm9ybWF0aW9uIEkgaGFkIHdhcyBwdWxsZWQgZnJvbSB0aGUgdmFyaW91cyBmb3Jr
cyBvZiBkb3duc3RyZWFtIGV4YW1wbGUgY29kZS4NCklmIGl0IG5lZWQgZm9yIGEgZG9jLiB0byBk
aXN0aW5ndWlzaCBpdCwgSSBhbSBnbGFkIHRvIHN1cHBvcnQvYXJyYW5nZSwgYW5kIHdoZXJlIHNo
b3VsZCBJIHB1dCB0aG9zZSBkZXNjcmlwdGlvbiB0byA/DQoNCkJlc3QgcmVnYXJkcywNCg0KSm9l
IEhvbmcNCklMSSBURUNITk9MT0dZIENPUlAuDQpURUw6ICs4ODYtMy01NjAwMDk5IGV4dC42MTM4
DQpFbWFpbDogam9lX2h1bmdAaWxpdGVrLmNvbQ0KOEYuLCBOby4xLCBUYWl5dWFuIDJuZCBTdC4s
IFpodWJlaSBDaXR5LCBIc2luY2h1IENvdW50cnkgMzAyLCBUYWl3YW4gKFIuTy5DLikNCg==

