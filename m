Return-Path: <linux-input+bounces-3547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E08BE212
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE561F256E5
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 12:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC56158A30;
	Tue,  7 May 2024 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcRkrFm3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8D156F42;
	Tue,  7 May 2024 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084938; cv=none; b=pU2RUNq/6hxKba8/7RGMZxnyHLB8hrj3jwBxlI5zV/5UNIc4oW1a8o+FmZ+sKZUhdVFlPgE2OKitJyfzdf52835sFyTt2xbQIxyfHN3jz+OfXetYDlFtHVWPNbRshZyv5+8Ul/DpxES3jY2D51gct5cmwCU8IEvOfpBxO4ihJEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084938; c=relaxed/simple;
	bh=TOm/1/igTymOhJqO4wiBkbYjU1VlxGgV2wrqemrv7vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzm0xSLyz2xmh/+iFXc6ku6BPkvrVNNz9rkxsHMdotoRJKxoixP60vhvgYBSE+t/kVJnhK+opsz8ZY63CdAWSx3n2q4h2kBcOPIzLDXgxvtdvFQaw6Of1OH/BKCY0CXwDKGWGSDDe7ktKkrJAXBP8RRdJAizmyMRuJyFt2h6OJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcRkrFm3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f57713684so3852665e87.1;
        Tue, 07 May 2024 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715084935; x=1715689735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9NzGBN8GFBURVK4ut/GnD421gR/XHXgeG5MnW//aI0=;
        b=lcRkrFm39FUaCX2eu9iDLzZIel8l01kG00R6MCx8oQwK+Oik14wlDGYGtNoEqwvdLH
         Ow/4pveydLpuGVRNFb0tUoGpKrdi1j9xCqTPYM2gkijivZl9pl9zavIe7uOl/bhvkNON
         bOHf7f+ewPR9kM4R+kjVLwjjx2FpY39RiI1DShV4fksgqVF9HdFunE0g4wm7c3i2Hsmi
         4hWClKrPZ6bdkeYOMOn7eXhsoAZFBUqR8hufu2oYgF9RH8yW3bMDtL9jirVxD3M6D3yu
         JrRx8y76KT78QocLJjAIeqZFg4T35kSyUyoEh7/moQFR8G2/kB/QX3C3FVT7ahy6DHoU
         1MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715084935; x=1715689735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9NzGBN8GFBURVK4ut/GnD421gR/XHXgeG5MnW//aI0=;
        b=TvxRDcPSvoWkRvlAuxEyF4a2ySRr5UNPPs2AZJreHmnVETWHWeXCzJtl0V18wDW8zm
         JUJC4saK6yD8ahvE50xqpF5XVjioTcsew4VMHo2qVfKht2V8+s2Sg2NhH94J4tCA/P7y
         q41Vkp6guNuTjtSClzI8IaAb4eaWT2/EEcsUPeMkK2/ZEMc6ESJG1NjvUwremazMO9Wc
         Ukjs7oL5PABOGHyvME2sLm4urA/dmi4aCROmERzC3LEN8b7J3pKdhKXyDeAo8JKSErUj
         n4eWI/BXDclfMsPWxtEH0taIP5krUh9pDdvOAM1HazH9IVz10yHru/6Mj1J086w7+nDY
         D7dg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1qxDwrDb3mD9Z/eykmaMNaI6y1GV1RDJDx0YkLee117u9EBHY6Wz4VBNu4ee4gFNKf67SlurssHqBL5SKdeMqEzV7udNMrEY/E0YezGfmhJg7V1N+3RzcU4MSTKOvVqrdYrkLzVBwEc=
X-Gm-Message-State: AOJu0YxeztFdly7GirVB4sm9L/9bZU78VZWWClIvM71ei/3VLBs59sp2
	KJD/GG8L+SPaWJXCQVTexO6FwMRUULkd9lRUfIjur1VQK0rGoNcak8CCpFJ51UB/dqOhwnya0SD
	FkPVdJVQ9jiQ7rvvyi/kNBnTXrCM=
X-Google-Smtp-Source: AGHT+IE84aZvRBjCENar9TrOFSoQAX8mkRtZ/oD0U4bDZFPTxw3ubQea5rQpr564l2PQvfxPh8mkD7AIXJP1r657GTQ=
X-Received: by 2002:ac2:5b4d:0:b0:516:c766:5b4f with SMTP id
 i13-20020ac25b4d000000b00516c7665b4fmr8973863lfp.67.1715084934931; Tue, 07
 May 2024 05:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502042335.15611-1-mmyangfl@gmail.com> <nycvar.YFH.7.76.2405062329320.16865@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2405062329320.16865@cbobk.fhfr.pm>
