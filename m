Return-Path: <linux-input+bounces-15571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 607DBBE8155
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 12:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EBB14FFD0E
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40D627FD5B;
	Fri, 17 Oct 2025 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/HScOWq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D831824A3;
	Fri, 17 Oct 2025 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760697375; cv=none; b=jx8WP0w1pmm3gBsGgi10hVBs7NTyNieFO7GxtyohZIgXKr5IlagYxSlwSVU2dgrbrfx40iny532R89wJBP80f1VoX/gMXaHwBvBQaaAmB4B+9hnbWMUABSXh1A3wrkvqwaA8lDbZsJYuCwSPf1V5cLvkLsXqgUvj+B7ddtxF0GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760697375; c=relaxed/simple;
	bh=opNui8Mv9U7I0QBWdXEv1ciqiflu8tqFjRdSebW1eHs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QDz9HOVRcLR1mZSoZ1EzukVnrF9FUOVzrTEl8vKgqmilqyUZ1cCUyg3zPgeENuqM16wh3Jr+v8vH19dXRdG2Dg38+O8xYJkeZfNJq1TM/iuY78ipqgbLDaYxqQFCR8NuoKLcnbySkRpjTDptpvu9PwwgKkGzQ+I/KO59LGxfP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/HScOWq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760697373; x=1792233373;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=opNui8Mv9U7I0QBWdXEv1ciqiflu8tqFjRdSebW1eHs=;
  b=f/HScOWqqHV77QUTpf6hIqufuYbeyMqNsblRXb8ijsybkP0bNo8+sN4m
   y2wSXh+LCEPfkjHsWt3iOjapidRTfm/tY0z2lWlEH7ZfkeYdY6jCqytEI
   o4SUh07GG8f3i0S1ltfrx+dE7YBCojVvNqf8n1buGyB6+RAJAm+rccqWG
   Zdc2X0Ove/BDhDCSFoZ3F2gy/jyBwWY9tG3HKtrJfxmgPNtZWxlZSIXEz
   kr7drfOUrCy7wrMIuzHrJn3iN5E7JlLPnkzQKI+OmI7R57wWe4SPnfyrP
   q4EDyXHVjYjHCgoHSlepnQqe80OOD5+fAF88W5heiuWb4ndl4Xg6tYn0x
   g==;
X-CSE-ConnectionGUID: I1jUad1TRQKsrCrMg1CKMw==
X-CSE-MsgGUID: DxtlXR/eS5eD2UFwzuKo5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74020882"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="74020882"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 03:36:12 -0700
X-CSE-ConnectionGUID: 1SSFR2hAS3eE+KzsEciHzg==
X-CSE-MsgGUID: yFhjv57hR3GbfYn2LwTLmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="187974632"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 03:36:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Oct 2025 13:36:04 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
In-Reply-To: <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
Message-ID: <18bb12d2-c258-5064-1702-005f9d5b0dd3@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com> <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com> <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1043059048-1760697364=:1052"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1043059048-1760697364=:1052
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> On Thu, 16 Oct 2025 at 17:09, Ilpo J=C3=A4rvinen
> > On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> > > On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> > > > On 10/13/25 22:15, Antheas Kapenekakis wrote:
> > > > > This is a two part series which does the following:
> > > > >   - Clean-up init sequence
> > > > >   - Unify backlight handling to happen under asus-wmi so that all=
 Aura
> > > > >     devices have synced brightness controls and the backlight but=
ton works
> > > > >     properly when it is on a USB laptop keyboard instead of one w=
/ WMI.
> > > > >
> > > > > For more context, see cover letter of V1. Since V5, I removed som=
e patches
> > > > > to make this easier to merge.
> > > > >
> > > > > All comments with these patches had been addressed since V4.
> > > > I have loaded this patchset for users of asus-linux project to try =
out.
> > > >
> > > > One of them opened a bug report about a kernel bug that happens
> > > > consistently when closing the lid of his laptop [1].
> > > >
> > > > He also sent another piece of kernel log, but didn't specify anythi=
ng more
> > > > about this [2].
> > > >
> > > > [1] https://pastebin.com/akZx1w10
> > > > [2] https://pastebin.com/sKdczPgf
> > >
> > > Can you provide a link to the bug report? [2] seems unrelated.
> > >
> > > As for [1], it looks like a trace that stems from a sysfs write to
> > > brightness stemming from userspace that follows the same chain it
> > > would on a stock kernel and times out. Is it present on a stock
> > > kernel?
> > >
> > > Ilpo should know more about this, could the spinlock be interfering?
> >
> > [1] certainly seems to do schedule() from do_kbd_led_set() so it's not
> > possible to use spinlock there.
> >
> > So we're back to what requires the spinlock? And what the spinlock
> > protects?
>=20
> For that invocation, since it is coming from the cdev device owned by
> asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
> asus_wmi is protected by the fact it is owned by that device. Spinlock
> is not required in this invocation due to not being an IRQ.
>=20
> Under asus_hid_event (second to last patch), which is called from an
> IRQ, a spinlock is required for protecting both listeners and the
> asus_ref.asus, and I suspect that scheduling from an IRQ is not
> allowed either. Is that correct?

Yes, it's not allowed either.

hid-asus seems to already use workqueue (though include for it is=20
missing) likely to workaround a similar challenge.

--=20
 i.

--8323328-1043059048-1760697364=:1052--

