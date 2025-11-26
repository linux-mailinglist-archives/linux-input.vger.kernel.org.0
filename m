Return-Path: <linux-input+bounces-16350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F196C8A9BA
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E69B3ADD06
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 15:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7498331A62;
	Wed, 26 Nov 2025 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVBkaHy6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A83314AC;
	Wed, 26 Nov 2025 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170643; cv=none; b=XILbQuirfK7zBzLGcCfzhv5Um552Hdnf3Na2Ktrct/ueYSiE0lhRgG3HK4vroleycINmUqDLvJUiwtvEisw88VgTEA9HGQnnuagphg9aiuwYexxvrbKoMPBYxOmixS2aw4y5bGG/ysBHWgzHt5WdpyFHT9efActCUMPRkHc+fBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170643; c=relaxed/simple;
	bh=pS1Uof3qQ/WcWtT+hxgNPPp3oZZwaurf+jPErm81dVY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jfBJz13YOLav9nksy3LfJpxlz/HcBnPk3iycKzAomlGrkbos3NwoUvMVcDLBcrzOVGwET3vUXz8qNb2O4lkh3Fy7Qah+Xjy6QN1sHJ4EHr8zledlSuROSpUg/Kw+d7lazQkfQXTdAhO1MiELGvhD8ACWhLRZbKFAnoyZPGHT0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVBkaHy6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764170641; x=1795706641;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pS1Uof3qQ/WcWtT+hxgNPPp3oZZwaurf+jPErm81dVY=;
  b=FVBkaHy63qP03XEoxRlqJDLvzoTfBSmyZgVXHM4UZ7mMOlf2/CJ1j3pO
   ZtvXlViIbqP+wCLW8c9ANOWOUyx8/r/JdjOTWS0xc6AOHxZRyDrfppRHH
   IIIQRY8kVk4atgzcbxpmu2fPwic5tBhAo8fx6uz3ixZJ1jmx7l1pAOHH6
   sw78JsQ4aKmTIB4ljoR3vGvyD0N+AWaSMRYenrZ/FMbwSyrwDwVnx+1O0
   U0w/t1Miuq3/ErRCCyZA0na0qFtWoPeQh3w4zZmOKg19kBkE2FyXxr8YT
   s2/87U8O5mQctAtL+MF12Y2VnaqCH5rLAUNlKFgoKychBAWlwrGyKdL+b
   g==;
X-CSE-ConnectionGUID: k6g6wGoGSiG2jlJzZk2Png==
X-CSE-MsgGUID: iWUKBLtARHuTgaek3gsa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70076250"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70076250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:24:00 -0800
X-CSE-ConnectionGUID: QQ7b9FkrScWK47juOw0rOA==
X-CSE-MsgGUID: k87HTYNXTO6SVJlz//zfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193397453"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:23:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Nov 2025 17:23:53 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
In-Reply-To: <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
Message-ID: <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev> <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:

> On Sat, 22 Nov 2025 at 12:01, Antheas Kapenekakis <lkml@antheas.dev> wrote:
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
> Slight bump on this. It addresses both of the remarks Denis made in
> the previous version.
> 
> I begrudgingly argued a bit for those because I did not want to resend
> the series and they were not functional changes, so sorry about that.
> But they are fixed in this version incl. with the conflict with the
> armoury patchset. Denis, you omitted a rby on "platform/x86: asus-wmi:
> Add support for multiple kbd led handlers" even though I addressed
> your comment, so you may want to add that.

FYI, there's no direct relation that mandates a person to give a rev-by 
even if all his/her comments were addressed.

But generally yes, it would be useful to hear whether Denis is fine with 
v10, especially those patches that had contention earlier but you've 
modified post-v8.

> As for "HID: asus: early return for ROG devices" changing the name of
> the devices of this driver, I will veto backporting it if it happens,
> so inputplumber will have the two full months to remove the name
> match. This is not a breaking change in the sense that software cannot
> be made to work on both previous and latter versions and there is no
> other software to my knowledge relying on name matches for Asus
> keyboards.

Did Hans give some opinion about this rename earlier, at least I don't 
remember nor could find from lore archives?

--
 i.

> Moreover, an early exit is needed to prevent ejecting HID
> endpoints without an ->input parameter so it is a needed fix anyway.
> Postponing it will prevent Xbox Ally users from having RGB control
> through userspace on a stock kernel but it is also not worth arguing
> about
> 
> It is also fine for me for this series to merge for 6.20, but I'd
> rather we handle it now since there will be some turbulence for asus
> users due to armoury merging so it makes sense to have this transition
> once.
>
> > ---
> > V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
> > V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
> > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> >
> > Changes since V9:
> >   - No functional changes
> >   - Rebase to review-ilpo-next
> >   - Fix armoury series conflict by removing the file asus-wmi-leds-ids on
> >     "remove unused keyboard backlight quirk" + imports
> >     Dismiss Luke's review as this patch diverged
> >   - Reword paragraph in "Add support for multiple kbd led handlers" to be
> >     more verbose
> >   - Use kfree in fortify patch
> >   - Fix minor style quirks from --nonstict checkpatch run
> >
> > Changes since V8:
> >   - No functional changes
> >   - Move legacy init patch to second, modify first patch so that their
> >     diff is minimized
> >   - Split "prevent binding to all HID devices on ROG" into two patches:
> >     - moving backlight initialization into probe
> >     - early exit to skip ->init check and rename
> >     - Remove skipping vendor fixups for non-vendor devices. It is not possible
> >       to read usages before the report fixups are applied, so it did not work
> >   - In that patch, reword a comment to be single line and make is_vendor a bool
> >   - Dismiss Luke's tags from "Add support for multiple kbd led handlers" as it
> >     has drifted too far since he reviewed/tested it.
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
> > Antheas Kapenekakis (11):
> >   HID: asus: simplify RGB init sequence
> >   HID: asus: initialize additional endpoints only for legacy devices
> >   HID: asus: use same report_id in response
> >   HID: asus: fortify keyboard handshake
> >   HID: asus: move vendor initialization to probe
> >   HID: asus: early return for ROG devices
> >   platform/x86: asus-wmi: Add support for multiple kbd led handlers
> >   HID: asus: listen to the asus-wmi brightness device instead of
> >     creating one
> >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >   platform/x86: asus-wmi: add keyboard brightness event handler
> >   HID: asus: add support for the asus-wmi brightness handler
> >
> >  drivers/hid/hid-asus.c                        | 205 ++++++++--------
> >  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
> >  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
> >  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
> >  4 files changed, 322 insertions(+), 184 deletions(-)
> >  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
> >
> >
> > base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
> > --
> > 2.52.0
> >
> >
> 

