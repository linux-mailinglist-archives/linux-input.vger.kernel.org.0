Return-Path: <linux-input+bounces-15429-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D605BD60DC
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A6E18A5309
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8372E5415;
	Mon, 13 Oct 2025 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="OLji6yeu"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8A2E0B42;
	Mon, 13 Oct 2025 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386675; cv=none; b=O3STMLHOlJILl+sCoxJvoUXkOXKmylm+yeowFz4IhEI6AEVI7akEvkQD7b0fR71Ytg2URaV0Y+laOJEb+Bplon6RPTinEBFfPUqpwckCtna0GBNum90tJoNdR0ZRK3XPlVs/ItnO519GgmUP5zB9w3U3OIPgJQNSNKr6kH9KFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386675; c=relaxed/simple;
	bh=Q1R5g6RCR0eVn7osuUYOjOCS0W0OBDb299rSngnMXj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwhYaGpxEbY6j2oQ2CX+57BRQTbYZQjVM7A4nbtnHowT7vwAB7PMYyEEhHvilHLYmGNz/siKneHuW9pyp3IGfgPn/Ao0AgfsatltEKMtN/4mAX6ci3Xk/4w1bcCziuRNEjV9srWweYFGU5XPu8RAoQQfUrVNNjywxvTLSqSx9rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=OLji6yeu; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D9B78C4CAE;
	Mon, 13 Oct 2025 23:17:51 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 75859C4CA6;
	Mon, 13 Oct 2025 23:17:51 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2A77D1FDBCD;
	Mon, 13 Oct 2025 23:17:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386671;
	bh=1/QmJQwkk3LrQS7y/nRlZtkyreNiia4OZ4Tcgd1js5c=; h=From:To:Subject;
	b=OLji6yeuNTcMgcq9Poqno54265/fJTIvRddU46qQCx+5ppbN5hez+i2mxRAkJZ4BL
	 8b83ASi2OXSQTjx+VlFfhxUmRHi/v4+af3Kn3b212zb4q7uEfBsa3MrwdFP8mmejE0
	 Yry5mTvYf/aUHy8VZfXFzGbo6j0oxwyO1NLS8wdBG5HZtwm9Yg7wW1YtRMU8FyWz4H
	 t7RF0PbGoK3PzSStjN8AeSz9b2cvslouP4U3JpcX7ySTMmQIptlGU7c0aNVD7Ac9em
	 ffpq2tNM3zcL5FOTyUQgGTI754mAlWJahWtXtkmeJncfcaT5BhoJE6UhZeGmn8qZmZ
	 qAIMg1Q/rvV9Q==
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
Subject: [PATCH v6 5/7] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Mon, 13 Oct 2025 22:15:33 +0200
Message-ID: <20251013201535.6737-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013201535.6737-1-lkml@antheas.dev>
References: <20251013201535.6737-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176038667114.3397618.15634674993346894509@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
 1 file changed, 40 deletions(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index f13a701f47a8..1f85d76387a8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -202,44 +202,4 @@ static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
 }
 #endif
 
-/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
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
-
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.51.0



