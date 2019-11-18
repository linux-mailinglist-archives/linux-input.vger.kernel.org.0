Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE52EFFE1C
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 06:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfKRFre (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 00:47:34 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:61530 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725816AbfKRFre (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 00:47:34 -0500
X-UUID: ee90d34a165a443a8d730f19011d0a9d-20191118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NlWDv9SeYsgi2iRUgyMRzJCtwYNFcrKvnRskCn7RxFw=;
        b=HUV8LWcEufP3lgh09H4dCiX+4K0hRxp3bJ/Dw+nSRccYU0KBjKIfvG+vtmWYU+rR+gCIuiz4wIugjDYN/USwG55arzRspi98G27k3+dGN/JS647FsfQ0TpQomdBMSgbHx6JYapYWPcr1PTwRztB++WgARTUhlr9bMzijZ5sIeAM=;
X-UUID: ee90d34a165a443a8d730f19011d0a9d-20191118
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 667588555; Mon, 18 Nov 2019 13:47:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 18 Nov 2019 13:47:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 18 Nov 2019 13:47:37 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] Input: evdev - convert kzalloc()/vzalloc() to kvzalloc()
Date:   Mon, 18 Nov 2019 13:47:27 +0800
Message-ID: <20191118054727.31045-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

V2Ugb2JzZXJ2ZWQgYSBsYXJnZShvcmRlci0zKSBhbGxvY2F0aW9uIGluIGV2ZGV2X29wZW4oKSBh
bmQgaXQgbWF5DQpjYXVzZSBhbiBPT00ga2VucmVsIHBhbmljIGluIGt6YWxsb2MoKSwgYmVmb3Jl
IHdlIGdldHRpbmcgdG8gdGhlDQp2emFsbG9jKCkgZmFsbGJhY2suDQoNCkZpeCBpdCBieSBjb252
ZXJ0aW5nIGt6YWxsb2MoKS92emFsbG9jKCkgdG8ga3Z6YWxsb2MoKSB0byBhdm9pZCB0aGUNCk9P
TSBraWxsZXIgbG9naWMgYXMgd2UgaGF2ZSBhIHZtYWxsb2MgZmFsbGJhY2suDQoNCklucHV0UmVh
ZGVyIGludm9rZWQgb29tLWtpbGxlcjogZ2ZwX21hc2s9MHgyNDBjMmMwDQooR0ZQX0tFUk5FTHxf
X0dGUF9OT1dBUk58X19HRlBfQ09NUHxfX0dGUF9aRVJPKSwgbm9kZW1hc2s9MCwgb3JkZXI9MywN
Cm9vbV9zY29yZV9hZGo9LTkwMA0KLi4uDQooZHVtcF9iYWNrdHJhY2UpIGZyb20gKHNob3dfc3Rh
Y2srMHgxOC8weDFjKQ0KKHNob3dfc3RhY2spIGZyb20gKGR1bXBfc3RhY2srMHg5NC8weGE4KQ0K
KGR1bXBfc3RhY2spIGZyb20gKGR1bXBfaGVhZGVyKzB4N2MvMHhlNCkNCihkdW1wX2hlYWRlcikg
ZnJvbSAob3V0X29mX21lbW9yeSsweDMzNC8weDM0OCkNCihvdXRfb2ZfbWVtb3J5KSBmcm9tIChf
X2FsbG9jX3BhZ2VzX25vZGVtYXNrKzB4ZTljLzB4ZWI4KQ0KKF9fYWxsb2NfcGFnZXNfbm9kZW1h
c2spIGZyb20gKGttYWxsb2Nfb3JkZXJfdHJhY2UrMHgzNC8weDEyOCkNCihrbWFsbG9jX29yZGVy
X3RyYWNlKSBmcm9tIChfX2ttYWxsb2MrMHgyNTgvMHgzNmMpDQooX19rbWFsbG9jKSBmcm9tIChl
dmRldl9vcGVuKzB4NWMvMHgxN2MpDQooZXZkZXZfb3BlbikgZnJvbSAoY2hyZGV2X29wZW4rMHgx
MDAvMHgyMDQpDQooY2hyZGV2X29wZW4pIGZyb20gKGRvX2RlbnRyeV9vcGVuKzB4MjFjLzB4MzU0
KQ0KKGRvX2RlbnRyeV9vcGVuKSBmcm9tICh2ZnNfb3BlbisweDU4LzB4ODQpDQoodmZzX29wZW4p
IGZyb20gKHBhdGhfb3BlbmF0KzB4NjQwLzB4Yzk4KQ0KKHBhdGhfb3BlbmF0KSBmcm9tIChkb19m
aWxwX29wZW4rMHg3OC8weDExYykNCihkb19maWxwX29wZW4pIGZyb20gKGRvX3N5c19vcGVuKzB4
MTMwLzB4MjQ0KQ0KKGRvX3N5c19vcGVuKSBmcm9tIChTeVNfb3BlbmF0KzB4MTQvMHgxOCkNCihT
eVNfb3BlbmF0KSBmcm9tIChfX3N5c190cmFjZV9yZXR1cm4rMHgwLzB4MTApDQouLi4NCk5vcm1h
bDogMTI0ODgqNGtCIChVTUVIKSA2OTg0KjhrQiAoVU1FSCkgMjEwMSoxNmtCIChVTUVIKSAwKjMy
a0INCjAqNjRrQiAwKjEyOGtCIDAqMjU2a0IgMCo1MTJrQiAwKjEwMjRrQiAwKjIwNDhrQiAwKjQw
OTZrQiA9IDEzOTQ0MGtCDQpIaWdoTWVtOiAyMDYqNGtCIChIKSAxMzEqOGtCIChIKSA0MioxNmtC
IChIKSAyKjMya0IgKEgpIDAqNjRrQg0KMCoxMjhrQiAwKjI1NmtCIDAqNTEya0IgMCoxMDI0a0Ig
MCoyMDQ4a0IgMCo0MDk2a0IgPSAyNjA4a0INCi4uLg0KS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IE91dCBvZiBtZW1vcnkgYW5kIG5vIGtpbGxhYmxlIHByb2Nlc3Nlcy4uLg0KDQpTaWduZWQt
b2ZmLWJ5OiBNaWxlcyBDaGVuIDxtaWxlcy5jaGVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvaW5wdXQvZXZkZXYuYyB8IDUgKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2V2ZGV2LmMg
Yi9kcml2ZXJzL2lucHV0L2V2ZGV2LmMNCmluZGV4IGQ3ZGQ2ZmNmMmRiMC4uY2Y1ZDdkNjNmZDQ4
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pbnB1dC9ldmRldi5jDQorKysgYi9kcml2ZXJzL2lucHV0
L2V2ZGV2LmMNCkBAIC00ODQsMTAgKzQ4NCw3IEBAIHN0YXRpYyBpbnQgZXZkZXZfb3BlbihzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkNCiAJc3RydWN0IGV2ZGV2X2NsaWVu
dCAqY2xpZW50Ow0KIAlpbnQgZXJyb3I7DQogDQotCWNsaWVudCA9IGt6YWxsb2Moc3RydWN0X3Np
emUoY2xpZW50LCBidWZmZXIsIGJ1ZnNpemUpLA0KLQkJCSBHRlBfS0VSTkVMIHwgX19HRlBfTk9X
QVJOKTsNCi0JaWYgKCFjbGllbnQpDQotCQljbGllbnQgPSB2emFsbG9jKHN0cnVjdF9zaXplKGNs
aWVudCwgYnVmZmVyLCBidWZzaXplKSk7DQorCWNsaWVudCA9IGt2emFsbG9jKHN0cnVjdF9zaXpl
KGNsaWVudCwgYnVmZmVyLCBidWZzaXplKSwgR0ZQX0tFUk5FTCk7DQogCWlmICghY2xpZW50KQ0K
IAkJcmV0dXJuIC1FTk9NRU07DQogDQotLSANCjIuMTguMA0K

