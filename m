Return-Path: <linux-input+bounces-11294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3FA714C2
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 11:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A81B16E1C8
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 10:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47271B21B4;
	Wed, 26 Mar 2025 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjKjprAo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E401A5B9C;
	Wed, 26 Mar 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742984703; cv=none; b=p1kFFUU0OpvKOLBAvjmrM3iSrX60yDXBZg3ynNyH+t8c+7ebfjo/dXIUCOYxL0uh9Z5FuAw34ujLoSzVfwjHqDNLqgjLfQ/95bUTYB+RGAHBk9Ib6mbLixifxwZJ6J6wzYcS+s8NNSpIe2BBkPBwDJ++0WTJMQxhW1I6ZO62UHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742984703; c=relaxed/simple;
	bh=HMpe+g8ayCMDDvXkSRNbqGD7K/UHAGzeFcPhq77IeGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mhZUTNfYWp70PkHUsePZSTzmtSG2G9Y7rYXtln4Xpl6uWKJagO/IKS2dHP73qSU8CgwDlPmU4x4nkUFZOEb6uxoBJaz5N1KEFU2+y2hp78nxaTb8iFSLj4INsJIK6E3+xxuRcJfHnW4aqdbkhl7Dsqr0ADV+uduqncWaPWxhDEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjKjprAo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742984702; x=1774520702;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HMpe+g8ayCMDDvXkSRNbqGD7K/UHAGzeFcPhq77IeGU=;
  b=QjKjprAoExhvdTGZdQnLuL1vfHr1FMoEo9Cw1jfJS63LkgnCjIppF1qR
   iIq2J3Rq1PfJyNuKGiTweZXBEthKERjGLYSjjjWgFoDrXvFu28pf+Wu/3
   lW172vpq71o6jHwS3mkRMGwi2O69mg1Lefss8I48umn08uRoUrRpXm9wT
   6v3WpZdz5AT2INGWGwwgrm+0qjlOd6t+RInkJNTGGABrQhmqCUFkRmJEV
   a6MmKnDFUY9TCCQZf6qaBsurjA6pYk2ZY6QY2+LOMMO8czUQoFETHLOaJ
   URTnidPEXuUer2/+E3iZTtgXBVcxzVFi93QFN14UX2Cq37w0xafj+c/7x
   A==;
X-CSE-ConnectionGUID: O7kMXzWITH6b//HbCVznXQ==
X-CSE-MsgGUID: oeL1VnFzRqeoZUDg8+dQAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48140934"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="48140934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 03:25:01 -0700
X-CSE-ConnectionGUID: NgYfe/fvSKuobzxo72HPeA==
X-CSE-MsgGUID: mWSjzESDQai1nBTapwA3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="125234310"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.5])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 03:24:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Mar 2025 12:24:53 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
In-Reply-To: <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
Message-ID: <43c4dd17-de34-804f-7080-b287ac4a0cac@linux.intel.com>
References: <20250325184601.10990-1-lkml@antheas.dev> <20250325184601.10990-10-lkml@antheas.dev> <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com> <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1308369930-1742984693=:942"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1308369930-1742984693=:942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Mar 2025, Antheas Kapenekakis wrote:
> On Wed, 26 Mar 2025 at 09:54, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Tue, 25 Mar 2025, Antheas Kapenekakis wrote:
> >
> > > Adds basic RGB support to hid-asus through multi-index. The interface
> > > works quite well, but has not gone through much stability testing.
> > > Applied on demand, if userspace does not touch the RGB sysfs, not
> > > even initialization is done. Ensuring compatibility with existing
> > > userspace programs.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/hid/Kconfig    |   1 +
> > >  drivers/hid/hid-asus.c | 171 +++++++++++++++++++++++++++++++++++++--=
--
> > >  2 files changed, 156 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > > index dfc245867a46a..d324c6ab997de 100644

