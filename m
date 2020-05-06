Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3986F1C6C38
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 10:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgEFIu1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 04:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgEFIu0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 May 2020 04:50:26 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFCEC061A0F;
        Wed,  6 May 2020 01:50:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so532687pjh.2;
        Wed, 06 May 2020 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=74T2RVJT6SWqKfiQxGQJfnOgzEu5gqmZKqNFsFFvii0=;
        b=b88x7hlyL0upQ9DZdMRABuIhFHAa/r82zxyma/PdlgvYgx+WypCEVHg8eMu2Wq/yTa
         KV3DqgcgHV4CrQGNIqjQDUCZA1oAb9wPqQFLRNzliBZvO5EZ3UqNMAHZOi2iPIOZKGzi
         BqbTGIh6OOQpZe6ZqPBA1ETI8h4iENk2ZyxZQrIAv8F8K1g2ga9np59YqadhEkSyz4KJ
         ZYwwYdj7xAY/T9ytC1hWZ54rNdOvyuHOaMYCfyl8KbusYg689Ov8NfxZc7IzY9SyxXQu
         LrONV0H5zvdiWcSSMnK1ccnIuuj6hitAJDRngmLMwTRXWAn0QGQD1P9vUyUqrmn890nN
         d0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=74T2RVJT6SWqKfiQxGQJfnOgzEu5gqmZKqNFsFFvii0=;
        b=kAE+dkSjCCEtV0yy3CsaBozyN5eJN6j6lAQKZ8CpSqkBUp1UVFfw261D0OVCj1VxGh
         0MneFURvCnaNemuPZrWc923oDtt11Q7LILFiM9bP12s0qdqHjpDy472XqzAtI7zALy3n
         4yl39M3IhxRJmK8ohnSmt07jdPu75nFHltz20BokpWmzNn27wUBx+BLXrjOOsfynOL7N
         aUdr81wwgt3wqWn49d0sTt2njLDHnPAz2D8zvVhds++u5cuoqM+RruBrJz5YUPy26VlJ
         ReAtsOhwuIP3XJuxPKVcCqkld/h9F54yBU/n4n/2X7lykMItO1j6hkK3Hvm1jjxPZSNg
         3S1Q==
X-Gm-Message-State: AGi0Puar+RCaRVgsURCMP9uDs4IOz5Mqu73goOOLad3jBuzD+MycG9xQ
        mF3npbg/2sEDMjIU5xoUIus=
X-Google-Smtp-Source: APiQypIupXJc+D27+LTqPTue9AQvuEyGWKV/x+jpuf6WxSkgbOx28wOvBWHXIBg1Sh62y10uxVrb+Q==
X-Received: by 2002:a17:902:227:: with SMTP id 36mr421212plc.118.1588755025183;
        Wed, 06 May 2020 01:50:25 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8820:12dd:4dfa:29:6edd:5551])
        by smtp.gmail.com with ESMTPSA id 141sm1203595pfz.171.2020.05.06.01.50.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 01:50:24 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: [PATCH] Input: elants_i2c: Provide an attribute to show calibration count
Date:   Wed,  6 May 2020 16:48:52 +0800
Message-Id: <1588754932-5902-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Johnny Chuang <johnny.chuang@emc.com.tw>

There is an non-touch case by non-calibration after update firmware.
Elan could know calibrate or not by calibration count.
The value of '0xffff' means we didn't calibrate after update firmware.
If calibrate success, it will plus one and change to '0x0000'.

Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
---
 drivers/input/touchscreen/elants_i2c.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 14c577c..1c8e1bd 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -87,6 +87,7 @@
 /* FW read command, 0x53 0x?? 0x0, 0x01 */
 #define E_ELAN_INFO_FW_VER	0x00
 #define E_ELAN_INFO_BC_VER	0x10
+#define E_ELAN_INFO_REK		0xE0
 #define E_ELAN_INFO_TEST_VER	0xE0
 #define E_ELAN_INFO_FW_ID	0xF0
 #define E_INFO_OSR		0xD6
@@ -1056,8 +1057,32 @@ static ssize_t show_iap_mode(struct device *dev,
 				"Normal" : "Recovery");
 }
 
+static ssize_t show_calibration_count(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_REK, 0x00, 0x01 };
+	u8 resp[HEADER_SIZE];
+	u16 rek_count;
+	int error;
+
+	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+						resp, sizeof(resp));
+	if (error) {
+		dev_err(&client->dev,
+			"read ReK status error=%d, buf=%*phC\n",
+			error, (int)sizeof(resp), resp);
+		return sprintf(buf, "%d\n", error);
+	}
+
+	rek_count = get_unaligned_be16(&resp[2]);
+
+	return sprintf(buf, "0x%04x\n", rek_count);
+}
+
 static DEVICE_ATTR_WO(calibrate);
 static DEVICE_ATTR(iap_mode, S_IRUGO, show_iap_mode, NULL);
+static DEVICE_ATTR(calibration_count, S_IRUGO, show_calibration_count, NULL);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, write_update_fw);
 
 struct elants_version_attribute {
@@ -1113,6 +1138,7 @@ static struct attribute *elants_attributes[] = {
 	&dev_attr_calibrate.attr,
 	&dev_attr_update_fw.attr,
 	&dev_attr_iap_mode.attr,
+	&dev_attr_calibration_count.attr,
 
 	&elants_ver_attr_fw_version.dattr.attr,
 	&elants_ver_attr_hw_version.dattr.attr,
-- 
2.7.4

