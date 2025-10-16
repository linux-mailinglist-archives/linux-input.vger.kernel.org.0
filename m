Return-Path: <linux-input+bounces-15513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DABE2D65
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 12:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3566188D7BA
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920862DF15B;
	Thu, 16 Oct 2025 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ftnv+0EO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6E2D0C7D;
	Thu, 16 Oct 2025 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611099; cv=none; b=KlECKbOqeNnPuAiqdjrURpZmWZLGcnRn7RqgLQin6+TM1wKF0rLR1dCwJec2L+HeYLoGBeIdeWrYSiE/9YGkJp0Vem+246sDK3I39nYiJKuv1i3VpzsrnPNPLhQJNTLRknUUqiYv61jrfNFEpUxDRL2XD6l7EMEh17KSEaIsGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611099; c=relaxed/simple;
	bh=8xbJ9lXmpz6svI5q8q0JDeGdOtjSkSYVx2kaRNrM/Ws=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gGcTAuXzdF4R9mxC7gTwYnSk59zG1iEknApQOnAUAu7WL3jJl3ZGxhLTcnkk57Nc+mfalHZYMRZcLLvoyqV3m3vedhZW1xiapFlSjf4UFy+W3jqq5IUgkWV6gjhTnrhyMwNSxd0WIvEI1ivLqhjmnSdqZ9SsJgNJ04smvUyWdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ftnv+0EO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760611097; x=1792147097;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8xbJ9lXmpz6svI5q8q0JDeGdOtjSkSYVx2kaRNrM/Ws=;
  b=Ftnv+0EOjBXARw9aWXGjAeqCOyxpHyxUUetb56HQBdjt5FsS6zdrh5FH
   bFls81bxBxAgkzGw7IsA3oRLiB6kI/uIO4DZy7Gy9nOjyY6uuq2cuAfog
   hfbAt22H6Rbi4wLBIUPsZw9OCq4zi+On1yr2iPk3aZgfBLwYAgxwxK16U
   a4zEIVL74f335kSCWDKCa9StQ4F4pILyb5dybRmgy5uD0YsiOuBqyiaeI
   LuHlwHk5wn4Ivv9jbOvUOzMKKNwUJBfZvjNa+XkcMueHH9rlCBynsB24f
   vhv/SxKwMIeJ8fltqS2nSsqnV1RMVMrTLlkYwxv4mYr2s2sSTdE8HDK68
   g==;
X-CSE-ConnectionGUID: VH6O2QXnTxazFjePy6U+8Q==
X-CSE-MsgGUID: e5mxPzMoT76PEkdObCYOSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80435575"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="80435575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:38:16 -0700
X-CSE-ConnectionGUID: u8z7iW1zTIyiv8cq8R1zag==
X-CSE-MsgGUID: 5nWPA7/TS2uBkUpaYE+gqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182826405"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:38:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 16 Oct 2025 13:38:09 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
In-Reply-To: <CAGwozwEo+Mx8fv_ohQQ9Ha6p=bJcJmfj==aRGcgoqQXzXEZmVw@mail.gmail.com>
Message-ID: <75807bcc-2b51-4b34-5173-433f3aedae76@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-4-lkml@antheas.dev> <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com> <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com> <cf824f48-58b4-2400-9acf-796bb76d6b28@linux.intel.com>
 <CAGwozwEo+Mx8fv_ohQQ9Ha6p=bJcJmfj==aRGcgoqQXzXEZmVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1392364556-1760611089=:1664"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1392364556-1760611089=:1664
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:

> On Thu, 16 Oct 2025 at 12:19, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:
> >
> > > On Wed, 15 Oct 2025 at 13:59, Ilpo J=C3=A4rvinen
> > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > >
> > > > On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
> > > >
> > > > > Some devices, such as the Z13 have multiple AURA devices connecte=
d
> > > > > to them by USB. In addition, they might have a WMI interface for
> > > > > RGB. In Windows, Armoury Crate exposes a unified brightness slide=
r
> > > > > for all of them, with 3 brightness levels.
> > > > >
> > > > > Therefore, to be synergistic in Linux, and support existing tooli=
ng
> > > > > such as UPower, allow adding listeners to the RGB device of the W=
MI
> > > > > interface. If WMI does not exist, lazy initialize the interface.
> > > > >
> > > > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > > ---
> > > > >  drivers/platform/x86/asus-wmi.c            | 118 +++++++++++++++=
+++---
> > > > >  include/linux/platform_data/x86/asus-wmi.h |  16 +++
> > > > >  2 files changed, 121 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x=
86/asus-wmi.c
> > > > > index e72a2b5d158e..a2a7cd61fd59 100644
> > > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > > @@ -258,6 +258,8 @@ struct asus_wmi {
> > > > >       int tpd_led_wk;
> > > > >       struct led_classdev kbd_led;
> > > > >       int kbd_led_wk;
> > > > > +     bool kbd_led_avail;
> > > > > +     bool kbd_led_registered;
> > > > >       struct led_classdev lightbar_led;
> > > > >       int lightbar_led_wk;
> > > > >       struct led_classdev micmute_led;
> > > > > @@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct a=
sus_wmi *asus)
> > > > >
> > > > >  /* LEDs ********************************************************=
***************/
> > > > >
> > > > > +struct asus_hid_ref {
> > > > > +     struct list_head listeners;
> > > > > +     struct asus_wmi *asus;
> > > > > +     spinlock_t lock;
> > > >
> > > > Please always document what a lock protects.
> > > >
> > > > I started wonder why it needs to be spinlock?
> > > >
> > > > It would seem rwsem is more natural for it as write is only needed =
at
> > > > probe/remove time (if there's no good reason for using a spinlock).
> > > >
> > > > You're also missing include.
> > >
> > > I went through the comments. Thanks. The reason that it is a spinlock
> > > is that both hid-asus and asus-wmi interact with the primitives to
> > > register and unregister listeners, either of which can prompt the
> > > creation of the led device which has to be atomic. And they do so fro=
m
> > > IRQs too.
> >
> > Please note in the changelog how it can happen from IRQs as I tried but
> > couldn't find anything. Admittedly, I didn't try to follow the callchai=
ns
> > that deeply. The justification should be clear enough to anyone who
> > looks this commit later so better have it in the changelog.
>=20
> The initial versions used a mutex, and we found kernel hangs under
> IRQs, so it was converted to a spinlock. I will try to reword.
> Specifically, I think the errors came when holding the lock when
> changing brightness.
>=20
> I recall one of them was brightness hotkey (second to last patch)
> triggers an IRQ -> event goes to asus-wmi -> calls brightness handler
> -> tries to hold lock -> crashes. Lock needs to be held because
> hid-asus can choose to unregister a listener.

If you're not certain and want an easy way to obtain a stacktrace to=20
confirm, you can likely do something like:

=09WARN_ON_ONCE(in_atomic());

=2E..at where you are taking the lock.

--=20
 i.

> > > Perhaps the driver could be refactored to use rwsem, I am not sure.
> >
> > Just leave it spinlock.
> >
> > > The fixed version can be found here[1]. I will give it 1-2 more days
> > > in case someone else wants to chime in and resend.
> >
> >
> >
> > --
> >  i.
>=20

--8323328-1392364556-1760611089=:1664--

