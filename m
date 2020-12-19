Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A5C2DED74
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgLSGYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgLSGYX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:24:23 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F71C061282
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:42 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id iq13so2531758pjb.3
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRLkSYRvko/RAr2XdFUWCWeKkqHgymygaQPYWzt1t1I=;
        b=t6dMSQOcQ2FvhILZpmaPcxyXkVVikY0W9uWj2OVryJHM9MaGr6rHZgWCYSQwdFh0hX
         te2I0VO4G1wfR/fabCP096QMEZAudUczFZzdGep1E3W/Hc3GV7c/kg9ck0jUpTBDrNDt
         icBvqIktejKuz+1tPYwDASe6NmkQZq8LOjUkaLk7qIDOF+9OrFVmnU8RIfLa8nM4W617
         THc4YkdvoXiRMTb2YJDQKaPfP/oLu8vYEWZqKHkp8WoF4521bKWM10/rZwXelQrgmpsT
         7IJ+ssKl/FIocn+HKYTFxW6dvXyhXPqpohTPiBBRkg5b45Mcer0bsphpADD9Je+3yucJ
         wrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRLkSYRvko/RAr2XdFUWCWeKkqHgymygaQPYWzt1t1I=;
        b=n8kgK4b5lr7dAgw6MOea5h84EozZZW5yVqBDfBIwY12Ewv+jKWB1S98jZJbB9YCIbh
         6FKVDWm2FsQ5cNd8w9uh8t7LrEKC9ylTmTtTLCJRS7Upw7eH6YKVn9zM+zurBxA411Yg
         m14u13K5wdLumsv9gCnDHzgLijmYX64CJ0xBAx4zhFeTePXbFlEQyJp4CRRpwx6Mh5ff
         AC1dqlv2Oj18KZqx/lqaNlLCgsFE33pLUWtUeKM2fRzYToQpFSPnr8UKUMdR6J0mDd4R
         rJ7xg5I5SzkH0NxWLAyBeAAZXv3Kps+fAv84L+6/fN7bVTJkxfEuw7KfcCT6cnv+Kw96
         W0EQ==
X-Gm-Message-State: AOAM532mbzeuml0kwZuRqII/cZx2w5enXI/rWHDIhQ5FfHzBkkCXjPlF
        ck5qV2V6A/l+7LfZ4WNgh4xdHw==
X-Google-Smtp-Source: ABdhPJzQKRX7wlaDcStpVYF9U3q33FjnUdYFAXuRdy4TAQPgXoTppsDQb4Ug9PQLorgi0wAy1j7gDg==
X-Received: by 2002:a17:902:bc49:b029:db:eb10:c5a1 with SMTP id t9-20020a170902bc49b02900dbeb10c5a1mr7424539plz.11.1608359022514;
        Fri, 18 Dec 2020 22:23:42 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:42 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Date:   Fri, 18 Dec 2020 22:23:25 -0800
Message-Id: <20201219062336.72568-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Use the DualSense MAC address as a unique identifier for the HID device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 8dbd0ae7e082..88823a7ba1a0 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -17,12 +17,16 @@
 /* Base class for playstation devices. */
 struct ps_device {
 	struct hid_device *hdev;
+	uint8_t mac_address[6];
 
 	int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
 };
 
 #define DS_INPUT_REPORT_USB			0x01
 
+#define DS_FEATURE_REPORT_PAIRING_INFO		9
+#define DS_FEATURE_REPORT_PAIRING_INFO_SIZE	19
+
 /* Button masks for DualSense input report. */
 #define DS_BUTTONS0_HAT_SWITCH	GENMASK(3, 0)
 #define DS_BUTTONS0_SQUARE	BIT(4)
@@ -127,6 +131,7 @@ static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const ch
 	return input_dev;
 }
 
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -157,6 +162,29 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static int dualsense_get_mac_address(struct dualsense *ds)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
+			DS_FEATURE_REPORT_PAIRING_INFO_SIZE, HID_FEATURE_REPORT,
+			HID_REQ_GET_REPORT);
+	if (ret < 0)
+		goto err_free;
+
+	/* Note MAC address is stored in little endian order. */
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
@@ -225,6 +253,13 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	ds->base.parse_report = dualsense_parse_report;
 	hid_set_drvdata(hdev, ds);
 
+	ret = dualsense_get_mac_address(ds);
+	if (ret < 0) {
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

