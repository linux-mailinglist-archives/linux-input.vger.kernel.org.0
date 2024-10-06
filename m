Return-Path: <linux-input+bounces-7106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B69991EA1
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 15:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EEFC1C20BF9
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB550176ADF;
	Sun,  6 Oct 2024 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="y2jYy87A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01D176AB6
	for <linux-input@vger.kernel.org>; Sun,  6 Oct 2024 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222282; cv=none; b=ek9EL1rV+scUEZ/ch6aNuV0CIzTaEfaJUKcTGo+JsHSlc6o4TyBarofGS3njOR37asRLuUw4GrI/x+ium5GJF1KT2z7mdk7aQzivVcC6FGoo2HiKzSu0ts1nGHsref7CjmKPu7x3v798seieJ0dzNgTgVppXhL3S2eCi1YFYXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222282; c=relaxed/simple;
	bh=C2M3Xg0+l9C709R1DfYEX9IQKRdtV1Ih7aB9pOJdsTc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lV/zIU7WXTeT9mkCh8VDxg57rdiP0kyCzCELOVikdxCHNknUg8KRWw8qu4pC2qHtpjr2nnKtCKFFbCvH/VpIFJ1HzRfa/iubYgUcaticlPM6dhr7i1gQIMT8L5z2FM+A/rFr7KMNk5nDW6agH6hcVD07wezir6Bwm9zoxjW0l7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=y2jYy87A; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 926FD15FF4E4;
	Sun,  6 Oct 2024 16:44:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1728222266;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-language:in-reply-to:references:autocrypt;
	bh=C2M3Xg0+l9C709R1DfYEX9IQKRdtV1Ih7aB9pOJdsTc=;
	b=y2jYy87A224iK/emGRBB8EEmZeJAHbmOJkqDlAs0ZGrIhG9dS2lqe9Es5GTDI3Y2NjDEP6
	CarNFsmEtXmipnME1foQ0jXN63OSljJNsE9mJTDmvC80Q6x+Imyw0A85RZ3wQEA8RRXHHa
	OFkiZt2ZNJmTTr0QCzZc8ajMrQT8X+Bqm73zKMsQjsf1cOi4r0yRUyvNRqcT2IMh0aGLqw
	wl4uAEYxPSbZV/IBDzDncwlCtdvlNjXKjWMmLtPdcHUBuz2qVNyr/k3TNDgO/ATdksXcNQ
	m1R5ZSTXtfpcnQ/ECuUJp+BYkBkAAoAJ4afKMqKpbr6/FfkVjwOEiU4u+873Vg==
Message-ID: <222f1501-70fe-43f1-8bce-81a7667a5927@valdikss.org.ru>
Date: Sun, 6 Oct 2024 16:44:14 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint
 Keyboard II in USB mode
From: ValdikSS <iam@valdikss.org.ru>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
References: <20240725004934.301342-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2408131128230.12664@cbobk.fhfr.pm>
 <d3d71c5b-da20-4358-84e9-59295da2863f@valdikss.org.ru>
Content-Language: ru, en-US
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
In-Reply-To: <d3d71c5b-da20-4358-84e9-59295da2863f@valdikss.org.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kVaBAh9onjtkHQxyA1jAi0Si"
X-Last-TLS-Session-Version: TLSv1.3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kVaBAh9onjtkHQxyA1jAi0Si
Content-Type: multipart/mixed; boundary="------------oDCu09m7weDnUPEuq94jZpFH";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Message-ID: <222f1501-70fe-43f1-8bce-81a7667a5927@valdikss.org.ru>
Subject: Re: [PATCH RESEND] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint
 Keyboard II in USB mode
References: <20240725004934.301342-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2408131128230.12664@cbobk.fhfr.pm>
 <d3d71c5b-da20-4358-84e9-59295da2863f@valdikss.org.ru>
In-Reply-To: <d3d71c5b-da20-4358-84e9-59295da2863f@valdikss.org.ru>

