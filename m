Return-Path: <linux-input+bounces-16474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F4CA9941
	for <lists+linux-input@lfdr.de>; Sat, 06 Dec 2025 00:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9537B3016CF5
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 23:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6375B2D94B7;
	Fri,  5 Dec 2025 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CROEpt3I"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB522DEA75
	for <linux-input@vger.kernel.org>; Fri,  5 Dec 2025 23:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764975896; cv=none; b=CEW553tDB7sBdPIGduns7yZo4oBxZHfBZ89qUsRJciUzgfjJmfmAKHInPddDjqbcS9BbHFLGFQmPbKeNb+81uG4dEhhcZf6P0cI+wMsQ7+srKPMGdjBolK0t6NeBFORs3rQNQ+4sH02bQrbn6JRLtNa8wAP+7UO93pJW7dD/zoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764975896; c=relaxed/simple;
	bh=+vTRae0wJSFrXXplbLCmDK4G26WgxE+ZZt8DGSNPHsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXbRxxF2Mz8k9/ljvFM3sN/QBu1Oc9o8zEharbqBKQGRCHe7U5g91Yh7rR5c7m846lBfXwPVN/9AwXFQuzt1+3yALUnoxhHJk6rEzEiD+MxPO3REIMrkupnXTpA7kqMKC9E7WZSpGqTELJzzxzCpWHHrYo79ehYkXatT9yPWbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CROEpt3I; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 476C13EB52
	for <linux-input@vger.kernel.org>; Sat,  6 Dec 2025 01:04:51 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 403783EBE0
	for <linux-input@vger.kernel.org>; Sat,  6 Dec 2025 01:04:50 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 42707200AD6
	for <linux-input@vger.kernel.org>; Sat,  6 Dec 2025 01:04:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764975889;
	bh=FN4DJQJ+9Cz5BFJ1VJbFIENahMUSbodsFaDSguVjvUQ=;
	h=Received:From:Subject:To;
	b=CROEpt3I/8MPssw3i++fP8MAvSYmNmQrcQKGvSyvUVXPI/jnu6MIxrA3eMamHCZdO
	 QbfUZWGjGk04JiX8THLFfEIIeMPUTNxLlF6Zn6c+eDnD4dgpGpY1bUz2cYDmBvpN4m
	 0pFcFKZc94qdZCFVABvGgnUGFOaX+bJRrQPxkKoTFYK7L8AKEYnk3hZMGMN88FfZ53
	 1RGVd8S78QqoIgqQ/gnWYEjofEfvAKaigKxxjIO1apRA/DB2vVp4ym2fRaYlI+B1td
	 eFUcuTiQl024+Oez9E5K04PJut3CyQCR4qPQnk76qU+4DC0RABjm88mYvIPfOeVRxE
	 aDKx7kwLYasRQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37b9728a353so34622441fa.0
        for <linux-input@vger.kernel.org>;
 Fri, 05 Dec 2025 15:04:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrkGJv90QNLulNH0nFOuZzwaQSi43OlIgRc/evTwpWMA4XkzxdKW06FsHCIOQHLEFmbqEtxgw1zmlgmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLZsnQ8EMnVJiunMr30WIxjcZ8CFNpj97359K/vIzz8jO9L2A
	sgHUh1G+1TQMn7MlG7Jb05qTdjb80kcZtCiUZBW9T5eM8MYHftKAHjwt28xZjyvj0SjcIfFL2Li
	SfByPtT4ntLOYy41LjzBWoHyQV1/5MXw=
X-Google-Smtp-Source: 
 AGHT+IEJO357ruewWv3wPtRkhuKvxNJmWlrfDmUJlV0kXPOaMW6utuLH5Ir5GVxT6ZpYbV8dIb07ZNOVPHMStozSB3I=
X-Received: by 2002:a2e:870b:0:b0:37a:455e:f302 with SMTP id
 38308e7fff4ca-37ed206318bmr1391521fa.27.1764975888739; Fri, 05 Dec 2025
 15:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
In-Reply-To: 
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 6 Dec 2025 00:04:37 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
X-Gm-Features: AQt7F2p_D2Bc624N6-yVa9nMIY4_WtAPVCIoDp5U8GVpgfzeQqTUCMG1eC575cg
Message-ID: 
 <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
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
 <176497588972.344817.10098666351448392542@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> >
> > Hello,
> >
> > I would like to report a regression affecting keyboard backlight bright=
ness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> >
> > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v10=
, keyboard *color* control works correctly, but *brightness* control no lon=
ger responds at all. The issue is reproducible on every boot. This problem =
is not present when using patchset v8, where both color and brightness work=
 as expected.
