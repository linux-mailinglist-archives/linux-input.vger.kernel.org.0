Return-Path: <linux-input+bounces-10407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF80A4786D
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 09:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE3E1170B67
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AF1227B8E;
	Thu, 27 Feb 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="SLnP7a4s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FfKUGvsM"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A522686F;
	Thu, 27 Feb 2025 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646710; cv=none; b=MIRl7+yRHkHasV5/RVoyH9lJsxYUhEEsxLEuHM6PFkNAiZjUbE+SqfPKXazad4Q6GQScGatAhF2th7ht0zoPqO4gjMfpH3FDrYCwBvQ6mGZ5S7Wb0sxMKrdUpbI4REqZ5Iv9ow0N2kDOorLPdFLgeF+ILN1c4pPsh4+5XgAQnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646710; c=relaxed/simple;
	bh=R7uqgHkyYx7IpDgIReDpNuezyyrdsJ1i5JapRHC3x14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up+RxRDOTiBaRfqu8E99D+4w6O23lrP7p/FRr07AW7HJrv2X93CkuJeh7HdHf9DDiMQw05CYo2ZDCpt0hcE47+HU7133J1nWMTQUykrEd8smQ9MOiQwFTRj6rLvY4/99HoemtAAi9SfQBvKKUN9uNV2aN2tbPECIF82mFwaCP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=SLnP7a4s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FfKUGvsM; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1196F1140B96;
	Thu, 27 Feb 2025 03:58:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 27 Feb 2025 03:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1740646708; x=
	1740733108; bh=H9Njq1CkHKwJjM9f0ORHmZLxNtqSK23Yr85u1HvkVR8=; b=S
	LnP7a4sgQN2AX2khYPucue3FtFHJlxndcxCaAv6p0bYtIuc0pv3pvXPvhFOE91eG
	qwvXLYDLayZYNu2E3p50i5ZDM+zxug40FRH2cwsvP8An7BcbWx0ihHzLzHvgGK4C
	agZ/4pS/OgBMQ3SRS1vmf0FuyqdNJC8EwlsgAuviYFWQ2Gm+1NQ5IU+ZLxQf7s2A
	vxVBi6n1LIjyvwNd+yOGh9CoYNB7Of9u3RZkfqWtHNsZv6fRRYj4CIXZHoNZTfv1
	DiZbaeBpOadDJ7kVAZpUnL3bmXytDuL8z6NXm8tsIsvUErCbGFm4nDOpG1g4Z/5A
	xwsJIUZy4WHqri3xMKprg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1740646708; x=1740733108; bh=H
	9Njq1CkHKwJjM9f0ORHmZLxNtqSK23Yr85u1HvkVR8=; b=FfKUGvsM8mRZLrMt5
	Q3O86ZTi0rDYM0RONo8b5aVt4fGQ9wQ47pIv4/s2RYt5BL5g9GVgCmI8sPE7XlY0
	6ZC+e/MOhBO7gLwVQ1IlMCPAQ/Vh0TyA6aiInN+sJ/2zAsf94+/jLTbALVvDmhGd
	M/5TKTC5RBY9C1xmIWiIU2fuQ16Gd14U5Y6PFy2X192fGd6XWIqe4k76+IfyCTjQ
	S8hS0YhEpjSAmJRS5JPR7sXt2e6ncLsY+PIuU42gMaVSw5+OOKpgxFagKJRm7bmi
	clEZqyPF+vRolD4XI3/8KVYykUV4iBbINlsxLGC9sr878t47LthpvESq6W7ctrDJ
	MJg8A==
X-ME-Sender: <xms:MynAZ2ID1NzglerBc-DtsCmKpCvTpeFsW3ICOCgQo-TlGvFYaX3drg>
    <xme:MynAZ-KYnePu0s5O2-ujM_x2lubDZlEE3_w7zkvsbabRjlDb4CY1fG_rL9FBJsUvK
    6ZpBrOOdeuZGcoGkzk>
