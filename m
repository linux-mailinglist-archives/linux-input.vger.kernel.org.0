Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACBE7C9BBC
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 23:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjJOVMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 17:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjJOVME (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:04 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CE8DF
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3296b49c546so3184052f8f.3
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404321; x=1698009121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J8RLHlqMUHOOwu0JAX+LHiZvvV4F3X/qYQjfJIsE2Q=;
        b=XDfpOewYfV2TrpTAOAnhUe0FqSl3rA5ql2d0CD9p3X9CTJYfp9xdmlZU/UdDdWu/20
         CLMdg1SeGprGiVS8YyeiMvOMKOUwgKVGUB1y+LVDRFMdiDzQevOfO7L94invzzIViHZo
         tDLYo/p5sioJh23i4agOOyB7sEH8nuGZH1F0w6n7ViCt4tQ98prMCQfpt5iCLxYok1pX
         SlQv1uQd7huZ4vthTdEYyEhy3lUyrifzLPzCrwpztsnkvK7dBpNMquWzsoeYpZQ3ZMGE
         5OlIRjj0RgAbD78/2frVw1DU51qgYdtyxRsoBK9no/gg2ltkcBJ7jujZGkKfeJ0tCAZI
         Eu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404321; x=1698009121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J8RLHlqMUHOOwu0JAX+LHiZvvV4F3X/qYQjfJIsE2Q=;
        b=GcQA1ZvGGNT3Nj7yz+e9WQ7qScvgVscRY8vhN8XnVyAEZsxDbnqm0i7whEKqXRpuyV
         jUTwt71MHHIp6jKo/f/gHzFJwEopMMJA9t7LJHdtQs3Vlf/La69Ne/1DUGaDCGswqkXq
         uPo+UlpUPdQc7Q5rmjaJ8SHmhDLQ7cmEIDONvq+A+BJhElNgGCq4NujrqSQCvjhx3UTo
         ZxiFaqKc6hjlwVgCCLRt8Y8g0g6DFxXlfRnTGZA2+RUiyzVyy2vFhdvuaV5OQJR7frIG
         6uFvCyuTb8zOA8efC5R16fqvEDFMv9nzhjf5VV+TJHnqNtM0Z0uae91PQgC3na8lu0nt
         C6Dg==
X-Gm-Message-State: AOJu0YzFpJ+RnQmjF0EjzUaXCsPB7f01QQu4y+jKsOEkyIqNrhglsU4u
        F/xovgEtKU1BUg40GEwKiBK06w==
X-Google-Smtp-Source: AGHT+IE6OynCsb4GHRDPLUzWypJ6Y6PqyEO+HiftdXR6aDbCJR+OpGtqg4RrpAo0iMhD+ntyvB9yXA==
X-Received: by 2002:a5d:5b0d:0:b0:32d:8401:4057 with SMTP id bx13-20020a5d5b0d000000b0032d84014057mr13258167wrb.15.1697404321568;
        Sun, 15 Oct 2023 14:12:01 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:01 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:51 +0100
Subject: [PATCH v2 3/7] Input: synaptics-rmi4 - f12: use hardcoded values
 for aftermarket touch ICs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-3-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=6118;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=eWdxGMEpVfu6L9JxVtKHUtCsmiQeYQ0ms+XbRoDfZPY=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0LnXrsVnxMb4KZgG8t1xkTKZpmmW/qJ3koXbtqQrk
 3+tWre5o5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAEwkNJ6RYePX6IerdGZHdoUm
 coTuDrz911CnVeCUhH7CadMNKs8uJTD8LxY9ePHGP4e5pyxDYs4ILz8+NeSB5HFOu7Wb391jVJS
 0WgMA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which are
devoid of register descriptors. Create a fake data register descriptor
for such ICs and provide hardcoded default values.

It isn't possible to reliably determine if the touch IC is original or
not, so these fallback values are offered as an alternative to the error
path when register descriptors aren't available.

Signed-off-by: methanal <baclofen@tuta.io>
[changes for readability / codeflow, checkpatch fixes]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_f12.c | 117 +++++++++++++++++++++++++++++++++----------
 1 file changed, 91 insertions(+), 26 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 7e97944f7616..719ee3b42550 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -195,6 +195,41 @@ static void rmi_f12_process_objects(struct f12_data *f12, u8 *data1, int size)
 		rmi_2d_sensor_abs_report(sensor, &sensor->objs[i], i);
 }
 
+static void rmi_f12_set_hardcoded_desc(struct rmi_function *fn, struct f12_data *f12)
+{
+	struct rmi_2d_sensor *sensor = &f12->sensor;
+	struct rmi_register_desc_item *reg_desc;
+
+	/* We have no f12->data_reg_desc, so the pkt_size is 0, override it with
+	 * a somewhat sensible default (this corresponds to 10 fingers).
+	 */
+	sensor->pkt_size = 88;
+
+	/*
+	 * There are no register descriptors to get these values from.
+	 * We set them to high values to either be overwritten by the clip
+	 * properties from devicetree, or to just not get in the way.
+	 */
+	sensor->max_x = 65535;
+	sensor->max_y = 65535;
+
+	/*
+	 * Create the Data1 register descriptor so that touch events
+	 * can work properly.
+	 */
+	reg_desc = devm_kcalloc(&fn->dev, 1,
+			sizeof(struct rmi_register_desc_item), GFP_KERNEL);
+	reg_desc->reg = 1;
+	reg_desc->reg_size = 80;
+	reg_desc->num_subpackets = 10;
+
+	f12->data1 = reg_desc;
+	f12->data1_offset = 0;
+	sensor->nbr_fingers = reg_desc->num_subpackets;
+	sensor->report_abs = 1;
+	sensor->attn_size += reg_desc->reg_size;
+}
+
 static irqreturn_t rmi_f12_attention(int irq, void *ctx)
 {
 	int retval;
@@ -315,6 +350,40 @@ static int rmi_f12_config(struct rmi_function *fn)
 	return 0;
 }
 
