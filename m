Return-Path: <linux-input+bounces-10383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD4A451D5
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 02:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E4F178CCD
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD0A178372;
	Wed, 26 Feb 2025 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="exI6T7PU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="4IEKUnUc"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2215852F;
	Wed, 26 Feb 2025 01:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531703; cv=none; b=g5z4pAXDZffQcAd6BGRNQD2pzFNdW9/7vW2Kh4dVJHWZgsRraojWH+eLoR4yUxWLgN7MvOVvN6sld/YUxI4Rrlf51U8Wl0egtP0QnNq/CXdJd7J0ne/p8zH7CFfAdKLGx3odmrjl7zcAThxJ0y4LmF6rD5BkFPyy6nLXb308fYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531703; c=relaxed/simple;
	bh=ox/VZcRuAzEOJXZPMBFSX+2qc1sdqLG2uhwib47Lj8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsxYPBMbV7FRa+sTtybe77MXLOShqtP16puJbtIL4Iw+vpX2feuDb+udT0e7UBu9ezGMDN6BNO3tbnaAy/9Tdhl8x6FUcJGVBnahwis2Yx+XmwSG0BCELSfoV1BDgjxYUUacyrUpWBu58UHo07/Ss0DEAXcliTxJPfeXEPYR3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=exI6T7PU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=4IEKUnUc; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id F1CCF1380991;
	Tue, 25 Feb 2025 20:01:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 25 Feb 2025 20:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1740531700; x=
	1740618100; bh=GOtW9HY7i8D64FY67E4Xds6336gx5vZndnY0hm/ZMoQ=; b=e
	xI6T7PUi5GgQqVoCZpTX+G9011een4V/3MS9FR3Iwa8KOZ/qxPkIss8SoovH6pkB
	1V/IKdM51z8Di+5mQpisETLsRYs8jVXPqsjlU9wWr/ERB8aEP5xQWdROcNqPc+m6
	YStDLLJyG7PZHdxf2rS8DpVExM0LTrJXi8z03MMPCdupTfAce94IQ1P8yJlgWHoQ
	9MimFeYW5/Bpr6WSBguvBQ47vlIVJ81OpiA0MV0KMX4jHXhFE+l3wfEylNxSc5/i
	B33Lb43ypPFE9B4j35piPhGwZktH62U7OpAeRUzISSyLxKVSktnCzavbNSRPhTTM
	mDPKAS5pfCcbuI/2TqkIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1740531700; x=1740618100; bh=G
	OtW9HY7i8D64FY67E4Xds6336gx5vZndnY0hm/ZMoQ=; b=4IEKUnUcxl9qlo2BO
	V6I9psT/7RKMC/D73CkltV96hpDS/WNsYootyC2DV7Kvs53H9zJPx5bfu3KpX49x
	e3eR+jeb4ReF+tNrpC5fCa61jl+KETmhtkn4Y1VKIrp6kxaXhnR8oycMhhbCdtsT
	Y/9s8OuqSuJMBprvWjigSUjy17XvLYFN9vTlkg/dRpaKdG+x3vbHdzlCCXTNUvqy
	4RVaQAzWyiEpAWT2E4k+RT6lBR9bMzDRcjcxwbDzltykcQbLL3Mq7MxeR4My9UgR
	HFz2I+Dkk/o7pD09BtHQ7S8AQlXxGXJITEsWZ6L6ysZLT+3qCilEleVzomnblAm6
	Z9xUA==
X-ME-Sender: <xms:9Ge-Z9WMkFWjeBkZszVu-zraFNnLcAUOjqi30xyH34pmH-AMNJjaCw>
    <xme:9Ge-Z9lwZR8itwFVKxD8qjDTu3ZZVwi_UBUdb3mgrxbKyzYPMiG-1kXzrg-Pt10pB
    Hptqx3GOUdpYLWCXdE>
X-ME-Received: <xmr:9Ge-Z5ZaAK_soOZc36VF8hGBmJsyBocwAea9b319UeDMaZJu-BI29JpB6dkPSG5Fe-vZ_aIN1iK1FdoYcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:9Ge-ZwXCtK9h1mVAWd_aa9FoOip__GQhlfUE2f3a9V2q8SSNTTkhQQ>
    <xmx:9Ge-Z3neJqWvSbvgBhmYhxNFi_YJ6RPtHWdP3YQdCSQPOhnOb54LoA>
    <xmx:9Ge-Z9cL4MOf-Ylh_dk4YXiDj7gixSbXP5lI0-RJbDNGFMN3DTMhCA>
    <xmx:9Ge-ZxHG2X88y6mKFqG6EH7mmpNTTSDhFtUsv1eGvkYByMIiO9TmhQ>
    <xmx:9Ge-Z54Uc_MCBmMWwls69Uv_Nq9gQ2clCm7NtvFnNxCg3YJDZ0JPwEWn>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 20:01:37 -0500 (EST)
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
Subject: [PATCH v2 1/2] hid-asus: check ROG Ally MCU version and warn
Date: Wed, 26 Feb 2025 14:01:28 +1300
Message-ID: <20250226010129.32043-2-luke@ljones.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226010129.32043-1-luke@ljones.dev>
References: <20250226010129.32043-1-luke@ljones.dev>
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
 drivers/hid/hid-asus.c | 103 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 46e3e42f9eb5..3cec622b6e68 100644
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
@@ -534,9 +539,95 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/*
+ * We don't care about any other part of the string except the version section.
+ * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
+ */
+static int mcu_parse_version_string(const u8 *response, size_t response_size)
+{
+	const u8 *end = response + response_size;
+	const u8 *p = response;
+	int dots, err;
+	long version;
+
+	dots = 0;
+	while (p < end && dots < 2) {
+		if (*p++ == '.')
+			dots++;
+	}
+
+	if (dots != 2 || p >= end)
+		return -EINVAL;
+
+	err = kstrtol((const char *)p, 10, &version);
+	if (err || version < 0)
+		return -EINVAL;
+
+	return version;
+}
+
+static int mcu_request_version(struct hid_device *hdev)
+{
+	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
+	u8 *response;
+	int ret;
+
+	response = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!response)
+		return -ENOMEM;
+
+	ret = asus_kbd_set_report(hdev, request, sizeof(request));
+	if (ret < 0)
+		goto out;
+
+	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
+				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
+				HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto out;
+
+	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
+
+out:
+	if (ret < 0)
+		hid_err(hdev, "Failed to get MCU version: %d, response: %*ph\n",
+					ret, ROG_ALLY_REPORT_SIZE, response);
+	kfree(response);
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
+	hid_info(hdev, "Ally device MCU version: %d\n", version);
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
 
@@ -560,6 +651,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
@@ -1280,10 +1379,10 @@ static const struct hid_device_id asus_devices[] = {
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