> >
> > Important detail: the issue occurs even **without** asusctl installed, =
so it must be within the kernel HID/WMI handling and is unrelated to usersp=
ace tools.
> >
> > Output of dmesg is available here [1], please let me know if any additi=
onal information is required.
> >
> > Thank you for your time and work on supporting these ASUS laptops.
> >
> > Best regards,
> > Kelsios
> >
> > [1] https://pastebin.com/ZFC13Scf
>
> [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshake ac=
k: -32
>
> Oh yeah, asus_kbd_init no longer works with spurious inits so it broke
> devices marked with QUIRK_ROG_NKEY_LEGACY
>
> There are three ways to approach this. One is to ignore the error...
> second is to drop the quirk... third is to check for the usages for ID1, =
ID2...
>
> I would tend towards dropping the ID2 init and ignoring the error for
> ID1... Unless an EPIPE would cause the device to close

Benjamin correctly caught the deviation

> Antheas
>
> > On 11/22/25 1:00 PM, Antheas Kapenekakis wrote:
> > > This is a two part series which does the following:
> > >   - Clean-up init sequence
> > >   - Unify backlight handling to happen under asus-wmi so that all Aur=
a
> > >     devices have synced brightness controls and the backlight button =
works
> > >     properly when it is on a USB laptop keyboard instead of one w/ WM=
I.
> > >
> > > For more context, see cover letter of V1. Since V5, I removed some pa=
tches
> > > to make this easier to merge.
> > >
> > > ---
> > > V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.d=
ev/
> > > V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.de=
v/
> > > V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.de=
v/
> > > V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.de=
v/
> > > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.d=
ev/
> > > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.d=
ev/
> > > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas=
.dev/
> > > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.de=
v/
> > > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.d=
ev/
> > >
> > > Changes since V9:
> > >   - No functional changes
> > >   - Rebase to review-ilpo-next
> > >   - Fix armoury series conflict by removing the file asus-wmi-leds-id=
s on
> > >     "remove unused keyboard backlight quirk" + imports
> > >     Dismiss Luke's review as this patch diverged
> > >   - Reword paragraph in "Add support for multiple kbd led handlers" t=
o be
> > >     more verbose
> > >   - Use kfree in fortify patch
> > >   - Fix minor style quirks from --nonstict checkpatch run
> > >
> > > Changes since V8:
> > >   - No functional changes
> > >   - Move legacy init patch to second, modify first patch so that thei=
r
> > >     diff is minimized
> > >   - Split "prevent binding to all HID devices on ROG" into two patche=
s:
> > >     - moving backlight initialization into probe
> > >     - early exit to skip ->init check and rename
> > >     - Remove skipping vendor fixups for non-vendor devices. It is not=
 possible
> > >       to read usages before the report fixups are applied, so it did =
not work
> > >   - In that patch, reword a comment to be single line and make is_ven=
dor a bool
> > >   - Dismiss Luke's tags from "Add support for multiple kbd led handle=
rs" as it
> > >     has drifted too far since he reviewed/tested it.
> > >
> > > Changes since V7:
> > >   - Readd legacy init quirk for Dennis
> > >   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
> > >   - Fix warning due to enum_backlight receiving negative values
> > >
> > > Changes since V6:
> > >   - Split initialization refactor into three patches, update commit t=
ext
> > >     to be clearer in what it does
> > >   - Replace spinlock accesses with guard and scoped guard in all patc=
hes
> > >   - Add missing includes mentioned by Ilpo
> > >   - Reflow, tweak comment in prevent binding to all HID devices on RO=
G
> > >   - Replace asus_ref.asus with local reference in all patches
> > >   - Add missing kernel doc comments
> > >   - Other minor nits from Ilpo
> > >   - User reported warning due to scheduling work while holding a spin=
lock.
> > >     Restructure patch for multiple handlers to limit when spinlock is=
 held to
> > >     variable access only. In parallel, setup a workqueue to handle re=
gistration
> > >     of led device and setting brightness. This is required as registe=
ring the
> > >     led device triggers kbd_led_get which needs to hold the spinlock =
to
> > >     protect the led_wk value. The workqueue is also required for the =
hid
> > >     event passthrough to avoid scheduling work while holding the spin=
lock.
> > >     Apply the workqueue to wmi brightness buttons as well, as that wa=
s
> > >     omitted before this series and WMI access was performed.
> > >   - On "HID: asus: prevent binding to all HID devices on ROG", rename
> > >     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fi=
xup.
> > >     This allows other quirks to apply (applies quirk that fixes keybo=
ard
> > >     being named as a pointer device).
> > >
> > > Changes since V5:
> > >   - It's been a long time
> > >   - Remove addition of RGB as that had some comments I need to work o=
n
> > >   - Remove folio patch (already merged)
> > >   - Remove legacy fix patch 11 from V4. There is a small chance that
> > >     without this patch, some old NKEY keyboards might not respond to
> > >     RGB commands according to Luke, but the kernel driver does not do
> > >     RGB currently. The 0x5d init is done by Armoury crate software in
> > >     Windows. If an issue is found, we can re-add it or just remove pa=
tches
> > >     1/2 before merging. However, init could use the cleanup.
> > >
> > > Changes since V4:
> > >   - Fix KConfig (reported by kernel robot)
> > >   - Fix Ilpo's nits, if I missed anything lmk
> > >
> > > Changes since V3:
> > >   - Add initializer for 0x5d for old NKEY keyboards until it is verif=
ied
> > >     that it is not needed for their media keys to function.
> > >   - Cover init in asus-wmi with spinlock as per Hans
> > >   - If asus-wmi registers WMI handler with brightness, init the brigh=
tness
> > >     in USB Asus keyboards, per Hans.
> > >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led =
class
> > >   - Fix oops when unregistering asus-wmi by moving unregister outside=
 of
> > >     the spin lock (but after the asus reference is set to null)
> > >
> > > Changes since V2:
> > >   - Check lazy init succeds in asus-wmi before setting register varia=
ble
> > >   - make explicit check in asus_hid_register_listener for listener ex=
isting
> > >     to avoid re-init
> > >   - rename asus_brt to asus_hid in most places and harmonize everythi=
ng
> > >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> > >   - fixup hid device quirks to avoid multiple RGB devices while still=
 exposing
> > >     all input vendor devices. This includes moving rgb init to probe
> > >     instead of the input_configured callbacks.
> > >   - Remove fan key (during retest it appears to be 0xae that is alrea=
dy
> > >     supported by hid-asus)
> > >   - Never unregister asus::kbd_backlight while asus-wmi is active, as=
 that
> > >   - removes fds from userspace and breaks backlight functionality. Al=
l
> > >   - current mainline drivers do not support backlight hotplugging, so=
 most
> > >     userspace software (e.g., KDE, UPower) is built with that assumpt=
ion.
> > >     For the Ally, since it disconnects its controller during sleep, t=
his
> > >     caused the backlight slider to not work in KDE.
> > >
> > > Changes since V1:
> > >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> > >   - Fix ifdef else having an invalid signature (reported by kernel ro=
bot)
> > >   - Restore input arguments to init and keyboard function so they can
> > >     be re-used for RGB controls.
> > >   - Remove Z13 delay (it did not work to fix the touchpad) and replac=
e it
> > >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. S=
quash
> > >     keyboard rename into it.
> > >   - Unregister brightness listener before removing work queue to avoi=
d
> > >     a race condition causing corruption
> > >   - Remove spurious mutex unlock in asus_brt_event
> > >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to =
avoid
> > >     relocking the mutex and causing a deadlock when unregistering led=
s
> > >   - Add extra check during unregistering to avoid calling unregister =
when
> > >     no led device is registered.
> > >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it c=
auses
> > >     the driver to create 4 RGB handlers per device. I also suspect so=
me
> > >     extra events sneak through (KDE had the @@@@@@).
> > >
> > > Antheas Kapenekakis (11):
> > >   HID: asus: simplify RGB init sequence
> > >   HID: asus: initialize additional endpoints only for legacy devices
> > >   HID: asus: use same report_id in response
> > >   HID: asus: fortify keyboard handshake
> > >   HID: asus: move vendor initialization to probe
> > >   HID: asus: early return for ROG devices
> > >   platform/x86: asus-wmi: Add support for multiple kbd led handlers
> > >   HID: asus: listen to the asus-wmi brightness device instead of
> > >     creating one
> > >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> > >   platform/x86: asus-wmi: add keyboard brightness event handler
> > >   HID: asus: add support for the asus-wmi brightness handler
> > >
> > >  drivers/hid/hid-asus.c                        | 205 ++++++++--------
> > >  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++-=
--
> > >  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
> > >  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
> > >  4 files changed, 322 insertions(+), 184 deletions(-)
> > >  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids=
.h
> > >
> > >
> > > base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
> >
> >
> >


