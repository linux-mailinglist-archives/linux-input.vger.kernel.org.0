Return-Path: <linux-input+bounces-15599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B022ABECD69
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59BFA622548
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D172F0663;
	Sat, 18 Oct 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="A/QZH8KD"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504262EE5FD;
	Sat, 18 Oct 2025 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782830; cv=none; b=rJwTo4E9BYX+FLNiabJdIlZvIjJxG56lp/PF1mCxeqL9DDJDnmeGNivalFoOEeR/+g2RMYzuPpFrjHpjlWZG3kRErxBJ+X65xOZ2dV7WX6Pr11WFwUZ3mMr7n9xd3FAze4qttNNmVd/qXqjMDakhdLPVLDGsw0yF1qXbSbdKk6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782830; c=relaxed/simple;
	bh=nLFPxh/z1HnRiXmMqcj8iqOYBGbl8hZW/8g7ga2zGb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpHJ6qtuGfEk552evcY+Rxc7MQYJ8uZU5za9PJgtiZFk2hbeomFXuDujhB77U13oZVBbyOuj58Byb2+jsh3c1DxWaWHtIAH+XhEUx8ncvYQ9VDV9QEEYwb4fd8MW+xMq2oPReDefN4pMKeLQRbt7ClwgYqtJpqhyuSP5to3vY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=A/QZH8KD; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id A24AEBDD81;
	Sat, 18 Oct 2025 13:20:20 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 2E579BDD6F;
	Sat, 18 Oct 2025 13:20:20 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 00E462008AA;
	Sat, 18 Oct 2025 13:20:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782819;
	bh=bI7xv5nilq6rrn2Ebu8+slF5nCGwp5Y2sXrQrdg6uNw=; h=From:To:Subject;
	b=A/QZH8KD2T5gcWxvJw0R1cCiQbqfPUUSyDMgEg+93sMSjjYPAEgLYBUk0FDE0Mxeu
	 sOgV/o2G/OcScpMjLHRtuFaG6bVnA2PjoAxHQZHzTnN2pEYsEIEW3L/Rz0LlX+3E9u
	 ARb7yj5br6Oev0eqBmf/FwLgfI+zUCXedRhw+pWTjQn0CgTKubmPUIFOrNtDHKDnta
	 aQuT4q42gRscqGwI7C70s2plcUm+0vHPYfzNXATULRoDyh76tnHksOggMIzneWtp6v
	 al/CsqLNjY2ED/XWbw3dwlXfvpTtTwolddgzQMCykgar4MaW5eZCndxvEJZgbe5lE2
	 OeGXhzXgTd65w==
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
Subject: [PATCH v7 7/9] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Sat, 18 Oct 2025 12:17:57 +0200
Message-ID: <20251018101759.4089-8-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018101759.4089-1-lkml@antheas.dev>
References: <20251018101759.4089-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176078281982.1198997.8977759081663902369@linux3247.grserver.gr>
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
index 1165039013b1..d8c5269854b0 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -203,44 +203,4 @@ static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
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



