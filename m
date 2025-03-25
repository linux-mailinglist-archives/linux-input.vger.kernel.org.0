Return-Path: <linux-input+bounces-11267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCD7A7099C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5DE1729A1
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2706F1F461C;
	Tue, 25 Mar 2025 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="1eUyE8cd"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8101F419C;
	Tue, 25 Mar 2025 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928382; cv=none; b=ENQiar58wX6Vu2j7qkvimzTjjKyUgrmdgD8KNyoMfolqnmNgFmeNgjW8cknlvKcmOuZo7qRtniXaCGFCbIAElb7UbBN64Tp6rzTKrSEpRPpLL7P+b6sdAKH9hHf3iw7f4HHC2jjJ1HzBn6dqSv3uH2sH7TzK87//yn8YA2xoHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928382; c=relaxed/simple;
	bh=BygUYtcHC1IOlX6moh+kyyRPEQgYoFGQtll23Vkk43w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzKz76rutQjpcGOZLhs8jlC64eb1VsHY5wdUFZJGaoapiz3j8jw5KWXvljFQTqP5lB7BgSD53G6i59L2MfopLOn6YMUMsMIrxKgHXc3R9bbQAOjrDpbF2Ezr+3nTmL5Ut5NlFcGlz5jZzlVU60/OdLyHx4cdHWENp+uwhBqfsWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=1eUyE8cd; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 18FD92E098B3;
	Tue, 25 Mar 2025 20:46:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928378;
	bh=KpxnHdWM8D2D/jh5HMKpqy9RmSSrb7wZeUDfWEFML2Y=; h=From:To:Subject;
	b=1eUyE8cdejY7a9Vu8mX9HP6JmA1BB9OnbmVkiPn/jsmugRIWiOGssFL0/OJmj4gON
	 bWq1erHW4hg0DjgPfsvDnmvOglSgaM4f9dRWegMcSh0zaIERrAaE0Y84El8OTjN1pe
	 CK7U4Zl69CT4GRgMnt6Sf2Jyf2ZABzMSnNI4Eulg=
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
Subject: [PATCH v5 06/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
Date: Tue, 25 Mar 2025 19:45:55 +0100
Message-ID: <20250325184601.10990-7-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292837817.8085.7106803137935381120@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The quirk for selecting whether keyboard backlight should be controlled
by HID or WMI is not needed anymore, so remove it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
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
2.49.0


