Return-Path: <linux-input+bounces-16473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02CCA97A2
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 23:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D63B93044693
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 22:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759CF26CE3B;
	Fri,  5 Dec 2025 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ffCR0P/T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3402586E8
	for <linux-input@vger.kernel.org>; Fri,  5 Dec 2025 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972840; cv=none; b=IPT3/Y/SD6lSqOILBN4NugnQDMKvh8qfp0kyrgOPu5Nlntj3ibxB/yXiXPQwaIP+ymBaHo5k3DP0HMSjd7ZTOfuavcEi10roiO1m671+TLVKrsihdVUe7hxLX9ckxaf/VaJ4KmDMNtjmEWiNrfmdOMzQf+fxDKLGJr+7KQH6cL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972840; c=relaxed/simple;
	bh=35kScrKWIJ3IIn8U9w60+FZP9E+HlROzdqwHAfhKAh0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DiKB8SwLAysLvpdmX7OAvsT4vQ3a/luM4tTDsfRNI7uklEz+VlrOKZvWdfwe6DMF0Op0grf8p9H29nUI/DHzL97BHvXO2TLdf+KCrZhI+l13RnHBYYneEiqW4CEHBEWw6uqYFg/tOwOSipFjHRVh08dBtrntJVXMvhrpZ5AQqJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ffCR0P/T; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764972829; x=1765232029;
	bh=UlY0CcTI7Op45THETXisR5xmkpvrO4isKp03QvFBj9Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ffCR0P/TfO2jbJH2VAtefSXg5UvOzaQKHOJv8xCLjqGpTt5Wyan4TxDIBYnt0cNMh
	 38mGmo0nNmjx0443XiZRzJrIE1GXQ9x1pqhi0bq4ogw9qXnYYYF2PR1T3tUlmH6yJT
	 znfJTSZipzsJlRZqALHYCwxajj4qUsjmHd61nK0nI0D434yLP8HTnMxCMJOheqNqZg
	 JfLjGXCtPVMdq2LSODz3HbZO57Pt8HTjBtE/mgbWCZus7abpYgIEheueWlebjUukcm
	 6QaWWp0PSklcvD33mJZVr51ZvgBZbgozMbmDqxxTvSB6gKb83kwqJXQOHAMuvWCzKz
	 730lSw0jGw/sw==
Date: Fri, 05 Dec 2025 22:13:43 +0000
To: Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
From: Kelsios <K3lsios@proton.me>
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight handling
Message-ID: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
Feedback-ID: 69676043:user:proton
X-Pm-Message-ID: 96940ee5dee707d610db9ec315f45906573a4d42
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to report a regression affecting keyboard backlight brightness=
 control on my ASUS ROG Zephyrus G16 (model GU605CW).

Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v10, ke=
yboard *color* control works correctly, but *brightness* control no longer =
responds at all. The issue is reproducible on every boot. This problem is n=
ot present when using patchset v8, where both color and brightness work as =
expected.

Important detail: the issue occurs even **without** asusctl installed, so i=
t must be within the kernel HID/WMI handling and is unrelated to userspace =
tools.

Output of dmesg is available here [1], please let me know if any additional=
 information is required.

Thank you for your time and work on supporting these ASUS laptops.

Best regards,
Kelsios

[1] https://pastebin.com/ZFC13Scf

On 11/22/25 1:00 PM, Antheas Kapenekakis wrote:
> This is a two part series which does the following:
>   - Clean-up init sequence
>   - Unify backlight handling to happen under asus-wmi so that all Aura
>     devices have synced brightness controls and the backlight button work=
s
>     properly when it is on a USB laptop keyboard instead of one w/ WMI.
>=20
> For more context, see cover letter of V1. Since V5, I removed some patche=
s
> to make this easier to merge.
>=20
> ---
> V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
> V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
> V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
> V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
> V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
> V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
> V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev=
/
> V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>=20
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
>=20
> Changes since V8:
>   - No functional changes
>   - Move legacy init patch to second, modify first patch so that their
>     diff is minimized
>   - Split "prevent binding to all HID devices on ROG" into two patches:
>     - moving backlight initialization into probe
>     - early exit to skip ->init check and rename
>     - Remove skipping vendor fixups for non-vendor devices. It is not pos=
sible
>       to read usages before the report fixups are applied, so it did not =
work
>   - In that patch, reword a comment to be single line and make is_vendor =
a bool
>   - Dismiss Luke's tags from "Add support for multiple kbd led handlers" =
as it
>     has drifted too far since he reviewed/tested it.
>=20
> Changes since V7:
>   - Readd legacy init quirk for Dennis
>   - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
>   - Fix warning due to enum_backlight receiving negative values
>=20
> Changes since V6:
>   - Split initialization refactor into three patches, update commit text
>     to be clearer in what it does
>   - Replace spinlock accesses with guard and scoped guard in all patches
>   - Add missing includes mentioned by Ilpo
>   - Reflow, tweak comment in prevent binding to all HID devices on ROG
>   - Replace asus_ref.asus with local reference in all patches
>   - Add missing kernel doc comments
>   - Other minor nits from Ilpo
>   - User reported warning due to scheduling work while holding a spinlock=
.
>     Restructure patch for multiple handlers to limit when spinlock is hel=
d to
>     variable access only. In parallel, setup a workqueue to handle regist=
ration
>     of led device and setting brightness. This is required as registering=
 the
