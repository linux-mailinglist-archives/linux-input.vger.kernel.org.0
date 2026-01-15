Return-Path: <linux-input+bounces-17110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF6D24E54
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FDD30164C0
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D936C598;
	Thu, 15 Jan 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsamOoUk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16E2EB10
	for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486657; cv=none; b=tCjoYNCrBqmc3Ih4JC86VTg0Cde1QnionZCGMkefohEI2BtIxjBMHaPrETwMzfG450hgship4VUsgOvxW30BuSSQrMwm4+1Jmgn4i8/WMwbla1TZ/Beu9+X1APNlgDtrPFZz1MQJ+G6/ilTscdFAf18Hca+SH5ubDZLyaY0I8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486657; c=relaxed/simple;
	bh=ZsCHwmki/Js7aAT+rv8C3xmGyaorqRaw9CiglHMpP4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IC507q7gsXfOJoil4b61dHjS2YHxmkVJjJhQehHabr/ar5V7yfUtndCmIbvXwYiBzOVpHab4sk2qZDyEsEwCJzOKwm1PtbH6ZoDIDFXrV6/oogL1INwAj/swhSkDn2q6taZLUyf/OAU21c0L0icmpnl+gOcDgLs0XgV1939+Mos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsamOoUk; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-501c6665144so9601441cf.0
        for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 06:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768486655; x=1769091455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWw9sx5dWA9ccoNDcTzjmxAnqBxj2shaKtFUdAhYCog=;
        b=AsamOoUkU4iOfhPYca//MeyC1NrYJZMtzuV4EKqYo+BHhoqFee72mBmO4PWrNzbm/l
         cZ52ueCnIy7hGCuvxpsnYMUljpJy5QH/KKCQG74gqtrgVkBi5yh3NEdltQmXVigZVAMB
         diasIcpEMjfH8kq7oYxGIW6tDs02bkDPqvRNbG7n1pV60w8KUGavinQSIw0ZpyOWHnPl
         gGWmBrkZPNhVTRmK1iffhF6hZ1GG+vnOzoXXVmfYGabk7bzQf7yL3mMu+CBEQXnoGnrG
         mjcPwJ3dzoqChBCdSum2LfSMsg87vDJSECzhLzoVCKrwLd0ElGUycpJT+ko/3nlIViXc
         pldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768486655; x=1769091455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWw9sx5dWA9ccoNDcTzjmxAnqBxj2shaKtFUdAhYCog=;
        b=t8kQFHeVrrrNj+duLzClmynugNgSdAYXGgnKgqFP8stjN38+I5S1PXv7iX6+U7S9Uy
         ISyehLoQQ2mPvLEHOs1Fmaj1kyLNPdowsZipBCjyRs6zWMORmtGsl8Tv3QepxAo1w8uz
         JtLjJ3te8x5kzT1DpYUe3OFsooyDFeabE+Po2VL9LuNETSol6B0IDTONMgbP419Evt7d
         /Ven++ruouXndYTFd21I0/q6TSk+mxE3FCXokHu4iFZUB5JpfzWbbAD1M0QFjZ1OGjVW
         TYYe3RzwYqhvSj3F7NUmPKZvCQyd97T4DqirJ63QdkOOEwvygl4+uARIggzW0iK6lHjQ
         GlnA==
X-Forwarded-Encrypted: i=1; AJvYcCW9aqO2M2Ej37OlDmmhLPacNvPs3UF1SLRR88KHFNNi0/tczTdkSJHheSCHDnQ6+t6GVmQaq3DwofeNiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8VYC8oKKy1VVIMTr6RKKxXSa40Ewnw1BtQRNiRSLQfF2ap9Q2
	lZhx/kzCVFy1dtI2vsLFfXQFSgBJCEdWD/mW3LAMj+ysaa5EKXrSYWUDWMajgPuRki2VC5JIFPo
	yB/Ko754kVQIiam7UxlG5fL0B/KlM1zXa749Oi3N4CPr9bfOG
X-Gm-Gg: AY/fxX4c4rsqmvlRANrZlYTHYQbPEzFeFHvBUHyfO1m2sShjAw4RXP8ABllxaBnHCiI
	GMas8ZxrDpnpMoGDOeFmJ8bxO1AyhOXmOtAfE6bqZ3opeZgMBA2kZTg3DGAHqrCI1Pp48USXM+X
	n8eGvksVkeptKGQZ6aZSGJ2q5DjHHZVXW3T34M3WQI6Fh1jWD2T7jVGIwZklRpaUpP5Wa9bJD5p
	lTcLkUgqaYtHeXHzNQzV0CIZ16KOJKUi/cmu/PpniQAOxTLfP1io3+EO6PK2GKpIiQ2tJyr4Zbs
	U5VC
