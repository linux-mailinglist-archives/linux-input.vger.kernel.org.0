Return-Path: <linux-input+bounces-15532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AEBE5FBA
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C5FC422484
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 00:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D39A21C9E1;
	Fri, 17 Oct 2025 00:38:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C5B222562;
	Fri, 17 Oct 2025 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661519; cv=none; b=IG3qdhL7wZgWfWo+v4ZIm1PTlSYecdDQKRotfI5lVV4YPsyqjjVhs2rNvr2ivmx6PPu61JA3daNFkuelx9G5bgaH/Hp8kcQUiGgMMcBMpdJV6ZaUyOzHRkp8miT7eIc7d7oZeheKHMscYciKEssBzPsIpAq3saMwcEFQXuBXiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661519; c=relaxed/simple;
	bh=xhF4nHUUDM1CG0hzEIDCdJZgHkgr5tzkrUrOlG309Ks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qD8bFzRlaWzeClnkYidRWawR3a9XCKjGITMWu4D5hqcj2xpBAir4AjtotAdwhinKc4dSSZnPJ+rcV4sD4VVvWYtIfVbtYPEWIM0IRmw/CadrCdWlpWYgg9qcQK6gbwWqx+j+xibe82+ANAUZTr1O02tn5D3DS738eTxeySaf+J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: RfxWkwAhR2a5duzhcmQ2rg==
X-CSE-MsgGUID: VmOLrsSIRq+1bpXoe4DDEA==
X-IronPort-AV: E=Sophos;i="6.19,234,1754928000"; 
   d="scan'208";a="129773907"
From: =?gb2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
To: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: Benjamin Tissoires <bentiss@kernel.org>, "kenalba@google.com"
	<kenalba@google.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?gb2312?B?wO7F9A==?= <lipeng43@xiaomi.com>,
	=?gb2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2Ml0gSElEOiBoaWQt?=
 =?gb2312?B?aW5wdXQ6IG9ubHkgaWdub3JlIDAgYmF0dGVyeSBldmVudHMgZm9yIGRpZ2l0?=
 =?gb2312?Q?izers?=
Thread-Topic: [External Mail]Re: [PATCH v2] HID: hid-input: only ignore 0
 battery events for digitizers
