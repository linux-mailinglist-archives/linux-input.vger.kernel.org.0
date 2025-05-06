Return-Path: <linux-input+bounces-12164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E6AABA18
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADFB33BFD61
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F994221D8F;
	Tue,  6 May 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tPdJ231d"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077C2797B0
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502479; cv=none; b=nydMdhiyUe89DRCmZ1uvbr5d88pHAsc4kwj+BknqwZWquwh1NQXsPar7ozIalI3smbFWYOav8kgJk2tVtWaV7vrdwFHkOtiCzBk+0/Nteig/AoeGsq88dcUheKuw7dGgVYdLbLW60OFJUco3GlTjIQERaLAQk3wBkE8B9ReN8YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502479; c=relaxed/simple;
	bh=g8MUKgYxO0XCdh4y8sIRCaK/IyskVqhdg6cAW+zE6B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsA3W0fkncxxlI7vhaxpT1136z/n1o5WneZYgKKZyGjXmf1Lt6eKyEHsy4xaotyYEWEXX2UwQzgK3uj4HsH2sXhPxq9Kme53bVL1F/LCiYWuSl79yCzb1H5pxRD3rz1j1X8YLjf/QTvxsFPWFbrRI8VkU9SBMwm8XjzWRYF0VYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=tPdJ231d; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5BB7D3F03F
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746502475;
	bh=dYfwdCCJVSXjAwFPOfnP+8phDvedaXssHCMaKp2AVLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tPdJ231dhR+Q2AHTF9964mlJJdMiK4foZoVsCuPeVevxoYANdBnbvcVNzpFw5KPEn
	 I1nabjdNc8lRsZ036QNaT2+OyORg2IWNYvGgoIQXTsllos/M4TGUwDgJOyai7qrcof
	 7n628PEfKit540s4+AdZUMHXhaSB1LGUswTmM/6SPl+LLP2AO9Psqayi2FWBX2nvMQ
	 0sSB8W5qcPnBuXpZsammptTi4YFgOD0UkmgPKuP4GbVoGBrJa/IS+hqjQW0Ss39O4a
	 fGHM/GQLtFxDyl24eRwEi6XFD3srIFx8U0EkyWSBlIT3Gxi+CTv3b/JiJagvAMxqDo
	 p3Qw7AiV+OsWw==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso432425666b.0
        for <linux-input@vger.kernel.org>; Mon, 05 May 2025 20:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746502475; x=1747107275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYfwdCCJVSXjAwFPOfnP+8phDvedaXssHCMaKp2AVLs=;
        b=Lf7AAu7yBKl41NKHOwnY/FYwPEYuVHzZJ9dY4Z9qyXukOJjbfdBT+P66Xkm8USouk/
         72eITbIF9e5NC6HNwL9FgKn+VMmjlPzwN8FxVdXpOpKbz1RWrf28GJdnKIDZpFEjrUBu
         K0rloYDM8PgMIstfkej8Cc/cLt4TlIvF+ojs8++k0fUdlWVCsuvLNqjsi1pJbK+Y33xv
         T+RJIBKdLfPTnh4xaCai8oLI0Wd+7yFWPXwGikpDEcf/hmuJ2BGcNzFUaZ8fcsSsCHMr
         d37rEK5LQ2SXkA/vvzVj2W446zm6cqPzOtMxSrlZfDmXcuR5RQfXmW5u5a3AGCyR2t0B
         wpMg==
X-Forwarded-Encrypted: i=1; AJvYcCXTOdpyeP/pK7nL02RpTQUE0l07tEwhQ+t8mjLGrZN5Z1ZkqtkhcEh70MyJTjYs1/M4rnSU6gxU13LZ7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaSss8APN9kJ7qNjXg7c0oFJJLtWKmtMjgpjTbXUbCDeRfQaQ
	sY68U3g9S94t/4Je9M4+kyJzYFkwACbZeRj74rSGUz/JgWHjXBpK5OaydMcLjfx+P08JnQc0/od
	hcZtbU8kYCPIMz7v/jJ/s9t93cjOemIMClLHh6+X/OlB2RztIqsBzur4onReQqyMoAP74zbaWce
	S2O5x382Zd7TEfpM4evfxn0gcIC35Xi3imY9PcTKjsR2U6ioem5mg=
X-Gm-Gg: ASbGncvWTABiY9LDXEO1P8laAodo70DlQBXlKGWTrwRUS1jQdiJHSiz2ULjin3mdK+o
	DA5VX4LAObPKvuBSJtVIODipyxc6imQCvXGIWX+wlITyZeF2a6p8QBxg8nYJ+T2hmClikUqsxkb
	JvxzGdlNZgFxI3
X-Received: by 2002:a17:906:478f:b0:ac3:8d34:1d73 with SMTP id a640c23a62f3a-ad1d3466659mr144058566b.8.1746502474789;
        Mon, 05 May 2025 20:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQvdM2anjmOfvdYXV4pVK/Lvh4+0O0s8lc0mGFrYvhPaoQnrfKNFO6ELytEXPy5ZXHpzf3CRNSYX3/91Zn0A8=
X-Received: by 2002:a17:906:478f:b0:ac3:8d34:1d73 with SMTP id
 a640c23a62f3a-ad1d3466659mr144057866b.8.1746502474453; Mon, 05 May 2025
 20:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312063532.551938-1-acelan.kao@canonical.com> <s3ns5747-ps0n-1no0-1qqq-prq39onr7o79@xreary.bet>
In-Reply-To: <s3ns5747-ps0n-1no0-1qqq-prq39onr7o79@xreary.bet>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Tue, 6 May 2025 11:34:22 +0800
X-Gm-Features: ATxdqUHoU1ZT80D8dlZIH98pbSWRq0Ubltew2yRlnoeaFhFCQQ1HsI43J43XnC8
Message-ID: <CAFv23Q=-jCJN-NrNKHan_KCHQEWS=1AtfhfxuA7bgvJdOw4raA@mail.gmail.com>
Subject: Re: [PATCH] HID: quirks: Add quirk for Chicony Electronics HP 5MP Camera
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiri Kosina <jikos@kernel.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=8824=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 12 Mar 2025, Chia-Lin Kao (AceLan) wrote:
>
> > The Chicony Electronics HP 5MP Camera (USB ID 04F2:B82C) reports a HID
> > sensor interface that is not actually implemented. Attempting to access
> > this non-functional sensor via iio_info causes system hangs as runtime =
PM
> > tries to wake up an unresponsive sensor.
> >
> > Add this device to the HID ignore list since the sensor interface is
> > non-functional by design and should not be exposed to userspace.
> >
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/hid/hid-ids.h    | 1 +
> >  drivers/hid/hid-quirks.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 7e400624908e..5fdea9116a3e 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -297,6 +297,7 @@
> >  #define USB_DEVICE_ID_ASUS_AK1D              0x1125
> >  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A  0x1408
> >  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12  0x1421
> > +#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA  0xb82c
> >
> >  #define USB_VENDOR_ID_CHUNGHWAT              0x2247
> >  #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH   0x0001
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 5d7a418ccdbe..452fac15550b 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -370,6 +370,7 @@ static const struct hid_device_id hid_have_special_=
driver[] =3D {
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIR=
ELESS2) },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) =
},
> >       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACE=
R_SWITCH12) },
> > +     { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_=
5MB_CAMERA) },
>
> Given the changelog, did you mean to add this device to hid_ignore_list[]
> instead of hid_have_special_driver[]?
Yes, you are right.
I'll submit v2 for the 2 patches.
Thanks.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

