Return-Path: <linux-input+bounces-16037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF06C5279A
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 14:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D3C84EE088
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB99430C34A;
	Wed, 12 Nov 2025 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuM4uggD"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05E314B66;
	Wed, 12 Nov 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953729; cv=none; b=iX60/uErl3LeyQHdy8HrvOj8fhJr9B3yYhGkpv0rtVyNcqdlT8JsW1JCCl5LXmuwmA0gUMzaUL0/gAxvHFqFQ9J4AVY9+pZ9ZUNjrbpX69dN6mTneoMOnGn3NQlZUdZPSq1TmffaQ0squ9a0+lAdh/HEp1Z7lrGDB5DeKiIAgq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953729; c=relaxed/simple;
	bh=ovlZgRRWjheuXQydj1w++9scwbRDo1vkxw4I8iNtNJc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JfHr+8fH4m/b6cFKzbkIQ6l8um7F/PeXurJOX6Kw0m1nQer/x01Hkj6upRXDVIpS4+bPRGawCEy2MKb8rZ3ghxytsBJ222pbJs+8T7E08qejU+i1kEOo1oGBJmp8S4B4f6XA+NeF5gCsSzOoiYFaGJa6PrwnjoP+4BjZlA/f5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuM4uggD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762953727; x=1794489727;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ovlZgRRWjheuXQydj1w++9scwbRDo1vkxw4I8iNtNJc=;
  b=OuM4uggDoFX64yX6Zqnx/rlYbNxIf1RoR6tip96yvgEF5VNOnXd/IEmo
   kEoSej6cTy0XaFmNe4TvlGe6rJizAio8f9kIxI1R4z5D9V91ngJ8HYHK4
   YmEdniwXIP/XPTaP0WmToPgjoqIm8HTr9ckw8694N+Wk6dwqpYpvudAnN
   zQwk6XZNu2TSuSGZCy7LixRNj6b0LZRalFTnRow0UEBB8578CmQ1m3lHf
   4i5azz/pXi45mTyzPwETLwx21fNIWtW34krRXGFLWLkLO3HNfDyuPzpQP
   0/OfYm+F0BSqoJm0rsIa1k8ImgwUdqJyyQCLqYvdI9GpDNkzlTlB0QrVz
   A==;
X-CSE-ConnectionGUID: C3DdMYfVQqujbRTDOXyP5A==
X-CSE-MsgGUID: 0V8/O913SpaK4b90AAseng==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76473577"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76473577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 05:22:07 -0800
X-CSE-ConnectionGUID: qmaHnKCTQe65lU5sq5wjbQ==
X-CSE-MsgGUID: cygpFaJyTxKL0xJuq+wYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="219956466"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 05:22:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 12 Nov 2025 15:21:59 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>, 
    Denis Benato <benato.denis96@gmail.com>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
In-Reply-To: <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
Message-ID: <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:

> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > This is a two part series which does the following:
> >   - Clean-up init sequence
> >   - Unify backlight handling to happen under asus-wmi so that all Aura
> >     devices have synced brightness controls and the backlight button works
> >     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> >
> > For more context, see cover letter of V1. Since V5, I removed some patches
> > to make this easier to merge.
> 
> Small bump for this.

I looked at v8 earlier but then got an impression some of Denis' comments 
against v7 were not taken into account in v8, which implies there will be 
delay until I've time to delve into the details (I need to understand 
things pretty deeply in such a case, which does take lots of time).

Alternatively, if Denis says v8 is acceptable, then I don't need to spend 
so much time on it, but somehow I've a feeling he isn't happy with v8 
but just hasn't voiced it again...

Please do realize that ignoring reviewer feedback without a very very good 
reason always risks adding delay or friction into getting things 
upstreamed. Especially, when the review comes from a person who has been 
around for me to learn to trust their reviews or from a maintainer of the 
code in question.

> Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG:
> DKIM/antheas.dev. Is there a reference for fixing this on my host?
> Perhaps it would help with spam

I see BADSIG very often these days from b4 (thanks to gmail expiring 
things after 7 days or so, I recall hearing somewhere), I just ignore them 
entirely.

AFAIK, that has never caused any delay to any patch in pdx86 domain so if 
that is what you thought is happening here, it's not the case.
If your patch does appear in the pdx86 patchwork, there's even less reason 
to worry as I mostly pick patches to process using patchwork's list.

-- 
 i.

