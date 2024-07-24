Return-Path: <linux-input+bounces-5137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCEE93AF88
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 12:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 734ABB20D54
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 10:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D131513B585;
	Wed, 24 Jul 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghycBVCb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF811C2AD
	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721815269; cv=none; b=RElKLW4jshtL8YENgDbIP7UqsRf7brq7mma2b8tnBGoP9Ixaiy6ee0oBHe7P8MP4HHwvDqMjBobv/PUP7Kk6zTmQ61HMbhj93tZhNQy2zm1g8hOyPoeadKS5NK9wWMg5TsLuzbOdFL1hISqT9DpBVUZlZNL0zjoIFm/FECncDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721815269; c=relaxed/simple;
	bh=VbSQK0fdGjniX4+zl374bMY8WnqvEh7sCQzLeQlT8bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR2O2R9aYDitVEbMvuYP5M3a4wCP3Me+dMMYK2wnI7uLtMlVC5QLK0sC0NHcGntC2213kPEx1kuXr2J+aWyCECdr0enxrU7GhxyCFlI4hIgbXzS4ksX9btD2yfJEo2F9G+BIdPAU2y7WPoz0Tuqjvc/bxaVKRW98xpoNmOm+jkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghycBVCb; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66ca536621cso35516297b3.3
        for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721815267; x=1722420067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kZDSflsFCEdGyx8834Dut9V56TuNQx+VBD2xZVv4Wg=;
        b=ghycBVCbel68QSHAFFeb3J9hfn1EBKTTF+PoBE70SWiWAfpgJdJ651GKZa5j2Yk5I0
         n3ZpcrTgh5B6Qb4/3Xrg70v+xdIrySy4oEPuEs3OU6M3Mfaj//IwUn8e12hv7RA6bdXb
         hAGLBTF49pVNVVAclrp2XclUs2F4YSIWHkeoMVAWIT49QT9/vtjbEGwDe/VL41P77jFK
         7VlnpRfvbn1TkiWq1THyQyluKW4TuWCrrsg99Ku3+/O73/PWD4mW8zoQgwXLzz3ezCkJ
         GCgoSkj4ByFuWt0sHk8pOqCdNl7Rtwz6iXDSj0r7Gm77P5I9J+YIholoMHyhTsmjd0DW
         qawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815267; x=1722420067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kZDSflsFCEdGyx8834Dut9V56TuNQx+VBD2xZVv4Wg=;
        b=KL7yYXR+RkTYLwXPYXY2ncgWg8Ulfred2bGf+5AuvR/siIswW2+XWDPSBKe97DUiUg
         iSCrYQ2EMVmOPHLxwPampWQBEnrWXq5s7vB8m8nw+i9Pp7V8BR3/lLP2IpjpyB3V5Ozn
         eitNl4a7FNcqwU8iRNeV98vtmcgMShoaxCZCi6kL7PfwtvO+Sh0Lr+mZBLdAf5tfI3SJ
         Gb6/2wOxpHACBAtIWnpmwd0mj7ZdKqBXXACijgOBYitzqT0016/2JFm0MRpm2pXaNNBY
         Z624jtnMmOqYb91gKI0GVYMnfrwHlP/ghlsp4z0Igd5i5SjmmXeN0qRbJpF0+oba7rCZ
         kX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7jKQnobgiM00+9sqLuG6S8VqoJ17YwS/mhrgzaevq3oDTOg/2I9tmOsxGMHJI7quEMcua3wLLPrcOouvUKdh48hIMgmbDBNO1cd0=
X-Gm-Message-State: AOJu0Yy9ycSrs2/qSW7XZB90Pb+vtXXtW9MoWe6QfOX1nLUMGa5xLQhK
	IZMsA09+0hEelou6UIRIUf7K60sR7tS98zUTbBwAFppiJgj59p1NGqjEM+2+aCNrjXq6J+DSm9A
	HREYMCnSL600o4C+juYNYaBAeKwqS0PzUcxU=
X-Google-Smtp-Source: AGHT+IEVeNO+2Cfb9V9/2c/6KUmzuCdkES7EuYq31KmkN850YaqTHVXMbo+cS4HBIjKjQEOyJN5G6QMSJFg13/KnwzA=
X-Received: by 2002:a05:690c:288c:b0:65f:8973:31a2 with SMTP id
 00721157ae682-67279fca551mr16673217b3.13.1721815267127; Wed, 24 Jul 2024
 03:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn> <ZqCDiTOl1GEuZUWb@google.com>
In-Reply-To: <ZqCDiTOl1GEuZUWb@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 24 Jul 2024 16:00:55 +0600
Message-ID: <CAMpQs4+OR96VZ4qQvqQAEAprfPVNWHQ8F-2vKTDDfQf40M_rLQ@mail.gmail.com>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:31=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Binbin,
>
> On Thu, Jul 04, 2024 at 08:52:43PM +0800, Binbin Zhou wrote:
> > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > supports both clickpad and touchpad types.
> >
> > At the same time, we extended the single data packet length to 16,
> > because according to the current PixArt hardware and FW design, we need
> > 11 bytes/15 bytes to represent the complete three-finger/four-finger da=
ta.
> >
> > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> > V4:
> >  - Thanks Dmitry for the review.
> >    - Just return what ps2_command() reports, instead of replacing it wi=
th
> >      -EIO;
> >    - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
> >      value and errors/success;
> >    - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
> >      some redundant code, like the call to input_mt_report_finger_count=
()
> >      and the setting of bits in the touchpad section.
>
> Thank you for making the change. I noticed a couple more things that I
> fixed up on my side and applied. Please take a look and shout if you
> see something wrong.

Hi Dmitry:

When I tried to fix it, I found that you had already fixed it for me
and merged it into your input/next branch. Thank you for your
corrections.
Also thank you very much for reviewing this patch series. I also
learned a lot about the input subsystem from it.

Of course I have tested it and it is good.

Thanks.
Binbin
>
> > +
> > +static void pixart_process_packet(struct psmouse *psmouse)
> > +{
> > +     struct pixart_data *priv =3D psmouse->private;
> > +     struct input_dev *dev =3D psmouse->dev;
> > +     int i, id, fingers =3D 0, abs_x, abs_y;
> > +     u8 *pkt =3D psmouse->packet;
> > +     u8 contact_cnt =3D CONTACT_CNT(pkt[0]);
>
> We have a nice FIELD_GET() macro that operates on a bitmask and value,
> so I changed CONTACT_CNT(m) to CONTACT_CNT_MASK and converted this to:
>
>
>         unsigned int contact_cnt =3D FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
>
> Same for SLOT_ID_MASK, ABS_Y_MASK, and ABS_X_MASK.
>
> > +     bool tip;
> > +
> > +     for (i =3D 0; i < contact_cnt; i++) {
> > +             id =3D SLOT_ID_MASK(pkt[3 * i + 3]);
> > +             abs_y =3D ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> > +             abs_x =3D ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
>
> That's way too many of pkt[3 * i + offset] repetitions, I made
>
>                 const u8 *p =3D &pkt[3 * i];
>
> temporary.
>
> <...>
>
> > +
> > +static int pixart_reconnect(struct psmouse *psmouse)
> > +{
> > +     u8 mode;
> > +     int error;
> > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > +
> > +     pixart_reset(psmouse);
> > +     error =3D pixart_read_tp_mode(ps2dev, &mode);
> > +     if (error)
> > +             return error;
> > +
> > +     if (mode !=3D PIXART_MODE_ABS)
> > +             return mode;
>
> This should be "return -EIO".
>
> Thanks.
>
> --
> Dmitry