X-ME-Received: <xmr:MynAZ2t8LWX7k0ZBxLLKzcH2AtVZ0nfKHpAvU9LYzVdPfUXGwl3hhzvFahhtMmMDf119OXF0B95j44NxJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqe
    enucggtffrrghtthgvrhhnpeeuueelfeefiefhlefhhfehleefffegteeuhfehveekteeu
    udfgteefteelhfeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtohep
    lhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:MynAZ7aHrbNlEVbihY9xKOns_EkTVKALdHQ6lpI3n8pa5T7cCqnuzw>
    <xmx:MynAZ9YQ3JQSN0MVluq_6B6as8ho7Q-AhoICySm1luIZ1oKPAtAvIg>
    <xmx:MynAZ3ALArPBhUZxyFjFgTY1fYP8Hi1AgTOaxctnMnmyS4EtmSSuvA>
    <xmx:MynAZzYQAyzz9pEeA4LXOOBSRsNFuPkRZeoHOjdF1Zta-OgYAf6DSA>
    <xmx:NCnAZ7NVsMPrGqCK1E2zQ_uEjQDs4lRGIZr6rSL3pz2wBVGuu2kj3Xyq>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 03:58:24 -0500 (EST)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v3 1/2] hid-asus: check ROG Ally MCU version and warn
Date: Thu, 27 Feb 2025 21:58:16 +1300
Message-ID: <20250227085817.1007697-2-luke@ljones.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227085817.1007697-1-luke@ljones.dev>
References: <20250227085817.1007697-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

ASUS have fixed suspend issues arising from a flag not being cleared in
the MCU FW in both the ROG Ally 1 and the ROG Ally X.

Implement a check and a warning to encourage users to update the FW to
a minimum supported version.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 107 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 46e3e42f9eb5..599c836507ff 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
+#define ROG_ALLY_REPORT_SIZE 64
+#define ROG_ALLY_X_MIN_MCU 313
+#define ROG_ALLY_MIN_MCU 319
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_MEDION_E1239T		BIT(10)
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
+#define QUIRK_ROG_ALLY_XPAD		BIT(13)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -534,9 +539,99 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/*
+ * We don't care about any other part of the string except the version section.
+ * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
+ * The bytes "5a 05 03 31 00 1a 13" and possibly more come before the version
+ * string, and there may be additional bytes after the version string such as
+ * "75 00 74 00 65 00" or a postfix such as "_T01"
+ */
+static int mcu_parse_version_string(const u8 *response, size_t response_size)
+{
+	const u8 *end = response + response_size;
+	const u8 *p = response;
+	int dots, err, version;
+	char buf[4];
+
+	dots = 0;
+	while (p < end && dots < 2) {
+		if (*p++ == '.')
+			dots++;
+	}
+
+	if (dots != 2 || p >= end || (p + 3) >= end)
+		return -EINVAL;
+
+	memcpy(buf, p, 3);
+	buf[3] = '\0';
+
+	err = kstrtoint(buf, 10, &version);
+	if (err || version < 0)
+		return -EINVAL;
+
+	return version;
+}
+
+static int mcu_request_version(struct hid_device *hdev)
+{
+	u8 *response __free(kfree) = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
+	int ret;
+
+	if (!response)
+		return -ENOMEM;
+
+	ret = asus_kbd_set_report(hdev, request, sizeof(request));
+	if (ret < 0)
+		return ret;
+
+	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
+				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
+				HID_REQ_GET_REPORT);
+	if (ret < 0)
+		return ret;
+
+	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
+	if (ret < 0) {
+		pr_err("Failed to parse MCU version: %d\n", ret);
+		print_hex_dump(KERN_ERR, "MCU: ", DUMP_PREFIX_NONE,
+			      16, 1, response, ROG_ALLY_REPORT_SIZE, false);
+	}
+
+	return ret;
+}
+
+static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
+{
+	int min_version, version;
+
+	version = mcu_request_version(hdev);
+	if (version < 0)
+		return;
+
+	switch (idProduct) {
+	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
+		min_version = ROG_ALLY_MIN_MCU;
+		break;
+	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X:
+		min_version = ROG_ALLY_X_MIN_MCU;
+		break;
+	default:
+		min_version = 0;
+	}
+
+	if (version < min_version) {
+		hid_warn(hdev,
+			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
+			min_version);
+	}
+}
+
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct usb_interface *intf;
+	struct usb_device *udev;
 	unsigned char kbd_func;
 	int ret;
 
@@ -560,6 +655,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 			if (ret < 0)
 				return ret;
 		}
+
+		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
+			intf = to_usb_interface(hdev->dev.parent);
+			udev = interface_to_usbdev(intf);
+			validate_mcu_fw_version(hdev,
+				le16_to_cpu(udev->descriptor.idProduct));
+		}
+
 	} else {
 		/* Initialize keyboard */
 		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
@@ -1280,10 +1383,10 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
 	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },
-- 
2.48.1


