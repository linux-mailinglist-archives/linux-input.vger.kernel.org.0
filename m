Return-Path: <linux-input+bounces-15524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D320BE4246
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 17:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14069481CC6
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D848340D87;
	Thu, 16 Oct 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDWL+7Nt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF32DF141;
	Thu, 16 Oct 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627345; cv=none; b=pbs8YugYRoRKk6oaZjMVCIzuSO1q8/EfoiNka82S/xFQGBdhaz4B8iW4Uj+BR2MR0NLHLLcbvJrtnDnpuMNaOrdlQYAE5YluSEoElwS+gjJ5hwbinJV/N8tH7kNC5TMACFRmQ8/2BogH+eMDcVFOF0ZkzpI4PjGE06s0TFUfz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627345; c=relaxed/simple;
	bh=nSpSrv8gxFhQYx+hHPG424AFdHhLVENoIUSyhiIeaHk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NUe+MjCnmGGCxOxdLcTKGNqT5yV4tq/x0fKXuuT4U2Pe4FAmkGwBkkpQuk/2QRjHw2l8Ewgkv2J+M7YYNepm7UGk9TIb1KDtUVX46kgPNYOn33grqt5xNav1b/Hi6mO7sR0jjik99LcwTU81E/5u3yax1iWtfcmtn5scvnBpCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDWL+7Nt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760627342; x=1792163342;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nSpSrv8gxFhQYx+hHPG424AFdHhLVENoIUSyhiIeaHk=;
  b=HDWL+7Nt5Bshw3/cNtWZce0yQETp+wTHEoFfRvtuQLUoN/LMwcMy9E35
   Yi0nwH2rGGYEuUKlIWJZAiwKRIsSbS8CQhfqnMh8nPPK9ZiPaRZHN9K2H
   IHASu9b+okOFc09oqa9D0BqEE3HMrbfcC2BNE3JLj6qnJEcH4rt1BDXIj
   eAmpRKkThze1cvBVElxYpln9j/7nJS0ACohTXFGthubUl80ZqjaFRu1Jy
   P+MpqHCcBuTquEd9q6nlDyinA5mh8h+Al+U+HTEoQukM0/8bcPRzNBjLt
   3EooSZJgQDWJXfzNL9/iPr3+qyd+5/p5F7VQ+ndsbEN420yO8g2svtMQR
   A==;
X-CSE-ConnectionGUID: Txh1kElyQeeYI7KZi+bBkg==
X-CSE-MsgGUID: a9uTr57NS8+nkGzlMFXJ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62971195"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62971195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 08:09:02 -0700
X-CSE-ConnectionGUID: 72JmLPo3SraGALD03bBPPA==
X-CSE-MsgGUID: SdaycEY2T9+U5BA4g2LSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182948972"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 08:08:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 16 Oct 2025 18:08:55 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
In-Reply-To: <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
Message-ID: <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com> <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com> wrote:
> > On 10/13/25 22:15, Antheas Kapenekakis wrote:
> > > This is a two part series which does the following:
> > >   - Clean-up init sequence
> > >   - Unify backlight handling to happen under asus-wmi so that all Aura
> > >     devices have synced brightness controls and the backlight button works
> > >     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> > >
> > > For more context, see cover letter of V1. Since V5, I removed some patches
> > > to make this easier to merge.
> > >
> > > All comments with these patches had been addressed since V4.
> > I have loaded this patchset for users of asus-linux project to try out.
> >
> > One of them opened a bug report about a kernel bug that happens
> > consistently when closing the lid of his laptop [1].
> >
> > He also sent another piece of kernel log, but didn't specify anything more
> > about this [2].
> >
> > [1] https://pastebin.com/akZx1w10
> > [2] https://pastebin.com/sKdczPgf
> 
> Can you provide a link to the bug report? [2] seems unrelated.
> 
> As for [1], it looks like a trace that stems from a sysfs write to
> brightness stemming from userspace that follows the same chain it
> would on a stock kernel and times out. Is it present on a stock
> kernel?
> 
> Ilpo should know more about this, could the spinlock be interfering?

[1] certainly seems to do schedule() from do_kbd_led_set() so it's not 
possible to use spinlock there.

