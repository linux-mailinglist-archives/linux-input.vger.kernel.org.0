Return-Path: <linux-input+bounces-16283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD48C7CD19
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878333A89F8
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930012D77E6;
	Sat, 22 Nov 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ldxI8lQz"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A031B4257;
	Sat, 22 Nov 2025 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809276; cv=none; b=oZZc3X75XJOOd65Z5NxGpcd6qI7nYibZloCEG94gCuV1lf4v3miLmvBinPwLKUn4HMgGzP3yIMtCIzIejPonLZoQ2W8vYfwMq5eXCY5GlGQLRhfLAVLCmXyH9Hsam1LI50GrVp6LJHHw0qIXGusii7hXNbFS2fGoOlan/GZhXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809276; c=relaxed/simple;
	bh=rxkkSCk2DK56eDfL7bhWZ8hwaZGT2EEY4PljngRv0GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFg5rPc2mPsyWePAAtFW1vK7jlHl152TaSA124WcULLYbJcjpM0uxeO5V6WaT9slkpW6RyJTrhZALs0IIbk3eXnIuouDNdCQx412UZYnZwLe4B2KRraeARrKjEX3CXGQ14OYxcK7JqUuQt3QrT8NUqlHt6jq7ndWoEvByuJp9vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ldxI8lQz; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id BDF455E595;
	Sat, 22 Nov 2025 13:01:04 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 7EA405DF1F;
	Sat, 22 Nov 2025 13:01:00 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1F04B1FC7D0;
	Sat, 22 Nov 2025 13:00:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809259;
	bh=Re1eQdSr9vOtzIPD3/V/WEo3AlS5lnUYptEp3cjeHwU=; h=From:To:Subject;
	b=ldxI8lQzOUoxBi/zqQuDUxJtcguHE+gVyc5EN3Ql1NpphQi3jvwVdpggRz3Lg+r5H
	 PWPFKwk04Pryv/d8McoQdyjyfqpIuSuBTULVBTSrhwfMPHHrZXemOrvjZSyr6gvd9Y
	 8Vofk5CRepoj7Fd9JWC2VuMYktr2nnkmMfrlT/G7oaPjHUk4yGemAXHQMX5jB+XA8Y
	 MHF2f4CUlRR52tsd1FOkCsdbZUHUwvP4gF3He7zn3UWihwJL5g3v/qJa5rFcO93oFV
	 oQyOoozNACmmQ4tREFs5bOFmMY2aYo92oK7FmDvY+blliYQWEwVwGFFSI4ROmhvE7u
	 sHhkW6wJTgTfg==
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
Subject: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
Date: Sat, 22 Nov 2025 12:00:21 +0100
Message-ID: <20251122110032.4274-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380925963.357799.5715230082794646529@linux3247.grserver.gr>
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
V9: https://lore.kernel.org/all/20251120094617.11672-1-lkml@antheas.dev/
V8: https://lore.kernel.org/all/20251101104712.8011-1-lkml@antheas.dev/
V7: https://lore.kernel.org/all/20251018101759.4089-1-lkml@antheas.dev/
V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

Changes since V9:
  - No functional changes
  - Rebase to review-ilpo-next
  - Fix armoury series conflict by removing the file asus-wmi-leds-ids on
    "remove unused keyboard backlight quirk" + imports
    Dismiss Luke's review as this patch diverged
  - Reword paragraph in "Add support for multiple kbd led handlers" to be
    more verbose
  - Use kfree in fortify patch
  - Fix minor style quirks from --nonstict checkpatch run

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

 drivers/hid/hid-asus.c                        | 205 ++++++++--------
 drivers/platform/x86/asus-wmi.c               | 223 +++++++++++++++---
 .../platform_data/x86/asus-wmi-leds-ids.h     |  50 ----
 include/linux/platform_data/x86/asus-wmi.h    |  28 +++
 4 files changed, 322 insertions(+), 184 deletions(-)
 delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h


base-commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3
-- 
2.52.0



