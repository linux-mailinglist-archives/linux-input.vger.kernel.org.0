Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB266124FE
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJ2Sts (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiJ2Stq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4605F13D73
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so7145149pjd.4
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsX5392UKnLgBJUW01iOJFDlpotAC8FaXD98a4yhStI=;
        b=djyfe5h2bzCwo7zUhkANoSN2Ruza0iMPxy90HgZRCG13oU8rLjGW0x3N3i2fC6izJS
         azuWBTJdW+ns35kLHXEcSu7HtUvhCVOz14frC7Fk45bUryDIrnWMF4VwZxrnV9qgBySR
         /ld7PXAoW21IKr96Az7pxHjIOQDw5q3xn/JoUra9fBFYwb74vMijef1VDgPrdtv4qkYB
         LQrzW2wTK/4nX3GU2PTvNDuDI217b2C7RF2bdc+07Mujbv13P38BAUQ7S1CrzmX8d3uu
         H49RztUbj6RLtC2paWbPdqjwXDFyE3x+HMcPgwxagUKIuyTYZlqGBpxVWaZSvJehiRnl
         QTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsX5392UKnLgBJUW01iOJFDlpotAC8FaXD98a4yhStI=;
        b=GI3CipBr3vJGVMa3yWfLB2I+PNbfFcg77uR5LfIPg5fTsBtQvEsuWSK+zRnxJJV/F5
         KGpHipHsAqluSVxVOVIn8KxqmpGSb2XSdOzT1dZbRgYAEel0h+Z0KK+RMEc8GF3U8zCQ
         5CuRG8pq7zQ7YilJH2N8o+Zr3hNAZAjftgM+Lu3rLD9bU6QuMcsTzYF2kijZNbmHM7jm
         RWL9hwIDzfrncCvUZ7Qb0T8n27kGiTUqLHjwgEzZVWYjdDOt+cJudbNmFy6ww8keQutz
         Ku4a/puCWbvQMntegpxCBzAaQDt498O4r61ZtH0REJtIFULWEOdLaQPsBEmXuFcmU58t
         HcsQ==
X-Gm-Message-State: ACrzQf3UIzFXcixrpSg0EkJrGiRIuiCiCCzNGxjFq0CLqW6NauBJKc0R
        TXrB/T+V7++Roir5JAUxspD4uFw99tg2+rKq
X-Google-Smtp-Source: AMsMyM7/ExqCztRIVEWaZ+3m9CgXkw2nIMtGGgV0IF/X6YKTTZe0loo/3kv1uHq3EfwYKkARnvgHyA==
X-Received: by 2002:a17:90a:ce89:b0:213:167c:81e1 with SMTP id g9-20020a17090ace8900b00213167c81e1mr23396076pju.38.1667069384780;
        Sat, 29 Oct 2022 11:49:44 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:44 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 12/13] HID: playstation: set default DualShock4 BT poll interval to 4ms.
Date:   Sat, 29 Oct 2022 11:48:50 -0700
Message-Id: <20221029184851.282366-13-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The poll interval for DualShock4 in Bluetooth mode is adjustable
through the main output report. Configure it to 4ms, which is
similar to USB.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index a2f1bd1400a2..05553d07cb1b 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -316,6 +316,17 @@ struct dualsense_output_report {
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 
+/* The lower 6 bits of hw_control of the Bluetooth main output report
+ * control the interval at which Dualshock 4 reports data:
+ * 0x00 - 1ms
+ * 0x01 - 1ms
+ * 0x02 - 2ms
+ * 0x3E - 62ms
+ * 0x3F - disabled
+ */
+#define DS4_OUTPUT_HWCTL_BT_POLL_MASK	0x3F
+/* Default to 4ms poll interval, which is same as USB (not adjustable). */
+#define DS4_BT_DEFAULT_POLL_INTERVAL_MS	4
 #define DS4_OUTPUT_HWCTL_CRC32		0x40
 #define DS4_OUTPUT_HWCTL_HID		0x80
 
@@ -348,6 +359,10 @@ struct dualshock4 {
 	uint32_t prev_sensor_timestamp;
 	uint32_t sensor_timestamp_us;
 
+	/* Bluetooth poll interval */
+	bool update_bt_poll_interval;
+	uint8_t bt_poll_interval;
+
 	bool update_rumble;
 	uint8_t motor_left;
 	uint8_t motor_right;
@@ -2010,6 +2025,11 @@ static void dualshock4_output_worker(struct work_struct *work)
 		 */
 		report.bt->hw_control = DS4_OUTPUT_HWCTL_HID | DS4_OUTPUT_HWCTL_CRC32;
 
+		if (ds4->update_bt_poll_interval) {
+			report.bt->hw_control |= ds4->bt_poll_interval;
+			ds4->update_bt_poll_interval = false;
+		}
+
 		crc = crc32_le(0xFFFFFFFF, &seed, 1);
 		crc = ~crc32_le(crc, report.data, report.len - 4);
 
@@ -2241,6 +2261,13 @@ static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 }
 
+static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
+{
+	ds4->bt_poll_interval = interval;
+	ds4->update_bt_poll_interval = true;
+	dualshock4_schedule_work(ds4);
+}
+
 /* Set default lightbar color based on player. */
 static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4)
 {
@@ -2372,6 +2399,8 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 			goto err;
 	}
 
+	dualshock4_set_bt_poll_interval(ds4, DS4_BT_DEFAULT_POLL_INTERVAL_MS);
+
 	ret = ps_device_set_player_id(ps_dev);
 	if (ret) {
 		hid_err(hdev, "Failed to assign player id for DualShock4: %d\n", ret);
-- 
2.37.3

