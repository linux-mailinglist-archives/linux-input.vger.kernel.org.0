Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E0A307C7C
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhA1RaV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbhA1R1r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:47 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0732EC061797
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:07 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id h15so3709221pli.8
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=GPAutzwo62/7+PRgCGAPiZv7jPvo2CH+j0S398ylF6iVY98bjPzXGXXKcW7so+CWVd
         ienlnc3zL4iNRLb8HHO5eaXX4JsM01W36qgO9OF3nBpxnO57OuUtZIeM5/MyoS95Qepk
         Qg6sz0+StkaDV0KLKN9H39zm21jTZmL1oI7jPLJwtg1fgEYELMX/WxGL2wgXaBW4KCMy
         Ce4KwydqTNF8WkDfiwsjHtAnkzJBc675tiZNCoc9ocJSQ9BlEqTaW4XiAOxRvDpus1F8
         j9ok7cN5USvAcb2isFxLxxKGnlF15sN/1Auq6VRK0U7n0iaUzM/91GzwE7pQ8uwRiYMO
         saZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8tDfgF4yjcWQcgWJ7Sr76cZF+mLnOj0iP8FJiIQgK3A=;
        b=ZFmQh9SScDqbsyRZ7NlOiK6Xyqg8w97KH1B2e9SzGYuvOCJSwirBc7BX9T5SQhoYFv
         tc8VKwu0ay5S4Y5enmV3qYuzHhbfkYzaH23fI8E0QhU1dXZbx0M40QFHwVAXZ4M9e9in
         2fpgJhy1iu3l4t9b9LwN2C0WjJ0qXla2VEfeDUt8op5FjiunlA+GkkVwWW45wJedJFpU
         TAfFz/G+xhTLxN4QTBlhd5XHKl86unWtjQLSsQ7bNQJy9+XjpQpZ+1rIefUF2FNC/utu
         ed8y9g+tEUdQF5oex1WipR/0HHzXzVMpJuV/Ey4sggexduF6bKaz8CnHbWS3asQXxUsg
         okbQ==
X-Gm-Message-State: AOAM531giz7bbUy/nqnS4ke9m5nZZHHcpcBGy5W/Ys79n6W6MDaVXyz6
        1ntNYL3frlBBpjcRWrRbZAtuQQ==
X-Google-Smtp-Source: ABdhPJy3R8aTVjhjyTGcIYIXpsSDMwuYC0Qmcjhngwfx46wP/DZX7IM9bJDaKM6QdnLXhPGNGV9p9g==
X-Received: by 2002:a17:902:ea8d:b029:e1:c81:3d23 with SMTP id x13-20020a170902ea8db02900e10c813d23mr320328plb.47.1611854826630;
        Thu, 28 Jan 2021 09:27:06 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:06 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Thu, 28 Jan 2021 09:26:46 -0800
Message-Id: <20210128172657.24516-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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