> > > +     };
> > > +     unsigned long flags;
> > > +     uint8_t colors[3];
> > > +     bool rgb_init, rgb_set;
> > > +     int ret;
> > > +
> > > +     spin_lock_irqsave(&led->lock, flags);
> > > +     rgb_init =3D led->rgb_init;
> > > +     rgb_set =3D led->rgb_set;
> > > +     led->rgb_set =3D false;
> > > +     colors[0] =3D led->rgb_colors[0];
> > > +     colors[1] =3D led->rgb_colors[1];
> > > +     colors[2] =3D led->rgb_colors[2];
> > > +     spin_unlock_irqrestore(&led->lock, flags);
> > > +
> > > +     if (!rgb_set)
> > > +             return;
> > > +
> > > +     if (rgb_init) {
> > > +             ret =3D asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT=
_ID1);
> > > +             if (ret < 0) {
> > > +                     hid_err(led->hdev, "Asus failed to init RGB: %d=
\n", ret);
> > > +                     return;
> > > +             }
> > > +             spin_lock_irqsave(&led->lock, flags);
> > > +             led->rgb_init =3D false;
> > > +             spin_unlock_irqrestore(&led->lock, flags);
> > > +     }
> > > +
> > > +     /* Protocol is: 54b3 zone (0=3Dall) mode (0=3Dsolid) RGB */
> >
> > BTW, this comment is very cryptic to me and I'm unable to connect it wi=
th
> > the code below. My only guess is that each non-parenthesized word is
> > explaining one index but things don't add up given what rgb_buf[0][0] a=
nd
> > [0][1] have.
>=20
> Maybe i fatfingered 54 and it should be 5a. Protocol is 54b3 zone mode
> R G B. So colors go to indexes 4, 5, 6

Ah. I suggest you add the spaces between the bytes to make it more=20
obvious. Although, this could be a constructed as struct as well in which=
=20
case the struct itself would document the format without need to=20
cryptic comments nor use of numeric indexes.

> > > +     rgb_buf[0][4] =3D colors[0];
> > > +     rgb_buf[0][5] =3D colors[1];
> > > +     rgb_buf[0][6] =3D colors[2];
> > > +
> > > +     for (size_t i =3D 0; i < ARRAY_SIZE(rgb_buf); i++) {
> > > +             ret =3D asus_kbd_set_report(led->hdev, rgb_buf[i], size=
of(rgb_buf[i]));
> > > +             if (ret < 0) {
> > > +                     hid_err(led->hdev, "Asus failed to set RGB: %d\=
n", ret);
> > > +                     return;
> > > +             }
> > > +     }
> > > +}

> > >       ret =3D asus_hid_register_listener(&drvdata->kbd_backlight->lis=
tener);
> > > -     if (ret < 0) {
> > > -             /* No need to have this still around */
> > > -             devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> > > +     /* Asus-wmi might not be accessible so this is not fatal. */
> > > +     if (!ret)
> > > +             hid_warn(hdev, "Asus-wmi brightness listener not regist=
ered\n");
> >
> > Is the condition correct way around given the message?
>=20
> You are right.
>=20
> > Please also note that you don't need to send an update every day or so
> > after minor comments like this. We're in merge window currently which
> > means I likely won't be applying any next material until -rc1 has been
> > released.
>=20
> If this is 6.16 material I am happy to put a pause on this for the
> next 1-3 weeks.

You don't need to "pause" for the merge window, in some subsystem=20
there's mandatory pause during merge window but I find that unnecessary.
I know people on pdx86 do review during merge window so no need to wait=20
when working with patches related to pdx86. Just don't expect patches=20
get applied during the merge window or right after it (the latter tends to=
=20
be the most busiest time of cycle for me) :-).

It's more about the frequency, how often to send a series which is=20
relatively large. Large number of versions end up just filling inboxes=20
(and patchwork's pending patches list) and we don't have time to read them=
=20
all through so I suggest waiting like 3 days at minimum between versions=20
when the series is large or complex to give time to go through the series.

This is not a hard rule, so if there are e.g. many significant changes,=20
feel free to "violate" it in that case.

--=20
 i.

--8323328-1308369930-1742984693=:942--

