Return-Path: <linux-input+bounces-15592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B25BECD1B
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFE6034F042
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4412D46C0;
	Sat, 18 Oct 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="MOfi9nGj"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C281C84A1;
	Sat, 18 Oct 2025 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782816; cv=none; b=Ip+GRbahAvDxtF3rFvhx4UzptDPhHBc/8d+2IbjBA4rmPyVwD2/S6D20HiIbUqPcsYnfRwlQ36GoOXYoiUVrjZDNlHl5Kp0auUM1vSrIY4g705O0UMSzWL06bov1ZSOCydvalCRjQozAdboCpA76axZejd9S6GpW2IRrF2OPq+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782816; c=relaxed/simple;
	bh=eeuPP/YIVN+jb8lQwuTlUpQU9Q0jplpX9ezHVO7IU84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pA1zo6NjtxGuO6I4cfq941BBiDgh9IQjuWkcW3F25evjR238JhWd+aNG7BxFche5dM4HzgzaCmQn6WWXhELzlW8T7dIkJcyTvE72QECvFDQAShDvhfOl5o7SlG5FKo3sRndhWcI9+mGflC1Y32DOZuqKNKiXi+rVgEaTPvsL1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=MOfi9nGj; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id C0B19C1DBA;
	Sat, 18 Oct 2025 13:20:04 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id CAFD6C1CDF;
	Sat, 18 Oct 2025 13:20:03 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 82BAC1FE7ED;
	Sat, 18 Oct 2025 13:20:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782803;
	bh=g5DuRXlUfInziU2yzJmrD3WF5r65Ep0vgbJExEInLsI=; h=From:To:Subject;
	b=MOfi9nGjDyYHN7G73ZherTgxWhHRa6eCBX9ba3kMIH2Mu7oZXwaN/5baGxHY+K0S9
	 fo0q7vAplzhAuNshBBnZ0a4y0PMliXKWv5zkSk3zMn/JV+HOfZR8FNiSQtLShBroWl
	 YQdFsjU6yBrAIPIqrwLrcc949FsfpCOg7+TWgJ6n9heaYZ3mpIrm2SNIp+0DR6mG83
	 gWWh57bri8Qc5noA5xB+FQqt6RC1H1mJxisuQyoa6/5ZYzg6A0rjuh6ut9sY6cZN6b
	 T37Bo8HajZcWQa5SIoUgPMRsSTpfYB12ouNh6yU+dw/t2HKm/suaR7gJ9YEywYu+WX
	 axXGMIhCo4VIA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.222) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v7 0/9] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
Date: Sat, 18 Oct 2025 12:17:50 +0200
Message-ID: <20251018101759.4089-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176078280346.1196952.8118807654851595704@linux3247.grserver.gr>
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

V6: https://lore.kernel.org/all/20251013201535.6737-1-lkml@antheas.dev/
V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

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

Antheas Kapenekakis (9):
  HID: asus: simplify RGB init sequence
  HID: asus: use same report_id in response
  HID: asus: fortify keyboard handshake
  HID: asus: prevent binding to all HID devices on ROG
  platform/x86: asus-wmi: Add support for multiple kbd led handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler

 drivers/hid/hid-asus.c                     | 222 ++++++++++-----------
 drivers/platform/x86/asus-wmi.c            | 215 +++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  70 +++----
 3 files changed, 326 insertions(+), 181 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0