>     led device triggers kbd_led_get which needs to hold the spinlock to
>     protect the led_wk value. The workqueue is also required for the hid
>     event passthrough to avoid scheduling work while holding the spinlock=
.
>     Apply the workqueue to wmi brightness buttons as well, as that was
>     omitted before this series and WMI access was performed.
>   - On "HID: asus: prevent binding to all HID devices on ROG", rename
>     quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
>     This allows other quirks to apply (applies quirk that fixes keyboard
>     being named as a pointer device).
>=20
> Changes since V5:
>   - It's been a long time
>   - Remove addition of RGB as that had some comments I need to work on
>   - Remove folio patch (already merged)
>   - Remove legacy fix patch 11 from V4. There is a small chance that
>     without this patch, some old NKEY keyboards might not respond to
>     RGB commands according to Luke, but the kernel driver does not do
>     RGB currently. The 0x5d init is done by Armoury crate software in
>     Windows. If an issue is found, we can re-add it or just remove patche=
s
>     1/2 before merging. However, init could use the cleanup.
>=20
> Changes since V4:
>   - Fix KConfig (reported by kernel robot)
>   - Fix Ilpo's nits, if I missed anything lmk
>=20
> Changes since V3:
>   - Add initializer for 0x5d for old NKEY keyboards until it is verified
>     that it is not needed for their media keys to function.
>   - Cover init in asus-wmi with spinlock as per Hans
>   - If asus-wmi registers WMI handler with brightness, init the brightnes=
s
>     in USB Asus keyboards, per Hans.
>   - Change hid handler name to asus-UNIQ:rgb:peripheral to match led clas=
s
>   - Fix oops when unregistering asus-wmi by moving unregister outside of
>     the spin lock (but after the asus reference is set to null)
>=20
> Changes since V2:
>   - Check lazy init succeds in asus-wmi before setting register variable
>   - make explicit check in asus_hid_register_listener for listener existi=
ng
>     to avoid re-init
>   - rename asus_brt to asus_hid in most places and harmonize everything
>   - switch to a spinlock instead of a mutex to avoid kernel ooops
>   - fixup hid device quirks to avoid multiple RGB devices while still exp=
osing
>     all input vendor devices. This includes moving rgb init to probe
>     instead of the input_configured callbacks.
>   - Remove fan key (during retest it appears to be 0xae that is already
>     supported by hid-asus)
>   - Never unregister asus::kbd_backlight while asus-wmi is active, as tha=
t
>   - removes fds from userspace and breaks backlight functionality. All
>   - current mainline drivers do not support backlight hotplugging, so mos=
t
>     userspace software (e.g., KDE, UPower) is built with that assumption.
>     For the Ally, since it disconnects its controller during sleep, this
>     caused the backlight slider to not work in KDE.
>=20
> Changes since V1:
>   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
>   - Fix ifdef else having an invalid signature (reported by kernel robot)
>   - Restore input arguments to init and keyboard function so they can
>     be re-used for RGB controls.
>   - Remove Z13 delay (it did not work to fix the touchpad) and replace it
>     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squas=
h
>     keyboard rename into it.
>   - Unregister brightness listener before removing work queue to avoid
>     a race condition causing corruption
>   - Remove spurious mutex unlock in asus_brt_event
>   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoi=
d
>     relocking the mutex and causing a deadlock when unregistering leds
>   - Add extra check during unregistering to avoid calling unregister when
>     no led device is registered.
>   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it cause=
s
>     the driver to create 4 RGB handlers per device. I also suspect some
>     extra events sneak through (KDE had the @@@@@@).
>=20
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
>=20
>  drivers/hid/hid-asus.c                        | 205 ++++++++--------
>  drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
>  .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
>  include/linux/platform_data/x86/asus-wmi.h    |  28 +++
>  4 files changed, 322 insertions(+), 184 deletions(-)
>  delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
>=20
>=20
> base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3



