Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AFE51C461
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 17:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381467AbiEEQA0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381482AbiEEQAY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:00:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C1F5A08A
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 08:56:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z2so7993915ejj.3
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NIUuHRgvgWCmYJCricL+FHDsiVQYgUJ0FjEwcnUqvHA=;
        b=exXWeiuiJqVSSFiH2D0YiOMHTMpz2ENa4sblu+fFfCOQ5CFTWE1DweH6W0NgHDu/2b
         czkcCEvUFQPeRLyzJ+YUAFaTqihvHXT9bxDtGPaNRCp+z0tEhXuVk6FU7S319cJ1pxoR
         Aeogd8redla9tC1t9YlFTQXf6zLYAYXutvMKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIUuHRgvgWCmYJCricL+FHDsiVQYgUJ0FjEwcnUqvHA=;
        b=AGBiTUkJfo8EUNNohIiKrV/lXJlp7qXXcB/Oog5LWmiGZpNF9h0uuOZJfZkJXd+zNH
         W+u7g/LX2NSthh/+qnpnSkVIqxy6MHbpizs9cTAkqb6XEHhrqMnTAVQE0C4gIVsMf5kp
         4ZJcKZYZ6T3D3T/HSZUJy7Hq8mUNGftq0n1XQYxQaDJ6SzHvfYNPTHRbiMHB9MCiV0pj
         +0zqoQPZF2ev78LtgOC5mU602p1DmvJeF2ntQvsuyAPf5+q/NtauzotnNVWXIGTsVAeX
         2L0Y4R7xuqqEPFkcziGA93BlaDCz16VXYxjQ9ejz0MYSM5AanRKeEuHwvYe4WcsgbaEi
         pgcQ==
X-Gm-Message-State: AOAM531Lfbz2kKYYxedrlayzW5RL0DNyIp1g+i89Ku9xc/Jcp2fo8LW5
        l6p8ufzyywfUpT3ADwkxlvHeW8qCFPxfEg==
X-Google-Smtp-Source: ABdhPJxQciPADqHPeWWuxEcUelSTYXq3kljBbPWiK+q6iQ5lBddTeI9k871mWFRCSx/28TOIMUz0PA==
X-Received: by 2002:a17:906:2294:b0:6f3:bd02:95a3 with SMTP id p20-20020a170906229400b006f3bd0295a3mr26671291eja.201.1651766204299;
        Thu, 05 May 2022 08:56:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm1009328edr.15.2022.05.05.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:56:43 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 3/6] Input: edt-ft5x06 - set report rate by dts property
Date:   Thu,  5 May 2022 17:56:32 +0200
Message-Id: <20220505155635.419653-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
References: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v3)

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

