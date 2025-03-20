Return-Path: <linux-input+bounces-11032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FAA6B056
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 23:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73391481C1E
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB822222DD;
	Thu, 20 Mar 2025 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dnEaE1MZ"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7C921C9ED;
	Thu, 20 Mar 2025 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508576; cv=none; b=OSC4z7wYnXZ8h77gKLJm00saOJRjMUulAuoxYQJSaY4Soz2gS2gJrbr2xJBynYHba4wUNQUhDaLcc8PmH+VZoWXVKxLXTM4ucqlZYFj4YhyM6CFlRG/lpyK//E8f84K8ild2XBAZaSoUJlfC0cXyDEy/aKUnwSAW/qj3fI8R+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508576; c=relaxed/simple;
	bh=qUg9FB5PSg7H9HF9FT27I11Qt2WWnUoF7orL4MtlwZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3d4D6pejbUp60PiCVvwt4v3Dw943Bs6O1BhSNz0WGif2dibqevsFIGVmZ6FrHjs6t7wiY4w44faIWaipmTuirMDrC2oe13HxKlTRXv8Vhc7EkAqGIyfeFcK+yQCDSiHAAckxB6Rwum0oTnB2SMckXEwqfFcW0pI2UTJWkvMQYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dnEaE1MZ; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 92B002E095F7;
	Fri, 21 Mar 2025 00:09:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742508570;
	bh=9sCw3kO8QxFQGuwLUqfE8xRfH2x0O6VUE3oIVzD+wmo=; h=From:To:Subject;
	b=dnEaE1MZsLwstLhkdSpqdRoSVPDv0VR4eVyeARKwQc3T7IiIP1ACb3iHfre6jo46B
	 8CyTDv3L8F2OAkx6538xCWA3rOFneVtabNXTj5O7N2WI/oyJTIr+rxa6O8fv0KVyg3
	 2NnOXXVSJY2R5M4GBecPuI+g4mL6yqCnBlENeJmU=
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
Subject: [PATCH 00/11] HID: Asus: Add RGB Support to Asus Z13, Ally,
 unify backlight asus-wmi, and Z13 QOL
Date: Thu, 20 Mar 2025 23:09:13 +0100
Message-ID: <20250320220924.5023-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174250857064.25255.14540520970626565870@linux1587.grserver.gr>
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

For context, see cover letter of V1.

The last two patches are still a bit experimental, the rest is getting to
be pretty stable by now. I will test my Ally in the weekend. Also, I am
not a fan of the asus-0003:0B05:1A30.0001-led name, so suggestions would
be appreciated.

---
V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/

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
  HID: asus: add Asus Z13 2025 Fan key
  HID: Asus: add Z13 folio to generic group for multitouch to work
  platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler
  HID: asus: add basic RGB support
  HID: asus: add RGB support to the ROG Ally units

 drivers/hid/hid-asus.c                     | 342 ++++++++++++++++-----
 drivers/hid/hid-ids.h                      |   2 +-
 drivers/platform/x86/asus-wmi.c            | 138 ++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  67 ++--
 4 files changed, 411 insertions(+), 138 deletions(-)


base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.48.1


