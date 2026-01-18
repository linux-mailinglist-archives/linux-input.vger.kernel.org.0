Return-Path: <linux-input+bounces-17191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F150D39B75
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 00:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B27130062F7
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 23:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53AA31ED63;
	Sun, 18 Jan 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD0+JqWB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A33191C0
	for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 23:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768779721; cv=none; b=CIyYNuzgyoUJ4WrHn3xVGNC0z9H/tsvYO7H9HgDmsYTbiHqDr848rK9AnQ2/5LQVpdVPHFiy7llLvr4OnwICzwfcnrN52DQUNy7U0fP5Onav1nnZWvaXTQB+aSMji/jGBDfxMJwKPscum6Q76UhwlorWshLKbd0QBM+VgFYo4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768779721; c=relaxed/simple;
	bh=CnzGCcxXaqOPF1LDVdQs4mDLbknYV4USV3TM1rqHYQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnMGI8sfwETOuXu5BkQmBYPka49ALjlMAkjPYoe+/7TrAOIAv9Purpc2tEw4aewK85DjE1cyGrO4HjCvtqrkN1jYFIhgJS+4e99ozEm1LKP8NFQymmqXfHDYbPVZE30MxBgkFfV4xpXntXfbx6U+a+vrn0ZbJOhe5RXJWVve8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD0+JqWB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6c89d302so3225876e87.1
        for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 15:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768779718; x=1769384518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp5cjlNe11W4IZEoA0zzgHiF956wEJnz1qzo6AZNGE8=;
        b=KD0+JqWBhgclIUoQaVtmkfVHpu3IJ6preSxgIu3IuA5tv9Pc3cpGW7wcqFWdfM7O+8
         1CJxHkeGXgi1d9UQeQ6VDEjia3+WHYiTEc6Y6hZPurs2pkxchxN0VSlDDG1tDwZ4bSjT
         914SELuObEeWSQ3gA/igFQIZ6TQOqc6m4iGhwQxnAgvGlAJNF0alnKM6e8I5kz2AWbh0
         FqSW9lH17px4VubrhVxOPpzKHQIkL3E6l/8Cf27MjswmaUfJyVdDXb4rc6MtURVjr7yY
         lgrx1wh4pQbEjRRYFaig94NAkGz9Um33YVvalwUeHlLNeukBsydqfv+/CkWdujsJp4SX
         Whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768779718; x=1769384518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lp5cjlNe11W4IZEoA0zzgHiF956wEJnz1qzo6AZNGE8=;
        b=uAopJIZknhyCFC3OxDnksWIDqyyZ3CN/b2ekK1eDCSJiEeOeT9O0sVo6xeKamt9GNC
         prCOgNxL2qfehI+MHA3VIGVybhntr60esytbvMl8qI9EIGLc7L6KSmo/AAvKYhlA1f8B
         uCdl0P2sbIhuJE6GsCZ4XOabZdTsQdpEfJtx5+HBCerwoINFMYVsAchS+MDBOdLNHKfy
         DSu5sRZAkrckS0nWDrruri4IQolr9WrC6EOt6cl4w+78Eb5BuH2F8iLbKvHlMFKRtzG4
         ZU+iTCPE/KURJWDucod8o1smmvo25wUEglgAWpvk5gsfie8vZJIIc9zPjBjQ9ZuPsTKV
         YZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc9zLUTgDkXPIZPrL4HaQlBTic1CU5lT+DXtc3yb6pl0XiT3k8Bet9Il/dxXA+GulR0VGhDnRn52QCdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIqS1atNkhVqrMuXJCrGsIQVqfiANGVDi2EUMpMaFDZO1q0fi
	UqQpQvykJyez34K1udw0CCwhoszTnw1L6jGPrplmmPa1UQaRjqutUTPrtRMOAwvTdZ7nVHmX5I9
	YtNPKtjCzhsPuHsvsuTXa0WcSeUcWY2Eq8w==
X-Gm-Gg: AY/fxX4dSt81J9thpUFN9l5JXgMTH4xGIB7ZzGdxRtFlAeDYuiLRtBy043nMuGvCzGL
	R7o26KxN2py/FH/Sxx2hp+7qt4prCUNKMxXho5+uRtfSg9+qKVfmUPIiwQnrtRANSK0Am1OuJd6
	8CVmr3F2vZyEZC74o/5SkYeRkYYgv9Yg9tG9SKgZL2c6vzs9E20vrXirm9pYHLMl2SRBDBDqgkn
	fb2o1wVqkL/clA/vxwV7Rg0mY4u5SvY/NkzkhLSLqjKwujC4SrY0dMNiPSHtjXOivQCIuH9
