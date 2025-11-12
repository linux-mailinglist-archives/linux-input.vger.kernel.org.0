Return-Path: <linux-input+bounces-16035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3DC52522
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B6B3B9D8C
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251F533507D;
	Wed, 12 Nov 2025 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GmdXfGsi"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C28309F03
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951467; cv=none; b=V8n8gCpxNbkij2y1koM9tOpJjbQ+i2yxqUtQWwlV7pQzi1j1w+qnAhRAzrlRsupds41u0BMk0kGd9I9ZP6nfHkuPvFW7duKFB3KgP5iQWjbdHy2+d1jytXgu0bzIWBf2Po0DyRHWfcx+GlEnyRvd/xuzsoKnCmDWPSRsoJJqm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951467; c=relaxed/simple;
	bh=Xdtj8EJJXBfVxOPsd+UQlXmW38dt9Qyre67/jnHSL7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=go66DYpnJLHdSAzwiAgiiRnWDMLFuikPqLymJVr1X1UADbc3qapWaoydQsty0LH4pG9GaNGXy5FcHhKovup31SDLKNSn+yAKwg+polfaFBf9jIEsLKOAzpqCvjrQrlCpqpu6ovz/Cu5qibuGHuFKcG31hFGyoj5gplER3r8yeVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GmdXfGsi; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id D8175BDCB8
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:44:22 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 445E2BDCB7
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:44:21 +0200 (EET)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AFFB0201C8F
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:44:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762951461;
	bh=6NX8w1HfEO3ifSQh2+TmP0vVE6odCioLpOXyuC1vqYo=;
	h=Received:From:Subject:To;
	b=GmdXfGsiriMy03lHWCMmP6tdMDlyZBxnlWhfErc8mNz/udSMD8U6a/u9/BLFhUnp9
	 EQlW/GH10YAxXjPkM5rgAds7bxP5Z+XZvc0eukgbBx7qctik5OiufN1snYf3Bk5HVy
	 yHZiElVSo/9tMnhLa1PEIT44eLT+QFWUXoYnpjJUs/SlXh7HFSCrgImQSk5Spivo2x
	 gBhXqmVfo3qa6VCNVY1HuFUcqpoq5XoxJIWJ9QRBcIrfyMd56RG9Uq13/L0tYzstDT
	 6XzMG5AfhxUEXL4m3x/VbCm+P2f5db5OOzeLkZ7pnZCyn6TERhwBLceytq+N2DwYIC
	 pLQOhIlh882Aw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37a3340391cso6819401fa.3
        for <linux-input@vger.kernel.org>;
 Wed, 12 Nov 2025 04:44:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHBfNPCe3ZrlVrf+RlXZjsYJjjvWtlxeKe3gAcVFZBEUVdHNax3RvDffwN1jHhe28BvAmKTGO5OOq15Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvEb4KJgdgDvdBVjUNSUTy1Fbya9oS6SFyKZyhXL5VFMRhlkM
	kut1F3FBAbHna3RtSzU8OOibNcs6L6WYlNEcS1kE/JaQGyohlvIlMApRa5GuhvGWEt8kNeDGB3F
	cxpo+0LniJbpkB/seQYCiOzKHRgay1eM=
X-Google-Smtp-Source: 
 AGHT+IEjY7/R9QGwfgTXB1oWCARTWbPiQ8BHFoXJ16FU7OI5xuBDIKzU5REXAvbKvyDigXq6fWdMCGFdLjlIgbU94Jc=
X-Received: by 2002:a2e:81d6:0:b0:37b:9237:270a with SMTP id
 38308e7fff4ca-37b923727d1mr5875451fa.45.1762951460114; Wed, 12 Nov 2025
 04:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 12 Nov 2025 13:44:08 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
X-Gm-Features: AWmQ_bm_Dtqxs7pqBBUARVzK1oYnIz6u2hr9FmyG7b_TGxMJYkJnRjj93krynUg
Message-ID: 
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176295146094.1612830.2125496990343054341@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> This is a two part series which does the following:
>   - Clean-up init sequence
>   - Unify backlight handling to happen under asus-wmi so that all Aura
>     devices have synced brightness controls and the backlight button works
>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>
> For more context, see cover letter of V1. Since V5, I removed some patches
> to make this easier to merge.

Small bump for this.

Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG:
DKIM/antheas.dev. Is there a reference for fixing this on my host?
Perhaps it would help with spam

Antheas

> ---
> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
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
> Antheas Kapenekakis (10):
>   HID: asus: simplify RGB init sequence
>   HID: asus: use same report_id in response
>   HID: asus: fortify keyboard handshake
>   HID: asus: prevent binding to all HID devices on ROG
>   HID: asus: initialize LED endpoint early for old NKEY keyboards
>   platform/x86: asus-wmi: Add support for multiple kbd led handlers
>   HID: asus: listen to the asus-wmi brightness device instead of
>     creating one
>   platform/x86: asus-wmi: remove unused keyboard backlight quirk
>   platform/x86: asus-wmi: add keyboard brightness event handler
>   HID: asus: add support for the asus-wmi brightness handler
>
>  drivers/hid/hid-asus.c                     | 222 +++++++++++----------
>  drivers/platform/x86/asus-wmi.c            | 214 +++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h |  70 +++----
>  3 files changed, 331 insertions(+), 175 deletions(-)
>
>
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> --
> 2.51.2
>
>


