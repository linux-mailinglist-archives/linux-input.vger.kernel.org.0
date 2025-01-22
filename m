Return-Path: <linux-input+bounces-9468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEAA18C54
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 07:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F389F3A2AC0
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 06:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E471A23BE;
	Wed, 22 Jan 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mujWOMzk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC347462;
	Wed, 22 Jan 2025 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528685; cv=none; b=iFqYtCCr0rZAe+n4hkSPJKcpYs48iDQlA7dxlv8zJh53OGfZGABbSGKMF2HX+XUsH09BKKVgj+S/nJjFLE4qdx/6iWvC/5tBWHPZlj52TiE+m/z/zYO88JIx7zoINpXlqp2Uis8Hy+IqNxd3J4GyCZCpMLvUTAPdO0gUdnSnSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528685; c=relaxed/simple;
	bh=aZJqqK7jffsh2tSvUgykiIDCFwhwRrFXUb0XOhBqXo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZY7BZo7qJQo4ePGhyittjdP/jw1iYQ0KnmeZPEMnp+lUpMFfozCfQP13BwBuYU5k5t0PIPOY7rViHRnkwZuSHMJM9UMNcYiQtEVle04ncFWMkSC9ZnyDvs1314sPsfuxH3dio+QHOiMRLrA+R7ZUwQVj7tPF+14lJeYSP2gnD/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mujWOMzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E177C4CED6;
	Wed, 22 Jan 2025 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737528684;
	bh=aZJqqK7jffsh2tSvUgykiIDCFwhwRrFXUb0XOhBqXo0=;
	h=From:To:Cc:Subject:Date:From;
	b=mujWOMzkFn2U5KgNfIS44uOX6/9ZwzwjISjM4O48ubO0kB4IIwXO2TnUhQ3WLHT7q
	 mpJN+CA0fJXQ6seRrOPqqamG9bLGbrVkahq2o/2StjVBlOP8AYeAwjUMVadxzcGrZY
	 BgSkz0yZ3C7APXOsoiLo76tpOckH2/ry6kUs2uzIUFkl5WNoy1039burpHwGjXh4s+
	 lWt0aymcjgeBss33lscU2RDd+vgcuYqtWS6b10NxG6GrwGnYEOJEs/HYCtFTb/m2YP
	 NPWcce2l6tq6UbZksiBaBNcMFm2eQ41H81WVEJYEfZ75Ei+WsSP0Nc2VHh3mu0UZCv
	 6SSRey8PnEkhw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lenovo: select CONFIG_ACPI_PLATFORM_PROFILE
Date: Wed, 22 Jan 2025 07:50:57 +0100
Message-Id: <20250122065120.1335235-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A previous patch tried to fix this link failure:

x86_64-linux-ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
hid-lenovo.c:(.text+0x22c): undefined reference to `platform_profile_cycle'

but got it wrong in three ways:

 - the link failure still exists with CONFIG_ACPI_PLATFORM_PROFILE=m
   when hid-lenovo is built-in

 - There is no way to manually enable CONFIG_ACPI_PLATFORM_PROFILE, as
   it is intended to be selected by its users.

Remove the broken #if check again and instead select the symbol like
the other users do. This requires adding a dependency on CONFIG_ACPI.

Fixes: 52e7d1f7c2fd ("HID: lenovo: Fix undefined platform_profile_cycle in ThinkPad X12 keyboard patch")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/Kconfig      | 2 ++
 drivers/hid/hid-lenovo.c | 7 +------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index b53eb569bd49..8adb745c5b28 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -570,6 +570,8 @@ config HID_LED
 
 config HID_LENOVO
 	tristate "Lenovo / Thinkpad devices"
+	depends on ACPI
+	select ACPI_PLATFORM_PROFILE
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 4d00bc4d656e..a7d9ca02779e 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -32,9 +32,7 @@
 #include <linux/leds.h>
 #include <linux/workqueue.h>
 
-#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
 #include <linux/platform_profile.h>
-#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
 
 #include "hid-ids.h"
 
@@ -730,13 +728,10 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 			if (hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) {
 				report_key_event(input, KEY_RFKILL);
 				return 1;
-			}
-#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
-			else {
+			} else {
 				platform_profile_cycle();
 				return 1;
 			}
-#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
 			return 0;
 		case TP_X12_RAW_HOTKEY_FN_F10:
 			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
-- 
2.39.5


