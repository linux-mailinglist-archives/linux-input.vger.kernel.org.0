Return-Path: <linux-input+bounces-5021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAF930458
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 09:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7851C2294E
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F75210EE;
	Sat, 13 Jul 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LsHlN0Zm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="STJ83Btb"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9FB4655D;
	Sat, 13 Jul 2024 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720856882; cv=none; b=UiHdGwHgg+NusKGKCxT7wGNA4choaoYgwU+REWfUKnMKEy4UwNR0ymbl9xQcXkViiwBqrinAknixOnYOYKT/QYmfyQk1LCqYjMdjGiF3BbEPBkIOaKWGOvf4kpNIYyAn/ErzMK1iLd41TueNhaN32FTMu7znNQTCl5UWpjKCpEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720856882; c=relaxed/simple;
	bh=fzE1tqkAitvT9MWEhAFeNMSVpk428YEAujKOqvz1CLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKXQBq7RmlOAgHxUdyGsQunBaey7wrr20I+5cUvFixYjYWV+Mnb5d1EiFbn1m9atIeNYDo58k7WyxckmXsT87+i3TS/MJ2sJ83VYUuP8x4NWgyFmPu0i3JqA5FB0DE9rLxF+qnKYZAa/HOVQOxOvEnar4dVyWAspXWaK7Nb7Mbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LsHlN0Zm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=STJ83Btb; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7EAF31141FFC;
	Sat, 13 Jul 2024 03:47:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 13 Jul 2024 03:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1720856879; x=
	1720943279; bh=9HOzQ+ZFXE7l7J8yGreQf7AnqqrREQApYuFf8vOUgZc=; b=L
	sHlN0ZmukVrdiPtao0dVrvRe9eV451O8mEX/qqzdiw0D2v+k4rmU8c0y+2FhJPqR
	Iif7mdJDyMPtdmUdx0II9uqHON9rh17TNYION23jTp+GOrbJ3jbrlyfivSNBZuCf
	br/1J2CqirverxAItgNWhR5m02lHbt/2pT98Lo58OXs6Y1jDpmLGIk+yKVAL4yfr
	nQJ2HXgVjgqhPQ0Trl1lvksD+8TOgVeYtczi+ZXvIDBXYxH7LJsfBm+UDEsSebuJ
	YhnmHE74kSbE39Rf5wXDWSf5jk1CisApP7PLZOAyjW+wkQNJCCvzofjzagOAGhdc
	75T+ghwU0Ei4NWV2d6FMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720856879; x=
	1720943279; bh=9HOzQ+ZFXE7l7J8yGreQf7AnqqrREQApYuFf8vOUgZc=; b=S
	TJ83BtbBqvQ8R9LAxbKo93gU5Y86rnUYjbPC7bs9Igl9E3+eChJRja4CdscbzatT
	Wby7h8HIhfGoRGvSldYbIZ8fLkE2m0u4KlAE/grS/n/X9ThBauGhfkhYSTaAEcqx
	ZILG5j0c7L+my1DHasy1pNMnmz/6RN2yWZUfO9mH7sJlA54rIBcLsdBy/YJ57u9r
	87LXJfK84HynhVYfxrw5b2qTfD7CnRnDi8QprXM80riHISjydIo+wKv+wJvvAi2B
	/z7Sx+O1x2ONLwBToQK4ebp/ATMePXgFUQhhyNA4/KOcNKx+dajHpbOmZPb5WSWX
	vBs6U82o8QADnyjhDr/Aw==
X-ME-Sender: <xms:LjGSZpTLLgEBSm0UebqMbq6_eBJdvDNOPlp6aGQPlmBpXAaiyppHZQ>
    <xme:LjGSZizCOdhgYo_R8heb_RPOeQKwVtw9aL5zmJ6FZU4FAjyonBPxs6KsD38PhNJSN
    DoBwIgdz0QDQ80FmF8>
X-ME-Received: <xmr:LjGSZu2M-xQ-Cb4Tb9E-i7bgasas62YEVPoHRtrHuGcy3m7hlk35OcF-89X1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeejgdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:LjGSZhBbF6XKaGx8FW13b_DQ_VvEfEM_bnDK_WdDB08LSuww5IKQZw>
    <xmx:LjGSZijqxVUODI3I0YrJeP-vaxqXb1x2_xb5ug-N-bjtrShibUnJAg>
    <xmx:LjGSZlo_a2Pstf5rCTSfbXaMhcXAEc4DuJSZpUWzLE8o7ZnEDWu0Ow>
    <xmx:LjGSZthmKpUXUKxFgJX-OsiwVEVJ_t7C6rFQcHnLNROw5jF80i3MlA>
    <xmx:LzGSZrWKCz4vr2OnIB3Aa46v2Tx0FK0ykRTiaVrlLU8vOqpfJ3dzqJDP>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 03:47:54 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v3 1/1] hid-asus: use hid for brightness control on keyboard
Date: Sat, 13 Jul 2024 19:47:33 +1200
Message-ID: <20240713074733.77334-2-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240713074733.77334-1-luke@ljones.dev>
References: <20240713074733.77334-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On almost all ASUS ROG series laptops the MCU used for the USB keyboard
also has a HID packet used for setting the brightness. This is usually
the same as the WMI method. But in some laptops the WMI method either
is missing or doesn't work, so we should default to the HID control.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c                     |  7 +++++
 drivers/platform/x86/asus-wmi.c            |  3 +-
 include/linux/platform_data/x86/asus-wmi.h | 36 ++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 37e6d25593c2..af57a5f03193 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -492,12 +492,19 @@ static void asus_kbd_backlight_work(struct work_struct *work)
  */
 static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 {
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	u32 value;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ASUS_WMI))
 		return false;
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
+			dmi_check_system(asus_use_hid_led_dmi_ids)) {
+		hid_info(hdev, "using HID for asus::kbd_backlight\n");
+		return false;
+	}
+
 	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
 				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
 	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3f9b6285c9a6..799d928c7d3d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL)) {
+	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
+		pr_info("using asus-wmi for asus::kbd_backlight\n");
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 3eb5cd6773ad..74b32e1d6735 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -4,6 +4,7 @@
 
 #include <linux/errno.h>
 #include <linux/types.h>
+#include <linux/dmi.h>
 
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
@@ -160,4 +161,39 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 }
 #endif
 
+/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
+static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
+		},
+	},
+	{ },
+};
+
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.45.2