So we're back to what requires the spinlock? And what the spinlock 
protects?


Not related to this particular email in this thread, if the users are 
testing something with different kernels, it's also important to make sure 
that the lockdep configs are enabled in both. As it could be that in one 
kernel lockdep is not enabled and thus it won't do the splat.

--
 i.


> My testing on devices that have WMI led controls is a bit limited
> unfortunately. However, most of our asus users have been happy with
> this series for around half a year now.
>
> > > ---
> > > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> > > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> > > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> > > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> > > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> > >
> > > Changes since V5:
> > >   - It's been a long time
> > >   - Remove addition of RGB as that had some comments I need to work on
> > >   - Remove folio patch (already merged)
> > >   - Remove legacy fix patch 11 from V4. There is a small chance that
> > >     without this patch, some old NKEY keyboards might not respond to
> > >     RGB commands according to Luke, but the kernel driver does not do
> > >     RGB currently. The 0x5d init is done by Armoury crate software in
> > >     Windows. If an issue is found, we can re-add it or just remove patches
> > >     1/2 before merging. However, init could use the cleanup.
> > >
> > > Changes since V4:
> > >   - Fix KConfig (reported by kernel robot)
> > >   - Fix Ilpo's nits, if I missed anything lmk
> > >
> > > Changes since V3:
> > >   - Add initializer for 0x5d for old NKEY keyboards until it is verified
> > >     that it is not needed for their media keys to function.
> > >   - Cover init in asus-wmi with spinlock as per Hans
> > >   - If asus-wmi registers WMI handler with brightness, init the brightness
> > >     in USB Asus keyboards, per Hans.
> > >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
> > >   - Fix oops when unregistering asus-wmi by moving unregister outside of
> > >     the spin lock (but after the asus reference is set to null)
> > >
> > > Changes since V2:
> > >   - Check lazy init succeds in asus-wmi before setting register variable
> > >   - make explicit check in asus_hid_register_listener for listener existing
> > >     to avoid re-init
> > >   - rename asus_brt to asus_hid in most places and harmonize everything
> > >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> > >   - fixup hid device quirks to avoid multiple RGB devices while still exposing
> > >     all input vendor devices. This includes moving rgb init to probe
> > >     instead of the input_configured callbacks.
> > >   - Remove fan key (during retest it appears to be 0xae that is already
> > >     supported by hid-asus)
> > >   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
> > >   - removes fds from userspace and breaks backlight functionality. All
> > >   - current mainline drivers do not support backlight hotplugging, so most
> > >     userspace software (e.g., KDE, UPower) is built with that assumption.
> > >     For the Ally, since it disconnects its controller during sleep, this
> > >     caused the backlight slider to not work in KDE.
> > >
> > > Changes since V1:
> > >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> > >   - Fix ifdef else having an invalid signature (reported by kernel robot)
> > >   - Restore input arguments to init and keyboard function so they can
> > >     be re-used for RGB controls.
> > >   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
> > >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
> > >     keyboard rename into it.
> > >   - Unregister brightness listener before removing work queue to avoid
> > >     a race condition causing corruption
> > >   - Remove spurious mutex unlock in asus_brt_event
> > >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
> > >     relocking the mutex and causing a deadlock when unregistering leds
> > >   - Add extra check during unregistering to avoid calling unregister when
> > >     no led device is registered.
> > >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
> > >     the driver to create 4 RGB handlers per device. I also suspect some
> > >     extra events sneak through (KDE had the @@@@@@).
> > >
> > > Antheas Kapenekakis (7):
> > >   HID: asus: refactor init sequence per spec
> > >   HID: asus: prevent binding to all HID devices on ROG
> > >   platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
> > >   HID: asus: listen to the asus-wmi brightness device instead of
> > >     creating one
> > >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> > >   platform/x86: asus-wmi: add keyboard brightness event handler
> > >   HID: asus: add support for the asus-wmi brightness handler
> > >
> > >  drivers/hid/hid-asus.c                     | 235 +++++++++++----------
> > >  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
> > >  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
> > >  3 files changed, 291 insertions(+), 170 deletions(-)
> > >
> > >
> > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> >
> 


