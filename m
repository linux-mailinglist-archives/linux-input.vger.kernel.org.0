Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755AB2F9615
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730615AbhAQXLY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730607AbhAQXKn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:10:43 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8181DC061574
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:03 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i63so2037778pfg.7
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=UzQlXgZaf6smOZ0m4KfwNataLuBmasNDuj+pmmOqkCLdYOEFqDFLDzx/KR1tnoxIsI
         lskIKH/isLrcTWoXUEiAuktP4/9QKXLbVdnMxACKA74ASHn++ZMEeHsgJKYJB/hsN2eg
         AXLmRdYKMSCF6PHeiy3NhSHJCVmOwYqcGYyHnllEs/HUhCxSVLTka5KQQxTHBCwZTwMu
         oD1aonjV9md/Gc2NGBkH9qwdjc448mazTE5KnPdEI7bWa2JiO3JI3t2Q5MOsBC4BTiAY
         JBDVuQbDRE8Zbl/qfJkUKQdPw/WLswKzMaN7cjBnYHbv/4PFHt/MVAG/fGNXi1X9VPq4
         eo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=JdFFG8X42itUEoA2BtyVSdg0t0zlxafCMtTJCiiiL33PojO+IpkkwiPiNbHD4gy/Hz
         yFEpM5oOBrvo+dMGIn23UMS+an1X/3aNLzHJgRCEUs16m3zLglgCUCdxRkIgTTrNJRw5
         ppISuLIt3P3kPc6Yej3dWICiImrgGPNDrDtBZq2bpHEGaDzYCdvt/xQppyRR/ZIu4f63
         yspLC8TKAnRCXjMM+QYFb0eFvs+jh+D9A0wdKgYPFN0w30qL8XGa3bHeybJ3JCDKI4kn
         iNaAFlD33SG3WkYpfcpfMd2IC9vDcLvdf3VYDYo5NNZtJXHHaoV+0gBqueNfAnN9Nnh+
         9bdA==
X-Gm-Message-State: AOAM531YQAgYy+LsgpeiMgrzylo3y45wXobtiPGxqUIOK4gYkWXflYNq
        YFR01k86Z1yEzUoAi6b/l5crGSu73jTlKw==
X-Google-Smtp-Source: ABdhPJzCOr6Qch4RUOS5t3RLuIeHiqj8Q6odgP9jIGdWPV5TGWwYQHcBfjMrG2z6NvxneEFU7uW16A==
X-Received: by 2002:a62:c301:0:b029:1b6:74fb:696e with SMTP id v1-20020a62c3010000b02901b674fb696emr5920104pfg.59.1610925003088;
        Sun, 17 Jan 2021 15:10:03 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:02 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 02/12] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Sun, 17 Jan 2021 15:09:46 -0800
Message-Id: <20210117230956.173031-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Use the DualSense MAC address as a unique identifier for the HID device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 46d5f5b3b0dd..2f24039dedbe 100644
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
@@ -166,6 +170,52 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size)
+{
+	int ret;
+
+	ret = hid_hw_raw_request(hdev, report_id, buf, size, HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
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
+		hid_err(hdev, "Incorrect reportID received, expected %d got %d\n", report_id, buf[0]);
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
@@ -237,6 +287,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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

