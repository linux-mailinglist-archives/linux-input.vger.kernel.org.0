Return-Path: <linux-input+bounces-16240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 85791C734F8
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3BFE347B4E
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5863B326929;
	Thu, 20 Nov 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GGGNhas0"
X-Original-To: linux-input@vger.kernel.org
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9E31ED75;
	Thu, 20 Nov 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632004; cv=none; b=gdXfTYtuBiqiKCiCn+pUhQOijeSaNNeKd7ZdI9fk5j/jbkftAYhSgICgwoNQWoIFu7lCOLEdjKltEs90yXATI+E8Jcp1/8z3PxQdQPFFhulDtXdtmzcR3AS3U33HBZk6np8JpuPu/gQnDuMWHR5tYcSg3KIAIAk+Za5LJlLOy60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632004; c=relaxed/simple;
	bh=PXY8Ijk4LqnDj8rD8OJlFkL+PdzysTHGHHyRHgkerfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T90bW97qbQlrGNGUy6C0Lp7bfMtdRxD+h48FSS7vkuiCfWcnyYDH8IxPcgx/jKEXQKJOiZnA4kDOPHZdbOg5ePQg+cInV17NvPqeWZyrYedUmqRFNWWKG7pYLjPESV0m5Bx8JbxsDlqNyCg10SbwW34LyYWIjiBikH1vkvXZOr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GGGNhas0; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id C10B543ED5;
	Thu, 20 Nov 2025 09:46:33 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id F0D0343F77;
	Thu, 20 Nov 2025 09:46:32 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AB1921FE32D;
	Thu, 20 Nov 2025 11:46:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631992;
	bh=3sfmN9T6gZRv6Jg2Cdddzudl3Go6cKhi4VQLLLakOwo=; h=From:To:Subject;
	b=GGGNhas0KoGYJuDbAQxRDy6ErUZ6NV3Nkot8Ohj2m5zTQbk+FHrDsIod50rkYqlJm
	 +Hb+b7L9Q1ne9wU1DZ7om6zxEwVeHEt7KB5zpO1SGEiqFpGFCInOObk6c9ESQVXLin
	 uo4YPlQoCYtXlJFbwfg+Z1YVGPQI2081Q9YLeZO+uv7WP1CY8lvFasiVnisrydEZwI
	 qTQJg33SSQMhFGZ+JlS6ZCFxf8VQ0d0CN5x+IuP/ByMaggal4maTkciibAdzcbaZMs
	 thlnlKmWm6jm+mmfGO1HgfZT1f2KRKTAUkLmoxW4KmKJbNm2ZQJt/oVLTqSeX6N8D/
	 8MC9SS42+8axA==
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
Subject: [PATCH v9 05/11] HID: asus: move vendor initialization to probe
Date: Thu, 20 Nov 2025 10:46:11 +0100
Message-ID: <20251120094617.11672-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199247.1475103.4032960527034339917@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

ROG NKEY devices have multiple HID endpoints, around 3-4. One of those
endpoints has a usage page of 0xff31, and is the one that emits keyboard
shortcuts and controls RGB/backlight. Currently, this driver places
the usage page check under asus_input_mapping and then inits backlight
in asus_input_configured which is unnecessarily complicated and prevents
probe from performing customizations on the vendor endpoint.

Simplify the logic by introducing an is_vendor variable into probe that
checks for usage page 0xff31. Then, use this variable to move backlight
initialization into probe instead of asus_input_configured, and remove
the backlight check from asus_input_mapping.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 5149dc7edfc5..3047bc54bf2e 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define T100CHI_MOUSE_REPORT_ID 0x06
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
+#define HID_USAGE_PAGE_VENDOR 0xff310000
 #define FEATURE_KBD_REPORT_ID 0x5a
 #define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
@@ -126,7 +127,6 @@ struct asus_drvdata {
 	struct input_dev *tp_kbd_input;
 	struct asus_kbd_leds *kbd_backlight;
 	const struct asus_touchpad_info *tp;
-	bool enable_backlight;
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
 	int battery_capacity;
@@ -317,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -942,11 +942,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 
 	drvdata->input = input;
 
-	if (drvdata->enable_backlight &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
-	    asus_kbd_register_leds(hdev))
-		hid_warn(hdev, "Failed to initialize backlight.\n");
-
 	return 0;
 }
 
@@ -1019,15 +1014,6 @@ static int asus_input_mapping(struct hid_device *hdev,
 			return -1;
 		}
 
-		/*
-		 * Check and enable backlight only on devices with UsagePage ==
-		 * 0xff31 to avoid initializing the keyboard firmware multiple
-		 * times on devices with multiple HID descriptors but same
-		 * PID/VID.
-		 */
-		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
-			drvdata->enable_backlight = true;
-
 		set_bit(EV_REP, hi->input->evbit);
 		return 1;
 	}
@@ -1144,8 +1130,11 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	int ret;
+	struct hid_report_enum *rep_enum;
 	struct asus_drvdata *drvdata;
+	struct hid_report *rep;
+	bool is_vendor = false;
+	int ret;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (drvdata == NULL) {
@@ -1229,12 +1218,24 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	/* Check for vendor for RGB init and handle generic devices properly. */
+	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
+			is_vendor = true;
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
 		return ret;
 	}
 
+	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
+	    !asus_kbd_wmi_led_control_present(hdev) &&
+	    asus_kbd_register_leds(hdev))
+		hid_warn(hdev, "Failed to initialize backlight.\n");
+
 	/*
 	 * Check that input registration succeeded. Checking that
 	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
-- 
2.52.0



