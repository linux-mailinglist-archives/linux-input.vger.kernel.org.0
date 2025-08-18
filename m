Return-Path: <linux-input+bounces-14076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE2B295F8
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 02:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B734E4EAF
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 00:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64F91F2BAB;
	Mon, 18 Aug 2025 00:52:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498C21F9F47;
	Mon, 18 Aug 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755478362; cv=none; b=in4YBLDh/9nlYRuM4cnDWdpwqX0L+JkfviXkO+SWDEeLItyY8PY683bCfL1aamcNqQpRp+cG0UUJ9MYAFAYXTm1QNwufJ/V+OJYXIZQvOFArkWrb1FfrjqxUXkuPjpoNbXtAVDVgR04meaO/dp+8NrkPY0fH567By9pP2sE5SCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755478362; c=relaxed/simple;
	bh=zverf+i839FeEH1z5oH6cTC5zYeVbvbSWasiO5A2aBE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dni87uE7oyoYAJ36U7vPJZHLN9qtIHhPMmQFh1+N+klzAEH0peIrtbUfnujdsNIUfKC41/XgTxBK2g34QsU4PnrEqJgQ+PfxQHGdWk1V6FM+HkLudNsW1xKh9dkKoWfX7NQ7ms7lwpzBfuppSpBAURWKLB49HQoxDPdhhTqE+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: CUT4fKZSSq+EPIuxPCTUOQ==
X-CSE-MsgGUID: PcQg34JjTGWhMxizu7Ij5w==
X-IronPort-AV: E=Sophos;i="6.17,293,1747670400"; 
   d="scan'208";a="149500033"
From: =?gb2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
To: =?gb2312?B?Sm9zqKYgRXhwqK5zaXRv?= <jose.exposito89@gmail.com>, Jiri Kosina
	<jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?gb2312?B?y87D3MPc?= <songmimi@xiaomi.com>,
	=?gb2312?B?VGhvbWFzIFpoYW8g1dTqzQ==?= <zhaohui7@xiaomi.com>,
	"tkjos@google.com" <tkjos@google.com>, =?gb2312?B?wqy5+rrq?=
	<luguohong@xiaomi.com>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtQQVRDSCB2MiAyLzJdIEhJRDog?=
 =?gb2312?B?aW5wdXQ6IHJlcG9ydCBiYXR0ZXJ5IHN0YXR1cyBjaGFuZ2VzIGltbWVkaWF0?=
 =?gb2312?Q?ely?=
Thread-Topic: [External Mail]Re: [PATCH v2 2/2] HID: input: report battery
 status changes immediately
Thread-Index: AQHcCrXbrGKdcLZC0kSUAM9u6AlyFrRhdOIAgAYpLxg=
Date: Mon, 18 Aug 2025 00:52:31 +0000
Message-ID: <5209b6cc4fd94859896b0ec7c3f34be3@xiaomi.com>
References: <20250806073944.5310-1-jose.exposito89@gmail.com>
 <20250806073944.5310-2-jose.exposito89@gmail.com>
 <4q4qn3p8-6s3s-289n-44s2-43s76qrs2oo4@xreary.bet>,<aJ29tlqoQYFa-WYt@fedora>
In-Reply-To: <aJ29tlqoQYFa-WYt@fedora>
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

