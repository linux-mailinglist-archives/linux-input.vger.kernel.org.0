Return-Path: <linux-input+bounces-16540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B99CB63F1
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 15:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0734730237AF
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 14:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A6D28CF66;
	Thu, 11 Dec 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EopJAEP6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34928AAEE
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464414; cv=none; b=uSQPL+udtXw/vjPr/bH1QanMFjwWdRiU2eBEihaNWpvWRN5khwcKmLeekEiUjYpsE7VXlUsCoHsIXRfdQGsUPkAQCP810g+44rcqhai9wV4pMdF7uyTs3DTU2EVvyMVNTXvvUKPslGO8yJJ495xQl1cCRbuFe9F+EaNCqAyFOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464414; c=relaxed/simple;
	bh=Z8pwXA3E9NvlNSAbfNFGW711RMsclhI4mGoYLMvcV1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJUTAsMR6tcpc/PcujISkJ2IHB9XoEh19KvhXpFl0oKPFW1tkLuclzh7Vqry8Pifxy4x0XA2PE08RcoP+UJwXYfo0FoM6QPXE4VajP3Z29a1XVwP2XL5ITVpy5fDSVz9bXAQQ6CR9j6RqJnl9Mj0tWKuDmU1gMijaTlIEil+/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EopJAEP6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-595910c9178so134978e87.1
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765464411; x=1766069211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfi80okuvZYcN9lPw2PbCSm5AvfB6SEfDQ+chpjk5ho=;
        b=EopJAEP61w7/YltiLtsqH+/KG7Ua8WRhqulEXZM/I/xE4miTfH8VNu0nyaKoPAw9c0
         aaxgmiGR7aWUsRlCiY64YKpItR2YuQ21RIAxOoWvXr/wgkZU2zDjAtE1nrLk7U43u0ON
         qN651sS8Yv/k0at/itMN18tOPCD2l569Wzr8afBSQVVc+VxE72so68Gqv5Pb3sA9NQin
         MToa9BTFPwZFMeQU6Mdw3CQdL7Y8uQaDyoBLdPixXYUiby7qVVXVtlsTY6xat4Zlnplf
         zoPPLVFIvvKcMxoWcEfNyiTboUB2DHcjKE19AZcjNhyUq20afIJHKaf/3//oLWk8U9ce
         DHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464411; x=1766069211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kfi80okuvZYcN9lPw2PbCSm5AvfB6SEfDQ+chpjk5ho=;
        b=Y7P3UI2pQsewTPRCeP7NWLsjwcuuTT0ettmMLkizNitex5GemHyB14ApJZYHXrAnQ9
         J81oajR0/IsOthMlyvr1a5X7Wis5bKwQVNmk+Vkni5B7vv+RDj0dPObGfL35/F75NEn2
         M7tr02vXacQLRYxhciofnvRSY/MwFLQh+l1Va07UFH1Bd7at5nkG18Xd3LnNY9JYfy0d
         pMVR/YeN90hsCkMmQaugwq9JDc+AjCjs2nUbLip3EEll38WTxb+I5l47avcmuxxCMhSq
         xwwTZXr7ysRTxpn8pp5QHeHNK6fgUgjUHr7LrZYoLuv41rBBDFmNwQ+bNIO0jOfgZvZy
         jiWg==
X-Forwarded-Encrypted: i=1; AJvYcCV7RwdnRIhP2uoUJmVsHSL0a62lRtAn30vWULoJ0dy5PIP9qa0eBUJ+DzI5HHXRsn/7fMWOgPHpVVcb6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybt/oqtQzwYH7zUNK6tof7vqRCAteTbje6F3ii6QfU47khzaqQ
	aBTy6CFVRys3RsK4mV8byT9nqnb2AA8yrNcWCnXFmwAK+/NjrGbY47lF/bt5Xfd0ZozJJN4ZoNu
	GsDQ2cbg3B1vZrEuzOp2sGTseY6gzfaA=
X-Gm-Gg: AY/fxX7iO3J+NRbWxM1JRBwhFo0HR08rWvpK4gsuogVxO77rl+ABNJ67FUKj0OM92s9
	s3HpME4s2izJc2F4tD/3kMftYeNNKnLYNXqagRY8eFZEEjkZOljTv05wziOLxZUyIlAmCTd061B
	dXRmtb4/UMSjBMagv6opHBXg6V9BoHvS3Tk/NeKCx6AG0ZxhOkycAxy1+B3eApSkUR72627ivGU
	LojwSyOy1ioM5G5Th4DTXmEuR+Fcimg39k6O1fyiRiwCdFFvQz6bGj/5W73/cxap6kcmqJXUGoP
	Bs8ehh0s/roCCUjf+9sUPX9V2l9s