From: =?UTF-8?B?TWlsYW4gUGzFvsOtaw==?= <milan.plzik@gmail.com>
Date: Tue, 7 May 2024 14:29:25 +0200
Message-ID: <CAN-R+gxhdSB2qsLhx8-g02OuQkTmJ2khLOvi9LKpzJgzP1Sc3Q@mail.gmail.com>
Subject: Re: [PATCH] HID: kye: Change Device Usage from Puck to Mouse
To: Jiri Kosina <jikos@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, linux-input@vger.kernel.org, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jiri, David,

no objections here. Unfortunately, I can't test the change at the
moment (I barely remember there was a mouse that could be used with
that tablet), but the change sounds good to me. Also, thanks a lot for
keeping the HID drivers up-to-date even for such old hardware :)

Best,
  Milan


On Mon, May 6, 2024 at 11:30=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Thu, 2 May 2024, David Yang wrote:
>
> > Change device type because
> > a. it is exactly a mouse, with left/right buttons and scroll wheel;
> > b. it does not have visible marks or crosshairs, thus does not provide
> > higher accuracy than stylus.
>
> Let's CC Milan, who originally added all this in feb6faf1e5d46 ("HID: kye=
:
> Fix report descriptor for Genius PenSketch M912") ... Milan, any concerns
> about the below?
>
> Thanks.
>
> >
> > Signed-off-by: David Yang <mmyangfl@gmail.com>
> > ---
> >  drivers/hid/hid-kye.c | 75 +++++++++++++++++++++++++------------------
> >  1 file changed, 44 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
> > index eb9bf2829937..70ceb9437332 100644
> > --- a/drivers/hid/hid-kye.c
> > +++ b/drivers/hid/hid-kye.c
> > @@ -209,7 +209,7 @@ static const __u8 pensketch_t609a_control_rdesc[] =
=3D {
> >       0xC0               /*  End Collection            */
> >  };
> >
> > -/* Fix indexes in kye_tablet_fixup if you change this */
> > +/* Fix indexes in kye_tablet_fixup() if you change this */
> >  static const __u8 kye_tablet_rdesc[] =3D {
> >       0x06, 0x00, 0xFF,             /*  Usage Page (FF00h),            =
 */
> >       0x09, 0x01,                   /*  Usage (01h),                   =
 */
> > @@ -262,12 +262,16 @@ static const __u8 kye_tablet_rdesc[] =3D {
> >       0x27, 0xFF, 0x07, 0x00, 0x00, /*      Logical Maximum (2047),    =
 */
> >       0x81, 0x02,                   /*      Input (Variable),          =
 */
> >       0xC0,                         /*    End Collection,              =
 */
> > -     0xC0,                         /*  End Collection,                =
 */
> > -     0x05, 0x0D,                   /*  Usage Page (Digitizer),        =
 */
> > -     0x09, 0x21,                   /*  Usage (Puck),                  =
 */
> > +     0xC0                          /*  End Collection,                =
 */
> > +};
> > +
> > +/* Fix indexes in kye_tablet_fixup() if you change this */
> > +static const __u8 kye_tablet_mouse_rdesc[] =3D {
> > +     0x05, 0x01,                   /*  Usage Page (Desktop),          =
 */
> > +     0x09, 0x02,                   /*  Usage (Mouse),                 =
 */
> >       0xA1, 0x01,                   /*  Collection (Application),      =
 */
> >       0x85, 0x11,                   /*    Report ID (17),              =
 */
> > -     0x09, 0x21,                   /*    Usage (Puck),                =
 */
> > +     0x09, 0x01,                   /*    Usage (Pointer),             =
 */
> >       0xA0,                         /*    Collection (Physical),       =
 */
> >       0x05, 0x09,                   /*      Usage Page (Button),       =
 */
> >       0x19, 0x01,                   /*      Usage Minimum (01h),       =
 */
> > @@ -280,7 +284,7 @@ static const __u8 kye_tablet_rdesc[] =3D {
> >       0x95, 0x04,                   /*      Report Count (4),          =
 */
> >       0x81, 0x01,                   /*      Input (Constant),          =
 */
> >       0x05, 0x0D,                   /*      Usage Page (Digitizer),    =
 */
> > -     0x09, 0x32,                   /*      Usage (In Range),          =
 */
> > +     0x09, 0x37,                   /*      Usage (Data Valid),        =
 */
> >       0x95, 0x01,                   /*      Report Count (1),          =
 */
> >       0x81, 0x02,                   /*      Input (Variable),          =
 */
> >       0x05, 0x01,                   /*      Usage Page (Desktop),      =
 */
> > @@ -317,7 +321,7 @@ static const struct kye_tablet_info {
> >       __s32 y_physical_maximum;
> >       __s8 unit_exponent;
> >       __s8 unit;
> > -     bool has_punk;
> > +     bool has_mouse;
> >       unsigned int control_rsize;
> >       const __u8 *control_rdesc;
> >  } kye_tablets_info[] =3D {
> > @@ -402,7 +406,7 @@ static __u8 *kye_consumer_control_fixup(struct hid_=
device *hdev, __u8 *rdesc,
> >  static __u8 *kye_tablet_fixup(struct hid_device *hdev, __u8 *rdesc, un=
signed int *rsize)
> >  {
> >       const struct kye_tablet_info *info;
> > -     unsigned int newsize;
> > +     __u8 *newdesc =3D rdesc;
> >
> >       if (*rsize < sizeof(kye_tablet_rdesc)) {
> >               hid_warn(hdev,
> > @@ -420,36 +424,45 @@ static __u8 *kye_tablet_fixup(struct hid_device *=
hdev, __u8 *rdesc, unsigned int
> >               return rdesc;
> >       }
> >
> > -     newsize =3D info->has_punk ? sizeof(kye_tablet_rdesc) : 112;
> > -     memcpy(rdesc, kye_tablet_rdesc, newsize);
> > -
> > -     put_unaligned_le32(info->x_logical_maximum, rdesc + 66);
> > -     put_unaligned_le32(info->x_physical_maximum, rdesc + 72);
> > -     rdesc[77] =3D info->unit;
> > -     rdesc[79] =3D info->unit_exponent;
> > -     put_unaligned_le32(info->y_logical_maximum, rdesc + 87);
> > -     put_unaligned_le32(info->y_physical_maximum, rdesc + 92);
> > -     put_unaligned_le32(info->pressure_logical_maximum, rdesc + 104);
> > -
> > -     if (info->has_punk) {
> > -             put_unaligned_le32(info->x_logical_maximum, rdesc + 156);
> > -             put_unaligned_le32(info->x_physical_maximum, rdesc + 162)=
;
> > -             rdesc[167] =3D info->unit;
> > -             rdesc[169] =3D info->unit_exponent;
> > -             put_unaligned_le32(info->y_logical_maximum, rdesc + 177);
> > -             put_unaligned_le32(info->y_physical_maximum, rdesc + 182)=
;
> > +     memcpy(newdesc, kye_tablet_rdesc, sizeof(kye_tablet_rdesc));
> > +
> > +     put_unaligned_le32(info->x_logical_maximum, newdesc + 66);
> > +     put_unaligned_le32(info->x_physical_maximum, newdesc + 72);
> > +     newdesc[77] =3D info->unit;
> > +     newdesc[79] =3D info->unit_exponent;
> > +     put_unaligned_le32(info->y_logical_maximum, newdesc + 87);
> > +     put_unaligned_le32(info->y_physical_maximum, newdesc + 92);
> > +     put_unaligned_le32(info->pressure_logical_maximum, newdesc + 104)=
;
> > +
> > +     newdesc +=3D sizeof(kye_tablet_rdesc);
> > +
> > +     if (info->has_mouse) {
> > +             if (newdesc + sizeof(kye_tablet_mouse_rdesc) > rdesc + *r=
size)
> > +                     hid_err(hdev, "control desc unexpectedly large\n"=
);
> > +             else {
> > +                     memcpy(newdesc, kye_tablet_mouse_rdesc, sizeof(ky=
e_tablet_mouse_rdesc));
> > +
> > +                     put_unaligned_le32(info->x_logical_maximum, newde=
sc + 44);
> > +                     put_unaligned_le32(info->x_physical_maximum, newd=
esc + 50);
> > +                     newdesc[55] =3D info->unit;
> > +                     newdesc[57] =3D info->unit_exponent;
> > +                     put_unaligned_le32(info->y_logical_maximum, newde=
sc + 65);
> > +                     put_unaligned_le32(info->y_physical_maximum, newd=
esc + 70);
> > +
> > +                     newdesc +=3D sizeof(kye_tablet_mouse_rdesc);
> > +             }
> >       }
> >
> >       if (info->control_rsize) {
> > -             if (newsize + info->control_rsize > *rsize)
> > -                     hid_err(hdev, "control rdesc unexpectedly large")=
;
> > +             if (newdesc + info->control_rsize > rdesc + *rsize)
> > +                     hid_err(hdev, "control desc unexpectedly large\n"=
);
> >               else {
> > -                     memcpy(rdesc + newsize, info->control_rdesc, info=
->control_rsize);
> > -                     newsize +=3D info->control_rsize;
> > +                     memcpy(newdesc, info->control_rdesc, info->contro=
l_rsize);
> > +                     newdesc +=3D info->control_rsize;
> >               }
> >       }
> >
> > -     *rsize =3D newsize;
> > +     *rsize =3D newdesc - rdesc;
> >       return rdesc;
> >  }
> >
> > --
> > 2.43.0
> >
>
> --
> Jiri Kosina
> SUSE Labs
>