+static int rmi_f12_sensor_init(struct rmi_function *fn, struct f12_data *f12)
+{
+	struct rmi_2d_sensor *sensor = &f12->sensor;
+
+	sensor->fn = fn;
+	f12->data_addr = fn->fd.data_base_addr;
+
+	/* On quirky devices that don't have a data_reg_desc we hardcode the packet
+	 * in rmi_f12_set_hardcoded_desc(). Make sure not to set it to 0 here.
+	 */
+	if (!sensor->pkt_size)
+		sensor->pkt_size = rmi_register_desc_calc_size(&f12->data_reg_desc);
+
+	sensor->axis_align =
+		f12->sensor_pdata.axis_align;
+
+	sensor->x_mm = f12->sensor_pdata.x_mm;
+	sensor->y_mm = f12->sensor_pdata.y_mm;
+	sensor->dribble = f12->sensor_pdata.dribble;
+
+	if (sensor->sensor_type == rmi_sensor_default)
+		sensor->sensor_type =
+			f12->sensor_pdata.sensor_type;
+
+	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: data packet size: %d\n", __func__,
+		sensor->pkt_size);
+
+	sensor->data_pkt = devm_kzalloc(&fn->dev, sensor->pkt_size, GFP_KERNEL);
+	if (!sensor->data_pkt)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int rmi_f12_probe(struct rmi_function *fn)
 {
 	struct f12_data *f12;
@@ -328,6 +397,7 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	struct rmi_driver_data *drvdata = dev_get_drvdata(&rmi_dev->dev);
 	u16 data_offset = 0;
 	int mask_size;
+	bool hardcoded_desc_quirk = false;
 
 	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s\n", __func__);
 
@@ -342,9 +412,9 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	++query_addr;
 
 	if (!(buf & BIT(0))) {
-		dev_err(&fn->dev,
-			"Behavior of F12 without register descriptors is undefined.\n");
-		return -ENODEV;
+		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
+			"No register descriptors defined for F12, using fallback\n");
+		hardcoded_desc_quirk = true;
 	}
 
 	f12 = devm_kzalloc(&fn->dev, sizeof(struct f12_data) + mask_size * 2,
@@ -352,6 +422,8 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	if (!f12)
 		return -ENOMEM;
 
+	dev_set_drvdata(&fn->dev, f12);
+
 	f12->abs_mask = (unsigned long *)((char *)f12
 			+ sizeof(struct f12_data));
 	f12->rel_mask = (unsigned long *)((char *)f12
@@ -370,6 +442,18 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		f12->sensor_pdata = pdata->sensor_pdata;
 	}
 
+	sensor = &f12->sensor;
+
+	if (hardcoded_desc_quirk) {
+		rmi_f12_set_hardcoded_desc(fn, f12);
+
+		ret = rmi_f12_sensor_init(fn, f12);
+		if (ret)
+			return ret;
+
+		goto skip_register_desc;
+	}
+
 	ret = rmi_read_register_desc(rmi_dev, query_addr,
 					&f12->query_reg_desc);
 	if (ret) {
@@ -400,29 +484,9 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	}
 	query_addr += 3;
 
-	sensor = &f12->sensor;
-	sensor->fn = fn;
-	f12->data_addr = fn->fd.data_base_addr;
-	sensor->pkt_size = rmi_register_desc_calc_size(&f12->data_reg_desc);
-
-	sensor->axis_align =
-		f12->sensor_pdata.axis_align;
-
-	sensor->x_mm = f12->sensor_pdata.x_mm;
-	sensor->y_mm = f12->sensor_pdata.y_mm;
-	sensor->dribble = f12->sensor_pdata.dribble;
-
-	if (sensor->sensor_type == rmi_sensor_default)
-		sensor->sensor_type =
-			f12->sensor_pdata.sensor_type;
-
-	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: data packet size: %d\n", __func__,
-		sensor->pkt_size);
-	sensor->data_pkt = devm_kzalloc(&fn->dev, sensor->pkt_size, GFP_KERNEL);
-	if (!sensor->data_pkt)
-		return -ENOMEM;
-
-	dev_set_drvdata(&fn->dev, f12);
+	ret = rmi_f12_sensor_init(fn, f12);
+	if (ret)
+		return ret;
 
 	ret = rmi_f12_read_sensor_tuning(f12);
 	if (ret)
@@ -520,6 +584,7 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		data_offset += item->reg_size;
 	}
 
+skip_register_desc:
 	/* allocate the in-kernel tracking buffers */
 	sensor->tracking_pos = devm_kcalloc(&fn->dev,
 			sensor->nbr_fingers, sizeof(struct input_mt_pos),

-- 
2.42.0

