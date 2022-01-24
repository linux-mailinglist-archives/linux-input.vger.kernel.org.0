Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215FF498072
	for <lists+linux-input@lfdr.de>; Mon, 24 Jan 2022 14:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242721AbiAXNHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 08:07:34 -0500
Received: from mail.valdk.tel ([185.177.150.13]:43134 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239858AbiAXNHe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 08:07:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8B0130BD9F;
        Mon, 24 Jan 2022 16:07:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1643029647;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-language:in-reply-to:references;
        bh=TyajGdeR+Y4L6VE6H92b624XSmNZaJS3zxq28ZcWg/U=;
        b=H7WVAxgr5swcx9G1rG5Sagn38Ldxt5CwfPrY2VJdMntEKEhcLrDoKFxM3BU1xXJ/EXYCtI
        7o20LemiJUyBgQ0ZAwrGDAvaLzBIruXG8IGM1T8I0WoZlCj7N+Pmqovh58jFgWprnCVsqW
        gEKARzVoEie5Ac48ZHYMKheBEYE/rywW8ohLiiEYz3R3OwPW0Hb1WlyuIHLvusImo4Q8Uy
        oNrJ6JtPFyKvXCSIQ7tEEJexKi3kfvYEIXm8OrsYeGWL6Cz9zSfhVDBBcECpnj7qsD8g3V
        XMToCbvxweieS7PR/ZWwHFK4MQJLZZyBVsJTOMUy/FZ8UorrIOaf+8YjfkC+wg==
Message-ID: <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
Date:   Mon, 24 Jan 2022 16:07:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.5.0) Gecko/20100101,
 Thunderbird/78.5.0
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Content-Language: en-US
To:     Florian Klink <flokli@flokli.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
From:   ValdikSS <iam@valdikss.org.ru>
In-Reply-To: <20220124122417.pl4qhpb644xp4ax3@tp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Zp4weFN8K1lgnoShrK8y3X0X"
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Zp4weFN8K1lgnoShrK8y3X0X
Content-Type: multipart/mixed; boundary="------------v13XXMHZpxQMRoyJ3T5eJZn0";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: Florian Klink <flokli@flokli.de>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Message-ID: <2f7053b2-4e47-e4f6-6a66-08067f30ed3b@valdikss.org.ru>
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <20220124122417.pl4qhpb644xp4ax3@tp>
In-Reply-To: <20220124122417.pl4qhpb644xp4ax3@tp>

--------------v13XXMHZpxQMRoyJ3T5eJZn0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDEuMjAyMiAxNToyNCwgRmxvcmlhbiBLbGluayB3cm90ZToNCj4gSGV5IFZhbGRp
a1NTLA0KPiANCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZvciBMZW5vdm8gVGhp
bmtQYWQgVHJhY2tQb2ludCBLZXlib2FyZCBJSSwNCj4+IGluIGJvdGggVVNCIGFuZCBCbHVl
dG9vdGggbW9kZXMuDQo+Pg0KPj4gSXQgYnJpbmdzIGFkZGl0aW9uYWwgZnVuY3Rpb25hbCBr
ZXlzIG1hcHBpbmcsIG5hdGl2ZSB2ZXJ0aWNhbCBhbmQgDQo+PiBob3Jpem9udGFsDQo+PiBz
Y3JvbGxpbmcsIHRyYWNrcG9pbnQgc2Vuc2l0aXZpdHkgY29uZmlndXJhdGlvbiBhbmQgRm4t
TG9jayBzeW5jLg0KPiANCj4gUXVpY2sgZm9sbG93LXVwIHF1ZXN0aW9uIG9uIHRoaXMgLSBk
aWQgeW91IGRvIGFueSB0aW5rZXJpbmcgd2l0aCBiYXR0ZXJ5DQo+IHN0YXR1cz8NCj4gDQo+
IEkgcmVhbGl6ZWQgdGhlcmUncyBhDQo+IC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6
MDA6MDguMS8wMDAwOjA3OjAwLjQvdXNiNi82LTIvNi0yOjEuMS8wMDAzOjE3RUY6NjBFRS4w
MDFGL3Bvd2VyX3N1cHBseS9oaWQtMDAwMzoxN0VGOjYwRUUuMDAxRi1iYXR0ZXJ5IA0KPiAN
Cj4gaW4gbXkgc3lzdGVtLCB3aGljaCBrbm93cyBhYm91dCBtb2RlbF9uYW1lLCBidXQgdGhp
bmdzIGxpa2UgImNhcGFjaXR5Ig0KPiBhbmQgInN0YXR1cyIgcmV0dXJuIGEgIk5vIGRhdGEg
YXZhaWxhYmxlIi4NCj4gDQoNCkhlbGxvLCBubywgSSBkaWRuJ3QgZG8gYW55dGhpbmcuIEl0
IHdvcmtzIGZvciBtZSBqdXN0IGZpbmUsIGl0IHNob3dzIA0KYmF0dGVyeSBzdGF0dXMgaW4g
S0RFIGFwcGxldC4NCg==

--------------v13XXMHZpxQMRoyJ3T5eJZn0--

--------------Zp4weFN8K1lgnoShrK8y3X0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmHupIYFAwAAAAAACgkQXNcgLu+I93JH
dw/+I2hAbcfpEGZ7nobTyyq8JhQeqnpVJu3FC8++TSD9+tpYsnaKIGUOiCvqWOvlGWjtJZOQX8zn
CcvSq4w3zLnLpuEVa6IMZOTdB+BH/JYQkeZNwEtwSHJ3fZ3hgVoR9gq4HvumqwKf33MVL6gRUryf
4EvBmJKGHqxjPHn7pJceE/xmjvP9l4jL1FOXueUF/U6xBWjS3DSpAko82Rs0IXh6GD/ttoJUlutp
BKrKdsyDc13d0yrCIKsX76/B44wSnkXkqX2/HL0Tq2E01M+F4UVLfirtQqM6kYwCdRtqZUbcACyn
ep+PURVWGiBO96NUmnKE0R13HO0Lie+0GXvndORqJFFMAQQ4wCmbEERwtY61drwalCXVfEjAIXp5
LnhRuid3wE9wEU8/H7T2OCDeQO2mmiM0nbTxHFOQO4C4+4A/OCwRQpZL0MLMazXhG2qIG+nz8rvO
W3Brw5OABgYjqOJXsfr9PhExTOh9KlNO5Esd6y/G15O5uL7ULwKCkTNe+vM0TWQIm8ZEw8eTz7Wf
EUtNitwAt9R1gVftYsNPx9AfTWSlOPVmzOYTxrOQjaxd4Nlt3QS2iZpB0iZJBA9QxtnYV2EJW8TR
XVTf/G5X6H1158Zc0zt4pbPfOXtk9Zptq5d8xhlbD2AZOsI3FqmGD18DKPy+hdEceRj9fB8iOW/B
c+o=
=1TTW
-----END PGP SIGNATURE-----

--------------Zp4weFN8K1lgnoShrK8y3X0X--
