Return-Path: <linux-input+bounces-11115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC4A6CDB4
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 03:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421FF175251
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B1C20010A;
	Sun, 23 Mar 2025 02:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Gfx1Oi1O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2vZqE7VH"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0811FFC6E;
	Sun, 23 Mar 2025 02:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742697279; cv=none; b=NtWLcvfL5lwBZhXTRj0Ebcs16GWvxMcFcdX6qU9r572MfkWmHt/Smc2MCdnVntb2GX+opkm9xqbTQHaUTZOkBwAfd2/6+gJgLNjtT6o3iUwAJuBtZY10CBEL7aaOGd8QE8r4bJpjkQjsiDl+O5i+ZHNBGp92/cBzM8VJEf/R0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742697279; c=relaxed/simple;
	bh=ul0SCM1a1SBOw+pM4ehI3QlVax89fM+x7Ej8MRTtqNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caiCk4kRNgWIhrZAqhcGVv4anNs68ZYJZnl+FkSoQfNYoON0xRo4AAFHRnZdsuu5QqPi4hXhMydtdQkChATuLWRzMISVNwGcq/HBtaR+itJ/ZSS8ktnpTz/kl1uF+vR8x2+SdECQOkq/6uKS61zVm409Y/otk2Iv4CW9Ei43P0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Gfx1Oi1O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2vZqE7VH; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 4FA8911400AD;
	Sat, 22 Mar 2025 22:34:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 22 Mar 2025 22:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1742697276; x=
	1742783676; bh=Y/GhYOg4JqfXJHzGwcRCLvEHQC1zVxrplBNn76M9WLQ=; b=G
	fx1Oi1On46A44bHev1vqPumM/aCZfhLQ/z5eOBYWUYce3LPmUWB6vj7GMfZWLUyM
	8zaUDoWm5B3iJpUfuILu1v8S3G0vzFOiczXnFzyUkIeVFeEGaZT+W8hlOHbv4mG+
	JfCpnJ56AnqkyMNn/wfEifUNvVBwmJQ4LmAOAkb9m3I9xSX/OEIOlJdVZUnDUZfR
	hwqHWjDjy/6l0msUWmM5YDGfi0orCcAxgK50F1PNsWEnLYxndmxzmomzKbAp0dGf
	smZmymWJ94eiNnoi4Qy9DCvfMgN3Hyh7Xub0Gg6ITbiMrjKq4vmqJFGbvExEmC9G
	g10h9gP0nZvxlkyEZxZjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742697276; x=1742783676; bh=Y
	/GhYOg4JqfXJHzGwcRCLvEHQC1zVxrplBNn76M9WLQ=; b=2vZqE7VHrcweGeFAf
	WpuYgQLYpMs+KskMOMz5G8qv8qFBqZygEkmDC6Fvou3k1dGzkmokAqoXwSBt9gTE
	w5Jc6XUt1sdkOkasrpPsAQtp4dblLqyWvy/+tZ6RZgnffKQTAwFU83JQNQQ037PM
	pP1VXE8C285gsuIXziRN60nGK6tbeABojT+961LjZ+usIVlfldmwWwcL2Jx0qzEU
	fwywZMdq8CRtNLnWeF03mEiAI9/3dKrvnU4aNnJlEvCWowFuubuuhcyngqUmd8uo
	uI/07CpmTTgX93wtTNxR7ao4L6XJRIEQdtLa5pM9ifCCbZEVjqEucaADzhoQ69BQ
	HVhxA==
X-ME-Sender: <xms:O3PfZ8pUMBZjA-WRCqLGnWDXHErg_VwZDIvnvd9-qZoKEROZ5quz3g>
    <xme:O3PfZyqy73wsY7d2QQgW4u_k-HbhpqR8PnRpQtbhsydfSuLwFReVv8V9Ib4mIxe_J
    hmj0MQ6F7kkOeVbdos>
X-ME-Received: <xmr:O3PfZxPwOC7EGDceySI8AHKp3NWokuHhQCdKIkr-COyuqJJaUcvgWb7RaWybohy7Ijfn3jTRrBbExkoYmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvh
    eqnecuggftrfgrthhtvghrnhepueeuleeffeeihfelhffhheelfeffgeetuefhheevkeet
    uedugfetfeetlefhieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeei
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuth
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthht
    oheplhhkmhhlsegrnhhthhgvrghsrdguvghv
X-ME-Proxy: <xmx:O3PfZz62VuZtF9RWX2Xuvh9I7mfzoAnBFyOmDI_8VGrcR2TxiWVAZA>
    <xmx:O3PfZ74QE_xjQLj5bF6BE_ng3NLPv_vDFsg-ydSpstmOCBFi-CNclw>
    <xmx:O3PfZzhxNylSG5xfvf3ASSDKIAZ261FKue_vygbKE0AFBw1aS0pH-g>
    <xmx:O3PfZ14Wkb6ElDYjQcgQA4yylyOz-bGJdOX44MCLIaohPAwc4BwzKA>
    <xmx:PHPfZ4HinRq19SCzM9nhOSS-1Vdv7yFnu1SGfSwaCJI5fI1KQMSdpXYY>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 22:34:31 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	lkml@antheas.dev,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 1/2] hid-asus: check ROG Ally MCU version and warn
Date: Sun, 23 Mar 2025 15:34:20 +1300
Message-ID: <20250323023421.78012-2-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250323023421.78012-1-luke@ljones.dev>
References: <20250323023421.78012-1-luke@ljones.dev>
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
2.49.0


