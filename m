Return-Path: <linux-input+bounces-11088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C9A6C93B
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 11:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A6A3AF911
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8291F8BCA;
	Sat, 22 Mar 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aLG7/+Ws"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2CA1F6679;
	Sat, 22 Mar 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639322; cv=none; b=PCNKqCSk45d+naBOzYXjK4/139jIWt7gkv/2AbKkygwrqTJ+hmi3PwEtb72W3ASRCeWS0kH6D5AHJfH0LSu4nSXBacER2ej09m0zDxDfR2PjYs5muIerHe046T5dOPdOXlCLUWb+dubbtxCVJ1oWSpQGnGKOv7MTP8RZ3JEm9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639322; c=relaxed/simple;
	bh=QiaMAzyure9xhOeTG9cPu2r4S61YEcYb/tsBd2SGK7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVODbQk6r6UDyegGiYrmDSmhFEYy4fxBQBLEgTSsic7abPaD7awjSsM/OQHK6o6YaNZFxnBD1iu3QMxQmv2Fyt62ZejhBdS+1T7Z2MgcuRh04s40H8uWAMcjpKvrzqf+STlrIBH32F9hsSW0OQoZvrVuApeuQ2u3gI0UUa00qoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aLG7/+Ws; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 7C9322E07CC1;
	Sat, 22 Mar 2025 12:28:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639317;
	bh=23MBRPbUgSvC3HFx1I2ygXhAuTpjXWmxZKRcZ4BV0FQ=; h=From:To:Subject;
	b=aLG7/+Ws76PxsDXT2LZqoo5TatPGOgdZsecxxvr4bCjdrn5MsnI/hnzvh0Pg3LygK
	 gMKcXSngRNcUIU337/N3K1LYDAd0E0VOVJi6zMKtq1cHFRkFXhM+lDslSN7KkFCa18
	 uANR/21Q2c5KMGK9TK5WxXori31OmBbniyd1EuWE=
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
Subject: [PATCH v3 00/10] HID: asus: Add RGB Support to Asus Z13, Ally,
 unify backlight asus-wmi, and Z13 QOL
Date: Sat, 22 Mar 2025 11:27:54 +0100
Message-ID: <20250322102804.418000-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174263931751.18806.13122806468115478771@linux1587.grserver.gr>
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

In V3, RGB controls are pretty stable, but as per Luke there needs to be
a discussion about how it should be merged, so the last two patches can
be considered as separate. The Z13 Folio has a unique pid, and so do the
ally units, so RGB can be safely enabled on those. For the rest, there
are cases where the same pid is used in laptops that have a white only
keyboard.

For more context, see cover letter of V1.

---
V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@antheas.dev/
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

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

Antheas Kapenekakis (10):
  HID: asus: refactor init sequence per spec
  HID: asus: prevent binding to all HID devices on ROG
  HID: Asus: add Z13 folio to generic group for multitouch to work
  platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler
  HID: asus: add basic RGB support
  HID: asus: add RGB support to the ROG Ally units

 drivers/hid/hid-asus.c                     | 354 +++++++++++++++------
 drivers/hid/hid-ids.h                      |   2 +-
 drivers/platform/x86/asus-wmi.c            | 152 ++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  67 ++--
 4 files changed, 423 insertions(+), 152 deletions(-)


base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.48.1


