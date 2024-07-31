Return-Path: <linux-input+bounces-5248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B569433A3
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 17:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBDF1C23760
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 15:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3800E1BC080;
	Wed, 31 Jul 2024 15:47:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CF1AD9FE;
	Wed, 31 Jul 2024 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440844; cv=none; b=UsAJ6WlLGZSkbj+6jQJPvpZm+qvzdCtoB1LmMsI8c34M5QeW+t/IAHI/pyNOlpMC1a8xfGb12sfowx0mA0rnUj1XmE+Eyw03JlJ84ZTn5b4pOMdmxeiqp7o1jIyw8VzdTTztnZ8X4ZDcKzSf5iuiYggGthY3E50Mj/8+Rp4M6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440844; c=relaxed/simple;
	bh=5L1ZkQfvJW4Hc+i4AwixrEEeoVmD/+4IFHxXjZYWleA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtaVXz4zdR36YyJebcB/2eM67FCEKqugksc0onylqb5uXrS6hNtb/z71vZkwkMMhrqlEPMPeTZRJx34hYv6k2uwQOaPun48rzUYXlppNbxVZhZzMt97ncT3YfOtGtvGbIMmcHgf56KzpxbQDiVEqsP6cK6X/povyt3/Cb0Mf8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz15t1722440796txjpre
X-QQ-Originating-IP: /bxfH/qQrJqd6hIR3sDVK/BqB8lbEXBQYWnbAIq4p6o=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 31 Jul 2024 23:46:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11460382544041475410
From: WangYuli <wangyuli@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Terry Wong <terry.wong2@yahoo.com>,
	Craig Cabrey <craigcabrey@gmail.com>,
	Dmitry Savin <envelsavinds@gmail.com>,
	Lugang He <helugang@uniontech.com>
Subject: [PATCH v2] HID: multitouch: Add report_fixup for Goodix GT7868Q touchpad
Date: Wed, 31 Jul 2024 23:46:19 +0800
Message-ID: <801C5D6FCE55F473+20240731154619.514470-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Goodix GT7868Q has incorrect data in the report and needs
a fixup.

The device is a haptic touchpad used on
Lenovo ThinkBook 13x Gen 4 series of laptops and have
incorrect descriptor that hid-parse fails to parse hence
device is not working.

Link: https://github.com/ty2/goodix-gt7868q-linux-driver.git
Signed-off-by: Terry Wong <terry.wong2@yahoo.com>
Signed-off-by: Craig Cabrey <craigcabrey@gmail.com>
Signed-off-by: Dmitry Savin <envelsavinds@gmail.com>
Link: https://lore.kernel.org/linux-input/20240716222757.22931-1-envelsavinds@gmail.com/T/#mc7922671337acc84c69d367074ce341db5a819dc
Suggested-by: Lugang He <helugang@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/hid-ids.h        |  2 ++
 drivers/hid/hid-multitouch.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7ce1b..eebfca375bcd 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -520,6 +520,8 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
 #define I2C_VENDOR_ID_GOODIX		0x27c6
+#define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
+#define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
 #define USB_VENDOR_ID_GOODTOUCH		0x1aad
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841f24..99812c0f830b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1441,6 +1441,30 @@ static int mt_event(struct hid_device *hid, struct hid_field *field,
 	return 0;
 }
 
+static __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+			     unsigned int *size)
+{
+	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
+	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
+	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
+		if (rdesc[607] == 0x15) {
+			rdesc[607] = 0x25;
+			dev_info(
+				&hdev->dev,
+				"GT7868Q report descriptor fixup is applied.\n");
+		} else {
+			dev_info(
+				&hdev->dev,
+				"The byte is not expected for fixing the report descriptor. \
+It's possible that the touchpad firmware is not suitable for applying the fix. \
+got: %x\n",
+				rdesc[607]);
+		}
+	}
+
+	return rdesc;
+}
+
 static void mt_report(struct hid_device *hid, struct hid_report *report)
 {
 	struct mt_device *td = hid_get_drvdata(hid);
@@ -2035,6 +2059,14 @@ static const struct hid_device_id mt_devices[] = {
 		MT_BT_DEVICE(USB_VENDOR_ID_FRUCTEL,
 			USB_DEVICE_ID_GAMETEL_MT_MODE) },
 
+	/* Goodix GT7868Q devices */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
+		     I2C_DEVICE_ID_GOODIX_01E8) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
+		     I2C_DEVICE_ID_GOODIX_01E8) },
+
 	/* GoodTouch panels */
 	{ .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_GOODTOUCH,
@@ -2270,6 +2302,7 @@ static struct hid_driver mt_driver = {
 	.feature_mapping = mt_feature_mapping,
 	.usage_table = mt_grabbed_usages,
 	.event = mt_event,
+	.report_fixup = mt_report_fixup,
 	.report = mt_report,
 	.suspend = pm_ptr(mt_suspend),
 	.reset_resume = pm_ptr(mt_reset_resume),
-- 
2.43.4


