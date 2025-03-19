Return-Path: <linux-input+bounces-10988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB42A698EB
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D56D4836D1
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA3021B8E7;
	Wed, 19 Mar 2025 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="mPkJYvo3"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE3F21ABA5;
	Wed, 19 Mar 2025 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411622; cv=none; b=hQsAbVxdnqi08shxfdQX9gTFPGJA5zeTuT25UErYZQQ3h3vwr7XxQvVevI0RXQR1acGafP8fEXAqlE9V4aWtNBqlcCQjinn5lofphGqQIC51hiw3eYWTrfygSs/Qx9jxWmbJcxZFDQ704h+jVnf8K7taL/8BjvZmwmDPolj+LJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411622; c=relaxed/simple;
	bh=BaICWmS9DP1Q0qAK8wPYj+KjwWIanEM5K0lWmT6H0qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMYJOttrC0ZZBBx0FXUa/R4fvBLM4fQCCCqGEy+SI5K2O8SDEMHCLd1L7kXERZ0J+av1lAahPqSZWzCi+T62h3/Wty/CkrIFcDyif6PlJ1LkiLNFFHZ+ClHK/I2kJe+mYCwmkAw/9AQHZey6/snNjCgdnh4Fb75B0X5claGJnes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=mPkJYvo3; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 71E532E095F5;
	Wed, 19 Mar 2025 21:13:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411618;
	bh=roAVJuFN0Ur6MuKE+h23ZI41YgCtmZzT18w2kdWZ1x4=; h=From:To:Subject;
	b=mPkJYvo3/J0X9tOB3lp0bR9+I7a5YozppZIDwdy/C4j7h16nkkX7F90lqa0VLrkPR
	 ZrQz41TSCijeC2FVOByDkUv6aEWyvn+LIFLDSF9K4fP1O2nZJHR1FCd29T8mqK1pWn
	 M+0BVinIgCUl8zZWGOMlaptsSyejrquV936voI2c=
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
Subject: [PATCH 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Wed, 19 Mar 2025 20:13:17 +0100
Message-ID: <20250319191320.10092-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241161869.8431.6244387660114121696@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
 1 file changed, 40 deletions(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 42e963b70acdb..add04524031d8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -183,44 +183,4 @@ static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
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
2.48.1


