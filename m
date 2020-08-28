Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14F52552F5
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 04:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgH1CUF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 22:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbgH1CUC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 22:20:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B67C061264;
        Thu, 27 Aug 2020 19:20:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q93so3477609pjq.0;
        Thu, 27 Aug 2020 19:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WDsU53ggUOIO8hY0xz6zuIn+yi29IL9YgTObODIlPzE=;
        b=J8v9qS61pcOAelCZNvP7NAULS7YDQPCXpQ7ns6LCgNd4u9gxMwiymUM+Hp9gsN+KBt
         LGiuQJpGHFrw0e+rImSvccGBIDljpSQ0BqX0EAfLaqqrOSiXKbbJJJ1zFi6Fwdf+X9Yl
         SzvRy+SbL96o/hmGJMNPCPdXMxYP9Jj0eBvH3rffynSWTF1WTYTJfrf1bzGS82q+Urmi
         t5GEpGMHlLYBTfTvUKntkayfiM3yaSD8p+IHhmzBZufAjGw1uARPda1DqjKONUv2q0s0
         ND29NB0wip4mx8Ux/PBu67ytdRoyG1GHuBac4jK666PamRA0wLXWB3n9IaUP++w6chs8
         pdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WDsU53ggUOIO8hY0xz6zuIn+yi29IL9YgTObODIlPzE=;
        b=h8g7TLQB6wLy6EzSyyCb4ueWqIFPKh580dv7ff13kSk1/RJlAfy3I3ZJ59YPxnTZOC
         AIXMxREOSsSRS3VLZQi8+KgmahQD/8tI8y4ZrR200w+AC9+G+bGu/qixbYhyzpjaOPFq
         kCkNe+b5e+BzuMgDnbzMn7x8u2AEyBiLQerRXFvgogKhH9uvx4u0gdP9VQjfoKMtR0aJ
         iIZn/ItZwmF4ICJ305Wf3N1ZTPMqZQWtfUzQGFRnqfekHqVzuQySmnC5+Q3r0yx66y+J
         CCdfZnHPF0m1gHNLX28irwJUFi9lRb7UeKW6lJQ6YQvfT0m/5w3pN/nAZU8mWd2yxQFy
         DfTQ==
X-Gm-Message-State: AOAM530kYkNe016bkbgPYnDs3ftKu9c05ab0NlBHHrtGANE6ehYxWsjQ
        Z8/9ipRjlKODEOcfnxLEpVA=
X-Google-Smtp-Source: ABdhPJzJoEc7mvAiqaNUpfYyibeySDd/byEvyhehC3HM8+KaaE5kxRq+kCIRWXgI33S2mbM01jRr3g==
X-Received: by 2002:a17:90a:ead1:: with SMTP id ev17mr455763pjb.147.1598581202186;
        Thu, 27 Aug 2020 19:20:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8861:9155:4578:9e9b:6ebc:aff1])
        by smtp.gmail.com with ESMTPSA id g17sm3388553pjl.37.2020.08.27.19.19.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 19:20:01 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: [PATCH v3] Input: elants_i2c - Report resolution of ABS_MT_TOUCH_MAJOR by FW information.
Date:   Fri, 28 Aug 2020 10:19:55 +0800
Message-Id: <1598581195-9874-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a new behavior to report touch major resolution
based on information provided by firmware.

In initial process, driver acquires touch information from touch ic.
It contains one byte about the resolution value of ABS_MT_TOUCH_MAJOR.
Touch driver will report touch major resolution by this information.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
Changes in v2:
  - register a real resolution value from firmware,
	instead of hardcoding resolution value as 1 by flag.
Changes in v3:
  - modify git log message from flag to real value.
  - modify driver comment from flag to real value.
---
 drivers/input/touchscreen/elants_i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index b0bd5bb..661a3ee 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -151,6 +151,7 @@ struct elants_data {
 
 	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
+	u8 report_major_resolution;
 
 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
@@ -459,6 +460,9 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 	rows = resp[2] + resp[6] + resp[10];
 	cols = resp[3] + resp[7] + resp[11];
 
+	/* get report resolution value of ABS_MT_TOUCH_MAJOR */
+	ts->report_major_resolution = resp[16];
+
 	/* Process mm_to_pixel information */
 	error = elants_i2c_execute_command(client,
 					   get_osr_cmd, sizeof(get_osr_cmd),
@@ -1325,6 +1329,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 			     0, MT_TOOL_PALM, 0, 0);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
+	if (ts->report_major_resolution > 0)
+		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->report_major_resolution);
 
 	touchscreen_parse_properties(ts->input, true, &ts->prop);
 
-- 
2.7.4