Thread-Index: AQHcPeaJlgoeOuC85U+13WxtbainmbTFgLmn
Date: Fri, 17 Oct 2025 00:38:28 +0000
Message-ID: <c717d9d1483f4436a9ba6e4266ea4e55@xiaomi.com>
References: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>,<p7675qor-q8qp-spr8-3o6r-pp3qp42qp4q4@xreary.bet>
In-Reply-To: <p7675qor-q8qp-spr8-3o6r-pp3qp42qp4q4@xreary.bet>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSmlyaSENCldoZXJlIGNhbiBJIGZpbmQgaW5mb3JtYXRpb24gYWJvdXQgeW91ciBjb21taXRz
PyBJcyBpdCAiaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2hpZC9oaWQuZ2l0L2xvZy8/aD1mb3ItNi4xNy91cHN0cmVhbS1maXhlcyI/IFNvIGZhciwg
SSBoYXZlbid0IHNlZW4gYW55IGluZm9ybWF0aW9uIGFib3V0IHRoaXMgY29tbWl0LiBJJ2xsIG5l
ZWQgdGhpcyBpbmZvcm1hdGlvbiB3aGVuIEkgc3VibWl0IHRoaXMgY29kZSB0byBHb29nbGUncyBH
S0kuIFRoYW5rIHlvdSENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CreivP7IyzogSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5vcmc+DQq3osvNyrG85DogMjAyNcTq
MTDUwjE1yNUgMjM6MTU6MTgNCsrVvP7IyzogRG1pdHJ5IFRvcm9raG92DQqzrcvNOiBCZW5qYW1p
biBUaXNzb2lyZXM7IMKsufq66jsga2VuYWxiYUBnb29nbGUuY29tOyBsaW51eC1pbnB1dEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCtb3zOI6IFtFeHRlcm5h
bCBNYWlsXVJlOiBbUEFUQ0ggdjJdIEhJRDogaGlkLWlucHV0OiBvbmx5IGlnbm9yZSAwIGJhdHRl
cnkgZXZlbnRzIGZvciBkaWdpdGl6ZXJzDQoNClvN4rK/08q8/l0gtMvTyrz+wLTUtNPa0KHD17mr
y77N4rK/o6zH6733yfe0psDtoaPI9LbU08q8/rCyyKvQ1LTm0smjrMfrvavTyrz+16q3orj4bWlz
ZWNAeGlhb21pLmNvbb340NC3tMChDQoNCk9uIFR1ZSwgMTQgT2N0IDIwMjUsIERtaXRyeSBUb3Jv
a2hvdiB3cm90ZToNCg0KPiBDb21taXQgNTgxYzQ0ODQ3NjllICgiSElEOiBpbnB1dDogbWFwIGRp
Z2l0aXplciBiYXR0ZXJ5IHVzYWdlIikgYWRkZWQNCj4gaGFuZGxpbmcgb2YgYmF0dGVyeSBldmVu
dHMgZm9yIGRpZ2l0aXplcnMgKHR5cGljYWxseSBmb3IgYmF0dGVyaWVzDQo+IHByZXNlbnRlZCBp
biBzdHlsaWkpLiBEaWdpdGl6ZXJzIHR5cGljYWxseSByZXBvcnQgY29ycmVjdCBiYXR0ZXJ5IGxl
dmVscw0KPiBvbmx5IHdoZW4gc3R5bHVzIGlzIGFjdGl2ZWx5IHRvdWNoaW5nIHRoZSBzdXJmYWNl
LCBhbmQgaW4gb3RoZXIgY2FzZXMNCj4gdGhleSBtYXkgcmVwb3J0IGJhdHRlcnkgbGV2ZWwgb2Yg
MC4gVG8gYXZvaWQgY29uZnVzaW5nIGNvbnN1bWVycyBvZiB0aGUNCj4gYmF0dGVyeSBpbmZvcm1h
dGlvbiB0aGUgY29kZSB3YXMgYWRkZWQgdG8gZmlsZXIgb3V0IHJlcG9ydHMgd2l0aCAwDQo+IGJh
dHRlcnkgbGV2ZWxzLg0KPg0KPiBIb3dldmVyIHRoZXJlIGV4aXN0IG90aGVyIGtpbmRzIG9mIGRl
dmljZXMgdGhhdCBtYXkgbGVnaXRpbWF0ZWx5IHJlcG9ydA0KPiAwIGJhdHRlcnkgbGV2ZWxzLiBG
aXggdGhpcyBieSBmaWx0ZXJpbmcgb3V0IDAtbGV2ZWwgcmVwb3J0cyBvbmx5IGZvcg0KPiBkaWdp
dGl6ZXIgdXNhZ2VzLCBhbmQgY29udGludWUgcmVwb3J0aW5nIHRoZW0gZm9yIG90aGVyIGtpbmRz
IG9mIGRldmljZXMNCj4gKFNtYXJ0IEJhdHRlcmllcywgZXRjKS4NCj4NCj4gUmVwb3J0ZWQtYnk6
IMKsufq66iA8bHVndW9ob25nQHhpYW9taS5jb20+DQo+IEZpeGVzOiA1ODFjNDQ4NDc2OWUgKCJI
SUQ6IGlucHV0OiBtYXAgZGlnaXRpemVyIGJhdHRlcnkgdXNhZ2UiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+IC0tLQ0KPg0K
PiB2MjogcmViYXNlZCBvbiB0b3Agb2YgbGludXgtbmV4dCwgZHJvcHBlZCBUZXN0ZWQtYnk6IHRh
Zw0KDQpBcHBsaWVkLCB0aGFua3MhDQoNCi0tDQpKaXJpIEtvc2luYQ0KU1VTRSBMYWJzDQoNCiMv
KioqKioqsb7Tyrz+vLDG5Li9vP66rNPQ0KHD17mry761xLGjw9zQxc+io6y99s/e09q3osvNuPjJ
z8PmtdjWt9bQwdCz9rXEuPbIy7vyyLrX6aGjvfvWucjOus7G5Mv7yMvS1MjOus7Qzsq9yrnTw6Oo
sPzAqLWrsrvP3tPayKuyv7vysr+31rXY0LnCtqGiuLTWxqGiu/LJoreio6mxvtPKvP7W0LXE0MXP
oqGjyOe5+8T6tO3K1cHLsb7Tyrz+o6zH68T6waK8tLXnu7C78tPKvP7NqNaqt6K8/sjLsqLJvrP9
sb7Tyrz+o6EgVGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVu
dGlhbCBpbmZvcm1hdGlvbiBmcm9tIFhJQU9NSSwgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3Ig
dGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1
c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVk
aW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVw
cm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWls
IGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhKioqKioqLyMNCg==

