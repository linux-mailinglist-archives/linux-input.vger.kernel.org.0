Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A493B253B91
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 03:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgH0BoU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 21:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgH0BoT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 21:44:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314F9C06138E;
        Wed, 26 Aug 2020 18:44:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x143so2226487pfc.4;
        Wed, 26 Aug 2020 18:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=28q+FTG5opePGVSIsaIYRmsu38zCqcpXVW1uX+shyDY=;
        b=UCMAE4A6F8nWN3GQ+EJ7w7NwkF+QwWwrcJXypnO2izF/1cw2HlTGp/P5LuuZ39OMkY
         DrzQrgtJY2/fTO3hZGQxByqnkGy7V64joUs3nRbsxzagjV31gkJDnETCIpVuncIZ/PGd
         PiMkTGGkjj7Qiiu35syni2S0EX+A+C3UEQzv7enBR9q3Iz76B+LiH4WSepTapuYzPgnp
         T4ej50f60XDN4sBQfYuHCFPLWrAl31GxDCTEy4zCS5a2n5Wk7sVYbgvAiaF+D//vy5kV
         NrE0dF50Nyt6R896IPjX7VDLCrZQMngkHTV0rZphjlLsvXzbTb4IsVNqNxH9EwALHUF8
         1D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=28q+FTG5opePGVSIsaIYRmsu38zCqcpXVW1uX+shyDY=;
        b=RCxfvVuvN+OFyD3P/rhhxlQDufJ8PqU4pYRZFNGmR3sTykRotoCf8G2Wxg3lF5/5vg
         7Xfe/Na7xP4J+mGPN8MfNF9YUDD+Erck+K/VdTw77HAvImOuoJ+9/PDwMLJ2oBuYBDPN
         1QL+Q8tDcyOVgj7fNrYhyBTf37V4CEqqX6w6Qy7BMMiwyTZemhMUUdIdxt2K7qk3iiBQ
         j46+DmvT5pIjtthwp7awubk/aNiAlgGMyhuqq1gkOwfVn7nLvYXXKaFeBYioVf8jEApC
         ES92ixaJHIbRvzNs7ivCk8aOmv4tP0Y270TW7VFzI2Gvrq1NqotqqePf0ZGCPhHr/vXV
         VD2g==
X-Gm-Message-State: AOAM533zO/85nbC1lBj+l0VyAvxw788Ihu6qGto2WzS4oUYP7+Vuri/w
        ruhCIMV8J2T57gLYysGkf629RrP71yoXHg==
X-Google-Smtp-Source: ABdhPJzhA7Iw8NMu79kV0Gp7/hURXXIDMaCMf6jy4uUJyT8HHfVjURroX52uQY8zP0HGIjvboD3EnA==
X-Received: by 2002:a62:1cca:: with SMTP id c193mr7752598pfc.3.1598492658721;
        Wed, 26 Aug 2020 18:44:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8891:f88d:4578:9e9b:6ebc:aff1])
        by smtp.gmail.com with ESMTPSA id q2sm281821pgs.90.2020.08.26.18.44.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 18:44:18 -0700 (PDT)
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
Subject: [PATCH v2] Input: elants_i2c - Report resolution of ABS_MT_TOUCH_MAJOR by FW information.
Date:   Thu, 27 Aug 2020 09:44:11 +0800
Message-Id: <1598492651-9072-1-git-send-email-johnny.chuang.emc@gmail.com>
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
Changes in v2:
  - register real resolution instead of true/false.
---
 drivers/input/touchscreen/elants_i2c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index b0bd5bb..dc7f4a5 100644
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
 
+	/* Decide if report resolution of ABS_MT_TOUCH_MAJOR */
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

