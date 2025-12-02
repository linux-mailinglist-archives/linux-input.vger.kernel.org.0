Return-Path: <linux-input+bounces-16446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16CC9B502
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 12:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 513204E17F2
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 11:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86C230F93B;
	Tue,  2 Dec 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCnr86e5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0828A3FA;
	Tue,  2 Dec 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674894; cv=none; b=P9x0sofBYR8f7MtCJ9URKABmCD4+NZ0pleA0pCLQq5P2zpY4cGzqTDXJqNYKl02DeID7mOhojqpG6ilYvM/bOYlG0/Lu+iVbyvB5oeAvJtjP8l9OUSATlC6RTfwYqIeUOS+eVnmml/8r2GoDOPKyDQIa76ZhySvjfYxNIJ8vhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674894; c=relaxed/simple;
	bh=AfSwRsjTfZM5+SbqNrX5CXgA5zbgtHPlkoLNh0LHLeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ+icWtoDVjozhIGPe9g9aKg9LvsHyReLN398ZfYMgA88OcxSloNjUx+vZodUmzhLZCW/S9NkioSJgCLVdMlTabj/QdqELFmQdXykUVEMckIxoA8G/XRiD1LZ9ZtLN2nHiYiQ6q63K6CCbqe9jz8ZFX62NGZxnbpaCkHdbrXTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCnr86e5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACC4C4CEF1;
	Tue,  2 Dec 2025 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764674894;
	bh=AfSwRsjTfZM5+SbqNrX5CXgA5zbgtHPlkoLNh0LHLeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCnr86e5GoHE69AwSAhWbhjziL260lGk5VG+5wJWqdQXYlmXRdjZb5nAVe7JrVoV8
	 mhYJ7rlsykVK/dd/ieeKuCa+4kIQvHjVAQ0JnG8HxPrRh3mMZ/0P2ufUq+Nc2Dxzaa
	 weduj9dnEy57fkTR7n0AfqEtQDay/etYp0taCKThVXiMX1EieVENojhJp/cuMSR8jM
	 n+4lnseLjiIuS6Hz/xSZnPG1+3NpcEMqYsXbeDuvvQqphNDxa1bMaBQcmtnke7Ek6j
	 UZB5W/o+m3OYMMLquOS10vWF5JS0Nmm60MDqgolC40ffne8ouS96/iAUJFWnzzTxgr
	 JgVJ/LV4oZ4zw==
Date: Tue, 2 Dec 2025 12:28:09 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
Message-ID: <3o567uhraajybt5wey3zevkqpneq56jrcoewhxn6t4poc2enxz@ooygktcsinge>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>

On Nov 22 2025, Antheas Kapenekakis wrote:
> This is a two part series which does the following:
>   - Clean-up init sequence
>   - Unify backlight handling to happen under asus-wmi so that all Aura
>     devices have synced brightness controls and the backlight button works
>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> 
> For more context, see cover letter of V1. Since V5, I removed some patches
> to make this easier to merge.

For the HID part:
Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Again, as mentioned in one of the other patch. Feel free to take this
into the platform-x86 tree.

Cheers,
Benjamin

