Return-Path: <linux-input+bounces-14003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38758B26124
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 11:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF26189BAA6
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 09:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAACF2FD7D7;
	Thu, 14 Aug 2025 09:30:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A0D2FD1D4;
	Thu, 14 Aug 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163824; cv=none; b=ULZS4FetJdYcL/vVT6g/NXQOOAPO984euH17ZQz35lgTxTAiUm731VdeXfs/LLFdvYvmhUz0xLk+t1/j/6Px5YU/AiowJULplkdcnY8xH3Wh7JHm7mAEMk1cN4VHe8fvpZR0IJ+v7bcoqdUF0kib396bKwzGLPagBdupanHm0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163824; c=relaxed/simple;
	bh=oAv4khhixX7rgl9LeDM66Sqj/mt7su23eFC/twsrkTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uD7AGq4zqjyebJyoV0vu3A0RPeZ+C0LOrZ0lNmteRcmGiiRVv3dD0cyWrppRA60413sxklbckHgkVHTVfBSNBVPNoC+eStUvTW/KFZGe/i+KL9h0y28maIufSlC/9WJUvTAGruwHdizSmQCDYzQ9w+u0sD+qFG92nsQ9ymOCva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: x57VMXEGSwqeqhVAQgHV4Q==
X-CSE-MsgGUID: DZYZCTcbQk2av5mijUA8/g==
X-IronPort-AV: E=Sophos;i="6.17,287,1747670400"; 
   d="scan'208";a="149241492"
From: =?gb2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
To: Jiri Kosina <jikos@kernel.org>, =?gb2312?B?Sm9zqKYgRXhwqK5zaXRv?=
	<jose.exposito89@gmail.com>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?gb2312?B?RmVpMSBKaWFuZyC9r7fJ?=
	<jiangfei1@xiaomi.com>, "tkjos@google.com" <tkjos@google.com>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2MiAyLzJdIEhJRDog?=
 =?gb2312?B?aW5wdXQ6IHJlcG9ydCBiYXR0ZXJ5IHN0YXR1cyBjaGFuZ2VzIGltbWVkaWF0?=
 =?gb2312?Q?ely?=
Thread-Topic: [External Mail]Re: [PATCH v2 2/2] HID: input: report battery
 status changes immediately
Thread-Index: AQHcCrXbrGKdcLZC0kSUAM9u6AlyFrReLnjCgAO2gDo=
Date: Thu, 14 Aug 2025 09:30:14 +0000
Message-ID: <53cecfd5c34c4f109d4ad1b5e4e7a955@xiaomi.com>
References: <20250806073944.5310-1-jose.exposito89@gmail.com>
 <20250806073944.5310-2-jose.exposito89@gmail.com>,<4q4qn3p8-6s3s-289n-44s2-43s76qrs2oo4@xreary.bet>,<6c923b9403bb45988f211cae45e4f748@xiaomi.com>
In-Reply-To: <6c923b9403bb45988f211cae45e4f748@xiaomi.com>
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

