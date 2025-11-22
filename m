Return-Path: <linux-input+bounces-16291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36004C7CD6D
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 458674E3DF6
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E572FE579;
	Sat, 22 Nov 2025 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gaiureR0"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C72FD1BA;
	Sat, 22 Nov 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809279; cv=none; b=BAwA7k1krjp/P2kKhmKJMQVrhFQbPf/aM2RlTpD4KsEDsLncz8qhGq2AZhhfHZQK6mX6YS6Zd9iRqXuC0P6j64nWLWRAHF9pXY+iou7zY3v6dY2XGKxVN4ea37EPtJ2dskMJFOh0SFWyLQcYEtCKJFiIahAurNLcGGW0RZneRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809279; c=relaxed/simple;
	bh=a9JX/hz7XDQCkoS0NA3OQe698B26HQ4M+j2HYaqlmKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1MaIXxCPo8aMIc2wS0T9W9qhbmx44uBQrRTgr2E169F71ixQ3OSUwmWMUPhHj5dnbJAuyyNjILShnCBDTn2A/AS8gfxRd4XZLbpKbr+6NmFZy6hyuFjzQCtY9rn80NNZnlSHUl32r3mXl2Z6PHVnjog80vlsEZ4NG7up1ICm4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gaiureR0; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2AEAEC124E;
	Sat, 22 Nov 2025 13:01:10 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id A5483C1444;
	Sat, 22 Nov 2025 13:01:09 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id BB6591FFF8A;
	Sat, 22 Nov 2025 13:01:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809269;
	bh=9FHeDYWB9QBHwXRCC98gB7W5reVHz+wGK9MBaN6TKO4=; h=From:To:Subject;
	b=gaiureR0VPW8ISl1YJsFdtrzodYuP/c4FZAQvojxdU3A8rxR1u3D2xN/U8V0v3h65
	 OFSUMT4dI+4ToIPbWWjt70eGZT7DiFd9crYTcDUHLl5wIjkR/yjsdsWEmjHnDB1hPL
	 VND8PE1MivE4ZBI2K7hsJKg7ZPT7z/GBosVWNsQRrFi80hbv13W5IUu40Ljy0JJany
	 OpMY8S5O/o8DSWIxTJmb/29UBXsLxEKs69DP83XccB/onGwMEU8JiGkz8Zw+/hCHhv
	 ASMoZcsN8GUsuMWrma8t+rYSGs9mEWw2sWGVnVxC0667XgReCmcUAV25c6ZGZbLN/d
	 AlX58Oumf50YA==
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
Subject: [PATCH v10 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Sat, 22 Nov 2025 12:00:30 +0100
Message-ID: <20251122110032.4274-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926930.360592.14765854476132917093@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove the file containing it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../platform_data/x86/asus-wmi-leds-ids.h     | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h

diff --git a/include/linux/platform_data/x86/asus-wmi-leds-ids.h b/include/linux/platform_data/x86/asus-wmi-leds-ids.h
deleted file mode 100644
index 034a039c4e37..000000000000
--- a/include/linux/platform_data/x86/asus-wmi-leds-ids.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
-#define __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H
-
-#include <linux/dmi.h>
-#include <linux/types.h>
-
-/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-#if IS_REACHABLE(CONFIG_ASUS_WMI) || IS_REACHABLE(CONFIG_HID_ASUS)
-static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
-		},
-	},
-	{ },
-};
-#endif
-
-#endif	/* __PLATFORM_DATA_X86_ASUS_WMI_LEDS_IDS_H */
-- 
2.52.0