> 
> ---
> V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
> V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> 
> Changes since V9:
>   - No functional changes
>   - Rebase to review-ilpo-next
>   - Fix armoury series conflict by removing the file asus-wmi-leds-ids on
>     "remove unused keyboard backlight quirk" + imports
>     Dismiss Luke's review as this patch diverged
>   - Reword paragraph in "Add support for multiple kbd led handlers" to be
>     more verbose
>   - Use kfree in fortify patch
>   - Fix minor style quirks from --nonstict checkpatch run
> 
> Changes since V8:
>   - No functional changes
>   - Move legacy init patch to second, modify first patch so that their
>     diff is minimized
>   - Split "prevent binding to all HID devices on ROG" into two patches:
>     - moving backlight initialization into probe
>     - early exit to skip ->init check and rename
>     - Remove skipping vendor fixups for non-vendor devices. It is not possible
>       to read usages before the report fixups are applied, so it did not work
>   - In that patch, reword a comment to be single line and make is_vendor a bool
>   - Dismiss Luke's tags from "Add support for multiple kbd led handlers" as it
>     has drifted too far since he reviewed/tested it.
> 
> Changes since V7:
>   - Readd legacy init quirk for Dennis
>   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
>   - Fix warning due to enum_backlight receiving negative values
> 
> Changes since V6:
>   - Split initialization refactor into three patches, update commit text
>     to be clearer in what it does
>   - Replace spinlock accesses with guard and scoped guard in all patches
>   - Add missing includes mentioned by Ilpo
>   - Reflow, tweak comment in prevent binding to all HID devices on ROG
>   - Replace asus_ref.asus with local reference in all patches
>   - Add missing kernel doc comments
>   - Other minor nits from Ilpo
>   - User reported warning due to scheduling work while holding a spinlock.
>     Restructure patch for multiple handlers to limit when spinlock is held to
>     variable access only. In parallel, setup a workqueue to handle registration
>     of led device and setting brightness. This is required as registering the
>     led device triggers kbd_led_get which needs to hold the spinlock to
>     protect the led_wk value. The workqueue is also required for the hid
>     event passthrough to avoid scheduling work while holding the spinlock.
>     Apply the workqueue to wmi brightness buttons as well, as that was
>     omitted before this series and WMI access was performed.
>   - On "HID: asus: prevent binding to all HID devices on ROG", rename
>     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
>     This allows other quirks to apply (applies quirk that fixes keyboard
>     being named as a pointer device).
> 
> Changes since V5:
>   - It's been a long time
>   - Remove addition of RGB as that had some comments I need to work on
>   - Remove folio patch (already merged)
>   - Remove legacy fix patch 11 from V4. There is a small chance that
>     without this patch, some old NKEY keyboards might not respond to
>     RGB commands according to Luke, but the kernel driver does not do
>     RGB currently. The 0x5d init is done by Armoury crate software in
>     Windows. If an issue is found, we can re-add it or just remove patches
>     1/2 before merging. However, init could use the cleanup.
> 
> Changes since V4:
>   - Fix KConfig (reported by kernel robot)
>   - Fix Ilpo's nits, if I missed anything lmk
> 
> Changes since V3:
>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>     that it is not needed for their media keys to function.
>   - Cover init in asus-wmi with spinlock as per Hans
>   - If asus-wmi registers WMI handler with brightness, init the brightness
>     in USB Asus keyboards, per Hans.
>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>     the spin lock (but after the asus reference is set to null)
> 
> Changes since V2:
>   - Check lazy init succeds in asus-wmi before setting register variable
>   - make explicit check in asus_hid_register_listener for listener existing
>     to avoid re-init
>   - rename asus_brt to asus_hid in most places and harmonize everything
>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>   - fixup hid device quirks to avoid multiple RGB devices while still exposing
>     all input vendor devices. This includes moving rgb init to probe
>     instead of the input_configured callbacks.
>   - Remove fan key (during retest it appears to be 0xae that is already
>     supported by hid-asus)
>   - Never unregister asus::kbd_backlight while asus-wmi is active, as that
>   - removes fds from userspace and breaks backlight functionality. All
>   - current mainline drivers do not support backlight hotplugging, so most
>     userspace software (e.g., KDE, UPower) is built with that assumption.
>     For the Ally, since it disconnects its controller during sleep, this
>     caused the backlight slider to not work in KDE.
> 
> Changes since V1:
>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>   - Restore input arguments to init and keyboard function so they can
>     be re-used for RGB controls.
>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
>     keyboard rename into it.
>   - Unregister brightness listener before removing work queue to avoid
>     a race condition causing corruption
>   - Remove spurious mutex unlock in asus_brt_event
>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
>     relocking the mutex and causing a deadlock when unregistering leds
>   - Add extra check during unregistering to avoid calling unregister when
>     no led device is registered.
>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
>     the driver to create 4 RGB handlers per device. I also suspect some
>     extra events sneak through (KDE had the @@@@@@).
> 
> Antheas Kapenekakis (11):
>   HID: asus: simplify RGB init sequence
>   HID: asus: initialize additional endpoints only for legacy devices
>   HID: asus: use same report_id in response
>   HID: asus: fortify keyboard handshake
>   HID: asus: move vendor initialization to probe
>   HID: asus: early return for ROG devices
>   platform/x86: asus-wmi: Add support for multiple kbd led handlers
>   HID: asus: listen to the asus-wmi brightness device instead of
>     creating one
>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>   platform/x86: asus-wmi: add keyboard brightness event handler
>   HID: asus: add support for the asus-wmi brightness handler
> 
>  drivers/hid/hid-asus.c                        | 205 ++++++++--------
>  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
>  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
>  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
>  4 files changed, 322 insertions(+), 184 deletions(-)
>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
> 
> 
> base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
> -- 
> 2.52.0
> 
> 

