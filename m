Return-Path: <linux-input+bounces-13515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD3B03B77
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 11:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAFD18833F3
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 09:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CA9242D86;
	Mon, 14 Jul 2025 09:57:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cello.ilitek.com (mail.ilitek.com.tw [60.248.80.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3A286A1;
	Mon, 14 Jul 2025 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752487022; cv=none; b=iukbiYJ5YHaRyiXgAQ0Ylre0l2sQTgJzQ6gPUTXtbcxpmN9+P8MKMYpHxIOv96+Hxn4NV1d0C+Hmif3Rmpuo88mAtFJCfemqFJEGd5WsQklT/u2iYLnFgAK2kTbFaLt35IKNqlv3Kdr+cJ6pnG+L7b1VrkFSTqnJXwvVNbjc8V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752487022; c=relaxed/simple;
	bh=ckWgDw3R9hXObxueDQVD0IGRb72umRdboYbqn2wrTJY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C3N2Q9DzX9XJQ4cf4MFCXqDn7m0knHVid3Jsaih8DgT2WBEQeOpxTU6iHMIS/ZFyVRWUXymHJcM0nFHThrflT/FMjZUGlTMIiN3LOyhmFfnhCTdLvR7PqogMdyBaY96Gvc6ZNTxeHsmr8bedPYVYkXsV5SJ75ppaSZxA942i9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ilitek.com; spf=pass smtp.mailfrom=ilitek.com; arc=none smtp.client-ip=60.248.80.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ilitek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilitek.com
X-UUID: 25fa050e609811f0a8cc29d1b46cc427-20250714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b5ea3243-9c4a-4ee0-b04f-974a43b69fce,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:fc2423df-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|110|111,TC:nil,Content:0|50,EDM:
	5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25fa050e609811f0a8cc29d1b46cc427-20250714
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
	(envelope-from <joe_hung@ilitek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1273878594; Mon, 14 Jul 2025 17:51:43 +0800
Received: from EX2.ili.com.tw (192.168.1.132) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Mon, 14 Jul
 2025 17:51:42 +0800
Received: from EX2.ili.com.tw ([fe80::c4c3:818f:1934:2a10]) by EX2.ili.com.tw
 ([fe80::c4c3:818f:1934:2a10%7]) with mapi id 15.01.2507.044; Mon, 14 Jul 2025
 17:51:42 +0800
From: =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?= <joe_hung@ilitek.com>
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"francesco.dolcini@toradex.com" <francesco.dolcini@toradex.com>,
	"emanuele.ghidoli@toradex.com" <emanuele.ghidoli@toradex.com>
CC: linux-input <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?big5?B?THVjYSBIc3UgKK59ucXB5Sk=?=
	<luca_hsu@ilitek.com>, =?big5?B?Sm9lIEh1bmcgKKx4u8q2pyk=?=
	<joe_hung@ilitek.com>
Subject: [PATCH] input: ilitek_ts_i2c: report key event for palm
Thread-Topic: [PATCH] input: ilitek_ts_i2c: report key event for palm
Thread-Index: Adv0pKcAGdMD8eJ9SN+aguAgERcaJQ==
Date: Mon, 14 Jul 2025 09:51:42 +0000
Message-ID: <b372a99d01c14d1690afba4ceedd0936@ilitek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

RnJvbSBlYzBkODAyMTRmZWU2YWNjMGIzOGYzM2FkMGI2YjQ4NzA5ODk2M2JjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogSm9lIEhvbmcgPGpvZV9odW5nQGlsaXRlay5jb20+DQpEYXRl
OiBNb24sIDE0IEp1bCAyMDI1IDE3OjIwOjExICswODAwDQpTdWJqZWN0OiBbUEFUQ0hdIGlucHV0
OiBpbGl0ZWtfdHNfaTJjOiByZXBvcnQga2V5IGV2ZW50IGZvciBwYWxtDQoNCkFkZCBzdXBwb3J0
IGZvciByZXBvcnRpbmcgdXNlci1kZWZpbmVkIGtleSBldmVudCB3aGlsZSBnZXR0aW5nIHBhbG0g
ZXZlbnQuDQoNClNpZ25lZC1vZmYtYnk6IEpvZSBIb25nIDxqb2VfaHVuZ0BpbGl0ZWsuY29tPg0K
LS0tDQogZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLmMgfCA0MiArKysr
KysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMuYyBi
L2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vaWxpdGVrX3RzX2kyYy5jDQppbmRleCAwZGQ2MzI3
MjRhMDAuLmZkY2I0YWI2NmZiYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3Jl
ZW4vaWxpdGVrX3RzX2kyYy5jDQorKysgYi9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRl
a190c19pMmMuYw0KQEAgLTM5LDggKzM5LDEzIEBADQogI2RlZmluZSBJTElURUtfVFBfSTJDX1JF
UE9SVF9JRAkJCQkweDQ4DQogDQogI2RlZmluZSBSRVBPUlRfQ09VTlRfQUREUkVTUwkJCQk2MQ0K
KyNkZWZpbmUgQUxHT19NT0RFX0FERFJFU1MJCQkJNjINCiAjZGVmaW5lIElMSVRFS19TVVBQT1JU
X01BWF9QT0lOVAkJCTQwDQogDQorc3RhdGljIHVpbnQgcGFsbV9rZXk7DQorbW9kdWxlX3BhcmFt
KHBhbG1fa2V5LCB1aW50LCAwNjY0KTsNCitNT0RVTEVfUEFSTV9ERVNDKHBhbG1fa2V5LCAiU2V0
IHBhbG0ga2V5IGNvZGUgd2hlbiBwYWxtIGlzIGRldGVjdGVkIik7DQorDQogc3RydWN0IGlsaXRl
a19wcm90b2NvbF9pbmZvIHsNCiAJdTE2IHZlcjsNCiAJdTggdmVyX21ham9yOw0KQEAgLTE3Niw2
ICsxODEsMTEgQEAgc3RhdGljIGludCBpbGl0ZWtfcHJvY2Vzc19hbmRfcmVwb3J0X3Y2KHN0cnVj
dCBpbGl0ZWtfdHNfZGF0YSAqdHMpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJfQ0KIA0KKwlpZiAo
cGFsbV9rZXkpIHsNCisJCWlucHV0X3JlcG9ydF9rZXkodHMtPmlucHV0X2RldiwgcGFsbV9rZXks
DQorCQkJCSAoYnVmW0FMR09fTU9ERV9BRERSRVNTXSAmIDB4ODApID8gMSA6IDApOw0KKwl9DQor
DQogCWNvdW50ID0gRElWX1JPVU5EX1VQKHJlcG9ydF9tYXhfcG9pbnQsIHBhY2tldF9tYXhfcG9p
bnQpOw0KIAlmb3IgKGkgPSAxOyBpIDwgY291bnQ7IGkrKykgew0KIAkJZXJyb3IgPSBpbGl0ZWtf
aTJjX3dyaXRlX2FuZF9yZWFkKHRzLCBOVUxMLCAwLCAwLA0KQEAgLTQ3Miw2ICs0ODIsOSBAQCBz
dGF0aWMgaW50IGlsaXRla19pbnB1dF9kZXZfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBpbGl0ZWtfdHNfZGF0YSAqdHMpDQogCWlucHV0LT5uYW1lID0gSUxJVEVLX1RTX05BTUU7DQog
CWlucHV0LT5pZC5idXN0eXBlID0gQlVTX0kyQzsNCiANCisJaWYgKHBhbG1fa2V5KQ0KKwkJX19z
ZXRfYml0KHBhbG1fa2V5LCBpbnB1dC0+a2V5Yml0KTsNCisNCiAJX19zZXRfYml0KElOUFVUX1BS
T1BfRElSRUNULCBpbnB1dC0+cHJvcGJpdCk7DQogDQogCWlucHV0X3NldF9hYnNfcGFyYW1zKGlu
cHV0LCBBQlNfTVRfUE9TSVRJT05fWCwNCkBAIC01MzcsOSArNTUwLDM4IEBAIHN0YXRpYyBzc2l6
ZV90IHByb2R1Y3RfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQogfQ0KIHN0YXRpYyBERVZJ
Q0VfQVRUUl9STyhwcm9kdWN0X2lkKTsNCiANCitzdGF0aWMgc3NpemVfdCBwYWxtX2tleV9zaG93
KHN0cnVjdCBkZXZpY2UgKmRldiwNCisJCQkgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLCBjaGFyICpidWYpDQorew0KKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICJwYWxtIGtleTog
WyV1XVxuIiwgcGFsbV9rZXkpOw0KK30NCisNCitzdGF0aWMgc3NpemVfdCBwYWxtX2tleV9zdG9y
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KKwkJ
CSAgICAgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGNvdW50KQ0KK3sNCisJc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsNCisJc3RydWN0IGlsaXRla190c19k
YXRhICp0cyA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KKw0KKwl1bnNpZ25lZCBsb25n
IHRtcDsNCisNCisJaWYgKGtzdHJ0b3VsKGJ1ZiwgMTAsICZ0bXApIHx8IHRtcCA+IEtFWV9NQVgp
DQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJaWYgKHBhbG1fa2V5KQ0KKwkJX19jbGVhcl9iaXQo
cGFsbV9rZXksIHRzLT5pbnB1dF9kZXYtPmtleWJpdCk7DQorDQorCV9fc2V0X2JpdCh0bXAsIHRz
LT5pbnB1dF9kZXYtPmtleWJpdCk7DQorCXBhbG1fa2V5ID0gdG1wOw0KKw0KKwlyZXR1cm4gY291
bnQ7DQorfQ0KKw0KK3N0YXRpYyBERVZJQ0VfQVRUUl9SVyhwYWxtX2tleSk7DQorDQogc3RhdGlj
IHN0cnVjdCBhdHRyaWJ1dGUgKmlsaXRla19zeXNmc19hdHRyc1tdID0gew0KIAkmZGV2X2F0dHJf
ZmlybXdhcmVfdmVyc2lvbi5hdHRyLA0KIAkmZGV2X2F0dHJfcHJvZHVjdF9pZC5hdHRyLA0KKwkm
ZGV2X2F0dHJfcGFsbV9rZXkuYXR0ciwNCiAJTlVMTA0KIH07DQogQVRUUklCVVRFX0dST1VQUyhp
bGl0ZWtfc3lzZnMpOw0KLS0gDQoyLjM0LjENCg0K


