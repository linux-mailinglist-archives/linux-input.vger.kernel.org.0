Return-Path: <linux-input+bounces-17135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5BD31F3C
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 14:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 785E0307B30E
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80FA285C88;
	Fri, 16 Jan 2026 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="XYCZktrW"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1290277CA5;
	Fri, 16 Jan 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570660; cv=none; b=oNGsRkxbQjGgaXUeUMLsPC6K+JHOugSGCIdZVFlBdMSly+Zgpl31U7Ow2VHfLqb5dnDRPhNkB9a9pN6zn35tpDbIil9C76JCaQF8uuRgWN7OosuU8s5EmI+kiwrXdcyOhojBPah4B5mIq1x1LpnKf9/Pok8eQe/BnzpaFmLu6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570660; c=relaxed/simple;
	bh=qC/J0+4+tdmZ37XLBWyV/NfGCb0il0AY9ubrh5qmRhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcFVoN8/iLV/DWtuIx1jOe7a2TN/WWcXKxiPn4xVdEJY0Nhq0mCiBvlJ/uYenCIQEzxuI4xrqKwa9k8evEQlPSf0OH2iSfbPI8o4w9ws3CxUKA7idsuKNSYBoGwLHasMfrZh2ZzRjqLZIog+929VFmvLYd1Mh2gOKehJwQHyYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=XYCZktrW; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 9938C408E8;
	Fri, 16 Jan 2026 13:32:11 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 186984088C;
	Fri, 16 Jan 2026 13:32:11 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c3:fefd:0:42c:a43d:2848:c282])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 41065202536;
	Fri, 16 Jan 2026 15:32:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768570330;
	bh=EZI62rLY8T5iCqJeT156w6aRaLQTMZvHv5YNdeVWJHQ=; h=From:To:Subject;
	b=XYCZktrW3q3PhEUkbcdI3lLhZowCGhZh8Rw6RRtsTfDKwWRK9y3uda6PQY8vTV9pK
	 D8IITk2VZ8ZtO78sgLQYc4FLECY4kd38l7UHPHFAV8ufCvJJsVic2Od9Du6chkNsI4
	 s3ih7zeaKlXEPTtvMe6rVcxKa1TlIwmbE5jOMmK+qrjwxS4xCENyqHSSbrmzGjLWfY
	 gVzrgXxQC/ixxtktl8e3MIVSuC5vaQ3X/VT8XxddWMgWauhqVtT/p/QimEA9sqNb1Z
	 ok3sgzsgJr9mnaNnbzxn1bpxuPfEqWj69y4o7CzMu3mQQnOX9XMNPrgQt+rlDhTGqC
	 qK1njUQMoDV4Q==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c3:fefd:0:42c:a43d:2848:c282) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
	Denis Benato <denis.benato@linux.dev>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v11 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Fri, 16 Jan 2026 14:31:48 +0100
Message-ID: <20260116133150.5606-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116133150.5606-1-lkml@antheas.dev>
References: <20260116133150.5606-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176857033060.3552944.3515433525594511802@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove the file containing it.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Acked-by: Benjamin Tissoires <bentiss@kernel.org>
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