--------------oDCu09m7weDnUPEuq94jZpFH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDguMjAyNCAxMjozOCwgVmFsZGlrU1Mgd3JvdGU6DQo+IE9uIDEzLjA4LjIwMjQg
MTI6MjgsIEppcmkgS29zaW5hIHdyb3RlOg0KPj4+IFdoZW4gRm4tTG9jayBpcyBwcmVzc2Vk
IG9uIExlbm92byBUcmFja1BvaW50IEtleWJvYXJkIElJIGluIFVTQiBtb2RlLA0KPj4+IHRo
ZSBrZXlib2FyZCBvbmx5IHNlbmRzIHRoZSBzY2FuY29kZSB0byB0aGUgaG9zdCBhbmQgZG9l
cyBub3QgdG9nZ2xlDQo+Pj4gdGhlIG1vZGUgYnkgaXRzZWxmLCBjb250cmFyeSB0byBCbHVl
dG9vdGggbW9kZS4NCj4+Pg0KPj4+IFRoaXMgcmVzdWx0cyBpbiBub24td29ya2luZyBGbi1M
b2NrIHN3aXRjaGluZy4NCj4+Pg0KPj4+IEZpeCB0aGlzIGlzc3VlIGJ5IHNlbmRpbmcgc3dp
dGNoaW5nIGNvbW1hbmQgdXBvbiByZWNlaXZpbmcgRm4tTG9jaw0KPj4+IHNjYW5jb2RlLg0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVmFsZGlrU1MgPGlhbUB2YWxkaWtzcy5vcmcucnU+
DQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSBjb250cmlidXRlIHVzaW5nIHlvdXIgcmVhbCBu
YW1lPw0KPiANCj4gSSBwcmVmZXIgdG8gdXNlIG15IG5pY2tuYW1lIG9uIHRoZSBpbnRlcm5l
dCwgYW5kIGFzIGZhciBhcyBJIGtub3csIHRoZSANCj4gcGF0Y2ggYWNjZXB0aW5nIHBvbGlj
eSBoYXMgYmVlbiBsaWZ0ZWQgdG8gYWxsb3cgbmlja25hbWVzIChwc2V1ZG9ueW1zKSANCj4g
c2luY2UgbXkgbGFzdCBjb250cmlidXRpb24uDQo+IA0KPiBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI2Rl
dmVsb3Blci1zLWNlcnRpZmljYXRlLW9mLW9yaWdpbi0xLTENCj4gDQo+PiB0aGVuIHlvdSBq
dXN0IGFkZCBhIGxpbmUgc2F5aW5nIFsuLi5dIHVzaW5nIGEgX2tub3duIGlkZW50aXR5XyAo
c29ycnksIA0KPj4gbm8gYW5vbnltb3VzIGNvbnRyaWJ1dGlvbnMuKQ0KPiANCj4gSXQgdXNl
ZCB0byBiZToNCj4gDQo+PiB1c2luZyB5b3VyIHJlYWwgbmFtZSAoc29ycnksIG5vIHBzZXVk
b255bXMgb3IgYW5vbnltb3VzIGNvbnRyaWJ1dGlvbnMuKQ0KPiANCj4gSWYgSSdtIHJlYWRp
bmcgdGhpcyB3cm9uZywgcGxlYXNlIGZlZWwgZnJlZSB0byByZXN1Ym1pdCBpdCB1bmRlciB5
b3VyIA0KPiBuYW1lLCBhcyBoYXMgYmVlbiBkb25lIHdpdGggbXkgcHJldmlvdXMgcGF0Y2gu
DQoNCkNoZWNrZWQgdGhlIGNvbW1pdCB3aGljaCBoYXZlIGNoYW5nZWQgdGhlIGtlcm5lbCBw
b2xpY3kgcmVnYXJkaW5nIA0KaWRlbnRpdGllczoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lk
PWQ0NTYzMjAxZjMzYTAyMmZjMDM1MzAzM2Q5ZGZlYjE2MDZhODgzMzANCg0KQW5kIENOQ0Yg
Y2xhcmlmaWNhdGlvbiBsaW5rZWQgaW4gdGhlIGNvbW1pdDoNCmh0dHBzOi8vZ2l0aHViLmNv
bS9jbmNmL2ZvdW5kYXRpb24vYmxvYi82NTlmZDMyYzg2ZGMvZGNvLWd1aWRlbGluZXMubWQN
Cg0KPiBBIHJlYWwgbmFtZSBkb2VzIG5vdCByZXF1aXJlIGEgbGVnYWwgbmFtZSwgbm9yIGEg
YmlydGggbmFtZSwgbm9yIGFueSBuYW1lIHRoYXQgYXBwZWFycyBvbiBhbiBvZmZpY2lhbCBJ
RCAoZS5nLiBhIHBhc3Nwb3J0KS4gWW91ciByZWFsIG5hbWUgaXMgdGhlIG5hbWUgeW91IGNv
bnZleSB0byBwZW9wbGUgaW4gdGhlIGNvbW11bml0eSBmb3IgdGhlbSB0byB1c2UgdG8gaWRl
bnRpZnkgeW91IGFzIHlvdS4gVGhlIGtleSBjb25jZXJuIGlzIHRoYXQgeW91ciBpZGVudGlm
aWNhdGlvbiBpcyBzdWZmaWNpZW50IGVub3VnaCB0byBjb250YWN0IHlvdSBpZiBhbiBpc3N1
ZSB3ZXJlIHRvIGFyaXNlIGluIHRoZSBmdXR1cmUgYWJvdXQgeW91ciBjb250cmlidXRpb24u
DQoNCkh1bWJseSBhc2tpbmcgdG8gcmV2aWV3IHRoZSBwYXRjaCB3aGVuIHRoZSB0aW1lIGFs
bG93cywgSmnFmcOtLg0K

