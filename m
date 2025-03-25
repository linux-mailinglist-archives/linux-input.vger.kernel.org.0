Return-Path: <linux-input+bounces-11261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728DA70995
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941D8188C92E
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D071DDC2E;
	Tue, 25 Mar 2025 18:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VWxD6JGk"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261319D086;
	Tue, 25 Mar 2025 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928374; cv=none; b=eW/iPVaP7z0aWlRPQvwILHGsyFc2mQ+d3ATpexn0A23dkovByeGoqRaV+XGqbyT1V91ST7mXL8gx3AQeNNRymr5iKYwhnv4zS9rBSofch3NH90S10ZN87uCqdhJ72IjqWec36r596Qh595qMvEWRkyOzHEAEoicJXbmVMbj10xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928374; c=relaxed/simple;
	bh=26cUWmyUJw9PvEkCjgx/ibwg0Ykhe7Oo8y/LNSYUn0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvY3dcIs7lTRJULkdnlcwJ+74zaKO6EsG1+rhVh+5rPgEnNbmuIeltviOBfJZv6TDLptWY5zBFTC0VudjxMwHU0bQkxp6w13ZQd3A7gLKXimx08vEJCNDeiWUZINnBi2uLOebyF2CfnVGDXo3hOvtFAVHH658oh3mG1Hgnfg0wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VWxD6JGk; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id BF0BB2E098A5;
	Tue, 25 Mar 2025 20:46:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928366;
	bh=3yGfiKbUIqLMVOFnvObw+kXe8LmExFJR+Kd9PtGzFrw=; h=From:To:Subject;
	b=VWxD6JGkJ+UFftcNfuhOgM8ozY1ZopchAxJfn4kgPUdDeLo0uZPIhC9BFNAZzMgN/
	 nHXS8IZJg4q73qqmxgZ2mP0SKXiMf18n7BQOPwRp7zRVeXTnrpIZ03Al1t4sS8R4VZ
	 mt//8h3SW46d/SLxwa8iA2hO2w/+0by8C5lqYoBQ=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v5 00/11] HID: asus: Add RGB Support to Asus Z13, Ally,
 unify backlight asus-wmi, and Z13 QOL
Date: Tue, 25 Mar 2025 19:45:49 +0100
Message-ID: <20250325184601.10990-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292836678.7644.4282738635052490441@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

This is a three part series which does the following:
  - Clean init sequence, fix the keyboard of the Z13 (touchpad,fan button)
  - Unifies backlight handling to happen under asus-wmi so that all Aura
    devices have synced brightness controls and the backlight button works
    properly when it is on a USB laptop keyboard instead of one w/ WMI.
  - Adds RGB support to hid-asus, solid colors only, and for the ROG Ally
    units and the Asus Z13 2025 first.

For more context, see cover letter of V1.

---
V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@antheas.dev/
V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@antheas.dev/
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

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
  HID: asus: refactor init sequence per spec
  HID: asus: prevent binding to all HID devices on ROG
  HID: asus: add Z13 folio to generic group for multitouch to work
  platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler
  HID: asus: add basic RGB support
  HID: asus: add RGB support to the ROG Ally units
  HID: asus: initialize LED endpoint early for old NKEY keyboards

 drivers/hid/Kconfig                        |   1 +
 drivers/hid/hid-asus.c                     | 359 +++++++++++++++------
 drivers/hid/hid-ids.h                      |   2 +-
 drivers/platform/x86/asus-wmi.c            | 157 ++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  69 ++--
 5 files changed, 435 insertions(+), 153 deletions(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.49.0