X-Google-Smtp-Source: AGHT+IERof09vBwYW6Dusa4ESex7D3E3lmDizgOtvwohmRz9tPqKmbQKRDJ3NyiWTHVawhoa/4Iz5XZwXW5E5XjxWk8=
X-Received: by 2002:a05:651c:31da:b0:37e:5602:4a53 with SMTP id
 38308e7fff4ca-37fb21548b3mr18569841fa.22.1765464410490; Thu, 11 Dec 2025
 06:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129002533.9070-1-vishnuocv@gmail.com> <20251129002533.9070-2-vishnuocv@gmail.com>
 <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
In-Reply-To: <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 11 Dec 2025 23:46:13 +0900
X-Gm-Features: AQt7F2qKZRA9_LzFSrr86WtwwgCQD2YzopRBEv1hQn9SUqGi0iGUOpwH4ifiZ08
Message-ID: <CABxCQKt8U-QkT-LWiFR72X_XkRrkeUFsbC_rWOb=90LQxJ7MjQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: corbet@lwn.net, hmh@hmh.eng.br, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dimitry,

Thank you so much for the review.



On Thu, Dec 11, 2025 at 3:49=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Vishnu,
>
> On Sat, Nov 29, 2025 at 09:25:31AM +0900, Vishnu Sankar wrote:
> > Enable doubletap functionality by default on TrackPoint devices that
> > support it. The feature is detected using firmware ID pattern matching
> > (PNP: LEN03xxx) with a deny list of incompatible devices.
> >
> > This provides immediate doubletap functionality without requiring
> > userspace configuration. The hardware is enabled during device
> > detection, while event filtering continues to be handled by the
> > thinkpad_acpi driver as before.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > ---
> > Changes in v4:
> > - Simplified approach: removed all sysfs attributes and user interface
> > - Enable doubletap by default during device detection
> > - Removed global variables and complex attribute infrastructure
> > - Uses minimal firmware ID detection with deny list
> > - Follows KISS principle as suggested by reviewers
> >
> > Changes in v3:
> > - No changes
> >
> > Changes in v2:
> > - Improve commit messages
> > - Sysfs attributes moved to trackpoint.c
> > - Removed unnecessary comments
> > - Removed unnecessary debug messages
> > - Using strstarts() instead of strcmp()
> > - is_trackpoint_dt_capable() modified
> > - Removed _BIT suffix and used BIT() define
> > - Reverse the trackpoint_doubletap_status() logic to return error first
> > - Removed export functions as a result of the design change
> > - Changed trackpoint_dev->psmouse to parent_psmouse
> > - The path of trackpoint.h is not changed
> > ---
> >  drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
> >  drivers/input/mouse/trackpoint.h |  5 ++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/tra=
ckpoint.c
> > index 5f6643b69a2c..67144c27bccd 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *ps=
mouse)
> >       return 0;
> >  }
> >
> > +/* List of known incapable device PNP IDs */
> > +static const char * const dt_incompatible_devices[] =3D {
> > +     "LEN0304",
> > +     "LEN0306",
> > +     "LEN0317",
> > +     "LEN031A",
> > +     "LEN031B",
> > +     "LEN031C",
> > +     "LEN031D",
> > +};
> > +
> > +/*
> > + * Checks if it's a doubletap capable device
>
> Please finish the sentence with a period.
Got it.
I will complete the sentence in the comment:
>
> > + * The PNP ID format is "PNP: LEN030d PNP0f13".
> > + */
> > +static bool is_trackpoint_dt_capable(const char *pnp_id)
>
> Let's call it trackpoint_is_dt_capable() to keep with common
> "trackpoint_" prefix in the file.
Agreed.
Will use trackpoint_is_dt_capable() instead of is_trackpoint_dt_capable.
>
> > +{
> > +     const char *id_start;
> > +     char id[8];
> > +     size_t i;
> > +
> > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > +             return false;
> > +
> > +     /* Points to "LEN03xxxx" */
> > +     id_start =3D pnp_id + 5;
> > +     if (sscanf(id_start, "%7s", id) !=3D 1)
> > +             return false;
> > +
> > +     /* Check if it's in the deny list */
> > +     for (i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
> > +             if (strcmp(id, dt_incompatible_devices[i]) =3D=3D 0)
>
> Why can't we use strncmp(pnp_id + 5, dt_incompatible_devices[i], 7) here
> (after ensuring that pnp_id is of sufficient length to begin with) and
> avoid sscanf()?
>
Agreed.
I can avoid the temporary buffer completely and compare directly using
strncmp().
Thank you.
> > +                     return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable=
)
> > +{
> > +     return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLET=
AP_ENABLE : TP_DOUBLETAP_DISABLE);
> > +}
>
> This wrapper seems an overkill given that it is called only once and
> always to enable the doubletap.
Understood.
Will call trackpoint_write() directly instead of using the
trackpoint_set_doubletap() wrapper.
>
> Thanks.
>
> --
> Dmitry



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

