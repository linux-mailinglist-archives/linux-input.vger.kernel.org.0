Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCEBB1139D3
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 03:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfLECWf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 21:22:35 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:55963 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728132AbfLECWf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 21:22:35 -0500
X-UUID: 09c5f15592064dd9af1468752702c9fe-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zF3v0xaTj7cC35c/2mHDLexBzEP7R6Xi6kyDMdBthps=;
        b=DSFkucxpH4GhK60eDepcWvqfgCK0vI5JjVBniqi/6vvsa1/u5jxMN9fSwG8Gbhb9E7zTYLWnfA0yHbV4EoaLKmTz7M8y9mLlqWlE+bMAgSXMYvejKFOT5rMNxi5ZnbDRdLtC34682ohYPloArbVjy+aQyxxRD5vy2njHWmycLHs=;
X-UUID: 09c5f15592064dd9af1468752702c9fe-20191205
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 684224926; Thu, 05 Dec 2019 10:22:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 10:22:16 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 10:23:13 +0800
Message-ID: <1575512548.12233.5.camel@mtkswgap22>
Subject: Re: [PATCH] Input: evdev - convert kzalloc()/vzalloc() to kvzalloc()
From:   Miles Chen <miles.chen@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Date:   Thu, 5 Dec 2019 10:22:28 +0800
In-Reply-To: <20191118054727.31045-1-miles.chen@mediatek.com>
References: <20191118054727.31045-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksDQoNCkdlbnRsZSBwaW5nLg0KDQpub3RlOg0KV2UgY2FuIGFsc28gb2JzZXJ2ZSB0aGlzIGlz
c3VlIGluIGtlcm5lbC00LjQsIGtlcm5lbC00LjksIGFuZA0Ka2VybmVsLTQuMTQuDQoNCg0KICAg
TWlsZXMNCg0KDQpPbiBNb24sIDIwMTktMTEtMTggYXQgMTM6NDcgKzA4MDAsIE1pbGVzIENoZW4g
d3JvdGU6DQo+IFdlIG9ic2VydmVkIGEgbGFyZ2Uob3JkZXItMykgYWxsb2NhdGlvbiBpbiBldmRl
dl9vcGVuKCkgYW5kIGl0IG1heQ0KPiBjYXVzZSBhbiBPT00ga2VucmVsIHBhbmljIGluIGt6YWxs
b2MoKSwgYmVmb3JlIHdlIGdldHRpbmcgdG8gdGhlDQo+IHZ6YWxsb2MoKSBmYWxsYmFjay4NCj4g
DQo+IEZpeCBpdCBieSBjb252ZXJ0aW5nIGt6YWxsb2MoKS92emFsbG9jKCkgdG8ga3Z6YWxsb2Mo
KSB0byBhdm9pZCB0aGUNCj4gT09NIGtpbGxlciBsb2dpYyBhcyB3ZSBoYXZlIGEgdm1hbGxvYyBm
YWxsYmFjay4NCj4gDQo+IElucHV0UmVhZGVyIGludm9rZWQgb29tLWtpbGxlcjogZ2ZwX21hc2s9
MHgyNDBjMmMwDQo+IChHRlBfS0VSTkVMfF9fR0ZQX05PV0FSTnxfX0dGUF9DT01QfF9fR0ZQX1pF
Uk8pLCBub2RlbWFzaz0wLCBvcmRlcj0zLA0KPiBvb21fc2NvcmVfYWRqPS05MDANCj4gLi4uDQo+
IChkdW1wX2JhY2t0cmFjZSkgZnJvbSAoc2hvd19zdGFjaysweDE4LzB4MWMpDQo+IChzaG93X3N0
YWNrKSBmcm9tIChkdW1wX3N0YWNrKzB4OTQvMHhhOCkNCj4gKGR1bXBfc3RhY2spIGZyb20gKGR1
bXBfaGVhZGVyKzB4N2MvMHhlNCkNCj4gKGR1bXBfaGVhZGVyKSBmcm9tIChvdXRfb2ZfbWVtb3J5
KzB4MzM0LzB4MzQ4KQ0KPiAob3V0X29mX21lbW9yeSkgZnJvbSAoX19hbGxvY19wYWdlc19ub2Rl
bWFzaysweGU5Yy8weGViOCkNCj4gKF9fYWxsb2NfcGFnZXNfbm9kZW1hc2spIGZyb20gKGttYWxs
b2Nfb3JkZXJfdHJhY2UrMHgzNC8weDEyOCkNCj4gKGttYWxsb2Nfb3JkZXJfdHJhY2UpIGZyb20g
KF9fa21hbGxvYysweDI1OC8weDM2YykNCj4gKF9fa21hbGxvYykgZnJvbSAoZXZkZXZfb3Blbisw
eDVjLzB4MTdjKQ0KPiAoZXZkZXZfb3BlbikgZnJvbSAoY2hyZGV2X29wZW4rMHgxMDAvMHgyMDQp
DQo+IChjaHJkZXZfb3BlbikgZnJvbSAoZG9fZGVudHJ5X29wZW4rMHgyMWMvMHgzNTQpDQo+IChk
b19kZW50cnlfb3BlbikgZnJvbSAodmZzX29wZW4rMHg1OC8weDg0KQ0KPiAodmZzX29wZW4pIGZy
b20gKHBhdGhfb3BlbmF0KzB4NjQwLzB4Yzk4KQ0KPiAocGF0aF9vcGVuYXQpIGZyb20gKGRvX2Zp
bHBfb3BlbisweDc4LzB4MTFjKQ0KPiAoZG9fZmlscF9vcGVuKSBmcm9tIChkb19zeXNfb3Blbisw
eDEzMC8weDI0NCkNCj4gKGRvX3N5c19vcGVuKSBmcm9tIChTeVNfb3BlbmF0KzB4MTQvMHgxOCkN
Cj4gKFN5U19vcGVuYXQpIGZyb20gKF9fc3lzX3RyYWNlX3JldHVybisweDAvMHgxMCkNCj4gLi4u
DQo+IE5vcm1hbDogMTI0ODgqNGtCIChVTUVIKSA2OTg0KjhrQiAoVU1FSCkgMjEwMSoxNmtCIChV
TUVIKSAwKjMya0INCj4gMCo2NGtCIDAqMTI4a0IgMCoyNTZrQiAwKjUxMmtCIDAqMTAyNGtCIDAq
MjA0OGtCIDAqNDA5NmtCID0gMTM5NDQwa0INCj4gSGlnaE1lbTogMjA2KjRrQiAoSCkgMTMxKjhr
QiAoSCkgNDIqMTZrQiAoSCkgMiozMmtCIChIKSAwKjY0a0INCj4gMCoxMjhrQiAwKjI1NmtCIDAq
NTEya0IgMCoxMDI0a0IgMCoyMDQ4a0IgMCo0MDk2a0IgPSAyNjA4a0INCj4gLi4uDQo+IEtlcm5l
bCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBPdXQgb2YgbWVtb3J5IGFuZCBubyBraWxsYWJsZSBwcm9j
ZXNzZXMuLi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pbGVzIENoZW4gPG1pbGVzLmNoZW5AbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQvZXZkZXYuYyB8IDUgKy0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2V2ZGV2LmMgYi9kcml2ZXJzL2lucHV0L2V2ZGV2LmMN
Cj4gaW5kZXggZDdkZDZmY2YyZGIwLi5jZjVkN2Q2M2ZkNDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvaW5wdXQvZXZkZXYuYw0KPiArKysgYi9kcml2ZXJzL2lucHV0L2V2ZGV2LmMNCj4gQEAgLTQ4
NCwxMCArNDg0LDcgQEAgc3RhdGljIGludCBldmRldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmaWxlICpmaWxlKQ0KPiAgCXN0cnVjdCBldmRldl9jbGllbnQgKmNsaWVudDsNCj4g
IAlpbnQgZXJyb3I7DQo+ICANCj4gLQljbGllbnQgPSBremFsbG9jKHN0cnVjdF9zaXplKGNsaWVu
dCwgYnVmZmVyLCBidWZzaXplKSwNCj4gLQkJCSBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsN
Cj4gLQlpZiAoIWNsaWVudCkNCj4gLQkJY2xpZW50ID0gdnphbGxvYyhzdHJ1Y3Rfc2l6ZShjbGll
bnQsIGJ1ZmZlciwgYnVmc2l6ZSkpOw0KPiArCWNsaWVudCA9IGt2emFsbG9jKHN0cnVjdF9zaXpl
KGNsaWVudCwgYnVmZmVyLCBidWZzaXplKSwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFjbGllbnQp
DQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQoNCg==

