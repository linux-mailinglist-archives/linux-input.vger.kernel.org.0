Return-Path: <linux-input+bounces-13721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FCB161DD
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 15:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7576318C7341
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 13:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86112D839B;
	Wed, 30 Jul 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CL1axfhY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6436284B46
	for <linux-input@vger.kernel.org>; Wed, 30 Jul 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883565; cv=none; b=tVLvrIj8UxWMQF9EGM/nlx0oAxh1Q5JU7Pc4YkgqxXD5THnSYcmtRX/LOw94XTdfLTSZvIu+6u0IqhBGL5Ih7Bm4vYLNtPWe1m7V2gqeedEZnEoUDXsKdCXd4sTWA2j8u4XGRnAz8gQ94w+/rrk05FVcEWp7fM7TCHgYEucixOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883565; c=relaxed/simple;
	bh=n+/Al/hya7iKccfkk2/acBwTs2umvyAH+cTmAiASgng=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lvUYyaBhBXUWpzLf9rTVac33rMBk1GTpWwFQEJ5vN9KAqFDyjPXU9S/FUg5q4IYpEWjNAlQ64IM9KPkPOzbS8Iw3Y6NOkdk93OdEckbycR4Sex0P8c1AhQW3PpLKb1RGDx1MR3T9ULsdYkQkRRaFEN8cjGl702EirBFIifmdcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CL1axfhY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso12958768a12.2
        for <linux-input@vger.kernel.org>; Wed, 30 Jul 2025 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753883562; x=1754488362; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rp5BOhOSI3hJlfQlyw0n/QrQz57EFsvEJK12JX37JM=;
        b=CL1axfhYUp1p32DMTs16tlR8K9euMFnYh3Lyy0ktI66sxaftJLwnl4StwvpuK+dmB6
         qj9me9NS/KdvKxvB6LjiDEo0OVy3iAem4nVF7i71v1pYm1iQaXggYrdcqWyeXoqLeUwA
         dPWbrG7qTFssU1wA91c9oQ0ptr1DtaUk9nq6/DpNctscUhmdv7PUTFK+IDyI+hrBLujk
         Cl4kxoxwrDk9tDCB48xUmX7JwG7TWCV0wUiiBidlP2uwhjgUL0IGrEWOnKDVZcHI0eAD
         LhyB7CmIvxBPXuqisPYV+aue1/IFw38mEoEnrjyvq1P3pe/5UApI3JKssgEn9ez+fsGN
         APPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883562; x=1754488362;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rp5BOhOSI3hJlfQlyw0n/QrQz57EFsvEJK12JX37JM=;
        b=vI9BREC4nUQahRj2ENIsr2+YDL5f5HV1YGVBHcKnkbiUJPIggLpwAdFfklikug19yg
         2XAenQ72LP0/StNin0yG0mLA6PuNKhJmZxyJyKB88lT/MN3kI2Ih4bR8Zd1q0zHMUZid
         PqAREH8aKcLBXecocSkAByOMBTwHZqfhblkY6yHDdk3QCpRTqGtUgKCF/6GLcioBgTPH
         IgS/a7bbXwndvbM4YT27Ye2SaJeui0atyCCdtWA4UbLr6o3IIg4Sv58RNvsay3514l1b
         tqCHR+OK3kDQw2JVWevSmNlRY9shSCv0ITOXrPDP7cNQ6cEacOhnwBq9NcNROQnU5juv
         q85w==
X-Forwarded-Encrypted: i=1; AJvYcCUrA+MuE6WeSrODimoyiGiJIrwkUB/8jK2jVAL12IxoBmKl7GD9y0Oao8dvPLEDmHaFXGRPgR9u02skOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQs4jueGPk0cKszOzUqZYUSBJDbvyEolzG59PuZ9Cwdtz2n4OP
	3VNNAId1HZF0EmXQGJlIbCHAdUs1SueOOlNbG9ne+m+7yv63SkyxGb/LJDFNAv4zwkw=
X-Gm-Gg: ASbGncttjimrBfgjr+LibmcUJQQgeNb2gsUmFuDmFFzxZNZXcTn0UHqyMDIg/vRSS6O
	sTlbxSHyzgkxZb/2DpYNu+7TnF8L13WUZcDOtV4yskX5gmvO+V1I7mZD4vx6SwI4P3Ki/1gFU4B
	Jfb0g71Nbmr3rFnKCovwX50QaNgNEhvsNm30puj23TldIpsle6JMY9B4GpF8A8a+XNEUEYpE6ve
	kb2T6h2lQdgaGKAJqY8A8YX8P7VINo7V5vJiXUZX/1Gn++cy/klvjzzgQ+sAcZ4ch5Ir6/33Gmj
	jl8mYKWzoa5bNOApsRgGcswQ5QYv21Bt8TFd+oFjWk9Vx+EBmwhVfbDpshyh/F0dYjzReviOD6s
	clT9ZSrh+pY149/3FaSuL33gak88=