DQpIZWxsbywgSm9zqKYgYW5kIEppcmkhDQpXaGVuIHdpbGwgdGhpcyBISUQgcGF0Y2ggYmUgbWVy
Z2VkIGludG8gdGhlIExpbnV4IG1haW5saW5lPyBXZSBhcmUgbG9va2luZyBmb3J3YXJkIHRvIHVz
aW5nIHRoaXMgZmVhdHVyZSwgc28gcGxlYXNlIGhlbHAgdXMgcHVzaCBpdCBmb3J3YXJkISBUaGFu
ayB5b3UgdmVyeSBtdWNoIQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQq3orz+yMs6IMKsufq66g0Kt6LLzcqxvOQ6IDIwMjXE6jjUwjEyyNUgODo0NA0KytW8/sjL
OiBKaXJpIEtvc2luYTsgSm9zqKYgRXhwqK5zaXRvDQqzrcvNOiBiZW50aXNzQGtlcm5lbC5vcmc7
IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgRmVpMSBKaWFuZyC9r7fJOyDCrLn6uuoNCtb3zOI6ILTwuLQ6IFtFeHRlcm5hbCBNYWlsXVJl
OiBbUEFUQ0ggdjIgMi8yXSBISUQ6IGlucHV0OiByZXBvcnQgYmF0dGVyeSBzdGF0dXMgY2hhbmdl
cyBpbW1lZGlhdGVseQ0KDQpIZWxsbywgSmlyaSENCg0KTm93YWRheXMsIHRoZXJlIGFyZSBtb3Jl
IGFuZCBtb3JlIEhJRCBkZXZpY2VzIGNvbm5lY3RlZCB0byBBbmRyb2lkIGFuZCBMaW51eCBkZXZp
Y2VzLiBGb3IgZXhhbXBsZSwgd2UgaGF2ZSBhbHJlYWR5IHJlYWNoZWQgdGhlIHRoaXJkIGdlbmVy
YXRpb24gb2YgY29udHJvbGxlcnMsIGEgSElEIGRldmljZS4gSW4gZWFjaCBnZW5lcmF0aW9uLCB3
ZSBuZWVkIHRvIHJlcG9ydCB0aGUgY2hhcmdpbmcgc3RhdHVzIG9mIHRoZSBjb250cm9sbGVyLCBh
IEhJRCBkZXZpY2UsIHRvIHRoZSBBbmRyb2lkIHBob25lLiBPbmx5IHRoZW4gY2FuIHRoZSBwaG9u
ZSBrbm93IHRoZSBjaGFyZ2luZyBzdGF0dXMgb2YgdGhlIEhJRCBkZXZpY2UuIEJhc2VkIG9uIHRo
aXMgY2hhcmdpbmcgc3RhdHVzLCB0aGUgcGhvbmUgY2FuIGRldGVybWluZSB0aGUgUEQgZmFzdCBj
aGFyZ2luZyBsb2dpYyBhbmQgaG93IHRvIHByb2NlZWQuIEluIGFkZGl0aW9uIHRvIHVzLCBvdGhl
ciBtb2JpbGUgcGhvbmUgbWFudWZhY3R1cmVycywgc3VjaCBhcyBWSVZPLCBoYXZlIGFsc28gbWFk
ZSBzZXZlcmFsIGdlbmVyYXRpb25zIG9mIGNvbnRyb2xsZXJzLiBXZSBhbHNvIGVuY291bnRlcmVk
IHRoaXMgcHJhY3RpY2FsIHByb2JsZW0gaW4gdGhlIHByb2Nlc3Mgb2YgbWFraW5nIHRoZSBjb250
cm9sbGVyLCBzbyB3ZSByYWlzZWQgdGhpcyBpc3N1ZSB3aXRoIHlvdS4gT3VyIHNvbHV0aW9uIGlz
IGFsc28gYmFzZWQgb24gdGhlIEhJRCBwcm90b2NvbC4gVGhhbmsgeW91IQ0KDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEppcmkgS29zaW5hIDxqaWtvc0BrZXJu
ZWwub3JnPg0Kt6LLzcqxvOQ6IDIwMjXE6jjUwjExyNUgMTk6NDgNCsrVvP7IyzogSm9zqKYgRXhw
qK5zaXRvDQqzrcvNOiBiZW50aXNzQGtlcm5lbC5vcmc7IMKsufq66jsgbGludXgtaW5wdXRAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQrW98ziOiBbRXh0ZXJu
YWwgTWFpbF1SZTogW1BBVENIIHYyIDIvMl0gSElEOiBpbnB1dDogcmVwb3J0IGJhdHRlcnkgc3Rh
dHVzIGNoYW5nZXMgaW1tZWRpYXRlbHkNCg0KW83isr/Tyrz+XSC0y9PKvP7AtNS009rQocPXuavL
vs3isr+jrMfrvffJ97SmwO2ho8j0ttTTyrz+sLLIq9DUtObSyaOsx+u9q9PKvP7XqreiuPhtaXNl
Y0B4aWFvbWkuY29tvfjQ0Le0wKENCg0KT24gV2VkLCA2IEF1ZyAyMDI1LCBKb3OopiBFeHCornNp
dG8gd3JvdGU6DQoNCj4gV2hlbiB0aGUgYmF0dGVyeSBzdGF0dXMgY2hhbmdlcywgcmVwb3J0IHRo
ZSBjaGFuZ2UgaW1tZWRpYXRlbHkgdG8gdXNlcg0KPiBzcGFjZS4NCg0KQ291bGQgeW91IHBsZWFz
ZSBtYWtlIHRoZSBjaGFuZ2Vsb2cgYSBsaXR0bGUgYml0IG1vcmUgZWxhYm9yYXRpdmUsIGkuZS4N
CndoeSBpcyBpdCBuZWVkZWQsIHdoYXQgdXNlci12aXNpYmxlIGJlaGF2aW9yIGNoYW5nZS9pbXBy
b3ZlbWVudCBpdCBicmluZ3MsDQpldGMuDQoNCkkga25vdyBpdCdzIGluIHRoZSBlLW1haWwgdGhy
ZWFkLCBidXQgYXQgbGVhc3Qgc29tZSBzdW1tYXJ5IHNob3VsZCBnbyBhbHNvDQp0byB0aGUgY29t
bWl0IGl0c2VsZi4NCg0KVGhhbmtzLA0KDQotLQ0KSmlyaSBLb3NpbmENClNVU0UgTGFicw0KDQoj
LyoqKioqKrG+08q8/rywxuS4vbz+uqzT0NChw9e5q8u+tcSxo8Pc0MXPoqOsvfbP3tPat6LLzbj4
yc/D5rXY1rfW0MHQs/a1xLj2yMu78si61+mho7371rnIzrrOxuTL+8jL0tTIzrrO0M7Kvcq508Oj
qLD8wKi1q7K7z97T2sirsr+78rK/t9a12NC5wrahori01sahorvyyaK3oqOpsb7Tyrz+1tC1xNDF
z6Kho8jnufvE+rTtytXBy7G+08q8/qOsx+vE+sGivLS157uwu/LTyrz+zajWqreivP7Iy7Kiyb6z
/bG+08q8/qOhIFRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgY29udGFpbiBjb25maWRl
bnRpYWwgaW5mb3JtYXRpb24gZnJvbSBYSUFPTUksIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9y
IHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkg
dXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1
ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJl
cHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBp
bnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFp
bCBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGl0ISoqKioqKi8jDQo=

