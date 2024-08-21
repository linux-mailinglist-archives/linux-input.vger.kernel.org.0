Return-Path: <linux-input+bounces-5725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C443F9596AD
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 10:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37462822D9
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 08:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1321A2875;
	Wed, 21 Aug 2024 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OTlWAUAB"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646E4687;
	Wed, 21 Aug 2024 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724227547; cv=none; b=j9pnb1jhHpsPwlqTjCbOxxzCDPAwIXdFbpGHpieFpU0mWktPby2M6rU36FWT1pVrnAt4Umb0st9pjumYrd4nrLV4aNMLxj72onrU8neWV501wOiTFbGJjYImDLWeuS1hJtTr1G/HCcAL4cGMHm2lnminP4G8ABzhFX2tgVUGcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724227547; c=relaxed/simple;
	bh=HO1v1jPb9+Az2MblAuLfzluHxIrlP9j9Dvy+rxtOVSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nb23z80Lvu/OvZzdp3dEvGlDNMC6Y0Dn5mJJGJYfjvZNwKjaidRtheqNVBkMZq5jBJwK8VI6q9svrjPr86FK86w0IM8St0dLAR3JufS7W9STwhLTclSWkhrsOLHwwIgV2wOL5j9fDxHaBHc3HFDJOu6hG0kYBLKwJbLYWDoBBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OTlWAUAB; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724227522; x=1724832322; i=markus.elfring@web.de;
	bh=HO1v1jPb9+Az2MblAuLfzluHxIrlP9j9Dvy+rxtOVSg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OTlWAUABcGpyKgVrUQSS5q4zITpO8oKIePiUZ+pa2BitpWbiN7bR2h80ytMcIFey
	 3//HwP+gmnlJPJMIjrQH8Nk5g5d1fcX29V63JcMvp+STT8GA5KpqvQA+x1+UmM0O/
	 FWeN3fsqEW6zpVQhnZoaQXycZ8w8j9N/ONHuCILH0Xf6B0YKTtvRTphffpvIGVesD
	 h+SOl10DhjOr+8evg4Jv10Xuro1lOKUCDBe9jycVKJOOnyLmbojtVBNSvlw+enPfC
	 3SQ0PK7LC1CEKxZc3V0OTB0jcFQZsmN7vYgDeQ5nCfSOpN+qoCViXbggSPZzyjTF+
	 hj3tUg+dLDPbmOg3zg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBVv-1sALfY3dTB-00pnPb; Wed, 21
 Aug 2024 10:05:21 +0200
Message-ID: <ce87c4bc-3a39-47a8-8860-9252960520b9@web.de>
Date: Wed, 21 Aug 2024 10:05:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] HID: corsair-void: Add Corsair Void headset family driver
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
 <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:B58tMx/GJGiA0qFlgFB4VfCo7pUXGdIG5Qc74o7ngZVptJ9ieLB
 lFYNhK7R++KLM7w09slz685tsvIQMQa16sH4SCGQYUTj3kuM7aaQYS5smmuIzsaGbJfCzRP
 alSeYG52wdBc98zQHm79ea/BTD9xsQQMokOiRgTzFm+m29ck3t9DTABkVanCJcjXwFbLBgw
 vfLx9gsmqnOfvdrb0cn5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IAwBQnQgBs8=;KAnmnfEGKu3MCmfkbmbLrLYBXLa
 598v1OWkeu1tyFMrkv+sc+FV0sd6tgEj7cnscJdtNHrVAT2LLUZaar2+86Jt42mShbD1aXze8
 mDB5LECFswyKXjqvk/QYaFwuzz23SUgIm8rhyGLIW8LojTQXKEYBiuO3jjZnZckKByuWItkMY
 dd4vi8fvd5vVxMLCXabIdRbl15QAYBd6b6dJ2/G7yLCOqQ9mUiwBb8Ita9DDDcoyPzDuVhT/s
 0TWC5TBs9PvM7RS+Iw+Dq780fRx6aLJdZ85VxSuFuxnzHChMzGilpdp+lvI3naYd/u/YXAtUg
 oCYgvySzH6p6zigniHt/5T2xBvZBSjjohzBrMf+OEZlyfemxw+ebJYc6b+kzbneleL9DWlrv9
 SPmAX+1ZsWbZbMfj+JZSlwoZET9q1tAz3su92KhmH5Cj3FkLKeUfcUVyLO6VWsjLBHNDD3aRd
 WdnUzWNH+ikGGQrz0Ir+rwfejOfzYul9ZxwPROB+f/R382hiNeq7IFxpGJ+0iXQSnOFaP7AyI
 oRHjxjDMvlrnARTiZ5qzkGUD56XydD9g6EjoVnFU+b+UnvPFSm6MvueGUQSOj8j2NCZjfUXW2
 O5B/ttdjdBxkmbqmLCftWihcE/j2bO2xGY+zFpfyhHRJXQis8TtdDQdKbEEBPytZtNNqOTqhi
 5/9hIzk8D0Tx6nyxQdlsq9qsm84i6rHLEC/3dVuuNKk42SOqCBw3R0LJKoPr282PtIoBU4MGT
 9ERB/K+kXaxYZjkvuApgxNRsAWi/hSBPBLloyynEMuKnnQYJQqk4YL8FqgZGz4OFUKFKV8nkZ
 2I6tKL6PboyLfIhUpMqS2piw==

Pj4gK3N0YXRpYyBzc2l6ZV90IHNlbmRfYWxlcnRfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0
ZSAqYXR0ciwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAq
YnVmLCBzaXplX3QgY291bnQpDQo+PiArew0K4oCmDQo+PiArwqDCoMKgIHVuc2lnbmVkIGNoYXIg
KnNlbmRfYnVmIF9fZnJlZShrZnJlZSkgPSBOVUxMOw0K4oCmDQo+PiArwqDCoMKgIHNlbmRfYnVm
ID0ga21hbGxvYygzLCBHRlBfS0VSTkVMKTsNCuKApg0KPj4gK8KgwqDCoCByZXQgPSBoaWRfaHdf
cmF3X3JlcXVlc3QoaGlkX2RldiwgQ09SU0FJUl9WT0lEX05PVElGX1JFUVVFU1RfSUQsDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VuZF9idWYsIDMsIEhJRF9PVVRQVVRf
UkVQT1JULA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhJRF9SRVFfU0VU
X1JFUE9SVCk7DQrigKYNCj4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBoaWRfaHdfcmF3X3Jl
cXVlc3QoKSBBUEksIGJ1dCBJIHRoaW5rIHRoYXQgYSBrZnJlZShzZW5kX2J1ZikgaXMgbWlzc2lu
ZyBoZXJlLg0KDQoqIFBsZWFzZSB0YWtlIGFub3RoZXIgbG9vayBhdCB0aGUgdXNhZ2Ugb2Ygc2Nv
cGUtYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudC4NCg0KKiBXb3VsZCB5b3UgZXZlbnR1YWxseSBw
cmVmZXIgYW55IG90aGVyIHByb2dyYW1taW5nIGludGVyZmFjZXMgaGVyZT8NCg0KDQpSZWdhcmRz
LA0KTWFya3VzDQo=

