Return-Path: <linux-input+bounces-16475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB12CA996B
	for <lists+linux-input@lfdr.de>; Sat, 06 Dec 2025 00:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46D9F3019187
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 23:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587803D3B3;
	Fri,  5 Dec 2025 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="keIqZJGM"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4482D8391
	for <linux-input@vger.kernel.org>; Fri,  5 Dec 2025 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764976378; cv=none; b=Y7QkMJAwFHaSYcKxKHKagW8sC4cg5Fpaxnbhx1qkVhhhgj6btn6vhzEXLzUsgyyZOxCMwC+KsnEytSAOXbJJ+y/bFUiW69QOCjuqGP87J6jDX7TUu7fvtRh/er9huaqIjbMTJ37c5K1ze6jmifnAP4eaSzU/Nl4GNG8IpqFnyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764976378; c=relaxed/simple;
	bh=2Rpf3yeoR+dJZxRYF0jdbiN1hjOMWf1TKmpljW+j9uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeRw3+w8QTJtynFMzcFxDulqVJiwmyNKxiFnOUMQQgcjCcvzXWLkDHKU57B96sgcn3Brf93rVx2g4rTEet13/LnqI5FtS30HEpFXwdIgOTGmtuShnF1MkNTxzJxaxCJ3BviUPZBNBxYjz4M80/55kjz2Nkrg5FwbM5dSAJSehSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=keIqZJGM; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id BE59943DFE
	for <linux-input@vger.kernel.org>; Fri,  5 Dec 2025 23:03:26 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 8EA3243F2A
	for <linux-input@vger.kernel.org>; Fri,  5 Dec 2025 23:03:25 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CCCBE2021F7
	for <linux-input@vger.kernel.org>; Sat,  6 Dec 2025 01:03:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764975805;
	bh=AwWbHS+U19d8OECccOtF1FrLTXHceCah4dhlQ8eYW0k=;
	h=Received:From:Subject:To;
	b=keIqZJGMnrWAew6LFGeJ6r0Y2ZkcZkdVA0/GihD477Xc0A8UbUsAKc7G4SpiuMwIb
	 8WFtqs9WccOxa3voZsj75G3KPxMd6KswElZCHnoZEvp5BxBSveJzXL3SR3pHJd639c
	 JbOLrDxiIDzWASO+PJifNyMBxNChAr/glLV+Jt9rsymAysur0+9Yx0ut9DFYo4BL9v
	 xJeRcHFrhHkDW/eGVcBEdGVKVylvfCxiohIJVsMpGw7/5qdEy8HW1xE2KzTa7AGDCN
	 JFJ+bd3eff2/hzf49ldLNIWb1xEpoP7GeDR9831RK+KB12R+wqhT/a0lApW5H95YZD
	 GjmU/bhsu214g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37e56b0712aso21234321fa.0
        for <linux-input@vger.kernel.org>;
 Fri, 05 Dec 2025 15:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDspw82BUNRvkMfrdWAnxnXDU80DBVXwqOxOfpMska9jYmjGWN/n4SbXBwEAcfSA46n4z0Mcu5pMJn0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5xiidOldNgjNzYOEZmEDCyU+RPlzPnxudV8suE0/kUWPlU35
	hSEdj/0ErsTDmFIwAxK5bw0mP+F4ps+ScQTjJkVVOkQ++qDCMWmRCxRq7msprnqneMFoKJDRb4v
	2wFRsnjSGF+f5KfqdI3al8YMrL0nnMro=
X-Google-Smtp-Source: 
 AGHT+IEr7/TA9dxP676rGJZ0nPZ6M9frzfSqaCX2pTFCbu9TxEVnYYMsSORiCRM72NmxtzpCPOwqRpLPruSjGJNImwY=
X-Received: by 2002:a05:651c:2122:b0:37b:aafa:5af6 with SMTP id
 38308e7fff4ca-37ed1ff23a6mr2200691fa.16.1764975804185; Fri, 05 Dec 2025
 15:03:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
In-Reply-To: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 6 Dec 2025 00:03:12 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
X-Gm-Features: AQt7F2r0hfI24PhCkwuAF9NQd--s58WI_WzH1oDCxke7tgBvp1AiyhghH_lu0Hk
Message-ID: 
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Kelsios <K3lsios@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176497580504.337985.6817950655581022363@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
>
> Hello,
>
> I would like to report a regression affecting keyboard backlight brightne=
ss control on my ASUS ROG Zephyrus G16 (model GU605CW).
>
> Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v10, =
keyboard *color* control works correctly, but *brightness* control no longe=
r responds at all. The issue is reproducible on every boot. This problem is=
 not present when using patchset v8, where both color and brightness work a=
s expected.
>
> Important detail: the issue occurs even **without** asusctl installed, so=
 it must be within the kernel HID/WMI handling and is unrelated to userspac=
e tools.
>
> Output of dmesg is available here [1], please let me know if any addition=
al information is required.
>
> Thank you for your time and work on supporting these ASUS laptops.
>
> Best regards,
> Kelsios
>
> [1] https://pastebin.com/ZFC13Scf

[ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshake ack:=
 -32

Oh yeah, asus_kbd_init no longer works with spurious inits so it broke
devices marked with QUIRK_ROG_NKEY_LEGACY

There are three ways to approach this. One is to ignore the error...
second is to drop the quirk... third is to check for the usages for ID1, ID=
2...

I would tend towards dropping the ID2 init and ignoring the error for
ID1... Unless an EPIPE would cause the device to close

Antheas

> On 11/22/25 1:00 PM, Antheas Kapenekakis wrote:
> > This is a two part series which does the following:
> >   - Clean-up init sequence
> >   - Unify backlight handling to happen under asus-wmi so that all Aura
> >     devices have synced brightness controls and the backlight button wo=
rks
> >     properly when it is on a USB laptop keyboard instead of one w/ WMI.
> >
> > For more context, see cover letter of V1. Since V5, I removed some patc=
hes
> > to make this easier to merge.
> >
> > ---
> > V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev=
/
> > V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
> > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev=
/
> > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev=
/
> > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.d=
ev/
> > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev=
/
> >
> > Changes since V9:
> >   - No functional changes
> >   - Rebase to review-ilpo-next
> >   - Fix armoury series conflict by removing the file asus-wmi-leds-ids =
on
> >     "remove unused keyboard backlight quirk" + imports
> >     Dismiss Luke's review as this patch diverged
> >   - Reword paragraph in "Add support for multiple kbd led handlers" to =
be
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
> >     - Remove skipping vendor fixups for non-vendor devices. It is not p=
ossible
> >       to read usages before the report fixups are applied, so it did no=
t work
> >   - In that patch, reword a comment to be single line and make is_vendo=
r a bool
> >   - Dismiss Luke's tags from "Add support for multiple kbd led handlers=
" as it
> >     has drifted too far since he reviewed/tested it.
> >
> > Changes since V7:
> >   - Readd legacy init quirk for Dennis
> >   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
> >   - Fix warning due to enum_backlight receiving negative values
> >
> > Changes since V6:
> >   - Split initialization refactor into three patches, update commit tex=
t
> >     to be clearer in what it does
> >   - Replace spinlock accesses with guard and scoped guard in all patche=
s
> >   - Add missing includes mentioned by Ilpo
> >   - Reflow, tweak comment in prevent binding to all HID devices on ROG
> >   - Replace asus_ref.asus with local reference in all patches
> >   - Add missing kernel doc comments
> >   - Other minor nits from Ilpo
> >   - User reported warning due to scheduling work while holding a spinlo=
ck.
> >     Restructure patch for multiple handlers to limit when spinlock is h=
eld to
> >     variable access only. In parallel, setup a workqueue to handle regi=
stration
> >     of led device and setting brightness. This is required as registeri=
ng the
> >     led device triggers kbd_led_get which needs to hold the spinlock to
> >     protect the led_wk value. The workqueue is also required for the hi=
d
> >     event passthrough to avoid scheduling work while holding the spinlo=
ck.
> >     Apply the workqueue to wmi brightness buttons as well, as that was
> >     omitted before this series and WMI access was performed.
> >   - On "HID: asus: prevent binding to all HID devices on ROG", rename
> >     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixu=
p.
> >     This allows other quirks to apply (applies quirk that fixes keyboar=
d
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
> >     Windows. If an issue is found, we can re-add it or just remove patc=
hes
> >     1/2 before merging. However, init could use the cleanup.
> >
> > Changes since V4:
> >   - Fix KConfig (reported by kernel robot)
> >   - Fix Ilpo's nits, if I missed anything lmk
> >
> > Changes since V3:
> >   - Add initializer for 0x5d for old NKEY keyboards until it is verifie=
d
> >     that it is not needed for their media keys to function.
> >   - Cover init in asus-wmi with spinlock as per Hans
> >   - If asus-wmi registers WMI handler with brightness, init the brightn=
ess
> >     in USB Asus keyboards, per Hans.
> >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led cl=
ass
> >   - Fix oops when unregistering asus-wmi by moving unregister outside o=
f
> >     the spin lock (but after the asus reference is set to null)
> >
> > Changes since V2:
> >   - Check lazy init succeds in asus-wmi before setting register variabl=
e
> >   - make explicit check in asus_hid_register_listener for listener exis=
ting
> >     to avoid re-init
> >   - rename asus_brt to asus_hid in most places and harmonize everything
> >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> >   - fixup hid device quirks to avoid multiple RGB devices while still e=
xposing
> >     all input vendor devices. This includes moving rgb init to probe
> >     instead of the input_configured callbacks.
> >   - Remove fan key (during retest it appears to be 0xae that is already
> >     supported by hid-asus)
> >   - Never unregister asus::kbd_backlight while asus-wmi is active, as t=
hat
> >   - removes fds from userspace and breaks backlight functionality. All
> >   - current mainline drivers do not support backlight hotplugging, so m=
ost
> >     userspace software (e.g., KDE, UPower) is built with that assumptio=
n.
> >     For the Ally, since it disconnects its controller during sleep, thi=
s
> >     caused the backlight slider to not work in KDE.
> >
> > Changes since V1:
> >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> >   - Fix ifdef else having an invalid signature (reported by kernel robo=
t)
> >   - Restore input arguments to init and keyboard function so they can
> >     be re-used for RGB controls.
> >   - Remove Z13 delay (it did not work to fix the touchpad) and replace =
it
> >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squ=
ash
> >     keyboard rename into it.
> >   - Unregister brightness listener before removing work queue to avoid
> >     a race condition causing corruption
> >   - Remove spurious mutex unlock in asus_brt_event
> >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to av=
oid
> >     relocking the mutex and causing a deadlock when unregistering leds
> >   - Add extra check during unregistering to avoid calling unregister wh=
en
> >     no led device is registered.
> >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it cau=
ses
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
>
>
>


