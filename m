Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B3D4D76E2
	for <lists+linux-input@lfdr.de>; Sun, 13 Mar 2022 17:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbiCMQgd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Mar 2022 12:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbiCMQg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Mar 2022 12:36:29 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329874ECCA
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:19 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id j25so3361166edj.11
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vrk2JZcA20Ao9d7OGuwyWNd41ngo/SrLvLg9/Or12Oc=;
        b=B15rZWHFNifzlDS/iTPFqdBBONDMB3TQRfXRJtqdYIios6ISlohx5FUwsjOlIOxyme
         Bp4MpxL1yaAYvUUEFRZusnacQRkN5xI8wL688mmAtUwD4+M0Eayd1FX5J8JtzgFgk185
         B6zyP7CrI6HiImYkERpLRikHuVIcDvTFa1VT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vrk2JZcA20Ao9d7OGuwyWNd41ngo/SrLvLg9/Or12Oc=;
        b=CPIgvmvnjyjOzM+F6hM8UV9vVTeivZxdMqfCZq47fkprs3y1YPjpGL+7c71632PMbT
         37C/nIt4Bf+a5D5kyDeI1aj1FCZ6NwcF4rLYRAhhTqwyE3EakK8c+W9D0A0Ff62PAgLA
         vaTmPFBqzmDC/JZuHJYGhlLnjoS5i1knuah0ncUvQKwsOuILLXShvrrZqsEEunkeLvhP
         jxpyh2kNyJVz/hjX29DixGHkVExRS7riMP8vC6ZMhumQDV4Lh7RIMfTb/3WubDDvPBu7
         +0Zz/6p0UGsL5Eb7pXsLsbdzZE7CsiJ2q0VaI1oU6DR76Os+HCDgfHOmSMZkL0EMt/9D
         0X+w==
X-Gm-Message-State: AOAM532hzwGjd0frTH9833eAzKRArS8thB0tbv1etkxNb041Js3nmCf1
        voqs0qpCiy5qjq3eunOpCb9kqUzk4YPSjQ==
X-Google-Smtp-Source: ABdhPJy9DbSKrlioYbsdYiTJKXqDwj4vWmITtckZd6ERdF6FgAsDRHwsL0KajsoP32VFVMeiHNlzYg==
X-Received: by 2002:a05:6402:3590:b0:415:c162:f3d6 with SMTP id y16-20020a056402359000b00415c162f3d6mr17092339edc.124.1647189317736;
        Sun, 13 Mar 2022 09:35:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id qt22-20020a170906ecf600b006da6ef9b820sm5725028ejb.112.2022.03.13.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 09:35:17 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v3 3/6] Input: edt-ft5x06 - set report rate by dts property
Date:   Sun, 13 Mar 2022 17:35:00 +0100
Message-Id: <20220313163503.5183-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
References: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It allows to change the M06/M12 default scan rate on driver probing.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Check the lower and upper limits of the report-rate-hz value
- Convert the M06 report-rate-hz value

 drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 77f061af5c61..843e8b0522f7 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1084,6 +1084,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	struct input_dev *input;
 	unsigned long irq_flags;
 	int error;
+	u32 report_rate;
 	char fw_version[EDT_NAME_LEN];
 
 	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
@@ -1213,6 +1214,35 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
 	edt_ft5x06_ts_get_parameters(tsdata);
 
+	if (tsdata->reg_addr.reg_report_rate != NO_REGISTER &&
+	    !of_property_read_u32(client->dev.of_node, "report-rate-hz",
+				  &report_rate)) {
+		tsdata->report_rate = report_rate;
+		if (tsdata->version == EDT_M06) {
+			if (report_rate < 30)
+				report_rate = 30;
+			else if (report_rate > 140)
+				report_rate = 140;
+		} else if (report_rate < 1) {
+			report_rate = 1;
+		} else if (report_rate > 255)
+			report_rate = 255;
+
+		if (report_rate != tsdata->report_rate)
+			dev_warn(&client->dev,
+				 "report-rate %dHz is unsupported, use %dHz\n",
+				 tsdata->report_rate, report_rate);
+
+		if (tsdata->version == EDT_M06)
+			report_rate /= 10;
+
+		tsdata->report_rate = report_rate;
+
+		edt_ft5x06_register_write(tsdata,
+					  tsdata->reg_addr.reg_report_rate,
+					  tsdata->report_rate);
+	}
+
 	dev_dbg(&client->dev,
 		"Model \"%s\", Rev. \"%s\", %dx%d sensors\n",
 		tsdata->name, fw_version, tsdata->num_x, tsdata->num_y);
-- 
2.32.0

