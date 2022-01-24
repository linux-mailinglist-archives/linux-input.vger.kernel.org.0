Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA30498075
	for <lists+linux-input@lfdr.de>; Mon, 24 Jan 2022 14:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240296AbiAXNIN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 08:08:13 -0500
Received: from mail.valdk.tel ([185.177.150.13]:43268 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239858AbiAXNIM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 08:08:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AA8930BDC3;
        Mon, 24 Jan 2022 16:08:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1643029688;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-language:in-reply-to:references;
        bh=1xf2VGgL4GBsVMjMeiZWK/li0KY9KUngxCGT/HWUVcg=;
        b=EhihNcT1B6q7FUR56wBTwV+sSZi4kEV7Q3H0qNLxmQlt1PcTpkwMyISDw7p2Eqa+ub/Wp+
        TJ6M7Z8P6e8jCfkF2UN37IoYtCOKuGEqfZswJSjX7nPDC0dl0Vz8ZcmsGEP1aEXYMm1usO
        zqhaDIjGuc3+bmpBfZJ2+VqYfzW32hSN8unRQzWD0kre7Yv7xBndJQwUwirZSrjU1rMYFN
        YfESn5GwzA3tVzIQOtR6kfMtNzqQDrTpyTHHEN6IwM8tcAx47VAsaaK7z7AdgZyAf189gW
        tMxDQTgseL2ND0tB8XF+0ed9sdasXOYwmZ4IB9OT0EguWRlgycxBb/L4TmP1Ag==
Message-ID: <3e11f0cb-aeb1-6101-5b7e-c68cddfae0a7@valdikss.org.ru>
Date:   Mon, 24 Jan 2022 16:08:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.5.0) Gecko/20100101,
 Thunderbird/78.5.0
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Content-Language: en-US
From:   ValdikSS <iam@valdikss.org.ru>
To:     Florian Klink <flokli@flokli.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
 <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
In-Reply-To: <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RyAutPkTHRTiI5ShXHutzU60"
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RyAutPkTHRTiI5ShXHutzU60
Content-Type: multipart/mixed; boundary="------------T31f1vCRg0BFmpp8IE6xLb7N";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: Florian Klink <flokli@flokli.de>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Message-ID: <3e11f0cb-aeb1-6101-5b7e-c68cddfae0a7@valdikss.org.ru>
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
 <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
In-Reply-To: <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>

--------------T31f1vCRg0BFmpp8IE6xLb7N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDEuMjAyMiAxNjowNywgVmFsZGlrU1Mgd3JvdGU6DQo+IE9uIDI0LjAxLjIwMjIg
MTU6MjQsIEZsb3JpYW4gS2xpbmsgd3JvdGU6DQo+PiBIZXkgVmFsZGlrU1MsDQo+Pg0KPj4+
IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZvciBMZW5vdm8gVGhpbmtQYWQgVHJhY2tQ
b2ludCBLZXlib2FyZCBJSSwNCj4+PiBpbiBib3RoIFVTQiBhbmQgQmx1ZXRvb3RoIG1vZGVz
Lg0KPj4+DQo+Pj4gSXQgYnJpbmdzIGFkZGl0aW9uYWwgZnVuY3Rpb25hbCBrZXlzIG1hcHBp
bmcsIG5hdGl2ZSB2ZXJ0aWNhbCBhbmQgDQo+Pj4gaG9yaXpvbnRhbA0KPj4+IHNjcm9sbGlu
ZywgdHJhY2twb2ludCBzZW5zaXRpdml0eSBjb25maWd1cmF0aW9uIGFuZCBGbi1Mb2NrIHN5
bmMuDQo+Pg0KPj4gUXVpY2sgZm9sbG93LXVwIHF1ZXN0aW9uIG9uIHRoaXMgLSBkaWQgeW91
IGRvIGFueSB0aW5rZXJpbmcgd2l0aCBiYXR0ZXJ5DQo+PiBzdGF0dXM/DQo+Pg0KPj4gSSBy
ZWFsaXplZCB0aGVyZSdzIGENCj4+IC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6
MDguMS8wMDAwOjA3OjAwLjQvdXNiNi82LTIvNi0yOjEuMS8wMDAzOjE3RUY6NjBFRS4wMDFG
L3Bvd2VyX3N1cHBseS9oaWQtMDAwMzoxN0VGOjYwRUUuMDAxRi1iYXR0ZXJ5IA0KPj4NCj4+
IGluIG15IHN5c3RlbSwgd2hpY2gga25vd3MgYWJvdXQgbW9kZWxfbmFtZSwgYnV0IHRoaW5n
cyBsaWtlICJjYXBhY2l0eSINCj4+IGFuZCAic3RhdHVzIiByZXR1cm4gYSAiTm8gZGF0YSBh
dmFpbGFibGUiLg0KPj4NCj4gDQo+IEhlbGxvLCBubywgSSBkaWRuJ3QgZG8gYW55dGhpbmcu
IEl0IHdvcmtzIGZvciBtZSBqdXN0IGZpbmUsIGl0IHNob3dzIA0KPiBiYXR0ZXJ5IHN0YXR1
cyBpbiBLREUgYXBwbGV0Lg0KDQpOb3RlOiBJJ20gdXNpbmcgdGhlIGtleWJvYXJkIG92ZXIg
Qmx1ZXRvb3RoLg0K

--------------T31f1vCRg0BFmpp8IE6xLb7N--

--------------RyAutPkTHRTiI5ShXHutzU60
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmHupLMFAwAAAAAACgkQXNcgLu+I93Ir
Tw//Q3zVQ2JjMXmCigJlU1FhaYnvJIPmS07yzrF00O4dbMqJMlqrH/QCMNYc2gnuFlMhMVfcpX/I
oqqgLaauDD3PYSjcbaeov6zTRsgw7pi4WoaBIH5/dzv+kF7jo+JE+eAUp0vCBEnZFLsovJjkKcQG
jwy1zEMG7GqWktipZJLL9HUhEqeDmgOrZRqWoR+fAxoIREqD6B+J+Hnoz04C79miGDHSnWWqOaoG
o15eurNORpmaZC6ouVIVgjjKpH9oKEgtgyr1L2L9jIw+HOqTKQFVD3klmYe6iXlF4i5qHaa2NtdT
HnaK+q/OINzyJDVdjefYPkKxK3mH0TNdJlCvVw1jarj6tGmAZR5HGf1f+/4coHQidW15zuq6suVH
KuhMrNCYFwENbfs1YHGR9/SShztGfU3nPxMHJSy7mRBEESt3nNyDcJVQW2tCBHEChnOffn4wyA+H
Ikum/4NsOMesCkMFfDpT2CQeJJSFUyu00gM2+J1NI0PYnjhsE9hrrXnTsLxWjKRhA88Gd9+7C1LM
oXUyJvwxPgfoDLbLj5meDs5S2LdF1cdYky9dBjVrGrk/TqLj/mwOIefzH8BPh1M8Nma19/8KhHHI
CX39qTQbssjemW5o+YWpU9Czan8i9NX5yquEeuiS3D6EKKPG81ApK1N7G7zkW6/NqQaXYQc6uhEP
5go=
=vrcd
-----END PGP SIGNATURE-----

--------------RyAutPkTHRTiI5ShXHutzU60--