X-Received: by 2002:a05:6512:150c:10b0:59b:9af4:4b9e with SMTP id
 2adb3069b0e04-59baee93ecfmr2280074e87.4.1768779718324; Sun, 18 Jan 2026
 15:41:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230221639.582406-1-yajatapps3@gmail.com> <fa17c5bb-9ab9-46f7-86fb-c06e09617279@kernel.org>
In-Reply-To: <fa17c5bb-9ab9-46f7-86fb-c06e09617279@kernel.org>
From: YAJAT APPS <yajatapps3@gmail.com>
Date: Sun, 18 Jan 2026 18:41:44 -0500
X-Gm-Features: AZwV_QjIKRuU7-MKGBDORBoMSCQY-3JLxZaPaqELJRzMH8hurOZhh3vQQwucNcM
Message-ID: <CAPrYeK6P1kmeocg9Bt6pzoxzc+GumK4P=_asfHxVzqw5uhVkBw@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix - fix inverted Y coordinate on SUPI S10
To: Hans de Goede <hansg@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: [PATCH] touchscreen-dmi quirk for SUPI S10

Hi Hans,

I=E2=80=99ve tested the attached patch on the SUPI S10.

The touchscreen uses ACPI HID GDIX1001, so no change is needed there.
With the patch applied, the Y axis is no longer inverted and touch
input now matches the display orientation correctly.
You can add:

Tested-by: Yajat Kumar <yajatapps3@gmail.com>

Thanks for the quick fix and explanation.

Regards,
Yajat Kumar


On Sun, Jan 11, 2026 at 4:30=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi Yajat,
>
> On 30-Dec-25 23:16, Yajat Kumar wrote:
> > The touchscreen on the SUPI S10 reports inverted Y coordinates, causing
> > touch input to be mirrored vertically relative to the display.
> >
> > Add a DMI-based quirk to invert the Y coordinate on this device so that
> > touch input matches the display orientation.
> >
> > Tested on SUPI S10 tablet with Goodix touchscreen controller.
> >
> > Signed-off-by: Yajat Kumar <yajatapps3@gmail.com>
>
> Thank you for your patch. This kind of quirks really belong
> in drivers/platform/x86/touchscreen_dmi.c instead of in individual
> touchscreen drivers.
>
> The inverted_x_screen[] DMI quirk is a left-over from before we
> moved these quirks to touchscreen_dmi.c and unfortunately we cannot
> move this because we've not been able to find someone to test this.
>
> I've attached a patch which should fix the issue using
> touchscreen_dmi.c . Note you may need to change the GDIX1001 in
> the patch to GDIX1002, see "ls /sys/bus/i2c/devices" to see which
> ACPI HID your touchscreen is using.
>
> Can you please test the attached patch ?
>
> Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchsc=
reen/goodix.c
> > index f8798d11ec03..d675a85a9312 100644
> > --- a/drivers/input/touchscreen/goodix.c
> > +++ b/drivers/input/touchscreen/goodix.c
> > @@ -160,6 +160,22 @@ static const struct dmi_system_id inverted_x_scree=
n[] =3D {
> >       {}
> >  };
> >
> > +/*
> > + * Those tablets have their y coordinate inverted
> > + */
> > +static const struct dmi_system_id inverted_y_screen[] =3D {
> > +#if defined(CONFIG_DMI) && defined(CONFIG_X86)
> > +     {
> > +             .ident =3D "SUPI S10",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "SUPI"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "S10")
> > +             },
> > +     },
> > +#endif
> > +     {}
> > +};
> > +
> >  /**
> >   * goodix_i2c_read - read data from a register of the i2c slave device=
.
> >   *
> > @@ -1212,6 +1228,12 @@ static int goodix_configure_dev(struct goodix_ts=
_data *ts)
> >                       "Applying 'inverted x screen' quirk\n");
> >       }
> >
> > +     if (dmi_check_system(inverted_y_screen)) {
> > +             ts->prop.invert_y =3D true;
> > +             dev_dbg(&ts->client->dev,
> > +                     "Applying 'inverted y screen' quirk\n");
> > +     }
> > +
> >       error =3D input_mt_init_slots(ts->input_dev, ts->max_touch_num,
> >                                   INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSE=
D);
> >       if (error) {

