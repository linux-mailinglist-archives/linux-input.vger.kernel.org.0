Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B94124F84D
	for <lists+linux-input@lfdr.de>; Mon, 24 Aug 2020 11:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgHXJ3R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Aug 2020 05:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729716AbgHXJ3M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Aug 2020 05:29:12 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E36CC061573;
        Mon, 24 Aug 2020 02:29:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m71so4526653pfd.1;
        Mon, 24 Aug 2020 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=M+CBKNTiwAynTWcjwTpo/w0QwP0i2sY5ZYNiviotLzQ=;
        b=lfwdl791pl6Rg3w7CCBD0U3WMVfwrvu6r0fM1NUT9BSmRAF83AXPqnMx8nGgLEeSm1
         B4KRNgwRVbajM54XQquuBtk0DR5JiJjSwr6RmH2lOJm/0SpJmLM8OKTeM5NjiQYaPk66
         HYVBod+Q4QFQ8vYYy7b9d9h5v9C9/ymT0gT08lS1m5sl8dUN+LgEvOeE1Hm4ImWpbWr5
         BiD3HQHd6dn2WFsaXPnalUNKXVh6SwfHz5f5jpL1Eyse1f9p4yMWcpDsjwhrF7JCOyVF
         flPIO8SrL+3iJ1LqbJJJODF2w24zXqJJzD54cx41rNQhwBMqwR0Gx5mYKh1BLNe7Mvds
         Wmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M+CBKNTiwAynTWcjwTpo/w0QwP0i2sY5ZYNiviotLzQ=;
        b=T1E0/nGGXT0AJfYuLipOEZp/WxnRm7KD5Fkgrf3HOt4wrYIVwrsR8dhIc0q3YkN75w
         uSScRMN+VB/k4EaEC7qtqnEG+BaHomLYzLmNzS/fPH68pTQe+Vqlj//uggmWUOiGcsvy
         nxGAqc5OK/j1YYOUfR9R2Sd9LvNSh4ruhp/RGz9raWZSNip4634sLdhNlB5YKHPeETas
         e6Zbdf2X1ZPOXGx4iMipo9IsC0lInYgrvKJJH2RhReP26I/Q3S6NydYnxyRF3seq8HOh
         4AG640WQeCijQK8BNPuZUiKqVwsohNUH0vnZ+t1PS5QLwO3hqFtxpi741j7w+k5dxJwa
         YCBw==
X-Gm-Message-State: AOAM530QtUoVJSx5TSWaA4K9yQvTu5DvR7xC4DYTVM+fgajYkx60JWHU
        HJ1CoYvzK24WB6xIYSlI2t8wQkMLTUs=
X-Google-Smtp-Source: ABdhPJyc/CdqWYl6Q/XYn70yHRjoNGyndjmiKPxrI/Fyj2xyhj0Zh1FqxNiNv5r1bUM5eBRoFKKdRQ==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr2987994pgl.208.1598261352105;
        Mon, 24 Aug 2020 02:29:12 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8881:a353:4578:9e9b:6ebc:aff1])
        by smtp.gmail.com with ESMTPSA id y65sm10644627pfb.155.2020.08.24.02.29.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 02:29:11 -0700 (PDT)
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
Subject: [PATCH] Input: elants_i2c - Report resolution of ABS_MT_TOUCH_MAJOR by FW information.
Date:   Mon, 24 Aug 2020 17:29:03 +0800
Message-Id: <1598261343-23946-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a new behavior to report touch major resolution
based on information provided by firmware.

In initial process, driver acquires touch information from touch ic.
This information contains of one flag about reporting resolution of
ABS_MT_TOUCH_MAJOR is needed, or not.
Touch driver will report touch major resolution after geting this flag.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index b0bd5bb..513f2fd 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -151,6 +151,7 @@ struct elants_data {
 
 	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
+	bool report_major_resolution;
 
 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
@@ -459,6 +460,9 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 	rows = resp[2] + resp[6] + resp[10];
 	cols = resp[3] + resp[7] + resp[11];
 
+	/* Decide if report resolution of ABS_MT_TOUCH_MAJOR */
+	ts->report_major_resolution = (resp[16] != 0) ? true : false;
+
 	/* Process mm_to_pixel information */
 	error = elants_i2c_execute_command(client,
 					   get_osr_cmd, sizeof(get_osr_cmd),
@@ -1325,6 +1329,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 			     0, MT_TOOL_PALM, 0, 0);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
+	if (ts->report_major_resolution == true)
+		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
 
 	touchscreen_parse_properties(ts->input, true, &ts->prop);
 
-- 
2.7.4