X-Google-Smtp-Source: AGHT+IHmHFD7kf9axGR7OqSKqgBDA0mgn8z8jZ8b9IsKFZAES+c1F4OBGbCYGQRGpeMsepIGLtvF1g==
X-Received: by 2002:a05:6402:40c5:b0:615:9b3c:5918 with SMTP id 4fb4d7f45d1cf-6159b3c5954mr1538590a12.1.1753883562203;
        Wed, 30 Jul 2025 06:52:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:83c4:a15:2832:36af:7a70])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6158ab9d0dbsm1108310a12.60.2025.07.30.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 06:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=166989f9f9a66e3cb36fa7f8ad6c45ebf369d74034ef3f270c152a3ef9d3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 30 Jul 2025 15:52:33 +0200
Message-Id: <DBPFTXDNMIS5.1RCL30X7VN5MG@baylibre.com>
To: "Michael Walle" <mwalle@kernel.org>, "Jon Cormier"
 <jcormier@criticallink.com>, "Jerome Neanne" <jneanne@baylibre.com>
Cc: "Job Sava" <jsava@criticallink.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-input@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.20.1
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com> <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com> <20250521-wandering-tested-porpoise-acbef7@kuoka> <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com> <20250529-wise-tremendous-stork-a7d091@kuoka> <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com> <0fb4b411-1b27-43fc-8d48-e5220fc85478@kernel.org> <CAKMwjwSZEhXav2U-bd+JNyVDK3JdJoN1kJjnxpfKXBKsW2XxdQ@mail.gmail.com> <DBEDT0OKPYAC.EX6HDQCKUWIS@walle.cc> <CADL8D3bpVVrswNUvS5nSeQYuZbyPOfMoMFG_JrPSFb9YkNEKdg@mail.gmail.com> <DBHJ1S8MTSA2.35ZZDZFQGFNB1@kernel.org>
In-Reply-To: <DBHJ1S8MTSA2.35ZZDZFQGFNB1@kernel.org>

--166989f9f9a66e3cb36fa7f8ad6c45ebf369d74034ef3f270c152a3ef9d3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I think my mail wasn't sent properly, so here we go again:

On Mon Jul 21, 2025 at 8:42 AM CEST, Michael Walle wrote:
> [+ Jerome and Markus ]
>
> Hi,
>
>> > > > Someone knowing the device should come with arguments whether
>> > > > other states for this are useful at all. Or not useful and then ar=
gument
>> > > > that in commit msg for example.
>> > > The other states are not useful for the kernel. Only the push button
>> > > has a need for an interrupt handler. The other states the PMIC handl=
es
>> > > on its own.
>> > >
>> > > What exactly do you want me to change?
>> >
>> > Because the driver isn't setting the configuration anyway, wouldn't
>> > it be possible to read the config bits (Register 0x3c, bits 7-6) to
>> > figure out whether the pin is configured as power-button instead of
>> > having this property?
>> >
>> > I mean, the correct config is likely stored in the NVM anyway, and
>> > reconfiguring it to another value seems unlikely.
>> Currently, the TPS MFD driver only loads the power button driver if
>> the flag is set.  We could put that discovery code in the MFD driver,
>> but what if the system designer doesn't want the power button driver?
>
> The device tree is not for configuration. The designer can just
> ignore the input event in that case.
>
>> I'm not sure auto detecting it makes sense.
>
> Why?
>
>> We are basing this on the other TI PMIC drivers and how they are
>> configured. I'm not sure I want to reinvent the wheel, so to speak.
>
> That was never a good reason. Maybe there was a reason for the
> TPS65219. Markus? Jerome? I haven't found anything in the commit
> messages or cover letters. Only that it is "optional". Not sure what
> that means. According to the TPS65219 datasheet, that pin if not
> used shall be configured as EN and be connected to VSYS.

I don't think the TPS65219 has a config register to detect if the pin is
a power-button that's why a devicetree description was necessary.
Looking at it now, it should probably have been an enum for TPS65219. It
is not relevant to any software but it is not describing the
configuration fully.

Best
Markus

--166989f9f9a66e3cb36fa7f8ad6c45ebf369d74034ef3f270c152a3ef9d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaIojoREcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKUwQ+AQCCSckOjQFmKhWjtgebU+FH8Kv6EqNOhk12
kbOkJ/ZVqwEA3K1IyehD1qEqHEZwyCvmd2D9lIEd1pazKofQxtaTygo=
=YrKw
-----END PGP SIGNATURE-----

--166989f9f9a66e3cb36fa7f8ad6c45ebf369d74034ef3f270c152a3ef9d3--

