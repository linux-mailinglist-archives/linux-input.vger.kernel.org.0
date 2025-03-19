Return-Path: <linux-input+bounces-10979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5972A698D1
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B43F17F32E
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36324211A1D;
	Wed, 19 Mar 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NJoS2zjn"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F0211715;
	Wed, 19 Mar 2025 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411609; cv=none; b=MtLb0TE9XwDtktu8q8H3TF1djJelJzjAIbGwOCP4DEuEtbOj1ogbzeWo4uxLbf54lsDEmrCuIqrTlH9ZPaM+aT7iJ1olEynK/InedBPv5PKRICznd7zmmHW3jyM74Zt77Ta0Pmdtdr6fJpWTyIK8zxY8aXkNaUWMA/rlkCrqtY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411609; c=relaxed/simple;
	bh=vSvZxZ0NwBGmwepE94KBT72M3Ac8sdqVeI1o403IOgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qOYvfuqJWWIy9mcEMxxJ1QtSH9XqDafuJDSySxxto4iciBAcyXM/CjqEFoIz4giGp5hl4gIL6/F27OgfGXy2HrBwdrf6tqqW9Hl7m4wEo9Hdta0AmU2gBVzKHK2fxzSRnTHWCTeTYzv8aHnojEBMxOcu11/L/YdYKa5/XrrqUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NJoS2zjn; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 442D42E029B7;
	Wed, 19 Mar 2025 21:13:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411603;
	bh=ZCfvDS6gXGAxsTeXHoTWtoXKbmrBvPEnxWQeAGaa6is=; h=From:To:Subject;
	b=NJoS2zjnObAFoTSqMo9oJDAbnM9VBMuOQsoToOBh+EiDViY2Tu56dm9goK7ZakUhF
	 3SeOcaY9gnGSWR0FECZ4nMr5ewuEBBChVfKDHURvY1FF0gSXSHjPfTzt6eHNgKi6b6
	 UdV59TQaeqPb7hB6LPjBnlSIHGW9fWbmHpoDhPcw=
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
Subject: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight unification,
 Z13 QOL improvements
Date: Wed, 19 Mar 2025 20:13:08 +0100
Message-ID: <20250319191320.10092-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241160339.7553.16834624348433775118@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

This is a three part series that does the following: first, it cleans up
the hid-asus driver initialization, preventing excess renames and dmesg
errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
key. Finally, the bigger piece of this series is the unification of the
backlight controls between hid-asus and asus-wmi.

This requires some context. First, some ROG devices expose both WMI and
HID controls for RGB. In addition, some ROG devices (such as the Z13)
have two AURA devices where both have backlight controls (lightbar and
keyboard). Under Windows, Armoury Crate exposes a single brightness control
for all Aura devices.

However, currently in the linux kernel this is not the case, with asus-wmi
and hid-asus relying on a quirk system to figure out which should control
the backlight. But what about the other one? There might be silent
regressions such as part of the RGB of the device not responding properly.

In the Z13, this is the case, with a race condition causing the lightbar
to control the asus::kbd_backlight device most of the time, with the
keyboard being renamed to asus::kbd_backlight_1 and not doing anything
under KDE controls.

Here, we should note that most backlight handlers are hardcoded to check
for backlight once, and for one backlight, during boot, so any other
solution would require a large rewrite of userspace.

Even when brightness controls are fixed, we still have the problem of the
backlight key being on/off when controlled by KDE and 0/33/66/100 when
the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 to
be done under hid as well, regardless of whether the backlight of the
device is controlled by WMI or HID.

Therefore, this is what the third part of this series does. It sets up
asus-wmi to expose accepting listeners for the asus::kbd_backlight device
and being the one that sets it up. Then, it makes hid-asus devices
register a listener there, so that all of them are controlled by
asus::kbd_backlight. Finally, it adds an event handler for keyboard keys,
so that HID led controls are handled by the kernel instead of userspace.
This way, even when userspace is not active the key works, and we get the
desired behavior of 0/33/66/100 across all Aura devices (currently, that
is keyboards, and embedded devices such as lightbars). This results
removing the quirk system as well, eliminating a point of failure.

I tested this on an Asus Z13 2025, and testing by other devices would be
appreciated for sure. This series is designed to be transparent to
userspace behavior-wise compared previous kernels, with all existing
laptops either having the same behavior or being better.

The Z13 keyboard folio RGB controls work beautifully, with KDE led
notifications working and doing 0/33/66/100 as expected. This also happens
with hotplugging, as the lightbar is always available and keeps the
endpoint alive from boot, even if the folio is not connected (a quirk
can be added later if there is a device where this is not the case).

The first two parts of the series can also be merged independently of the
third part, so we can iterate on that more. Perhaps there is a better way
to handle this cohesion,

Oh, by the way Luke, I developed this series with a variant of
your Armoury series merged, and only switched to 6.14-v7 for this
submission. You will be happy to know that there are no conflicts :)
(at least with that version from ~January). Also, please factcheck
my initialization sequence is correct in the 0x5d and 0x5e devices
you added when you made that refactor last year. Are those handshakes
needed?

Antheas Kapenekakis (11):
  HID: asus: refactor init sequence per spec
  HID: asus: cleanup keyboard backlight check
  HID: asus: prevent binding to all HID devices on ROG
  HID: asus: rename keyboard3 to Z13_FOLIO
  HID: asus: add Asus Z13 2025 Fan key
  HID: asus: introduce small delay on Asus Z13 RGB init
  platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
  HID: asus: listen to the asus-wmi brightness device instead of
    creating one
  platform/x86: asus-wmi: remove unused keyboard backlight quirk
  platform/x86: asus-wmi: add keyboard brightness event handler
  HID: asus: add support for the asus-wmi brightness handler

 drivers/hid/hid-asus.c                     | 220 ++++++++++++---------
 drivers/hid/hid-ids.h                      |   2 +-
 drivers/platform/x86/asus-wmi.c            | 137 +++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  66 +++----
 4 files changed, 279 insertions(+), 146 deletions(-)


base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.48.1