X-Received: by 2002:a05:622a:15c8:b0:501:17cb:bfbc with SMTP id
 d75a77b69052e-5014821c484mr90163591cf.33.1768486654339; Thu, 15 Jan 2026
 06:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALEuBa=E1YSo1oVxd67rBf+6bC28zQZi5HBghMmcPFHKQn2+UA@mail.gmail.com>
 <09efd83ea70771f8ce1feaf7d7172b72970d8d55.camel@hadess.net>
In-Reply-To: <09efd83ea70771f8ce1feaf7d7172b72970d8d55.camel@hadess.net>
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 22:17:23 +0800
X-Gm-Features: AZwV_Qj8hsI_M6wq7ZFVeyxavOmu-4JoB-C8lx3kUPQaLN3ghLdag7OadmWmtP8
Message-ID: <CALEuBakRd8W-FvOiuih-CsEQH-CL_S1MBVVsOUj9g22zjxPEdQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in hidpp_get_report_length()
To: Bastien Nocera <hadess@hadess.net>
Cc: jikos@kernel.org, bentiss@kernel.org, lains@riseup.net, hansg@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for the review. I apologize for the format issue and will
resend the patch as plain text following the documentation guidelines.

Best regards,

Kery

Bastien Nocera <hadess@hadess.net> =E4=BA=8E2026=E5=B9=B41=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B 20:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> Patch looks good, but you will need to resend it as plain text, as per
> the submitting patches documentation:
> https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html#no-=
mime-no-links-no-compression-no-attachments-just-plain-text
>
> Regards
>
> On Thu, 2026-01-15 at 01:48 +0800, =E9=BD=90=E6=9F=AF=E5=AE=87 wrote:
> > Add validation for report->maxfield and report->field[0] before
> > dereferencing to prevent NULL pointer dereference.
> >
> > The HID report descriptor is provided by the USB device firmware via
> > USB control transfer (GET_DESCRIPTOR). A malicious device can craft
> > a descriptor that defines an OUTPUT report without any usages
> > (padding fields). When the HID subsystem parses such a descriptor:
> >
> > 1. hid_add_field() calls hid_register_report() to create the report
> >    object and stores it in report_id_hash[id]
> > 2. Since parser->local.usage_index is 0, hid_add_field() returns
> > early
> >    without calling hid_register_field() to add any fields
> > 3. Result: report exists with maxfield=3D0 and field[0]=3DNULL
> >
> > When hidpp_probe() is called for a device matching this driver:
> >   - hidpp_validate_device() calls hidpp_get_report_length()
> >   - hidpp_get_report_length() retrieves the report from hash (not
> > NULL)
> >   - It then dereferences report->field[0]->report_count
> >   - Since field[0] is NULL, this triggers a kernel NULL pointer
> >     dereference
> >
> > Data flow from attacker to crash:
> >   Malicious USB Device
> >        |
> >        v (USB GET_DESCRIPTOR control transfer)
> >   hid_get_class_descriptor() -- reads HID report descriptor from
> > device
> >        |
> >        v
> >   hid_parse_report() -- stores descriptor in hid->dev_rdesc
> >        |
> >        v
> >   hid_open_report() -> hid_add_field()
> >        |                    |
> >        |                    v
> >        |              hid_register_report() -- creates report,
> > maxfield=3D0
> >        |                    |
> >        |                    v
> >        |              returns early if usage_index=3D=3D0, no field add=
ed
> >        |
> >        v
> >   hidpp_validate_device() -> hidpp_get_report_length()
> >        |
> >        v
> >   report->field[0]->report_count -- NULL pointer dereference!
> >
> > This is triggerable by an attacker with physical access using a
> > malicious USB device (e.g., BadUSB, programmable USB development
> > boards).
> >
> > Fixes: d71b18f7c7999 ("HID: logitech-hidpp: do not hardcode very long
> > report length")
> > Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> > logitech-hidpp.c
> > index d5011a5d0890..02ddbd658e89 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -4314,7 +4314,7 @@ static int hidpp_get_report_length(struct
> > hid_device *hdev, int id)
> >
> >         re =3D &(hdev->report_enum[HID_OUTPUT_REPORT]);
> >         report =3D re->report_id_hash[id];
> > -       if (!report)
> > +       if (!report || report->maxfield < 1 || !report->field[0])
> >                 return 0;
> >
> >         return report->field[0]->report_count + 1;
> > --
> > 2.34.1

