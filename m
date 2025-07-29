Return-Path: <linux-input+bounces-13715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70AB14E1F
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 15:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3543AD5FE
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 13:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C9A1DE4E7;
	Tue, 29 Jul 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mh0C4eIr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032140855;
	Tue, 29 Jul 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753794621; cv=none; b=k2k870WjSnCaGiIqZmj4LogXWEiLvpCHCgvhLyjJbvGP/4NWKwIkm+aUkQ+DRfIOYGXRSwjtEYrd+Z9H0KOk8v+PdH0y0k+9OcCsQoiWDKEczmKeqqaWXZ6JBL+nmvCLow5SKR39uOMX76L9Lt1g7+5SndW4xckilcG1kZx0MbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753794621; c=relaxed/simple;
	bh=zqwXG53TqX88OOIij8KVQ/Qra+rNQ2e4vYxubSYODL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieBfc0YdU2NbxiQi0Z7sI4H/lO/EWDTXAkeXOt4/ZPWH3cpIc0aA0p3Cpc53hI37lprnSs+5KDioRSHGdRZyFHJqv9QaxK+z6bHDmApwRWQYSU8mEuPtRoKlmYc82REBngGwBQu3fTnmPoTohzbs/1eSPlMScjAfJyZqRSlujt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mh0C4eIr; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-32b43846e8cso42701221fa.0;
        Tue, 29 Jul 2025 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753794617; x=1754399417; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqwXG53TqX88OOIij8KVQ/Qra+rNQ2e4vYxubSYODL4=;
        b=Mh0C4eIrYWDXO8JIwEvqXgp9WZRSgqWkrtL9e5VnBw+kJL2UNombWh4Suzn7uYBqJc
         Qe+SppsvfZ9TgbRienn+P1hGlMU6okGeYri3mrhS8aFk43MIAT3Hpuz3jJuyO8J0sCcA
         5kqSRI+dui484zZ35iypIH85Md9cQGz7MDjEBK0eQoWo+f0Dx/rO7FjeaaRwGcqPrZ5M
         aNzdU9N47puXTJiOOkpkkITE75l44sB9Ru9s57opw0tN00NPaLsIjpZKd+JjtEypCVas
         Ic3pEvIqebR9X+9Xfak52eQ3SWW6REdz9q3M3aSq4fOTh9lQHCsdLq1VzuoEDlYFmIb1
         g5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794617; x=1754399417;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqwXG53TqX88OOIij8KVQ/Qra+rNQ2e4vYxubSYODL4=;
        b=Asj9sDIjbGqxPEOO3nodkADTbFITS3zl3Ej+vbI2KBsEprtkmITnWN5GmH1emXLbYf
         so8I/S9G06pFizG9GCvSTWA5hGl1P3nbQCMTFwitvzWReDBAtC1Zjf6BgtnmxKN08n6T
         FRo5NvTSOHbVVJIrNAdj6VWeEfHCtNx9VqyCC9fVci3Ufo58InMOzuDAH3v39d4cK5Hf
         Vs3UrBAf+hOw+wpCVxOqGaT6uFLYm0gVMq4OjsRZr/tf7PF6tnLcCCwmEWZJFWZD+CLi
         iMBC77ZgMGCZxj5145FuSteRC0UgnMyRSyv/9JVGEYSUTPfsg7g7R2fLw0J5+Z6XPdPF
         Wd8w==
X-Forwarded-Encrypted: i=1; AJvYcCUsUjLGT29zwRSjstQx5uxnM7W6JkVBS8vJ63Px5x7DCFaCJ8FN/HzqQdVyJ7bhUK9z9S7BCn99VOGm2g==@vger.kernel.org, AJvYcCWxOc253aIG5I2KPanAbR8UYN4BMZ2/o9t096ch5O3svF7A/3Q1g/+58Hi6q605Hkmyp7pbDJS/tWEL46lT@vger.kernel.org, AJvYcCX7STSTCDzlYx4Qvp86adyC1FxdTxiUsBGV9VBbUIM2WGNyx6paPWNGtewLcke9hZEEwVUZ9Cl3U7e+MicJ18Dnr1tCyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUGmEcEAVJddC3+gGXyd2TjTuCEMQYtPTjIQVqM2d102b5qpk
	gB8WL9uziF8i/f4B3PaW5VNHVCjQu2CyxqEgvnmQXlsy5K1tao6+MYSl
X-Gm-Gg: ASbGnctCxfC6dstAvPn3ttoizqOM4c7vceJVhx8+rtnJUl0r/shSeTYj9bZWolgv3pH
	k2gGjfgBsj3qqBws7ZHz8IvffZ0XwuaCUKj/DVbSknYhTVNg1QTwmj5Mqd/ZHBcG5tMDnxQB+fe
	nxjAdZidzgZ699E8LTj213jzOnuExGJokng28MAXPh96fj5C3WqdnYavXP5PePu3Gtb3WrwE+ZA
	fIZL6vF9JhsXGyoEyNLNJMJbLV0VwcA4aaayZuBeSx3ZlvmJvvfX2U5WTUjud2lYbtKNq8vGj91
	xAXhvElBV0PAtfBlFViOmMirsXGbEdczFpQJc1Arv9MlJlhigia4K8h12e/frIIZIcr2Tv167NG
	GI/Qqnv/tji/HblRdFMpaofVagvxP/jHyIYsV9Q==
