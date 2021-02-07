Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243CC3127A2
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhBGVt5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBGVt4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:49:56 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018FEC061786
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:16 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id r38so8949133pgk.13
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eo5PpXmuhOqJQes14kJibQrKqKs7EZV7Rp6IbsTqi4Q=;
        b=Vg8k8iwE/Q4uCd5Em/ysbAfS1Hd6+8k/7f0avzopPNzKSZtmeXQ7NJqBF5SMzZbM+9
         kj9ZcC2TvxOX1v26TPN8lP8v3/3nyw4ugQNK1g8PqknB17LJb+wqEkd13wmEbEwfUNQa
         +dkS21e+tS4ccmb/C72GL9XKIrsVHUmZWpkyfXJqbiAQb0FxZkFRURbW7V2b8MxgWLfN
         K8CRKtHirSizBci4CBt/suz/pT54OiwGdmMVpgU0clUlHN22YFPvM/9LWmHU4d1l7cEk
         fAVfnzzQ3JFMppODpXX0vAaXkp9T29sMkSRzQzt1mpHbFjeHuU61WqyC3aVW7REfXmNn
         qXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eo5PpXmuhOqJQes14kJibQrKqKs7EZV7Rp6IbsTqi4Q=;
        b=Yg20q+ZviSN3H7ml+pi62WiCfx4G5zJnvH1pBL9lV1X+HHKYxtR4+f6mo+Q6cd0bKX
         JEUrUbUsVUhbeAD2cSZ/bVFyaFvnDMGmUmLx+lJiwbAFFtyLsbkCCuoBqSQ/De2JBOk0
         Ju91XZkSFtN4DGtin2KDN+PP0CB6t4JaKXS6KmFE8tBNFC3XupXAVcrYvLFRJovS8oAW
         A5hsB5h2Ovw2e0jsTj1JGP02PtLqUjjysvJwCuompKqLijYylbfnNz7dHmnrTVCpTAmw
         ULyKVqr5p2RvqMqz+y35u8ULPVwrbHC99HrNG538IXEKInsAMu0Pjcqx1WQSb64AMg2l
         KDfw==
X-Gm-Message-State: AOAM533Y57B+v62QfzDT/vsrJslQy0IJIwEnHm/g85LixtOeB2ZB8H7w
        e3Wxf4s60V61cfv6WlYBahi5iQ==
X-Google-Smtp-Source: ABdhPJw3+dpKVezC7Zq1YjFolcF4zAOFPOObcISl+rnax1ofmfBbDup1Tf/r+bB9uwEFovj8KrfPdQ==
X-Received: by 2002:a63:cd08:: with SMTP id i8mr14294686pgg.425.1612734555595;
        Sun, 07 Feb 2021 13:49:15 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:15 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Sun,  7 Feb 2021 13:48:57 -0800
Message-Id: <20210207214908.79573-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
References: <20210207214908.79573-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Use the DualSense MAC address as a unique identifier for the HID device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 7d4171a89322..aca49637ef2f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -20,6 +20,7 @@
 /* Base class for playstation devices. */
 struct ps_device {
 	struct hid_device *hdev;
+	uint8_t mac_address[6]; /* Note: stored in little endian order. */
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
@@ -27,6 +28,9 @@ struct ps_device {
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_USB_SIZE		64
 
+#define DS_FEATURE_REPORT_PAIRING_INFO		0x09
+#define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	20
+
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
 #define DS_BUTTONS0_SQUARE	BIT(4)
@@ -166,6 +170,53 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size)
+{
+	int ret;
+
+	ret = hid_hw_raw_request(hdev, report_id, buf, size, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to retrieve feature with reportID %d: %d\n", report_id, ret);
+		return ret;
+	}
+
+	if (ret != size) {
+		hid_err(hdev, "Invalid byte count transferred, expected %zu got %d\n", size, ret);
+		return -EINVAL;
+	}
+
+	if (buf[0] != report_id) {
+		hid_err(hdev, "Invalid reportID received, expected %d got %d\n", report_id, buf[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dualsense_get_mac_address(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
+			DS_FEATURE_REPORT_PAIRING_INFO_SIZE);
+	if (ret) {
+		hid_err(ds->base.hdev, "Failed to retrieve DualSense pairing info: %d\n", ret);
+		goto err_free;
+	}
+
+	memcpy(ds->base.mac_address, &buf[1], sizeof(ds->base.mac_address));
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
 		u8 *data, int size)
 {
@@ -237,6 +288,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ds->base.parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
+	ret = dualsense_get_mac_address(ds);
+	if (ret) {
+		hid_err(hdev, "Failed to get MAC address from DualSense\n");
+		return ERR_PTR(ret);
+	}
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
+
 	ds->gamepad = ps_gamepad_create(hdev);
 	if (IS_ERR(ds->gamepad)) {
 		ret = PTR_ERR(ds->gamepad);
-- 
2.26.2

