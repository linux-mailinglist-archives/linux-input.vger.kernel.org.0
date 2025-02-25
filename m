Return-Path: <linux-input+bounces-10333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95794A43775
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C5AF1748C9
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C77F267399;
	Tue, 25 Feb 2025 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="hU4J+QEe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XXisPTtr"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BB266F0C;
	Tue, 25 Feb 2025 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740471479; cv=none; b=XVw9l9PwgMXdvwMudov6tmSklWrHe/I7ygGoDbtXql5n0u95+X94G+TNKD3ZjeP5lFuXXijKdF1cqgE4ebMQ+CxnIjiU0Nv/HciF13a1ur2P22YnLzXYrJ+0Ip26c7/impdEG21h3ttmUW7u5bCC5lDrgsLDkCXiUJ4FvAE+OSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740471479; c=relaxed/simple;
	bh=DF0yJCSgWku2Qh+hjwAfly4BrXeaV02IL45lb7rnNFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psS2F3hpUV9oyA7P5fGlRU9DY4+6ZE5Of9QqgJJe//HjVlX3VNCvnhA6J1kJACVKeYPkSUuRUjNsw+M29KptA6urwPgV8sZT/ExGn1TO7B6nP/feFbWSSp8hWUs0fJ/Q3aUmdLy4ke/V6unBsDloZ0sajZp7D0NbYtKBp3iovGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=hU4J+QEe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XXisPTtr; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4AE531140117;
	Tue, 25 Feb 2025 03:17:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 25 Feb 2025 03:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1740471476; x=
	1740557876; bh=PXVJmloJsQF5heTHD5DBkxvBIpoRIMfclHE+NbIcyi4=; b=h
	U4J+QEeoXmvsonRbJ6uSqv968rv0jAC5gOgrXouJ/IkiSYSUIpUihwngHUwo5p/y
	XEFzydeL8+Etoq2hNUg7pMWw1MC0mvRCMe3CWZ8/TON2vrlev9YV9PMonaptHcNh
	R9RojhXcmiGHExZ0Al9fGL4irLaC9yRGfP+8onbiBqJ7g79VOvKa8suBDCxaOLDf
	w6ZBo9lxG12wZMVHaiRGk8qqbA/80E6nR0llzth3G73pCoe8wpuZbA3n4EB2/rlG
	rzqHCJLuWoEiSm9f70o48yHSSXsObJnfB2ZZ9uRSbGFX3OF8hub9JlSOlWvWaubz
	bZtCOolc9ElsDJm6e8dWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1740471476; x=1740557876; bh=P
	XVJmloJsQF5heTHD5DBkxvBIpoRIMfclHE+NbIcyi4=; b=XXisPTtrlafiCJlTo
	9KSxzGYUkrTBPJz/JY1ruo3VhKT3uFBoUM8MYVkTvsxGvBd6uzer8+W2bXkSi9b4
	D7v26o9EnKvrZgwuR+NzgJyl/i6nra6UxsBTcr1zAFpcIriHXGCVdXNkrj3+g91W
	DFeDC3dTI+We+FWi2Bra8zgXL71ODCuypFZ0WYfQmhleQIRutR/bg2+gPOtzm2xx
	8nhBi4kocPe2fjFOxeiKQmyWku5//MJ7YGN3mKRZ4RYTEAKq8Rb00b4jIVm55RJh
	Oo2IUKKYCbAD+yKeXcng/hVjca8cbizoyGRz6vJeqln8AdAdgGku5N/kO6+kJm2B
	BqnDQ==
X-ME-Sender: <xms:s3y9Z5Q-l-Th_YxQdtxSWYYyYGXISztp8iyqWtF6qJbkB9GyZtjosQ>
    <xme:s3y9Zyy5BIdBMjijDmmrRZnirFHQK8TQEIzmipXd2J2UhKcA7eyBQMcNFg4U9Mzfy
    xFJ8YLyFiA13hiHxRM>
X-ME-Received: <xmr:s3y9Z-23UI_9WMlaNgACUL1B5rs1y8loC_CIJ6puItXGvg4PfTjTpdIP-sYk2-y1dkfNHqY85fEOhZ7BAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqe
    enucggtffrrghtthgvrhhnpeeuueelfeefiefhlefhhfehleefffegteeuhfehveekteeu
    udfgteefteelhfeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:s3y9ZxCq_OONkGLRHT0Nz0Jds0xCZ6QFJ4W5UuyT77l9vvAI6F9jeQ>
    <xmx:s3y9ZyiNYvYD4Le_tbOfYGR1AHZlUvi_sgeV4Y7ZpvSp88UBLespfw>
    <xmx:s3y9Z1qmjsSEdo5Cg_ZYqZRe0R_IeUZVfecyA8uFgLdmIBooOj0dpg>
    <xmx:s3y9Z9hBx7Ol71mJT9IISYmiJ3npClrNgaop19dLMdaLJGy_c4BYEw>
    <xmx:tHy9Z2jm_qtYS3kVSvU_0q2BIoZYLei2xmn_xePTP30Cm7rdZKuQY2w->
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 03:17:52 -0500 (EST)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 1/2] hid-asus: check ROG Ally MCU version and warn
Date: Tue, 25 Feb 2025 21:17:43 +1300
Message-ID: <20250225081744.92841-2-luke@ljones.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225081744.92841-1-luke@ljones.dev>
References: <20250225081744.92841-1-luke@ljones.dev>
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
 drivers/hid/hid-asus.c | 97 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 46e3e42f9eb5..e1e60b80115a 100644
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
@@ -534,9 +539,89 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
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
+	int min_version = ROG_ALLY_X_MIN_MCU;
+	int version;
+
+	version = mcu_request_version(hdev);
+	if (version < 0)
+		return;
+
+	if (idProduct == USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY)
+		min_version = ROG_ALLY_MIN_MCU;
+
+	hid_info(hdev, "Ally device MCU version: %d\n", version);
+	if (version < min_version) {
+		hid_warn(hdev,
+			 "The MCU firmware version must be %d or greater\n"
+			 "Please update your MCU with official ASUS firmware release\n",
+			 min_version);
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
 
@@ -560,6 +645,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
@@ -1280,10 +1373,10 @@ static const struct hid_device_id asus_devices[] = {
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