X-Google-Smtp-Source: AGHT+IFZ/N3Wty39h0MbOGDUqu/LRsLW7/CkdOqmKEcvSIKIR9otNIxYvAmAhnZeMJgLicfFxAXP1Q==
X-Received: by 2002:a05:651c:4ca:b0:32c:a502:8334 with SMTP id 38308e7fff4ca-331ee8889afmr47837211fa.36.1753794616229;
        Tue, 29 Jul 2025 06:10:16 -0700 (PDT)
Received: from [10.17.33.153] ([94.25.60.95])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f40a2970sm15766311fa.28.2025.07.29.06.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:10:15 -0700 (PDT)
Message-ID: <38859d78-ee7e-4c9b-8e35-f87853d6d2e1@gmail.com>
Date: Tue, 29 Jul 2025 16:10:14 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Add WMI driver for Redmibook keyboard.
To: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
References: <20250727223516.29244-1-foxido@foxido.dev>
 <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
Content-Language: en-US, ru
From: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
Autocrypt: addr=nikita.nikita.krasnov@gmail.com; keydata=
 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
 sXwISql2dLWvF4EeopUcuqEmcKFKXR+Ifbxj7A==
In-Reply-To: <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aeGu5rzxPwO7yiq0M45COE0p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aeGu5rzxPwO7yiq0M45COE0p
Content-Type: multipart/mixed; boundary="------------gmvRK0JGRBY12065Ty6N8ltg";
 protected-headers="v1"
From: Nikita Krasnov <nikita.nikita.krasnov@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
Message-ID: <38859d78-ee7e-4c9b-8e35-f87853d6d2e1@gmail.com>
Subject: Re: [PATCH 1/1] Add WMI driver for Redmibook keyboard.
References: <20250727223516.29244-1-foxido@foxido.dev>
 <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
In-Reply-To: <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>

--------------gmvRK0JGRBY12065Ty6N8ltg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:47:57AM +0300 Armin Wolf wrote:
> "Say Y here if you want support for WMI-based hotkey events on Xiaomi R=
edmi devices."

I think it should be "Xiaomi Redmibook" instead. "Xiaomi Redmi" is
associated with mobiles devices. See Google Images for example of this:
[1] and [2].

[1]: https://www.google.com/search?q=3Dxiaomi+redmi&udm=3D2
[2]: https://www.google.com/search?q=3Dxiaomi+redmibook&udm=3D2

--=20
Nikita Krasnov

--------------gmvRK0JGRBY12065Ty6N8ltg--

--------------aeGu5rzxPwO7yiq0M45COE0p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEpkOhtFujpzRWyb0a4A5zBMF+d4YFAmiIyDYFAwAAAAAACgkQ4A5zBMF+d4bo
3g/+OAx7qEd4bpF7KVYVRLWeYT6WO5v0eqa4Nu/7JrtEJMSp1uVTLRrhcEOTY72uYCXglYstZj3B
j9uESHfsl8/h1PWh7jx0QaKwI4djBsPJIkPSlionqOwnX+n8/jPCjFxIx6OcnjdaYdIoJYGyKzLs
pytfdXdFHu9cWfEJvmpzhpSntUSIPsLxFZ6KCTUV1zx8IKgkipvfCC/fxDuymA/jt64fU7llyl/1
rzAboRqXQbKv+SNjNWfOS5coYc3Pl0IKv30QOUw608w39jI3t5ogaF83ufTJWdkapGJLDqwBlnbK
Ox8nSdxFciIcK0p1XhEmgX24yF4D3Tk7A0pWmYgBrzeP7oJpTwt70csaDketg3e6gb1404+JyU0r
7u9WlgIHqy38Gzr3gZmYDyuCrQUMHzcq8MtYGML7UdV+yycR+j5YxPqyjVlE5wePs85D0303rCqX
+1n6EXYNq+Q3mt+9TQjy+vesGVZUPPTjW/NuwDqtQC+qAGLezo59omvFUzT4Df8TNsRItCvfrG/K
qW1V1OxLKLg/8W/NU5P4+zR14aL3wDN4t7XvUBBvc6Rrbt48N15vxJ5LCd8AExjnXyso4qqtVPaT
nBmWuLnMAnewPwrupXaFpQAPAIr7/DsG2nhoYs836Cx6azwavFB+Y3Y601rH8KjYrYe8fJtb6c4M
sBs=
=HHx3
-----END PGP SIGNATURE-----

--------------aeGu5rzxPwO7yiq0M45COE0p--

