Return-Path: <linux-input+bounces-16231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6578C73468
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 8354A2FFEE
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A1C2FABF0;
	Thu, 20 Nov 2025 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UCEM1bjH"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3514CB5B;
	Thu, 20 Nov 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631995; cv=none; b=cDPB1eZ2ZLPoNraa2vzD/ZxrIlNbAuBpcVcv3P6J5jS1ZN0ZVpBqYg0XG1qDytyfkZhoOQdH5iiY6dzHY/E+4xRZRL8xcntA3C+KVC+XVqYAxIQWOoNMamF/lOnmAcXhnVBDVb4sGjBtVn0u6+usBgfntg9bpRGlTjoiS+3H0p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631995; c=relaxed/simple;
	bh=Q3quZfQiUDyTQaUEdGvhapH6KbyTbj/B/L+ocQttPTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hptv+/yHomPDuiIBZIeagDVGkG/UzsgictiiTLDF7VNTczJOrjCsWCUo8QX1bicD72r1yAPmRs3KUryPkSVb3JymLS8XQkcWnUDX07IqyT1uLsccJowVI55JHq1impwJRmIpYpwmO9yr6th1fe6+hxriUqPIW7Jv0a9HHlaNyuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UCEM1bjH; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id B340B5E5C9;
	Thu, 20 Nov 2025 11:46:29 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 75EC85E567;
	Thu, 20 Nov 2025 11:46:28 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0D1271FDAE9;
	Thu, 20 Nov 2025 11:46:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631987;
	bh=8vabJ9cpw1qYA8nDaDMsFosuTLgC3n61JJTUUGoQCbs=; h=From:To:Subject;
	b=UCEM1bjHs2UMDoDx1qpQ3O1RSUmK50G41NpR1ZWl6D8dEKiYzhV9r3ibt2k73X6gA
	 3APIjFKmKp9sai8OOwA31Hn3aIeBRcrsnojlY79B57T0mCDnXlA9EtzEpJsQW2eu29
	 A0u7Z46N0boI35Dts/9kxFyfn1KBCMeJj8VEeXe3ODCYCUl526kew+KgjOSCRsgLfZ
	 3OilSZpvyuPXGOqYIK8RVpmsx0gulMqvqyOI61oQc3F8r+NSflIb29zmUzov9idOmd
	 Yhl8X0UBW9+Cx0zuS540p+wobuapOZez8TewGBc6yrrsgCyR7LZOEP/g54Va0jxOKo
	 d6ts/hlSx0/WA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
Date: Thu, 20 Nov 2025 10:46:06 +0100
Message-ID: <20251120094617.11672-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363198759.1474855.6303774373205858520@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

This is a two part series which does the following:
  - Clean-up init sequence
  - Unify backlight handling to happen under asus-wmi so that all Aura
    devices have synced brightness controls and the backlight button works
    properly when it is on a USB laptop keyboard instead of one w/ WMI.

For more context, see cover letter of V1. Since V5, I removed some patches
to make this easier to merge.

---
V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

Changes since V8:
  - No functional changes
  - Move legacy init patch to second, modify first patch so that their
    diff is minimized
  - Split "prevent binding to all HID devices on ROG" into two patches:
    - moving backlight initialization into probe
    - early exit to skip ->init check and rename
    - Remove skipping vendor fixups for non-vendor devices. It is not possible
      to read usages before the report fixups are applied, so it did not work
  - In that patch, reword a comment to be single line and make is_vendor a bool
  - Dismiss Luke's tags from "Add support for multiple kbd led handlers" as it
    has drifted too far since he reviewed/tested it.

Changes since V7:
  - Readd legacy init quirk for Dennis
  - Remove HID_QUIRK_INPUT_PER_APP as a courtesy to asusctl
  - Fix warning due to enum_backlight receiving negative values

