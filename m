Return-Path: <linux-input+bounces-15612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8906BEEEEA
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 02:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA2F24E142A
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 00:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366B656B81;
	Mon, 20 Oct 2025 00:41:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CEDB652;
	Mon, 20 Oct 2025 00:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760920872; cv=none; b=NpL6NcQUlcfUVyt/eoSujl+ZY8BW7oGLUqhAYBK6kOVXZ27B24aTY2ASZ9jKDDDNo6ar1P+sO0/4ephjbBhKmyDO1NgxHaiPx5QJ3tvMh7fgxjfKlAavPI5y7UF/1vUC9htm5kN4BOe9r+1UV7wO7Ra2DtFXPRaeYeToP0LgfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760920872; c=relaxed/simple;
	bh=np4+VdCIYjoDgWkrRURQxL7azM8oS7+Nph68KFVuIhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PkwOG/3O9WDVU6Vz+l3fEbW5sVOJuHXoYebioROckjUUlua9CcFnuaMSTvUpvO/+L6lwUgHvipCXgu1ZBBePeLhOZhoki+zAvdk+Atkhb7g0kfZhuZkmY6HN2sxmc7tXuQC8fPfxZgbksHw/toZY7mVJq0GebZazUjMIMnsxCak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: YC6X55iFRL6o4pHcGmm1VA==
X-CSE-MsgGUID: P+78NqPvTcyp1OLC12hHdA==
X-IronPort-AV: E=Sophos;i="6.19,241,1754928000"; 
   d="scan'208";a="155764876"
From: =?gb2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benjamin Tissoires
	<bentiss@kernel.org>, "kenalba@google.com" <kenalba@google.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?wO7F9A==?= <lipeng43@xiaomi.com>, =?gb2312?B?wqy5+rrq?=
	<luguohong@xiaomi.com>
Subject: =?gb2312?B?tPC4tDogtPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2Ml0gSElE?=
 =?gb2312?B?OiBoaWQtaW5wdXQ6IG9ubHkgaWdub3JlIDAgYmF0dGVyeSBldmVudHMgZm9y?=
 =?gb2312?Q?_digitizers?=
Thread-Topic: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2Ml0gSElEOiBoaWQt?=
 =?gb2312?B?aW5wdXQ6IG9ubHkgaWdub3JlIDAgYmF0dGVyeSBldmVudHMgZm9yIGRpZ2l0?=
 =?gb2312?Q?izers?=
Thread-Index: AQHcPeaJlgoeOuC85U+13WxtbainmbTFgLmngAB5O4CABD5tZQ==
Date: Mon, 20 Oct 2025 00:40:59 +0000
Message-ID: <4b7b5b7a13fc4191a0d7c99233984e45@xiaomi.com>
References: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>,<p7675qor-q8qp-spr8-3o6r-pp3qp42qp4q4@xreary.bet>
 <c717d9d1483f4436a9ba6e4266ea4e55@xiaomi.com>,<pp809797-55r9-0os0-0n21-6990q620q788@xreary.bet>
In-Reply-To: <pp809797-55r9-0os0-0n21-6990q620q788@xreary.bet>
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

DQpUaGFuayB5b3Ugc28gbXVjaKOhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQq3orz+yMs6IEppcmkgS29zaW5hIDxqaWtvc0BrZXJuZWwub3JnPg0Kt6LLzcqxvOQ6
IDIwMjXE6jEw1MIxN8jVIDIzOjUxOjQzDQrK1bz+yMs6IMKsufq66g0Ks63LzTogRG1pdHJ5IFRv
cm9raG92OyBCZW5qYW1pbiBUaXNzb2lyZXM7IGtlbmFsYmFAZ29vZ2xlLmNvbTsgbGludXgtaW5w
dXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyDA7sX0DQrW
98ziOiBSZTogtPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2Ml0gSElEOiBoaWQtaW5w
dXQ6IG9ubHkgaWdub3JlIDAgYmF0dGVyeSBldmVudHMgZm9yIGRpZ2l0aXplcnMNCg0KW83isr/T
yrz+XSC0y9PKvP7AtNS009rQocPXuavLvs3isr+jrMfrvffJ97SmwO2ho8j0ttTTyrz+sLLIq9DU
tObSyaOsx+u9q9PKvP7XqreiuPhtaXNlY0B4aWFvbWkuY29tvfjQ0Le0wKENCg0KT24gRnJpLCAx
NyBPY3QgMjAyNSwgwqy5+rrqIHdyb3RlOg0KDQo+IFdoZXJlIGNhbiBJIGZpbmQgaW5mb3JtYXRp
b24gYWJvdXQgeW91ciBjb21taXRzPyBJcyBpdA0KPiAiaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2hpZC9oaWQuZ2l0L2xvZy8/aD1mb3ItNi4xNy91
cHN0cmVhbS1maXhlcyI/DQo+IFNvIGZhciwgSSBoYXZlbid0IHNlZW4gYW55IGluZm9ybWF0aW9u
IGFib3V0IHRoaXMgY29tbWl0LiBJJ2xsIG5lZWQgdGhpcw0KPiBpbmZvcm1hdGlvbiB3aGVuIEkg
c3VibWl0IHRoaXMgY29kZSB0byBHb29nbGUncyBHS0kuIFRoYW5rIHlvdSENCg0KVGhlIHF1ZXVl
IG9mIGZpeGVzIGZvciA2LjE4IGlzIGF0DQoNCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaGlkL2hpZC5naXQvbG9nLz9oPWZvci02LjE4L3Vw
c3RyZWFtLWZpeGVzDQoNCmFuZCBpdCdzIGp1c3Qgbm93IG9uIGl0cyB3YXkgdG8gTGludXMnIHRy
ZWU6DQoNCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaGlkL2hpZC5naXQvbG9nLz9oPWZvci1saW51cw0KDQotLQ0KSmlyaSBLb3NpbmENClNV
U0UgTGFicw0KDQojLyoqKioqKrG+08q8/rywxuS4vbz+uqzT0NChw9e5q8u+tcSxo8Pc0MXPoqOs
vfbP3tPat6LLzbj4yc/D5rXY1rfW0MHQs/a1xLj2yMu78si61+mho7371rnIzrrOxuTL+8jL0tTI
zrrO0M7Kvcq508OjqLD8wKi1q7K7z97T2sirsr+78rK/t9a12NC5wrahori01sahorvyyaK3oqOp
sb7Tyrz+1tC1xNDFz6Kho8jnufvE+rTtytXBy7G+08q8/qOsx+vE+sGivLS157uwu/LTyrz+zajW
qreivP7Iy7Kiyb6z/bG+08q8/qOhIFRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgY29u
dGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBYSUFPTUksIHdoaWNoIGlzIGludGVu
ZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVk
IGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFu
eSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRp
c2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhl
ciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJl
Y2VpdmUgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBw
aG9uZSBvciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGl0ISoqKioqKi8jDQo=