--------------oDCu09m7weDnUPEuq94jZpFH--

--------------kVaBAh9onjtkHQxyA1jAi0Si
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmcClC4FAwAAAAAACgkQXNcgLu+I93Iu
SRAA02XDdC7Fmgzn1bzQ0AUROVkvW/5ipJwkVORr6cuBKP62EHz1asAwuqFtQbiUdRKDpUK7jAaQ
msRySjWGt9WlboIHClz6U5hOyBZfJL7fw/LFYGMO3x/Kw++CmFLhnsdTBHfrYrSiK0nwBZPNqGcL
N+eHNW+QI5Uh+YKU/PJeUmC+Fm3/G03hIg/0nUSyeQB68KwxCbS4uBHSfoF7UBbAd/MBIzQ/SJdX
X7l+DPSgTrHYve+tLdcA7JvV4HKC38WNA8MmYcErDLJv4dqE6HDypPQr0VMvxEbZ7ZAvfNlA7+pB
W8Tw18n7dS9Qe5RofrsilCnrKsgC2Qw1r7ROKq7pod63zwyRc6Rtoa1HRpX/ro7uMJUpbk5aUmT5
ma3DGsbtPZeV9lKud9Gd3xVL6pmw6qXlFh/v7XEzSddw/SC/Q/Pq1dINqiTpT2GcifKhnOiQcgLw
ProjauJN7gET5qi1oSemd5bHmjvKVKaSmDQd8KOLHZmHyBZfFnNN2TyGsEVFVPMr5S93jfWE/VrE
KKECYWdTwyY5ptieXJDgU68ocPT2Kx8wjy3Ca7bouZe/qcr8oJdlzEr2siYH5TODVScMW0AmlFfE
o42rXKjV0l79wlGoL3rGFJCW/jRav7MYwNcQucGhyWELDwYTQgLN8QKinAeQyadolWZnYDT9o1X2
hQE=
=jySo
-----END PGP SIGNATURE-----

--------------kVaBAh9onjtkHQxyA1jAi0Si--