> 
> Antheas
> 
> > ---
> > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> >
> > Changes since V7:
> >   - Readd legacy init quirk for Dennis
> >   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
> >   - Fix warning due to enum_backlight receiving negative values
> >
> > Changes since V6:
> >   - Split initialization refactor into three patches, update commit text
> >     to be clearer in what it does
> >   - Replace spinlock accesses with guard and scoped guard in all patches
> >   - Add missing includes mentioned by Ilpo
> >   - Reflow, tweak comment in prevent binding to all HID devices on ROG
> >   - Replace asus_ref.asus with local reference in all patches
> >   - Add missing kernel doc comments
> >   - Other minor nits from Ilpo
> >   - User reported warning due to scheduling work while holding a spinlock.
> >     Restructure patch for multiple handlers to limit when spinlock is held to
> >     variable access only. In parallel, setup a workqueue to handle registration
> >     of led device and setting brightness. This is required as registering the
> >     led device triggers kbd_led_get which needs to hold the spinlock to
> >     protect the led_wk value. The workqueue is also required for the hid
> >     event passthrough to avoid scheduling work while holding the spinlock.
> >     Apply the workqueue to wmi brightness buttons as well, as that was
> >     omitted before this series and WMI access was performed.
> >   - On "HID: asus: prevent binding to all HID devices on ROG", rename
> >     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
> >     This allows other quirks to apply (applies quirk that fixes keyboard
> >     being named as a pointer device).
> >
> > Changes since V5:
> >   - It's been a long time
> >   - Remove addition of RGB as that had some comments I need to work on
> >   - Remove folio patch (already merged)
> >   - Remove legacy fix patch 11 from V4. There is a small chance that
> >     without this patch, some old NKEY keyboards might not respond to
> >     RGB commands according to Luke, but the kernel driver does not do
> >     RGB currently. The 0x5d init is done by Armoury crate software in
> >     Windows. If an issue is found, we can re-add it or just remove patches
> >     1/2 before merging. However, init could use the cleanup.
> >
> > Changes since V4:
> >   - Fix KConfig (reported by kernel robot)
> >   - Fix Ilpo's nits, if I missed anything lmk
> >
> > Changes since V3:
> >   - Add initializer for 0x5d for old NKEY keyboards until it is verified
> >     that it is not needed for their media keys to function.
> >   - Cover init in asus-wmi with spinlock as per Hans
> >   - If asus-wmi registers WMI handler with brightness, init the brightness
> >     in USB Asus keyboards, per Hans.
> >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
> >   - Fix oops when unregistering asus-wmi by moving unregister outside of
> >     the spin lock (but after the asus reference is set to null)
> >
> > Changes since V2:
> >   - Check lazy init succeds in asus-wmi before setting register variable
> >   - make explicit check in asus_hid_register_listener for listener existing
> >     to avoid re-init
> >   - rename asus_brt to asus_hid in most places and harmonize everything
> >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> >   - fixup hid device quirks to avoid multiple RGB devices while still exposing
> >     all input vendor devices. This includes moving rgb init to probe
> >     instead of the input_configured callbacks.
> >   - Remove fan key (during retest it appears to be 0xae that is already
> >     supported by hid-asus)
> >   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
> >   - removes fds from userspace and breaks backlight functionality. All
> >   - current mainline drivers do not support backlight hotplugging, so most
> >     userspace software (e.g., KDE, UPower) is built with that assumption.
> >     For the Ally, since it disconnects its controller during sleep, this
> >     caused the backlight slider to not work in KDE.
> >
> > Changes since V1:
> >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> >   - Fix ifdef else having an invalid signature (reported by kernel robot)
> >   - Restore input arguments to init and keyboard function so they can
> >     be re-used for RGB controls.
> >   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
> >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
> >     keyboard rename into it.
> >   - Unregister brightness listener before removing work queue to avoid
> >     a race condition causing corruption
> >   - Remove spurious mutex unlock in asus_brt_event
> >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
> >     relocking the mutex and causing a deadlock when unregistering leds
> >   - Add extra check during unregistering to avoid calling unregister when
> >     no led device is registered.
> >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
> >     the driver to create 4 RGB handlers per device. I also suspect some
> >     extra events sneak through (KDE had the @@@@@@).
> >
> > Antheas Kapenekakis (10):
> >   HID: asus: simplify RGB init sequence
> >   HID: asus: use same report_id in response
> >   HID: asus: fortify keyboard handshake
> >   HID: asus: prevent binding to all HID devices on ROG
> >   HID: asus: initialize LED endpoint early for old NKEY keyboards
> >   platform/x86: asus-wmi: Add support for multiple kbd led handlers
> >   HID: asus: listen to the asus-wmi brightness device instead of
> >     creating one
> >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >   platform/x86: asus-wmi: add keyboard brightness event handler
> >   HID: asus: add support for the asus-wmi brightness handler
> >
> >  drivers/hid/hid-asus.c                     | 222 +++++++++++----------
> >  drivers/platform/x86/asus-wmi.c            | 214 +++++++++++++++++---
> >  include/linux/platform_data/x86/asus-wmi.h |  70 +++----
> >  3 files changed, 331 insertions(+), 175 deletions(-)
> >
> >
> > base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> > --
> > 2.51.2
> >
> >
> 