SGkgSmlyaSwNCkhvdydzIHlvdXIgcmV2aWV3IG9mIHRoaXMgcGF0Y2ggZ29pbmc/IFdlIGxvb2sg
Zm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91LiBUaGFuayB5b3UhDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEpvc6imIEV4cKiuc2l0byA8am9zZS5l
eHBvc2l0bzg5QGdtYWlsLmNvbT4NCreiy83KsbzkOiAyMDI1xOo41MIxNMjVIDE4OjQzDQrK1bz+
yMs6IEppcmkgS29zaW5hDQqzrcvNOiBiZW50aXNzQGtlcm5lbC5vcmc7IMKsufq66jsgbGludXgt
aW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQrW98zi
OiBbRXh0ZXJuYWwgTWFpbF1SZTogW1BBVENIIHYyIDIvMl0gSElEOiBpbnB1dDogcmVwb3J0IGJh
dHRlcnkgc3RhdHVzIGNoYW5nZXMgaW1tZWRpYXRlbHkNCg0KW83isr/Tyrz+XSC0y9PKvP7AtNS0
09rQocPXuavLvs3isr+jrMfrvffJ97SmwO2ho8j0ttTTyrz+sLLIq9DUtObSyaOsx+u9q9PKvP7X
qreiuPhtaXNlY0B4aWFvbWkuY29tvfjQ0Le0wKENCg0KSGkgSmlyaSwNCg0KT24gTW9uLCBBdWcg
MTEsIDIwMjUgYXQgMDE6NDg6MjJQTSArMDIwMCwgSmlyaSBLb3NpbmEgd3JvdGU6DQo+IE9uIFdl
ZCwgNiBBdWcgMjAyNSwgSm9zqKYgRXhwqK5zaXRvIHdyb3RlOg0KPg0KPiA+IFdoZW4gdGhlIGJh
dHRlcnkgc3RhdHVzIGNoYW5nZXMsIHJlcG9ydCB0aGUgY2hhbmdlIGltbWVkaWF0ZWx5IHRvIHVz
ZXINCj4gPiBzcGFjZS4NCj4NCj4gQ291bGQgeW91IHBsZWFzZSBtYWtlIHRoZSBjaGFuZ2Vsb2cg
YSBsaXR0bGUgYml0IG1vcmUgZWxhYm9yYXRpdmUsIGkuZS4NCj4gd2h5IGlzIGl0IG5lZWRlZCwg
d2hhdCB1c2VyLXZpc2libGUgYmVoYXZpb3IgY2hhbmdlL2ltcHJvdmVtZW50IGl0IGJyaW5ncywN
Cj4gZXRjLg0KPg0KPiBJIGtub3cgaXQncyBpbiB0aGUgZS1tYWlsIHRocmVhZCwgYnV0IGF0IGxl
YXN0IHNvbWUgc3VtbWFyeSBzaG91bGQgZ28gYWxzbw0KPiB0byB0aGUgY29tbWl0IGl0c2VsZi4N
Cg0KVGhhbmtzIGEgbG90IGZvciByZXZpZXdpbmcgdGhlc2UgcGF0Y2hlcy4NCg0KSSBzZW50IHYz
IHdpdGggYSBtb3JlIGRldGFpbGVkIGRlc2NyaXB0aW9uIG9mIHRoZSBmaXg6DQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1pbnB1dC8yMDI1MDgxNDEwMzk0Ny4xMTYxMzktMS1qb3NlLmV4
cG9zaXRvODlAZ21haWwuY29tLw0KDQpKb3NlDQoNCj4gVGhhbmtzLA0KPg0KPiAtLQ0KPiBKaXJp
IEtvc2luYQ0KPiBTVVNFIExhYnMNCj4NCiMvKioqKioqsb7Tyrz+vLDG5Li9vP66rNPQ0KHD17mr
y761xLGjw9zQxc+io6y99s/e09q3osvNuPjJz8PmtdjWt9bQwdCz9rXEuPbIy7vyyLrX6aGjvfvW
ucjOus7G5Mv7yMvS1MjOus7Qzsq9yrnTw6OosPzAqLWrsrvP3tPayKuyv7vysr+31rXY0LnCtqGi
uLTWxqGiu/LJoreio6mxvtPKvP7W0LXE0MXPoqGjyOe5+8T6tO3K1cHLsb7Tyrz+o6zH68T6waK8
tLXnu7C78tPKvP7NqNaqt6K8/sjLsqLJvrP9sb7Tyrz+o6EgVGhpcyBlLW1haWwgYW5kIGl0cyBh
dHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBmcm9tIFhJQU9NSSwg
d2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRk
cmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFs
IG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBi
eSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJp
dGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhKioq
KioqLyMNCg==

