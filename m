Return-Path: <linux-input+bounces-15511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58960BE2C9A
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 12:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322323BAE91
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 10:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A66C32861D;
	Thu, 16 Oct 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgE07Cfd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946F32860C;
	Thu, 16 Oct 2025 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609943; cv=none; b=mLnx6WXc8IxXrLAdKrbXinbVTobMLp/xtox8uUG8q2cUsLXXeBCxnKieED/MkoUSLyKVaweU9WxzfHrGNNf3CCxmXxdD5r3coWrJP7sXat0nplQBXluUIMHpUfVbJXAybVOz+DvwnknqHV7m05BXwlywqNwet4FtkTQRE7yyTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609943; c=relaxed/simple;
	bh=Eluc4w9ycVVcfrCZPAC/PaN5nQHAhBh69pF94Zrj1I8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cRQ0MawMXXmwGnuiceeNdAYd0lod9s4Buow6gnldRtXGBJpRUJJ4NhoDsKEZCMIsv6pQ2tOgnhcGRHjnULvl3m3l1Re0mCXP7Sy4Zy5NNFnhvOyZO4w57dDyvUwJzmiq/2VkovYc4Bc1Hic1Jq6khWXkP5ixmeCuJNQxg9HWbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgE07Cfd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760609941; x=1792145941;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Eluc4w9ycVVcfrCZPAC/PaN5nQHAhBh69pF94Zrj1I8=;
  b=CgE07CfdrvKL0rZyhWSQBovTH9sXymDfJk7Lgiujrm4z9Z8enR3D4uoc
   GBl/zT6hDF3KPuD3NGps4Hxiep3kFBSfI6nEBT91B0rI3xjkDqirmB7WO
   kE1VvcQ1ZIasGZcmcKGkqxs+tbJvh0tPSB4UP5b9bhMUAhvq2vQ/veJRm
   UEMtUjNGsuFoHqZNRjUzNs6iyzMOHrrhGEQTHHNqKPJ1BMClJhxayB53B
   YsuSXw9bflrmLwgDafRiQJYaCjtvA6fLI0z/aeYqBlOJ81toA4CxIahmu
   LeQ/w1HXXf5IYsgZekNJ2SXOYTKOxWi5eLSaX4d1X79hiGl6nHvIy286Y
   A==;
X-CSE-ConnectionGUID: 8nRLQuKSQEKTAV3OcDQ3OA==
X-CSE-MsgGUID: jCib9RurQY2NIyCmH+E4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62946934"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62946934"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:18:59 -0700
X-CSE-ConnectionGUID: CJrAuFCmTOu9r6ffC+QvlA==
X-CSE-MsgGUID: fEesfpwWTiK4errXV8tOuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="213377964"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:18:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 16 Oct 2025 13:18:53 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
In-Reply-To: <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com>
Message-ID: <cf824f48-58b4-2400-9acf-796bb76d6b28@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-4-lkml@antheas.dev> <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com> <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-193638825-1760609933=:1664"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-193638825-1760609933=:1664
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:

> On Wed, 15 Oct 2025 at 13:59, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
> >
> > > Some devices, such as the Z13 have multiple AURA devices connected
> > > to them by USB. In addition, they might have a WMI interface for
> > > RGB. In Windows, Armoury Crate exposes a unified brightness slider
> > > for all of them, with 3 brightness levels.
> > >
> > > Therefore, to be synergistic in Linux, and support existing tooling
> > > such as UPower, allow adding listeners to the RGB device of the WMI
> > > interface. If WMI does not exist, lazy initialize the interface.
> > >
> > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/platform/x86/asus-wmi.c            | 118 ++++++++++++++++++-=
--
> > >  include/linux/platform_data/x86/asus-wmi.h |  16 +++
> > >  2 files changed, 121 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> > > index e72a2b5d158e..a2a7cd61fd59 100644
> > > --- a/drivers/platform/x86/asus-wmi.c
> > > +++ b/drivers/platform/x86/asus-wmi.c
> > > @@ -258,6 +258,8 @@ struct asus_wmi {
> > >       int tpd_led_wk;
> > >       struct led_classdev kbd_led;
> > >       int kbd_led_wk;
> > > +     bool kbd_led_avail;
> > > +     bool kbd_led_registered;
> > >       struct led_classdev lightbar_led;
> > >       int lightbar_led_wk;
> > >       struct led_classdev micmute_led;
> > > @@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct asus_=
wmi *asus)
> > >
> > >  /* LEDs ************************************************************=
***********/
> > >
> > > +struct asus_hid_ref {
> > > +     struct list_head listeners;
> > > +     struct asus_wmi *asus;
> > > +     spinlock_t lock;
> >
> > Please always document what a lock protects.
> >
> > I started wonder why it needs to be spinlock?
> >
> > It would seem rwsem is more natural for it as write is only needed at
> > probe/remove time (if there's no good reason for using a spinlock).
> >
> > You're also missing include.
>=20
> I went through the comments. Thanks. The reason that it is a spinlock
> is that both hid-asus and asus-wmi interact with the primitives to
> register and unregister listeners, either of which can prompt the
> creation of the led device which has to be atomic. And they do so from
> IRQs too.

Please note in the changelog how it can happen from IRQs as I tried but=20
couldn't find anything. Admittedly, I didn't try to follow the callchains=
=20
that deeply. The justification should be clear enough to anyone who=20
looks this commit later so better have it in the changelog.

> Perhaps the driver could be refactored to use rwsem, I am not sure.

Just leave it spinlock.

> The fixed version can be found here[1]. I will give it 1-2 more days
> in case someone else wants to chime in and resend.



--=20
 i.
--8323328-193638825-1760609933=:1664--

