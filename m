Return-Path: <linux-input+bounces-4190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252B8FFA53
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 06:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B0511C226C8
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 04:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6571BC43;
	Fri,  7 Jun 2024 04:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="N+vTXTHL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qOvka1fm"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A521B7F4;
	Fri,  7 Jun 2024 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717733148; cv=none; b=iIYJ/bX7eXOrJRTWYjz+GBjQZmxcIaLGPZDcm5ug9RHMNFYgcRM5/umuH/5i12BqfJYVThNQzFiBb47DNbizks57+o8P1L6d41CaIe2x9kBB9TuLr+y0o6sRjf9zge+W2mkTR+IDbguandYlAysfq6D2zetvUoMCaYBw9ngEA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717733148; c=relaxed/simple;
	bh=4wIxBHnC2wRtkZS/h8LSvjbfRd/BaYJ/jMSPZxgfjj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4vF32lED/ws6AzBINiDiME+IECZrSY8nyo5Z7uA9JiXka0bvf90b34zO2Mjlc91YfCrGK5Z7Mbok4cepRSxFiVq00slOTn6jb5ma3KWByfDIEZapN9kGsORiXRWYM1rynqw+rOPXAzPn7+G9rcMvkc3c9vLJiAwE3LLPM7Sy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=N+vTXTHL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qOvka1fm; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 6077C1C000AE;
	Fri,  7 Jun 2024 00:05:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 07 Jun 2024 00:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1717733146; x=
	1717819546; bh=0Jqb3fjiTvPxuNG5jHLrrKkR69WgAYfAmdTxvjI4BQg=; b=N
	+vTXTHLTn2PKent2FE6ruQSKJb89z+K2Zche637zCKyJvbBdlLZVkwySzWEB+MLS
	Zzhdr5e02y4roDDcLZvLMHOEmyPegH7MaEXqkn4UxNDhh/DlYUc6e2XR2ICrpkBN
	ZRF1lV7g6Bek6wGiGHvvRXrjUWulSrWaXmBhAkv5Tnrl12boutdZmU7+glcjsvEa
	jIyHxV0rT431bwOpPZaVniP3SGHDsnbX9wE6gBQCjDKZwOtpz42Uw9h3yPvT6/LV
	Z0cJ3LBf01XauNx6gCF+yyecNm1QX+1cNtu8z3e8kdAbHRs3022TiTLBl9423PMz
	Shrt4uKeBqibmUBcyochQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717733146; x=
	1717819546; bh=0Jqb3fjiTvPxuNG5jHLrrKkR69WgAYfAmdTxvjI4BQg=; b=q
	Ovka1fm9rQQ2yiGwHD6rxy1WYVIGeWOz6hkCJymOQLpDlz+BVL904UImn5IMB/a7
	QxIkF+PsDelIlN3hJXi2pMDpRxvoo3xhdJnBjMFDCY7REEBVKGZSgUJ2E5f6qWkh
	sPCkL2Ea3TDD2Ha8m+fI1Lvhb0Ntxja3SxMZt8S7JxtM/V6oQIUrixU2TqtClNcD
	tW+2ztKSnWswA8Jjzxirn7Q3qXcvW52c6D6Jx5nwdOAmSovsy6plEjdxuLkek8oA
	sKO//EdHgYV+ToiE/I0Us8CqKRjR2MIc3YhgYTqwCm0BhUL1mCdrC2YjhRk8Vb9L
	FcolNu80vSf0bIxxWDICQ==
X-ME-Sender: <xms:GYdiZjkB8ezPhkeEoaqqah6iu56SGWo0dM1IeDyayrp8ijyO3f4-jg>
    <xme:GYdiZm3XOEAE-jh7NuU5RvDDLbK6TdqKZFYPUHOKXgX9mWoNyP8bnE1L8e_mOA_5a
    eU8vHVcig1JcAl31no>
X-ME-Received: <xmr:GYdiZpr_m38a0lGzw2kLaprYAdL8L8rnbqhMYK7ZFRzO9rvWA_gRRuBANQbX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:GYdiZrmc6-_SNa60iD69_io_DVZF3TNbLJP5YVskx7MQawzpbnbhnA>
    <xmx:GYdiZh217_rK3FHvbQfpIosJTfutH6v7Q_F-VKfAEwj7di7UkqzAyg>
    <xmx:GYdiZqvHatLsBUzmPnhB65grWcVOuo00XAzMdR5WNhZAZD2MuJaSZA>
    <xmx:GYdiZlU3HFWJ2O7PITV6CU5ljdTjXQJVLlR8PvCUijSbioiIEUn3WQ>
    <xmx:GodiZsR7O55XPK52FkBH12M4tRRGhHtsYE0xZvRZwJXE5HcVCul3u4df>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 00:05:43 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 1/1] hid-asus: use hid for brightness control on keyboard
Date: Fri,  7 Jun 2024 16:05:32 +1200
Message-ID: <20240607040532.1074379-2-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240607040532.1074379-1-luke@ljones.dev>
References: <20240607040532.1074379-1-luke@ljones.dev>
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
 drivers/hid/hid-asus.c                     |  7 ++++
 drivers/platform/x86/asus-wmi.c            |  3 +-
 include/linux/platform_data/x86/asus-wmi.h | 45 ++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..0ed3708ef7e2 100644
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
index 3eb5cd6773ad..6ba0015e4386 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -4,6 +4,7 @@
 
 #include <linux/errno.h>
 #include <linux/types.h>
+#include <linux/dmi.h>
 
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
@@ -160,4 +161,48 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 }
 #endif
 
+/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
+#if IS_ENABLED(CONFIG_ASUS_WMI)
+bool asus_use_hid_led(void);
+#else
+static inline bool asus_use_hid_led(void)
+{
+	return true;
+}
+#endif
+
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
+			DMI_MATCH(DMI_BOARD_NAME, "GA403"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
+		},
+	},
+	NULL,
+};
+
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.45.1


