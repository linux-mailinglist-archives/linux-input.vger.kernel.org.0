Return-Path: <linux-input+bounces-15433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CFBBD610F
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A5464018AD
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2302DE1E4;
	Mon, 13 Oct 2025 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RL+1lKhm"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFC2D94A9;
	Mon, 13 Oct 2025 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387022; cv=none; b=f6LBqtOCFnxD1g5RsqlxtD0iF59dgZnZfRih3Elu5oS5UatZ7BZFcpESWkxb0qUTzHjqRRRXYraEipCJD20w5Mt/E6RoC6gCbK0u4KAmT1K7arYO2W7/8yFeAVAH4m12yunqn7gKvCybNvrVaSe/4xYoijTM83bXqlKEaovdF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387022; c=relaxed/simple;
	bh=A3Ymqe4PxFn583o+aAaAPj3qU3+4X72cbIfnRwyCYZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXQShjrA7YOlpdC87rW7JfrUlQomUQdiRuK92JpGvaBE7s8vY/7xzpl/c4ED5cxJkhbmjP2UHTIstqbRm86uBncfpNpWt9Jyd/PeqMl4zODwMtWMQtxIy0QejGe8w3/yyAMmSZeYZscyct7vnShML3zenr9crE+VRQedMPConl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RL+1lKhm; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 3E2E4C4CA2;
	Mon, 13 Oct 2025 23:17:40 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 4F4F3C4CA9;
	Mon, 13 Oct 2025 23:17:39 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 09AE11FDBBF;
	Mon, 13 Oct 2025 23:17:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386659;
	bh=j/OiZLjA0l0ekzdu2qeZVWmhmEiXayHMPlu3k0WwWpY=; h=From:To:Subject;
	b=RL+1lKhmgASt11O/icU1SGEpPehJp2P9GYz1U0m7ODKcoKcynMndp8jyUEjn1h74O
	 nDowWfdPohSkCsgWJX7j92Lpzq8iDoi2jhjq04FLiLuWQTL1c21Md35cEtIpnYHRpS
	 ScVJOkRoDaWiE61w7vA4vnVxg9mcOhNdL4j1kyPWxFDK93JpyKxsTz4SVWZqNORvoS
	 9fvZSERQ8JWhpDNQvmdEizp9f44aCrOMC37eeBPnRqwCzLFDMOQ2KgJlQCESeH/HuH
	 FNuj5qU9leDwQ/FiOU95sBi9BNf0cGxypf4O1g8oEZxItjHYJuiE/cOrrCK+jsewaF
	 veTSi65gsW0tw==
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
Subject: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard backlight
 handling
Date: Mon, 13 Oct 2025 22:15:28 +0200
Message-ID: <20251013201535.6737-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176038665894.3397295.14776036217802633959@linux3247.grserver.gr>
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

All comments with these patches had been addressed since V4.

---
V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@antheas.dev/
V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

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

Antheas Kapenekakis (7):
  HID: asus: refactor init sequence per spec
  HID: asus: prevent binding to all HID devices on ROG
  platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler

 drivers/hid/hid-asus.c                     | 235 +++++++++++----------
 drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  69 +++---
 3 files changed, 291 insertions(+), 170 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0



