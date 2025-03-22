Return-Path: <linux-input+bounces-11094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852AA6C950
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 11:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 617E41B629C7
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CC721D3D4;
	Sat, 22 Mar 2025 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="3jMC1L3N"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0020F093;
	Sat, 22 Mar 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639330; cv=none; b=TonuSxdyBt6n8vMQDLx3wxPpz/KWvT3VmRyBYB+sF6dstJWWrWCnqqQ/xISiY9Z7FXBGEnw+0SaANP/I45Oe+Ek9iFnDJy6Vz4RnaTV/47YS3KclQrbnpJjw6vERX0oc0u0MmiT55hHs4qxV1aj6/+keog1CbEU0aBEJ0dBs+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639330; c=relaxed/simple;
	bh=necrfefBJVxubjAa0JrzQEAv6oJMDS/YFkHSYRXf7v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b10tEbMS4r1f4ySWw4ie2R7mt/5Jvcffr/gn5atqLuVIkPORCu7ZrQpI4qE4KgjjixuUyd6tBubKQAV4nBWy067s0zjyIajftUVzHFKfnUctCnHMa6pWVrhM+4LUgnrB6ateyMwbcD5Y9LigD1BCFBlcMUbRVSKAY4xxmWSahIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=3jMC1L3N; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C46202E0879F;
	Sat, 22 Mar 2025 12:28:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639327;
	bh=/IR9Bkm9Uup9loRYxXqixy9gr2VXNlaTSH+A2ZRu3z0=; h=From:To:Subject;
	b=3jMC1L3NyoRyMANlFngj5aUmaEqvdFn1057uJtlojzaRikUnoehSLdpzPjFuZvGvh
	 LL+vS4iAmuGLxixJO7q4q5JUDfuKaUQDN4BqriyJYajSl5StlqpBb95nH4wi6cc3WO
	 wEs/6n7yiircJ1CnaVyrHhlo+hThDCsUOEddTdcI=
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
Subject: [PATCH v3 06/10] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Sat, 22 Mar 2025 11:28:00 +0100
Message-ID: <20250322102804.418000-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250322102804.418000-1-lkml@antheas.dev>
References: <20250322102804.418000-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174263932692.19176.10610809038486173736@linux1587.grserver.gr>
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
index ec8b0c585a63f..c513b5a732323 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -183,44 +183,4 @@ static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
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