Changes since V6:
  - Split initialization refactor into three patches, update commit text
    to be clearer in what it does
  - Replace spinlock accesses with guard and scoped guard in all patches
  - Add missing includes mentioned by Ilpo
  - Reflow, tweak comment in prevent binding to all HID devices on ROG
  - Replace asus_ref.asus with local reference in all patches
  - Add missing kernel doc comments
  - Other minor nits from Ilpo
  - User reported warning due to scheduling work while holding a spinlock.
    Restructure patch for multiple handlers to limit when spinlock is held to
    variable access only. In parallel, setup a workqueue to handle registration
    of led device and setting brightness. This is required as registering the
    led device triggers kbd_led_get which needs to hold the spinlock to
    protect the led_wk value. The workqueue is also required for the hid
    event passthrough to avoid scheduling work while holding the spinlock.
    Apply the workqueue to wmi brightness buttons as well, as that was
    omitted before this series and WMI access was performed.
  - On "HID: asus: prevent binding to all HID devices on ROG", rename
    quirk HANDLE_GENERIC to SKIP_REPORT_FIXUP and only skip report fixup.
    This allows other quirks to apply (applies quirk that fixes keyboard
    being named as a pointer device).

Changes since V5:
  - It's been a long time
  - Remove addition of RGB as that had some comments I need to work on
  - Remove folio patch (already merged)
  - Remove legacy fix patch 11 from V4. There is a small chance that
    without this patch, some old NKEY keyboards might not respond to
    RGB commands according to Luke, but the kernel driver does not do
    RGB currently. The 0x5d init is done by Armoury crate software in
    Windows. If an issue is found, we can re-add it or just remove patches
    1/2 before merging. However, init could use the cleanup.

Changes since V4:
  - Fix KConfig (reported by kernel robot)
  - Fix Ilpo's nits, if I missed anything lmk

Changes since V3:
  - Add initializer for 0x5d for old NKEY keyboards until it is verified
    that it is not needed for their media keys to function.
  - Cover init in asus-wmi with spinlock as per Hans
  - If asus-wmi registers WMI handler with brightness, init the brightness
    in USB Asus keyboards, per Hans.
  - Change hid handler name to asus-UNIQ:rgb:peripheral to match led class
  - Fix oops when unregistering asus-wmi by moving unregister outside of
    the spin lock (but after the asus reference is set to null)

Changes since V2:
  - Check lazy init succeds in asus-wmi before setting register variable
  - make explicit check in asus_hid_register_listener for listener existing
    to avoid re-init
  - rename asus_brt to asus_hid in most places and harmonize everything
  - switch to a spinlock instead of a mutex to avoid kernel ooops
  - fixup hid device quirks to avoid multiple RGB devices while still exposing
    all input vendor devices. This includes moving rgb init to probe
    instead of the input_configured callbacks.
  - Remove fan key (during retest it appears to be 0xae that is already
    supported by hid-asus)
  - Never unregister asus::kbd_backlight while asus-wmi is active, as that
  - removes fds from userspace and breaks backlight functionality. All
  - current mainline drivers do not support backlight hotplugging, so most
    userspace software (e.g., KDE, UPower) is built with that assumption.
    For the Ally, since it disconnects its controller during sleep, this
    caused the backlight slider to not work in KDE.

Changes since V1:
  - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
  - Fix ifdef else having an invalid signature (reported by kernel robot)
  - Restore input arguments to init and keyboard function so they can
    be re-used for RGB controls.
  - Remove Z13 delay (it did not work to fix the touchpad) and replace it
    with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
    keyboard rename into it.
  - Unregister brightness listener before removing work queue to avoid
    a race condition causing corruption
  - Remove spurious mutex unlock in asus_brt_event
  - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
    relocking the mutex and causing a deadlock when unregistering leds
  - Add extra check during unregistering to avoid calling unregister when
    no led device is registered.
  - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
    the driver to create 4 RGB handlers per device. I also suspect some
    extra events sneak through (KDE had the @@@@@@).

Antheas Kapenekakis (11):
  HID: asus: simplify RGB init sequence
  HID: asus: initialize additional endpoints only for legacy devices
  HID: asus: use same report_id in response
  HID: asus: fortify keyboard handshake
  HID: asus: move vendor initialization to probe
  HID: asus: early return for ROG devices
  platform/x86: asus-wmi: Add support for multiple kbd led handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler

 drivers/hid/hid-asus.c                     | 206 ++++++++++----------
 drivers/platform/x86/asus-wmi.c            | 214 ++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  70 +++----
 3 files changed, 318 insertions(+), 172 deletions(-)


base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
-- 
2.52.0



