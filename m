Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38881553246
	for <lists+linux-input@lfdr.de>; Tue, 21 Jun 2022 14:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350475AbiFUMjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jun 2022 08:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350497AbiFUMjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jun 2022 08:39:48 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B97827FEB
        for <linux-input@vger.kernel.org>; Tue, 21 Jun 2022 05:39:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eq6so11843004edb.6
        for <linux-input@vger.kernel.org>; Tue, 21 Jun 2022 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=T09TgHVdVJZmzUPSPlFfOkxGtvFLfz7rmFTqJydBgLkLmCznsPvZI8z/meS3GIC2JR
         6C7bXfvH3fPLxkB6WtUZr0Sqb2BIooFp/gex5z2dU0IXfSA9QB5T2r+yGSwfY+x0PRy+
         tqUHvyTWk50XH2CvqoIB023ycbrr0BUwIxvxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=fzcpUB2x1paPZpz6LR4KvM966duoTD76FK0a5HB/JRvpeTDVOf9ghRh5+N2cCrI7Po
         6/qtMujXpKhhghNFVBYy4Vemlv77a9cJKpMmsDXFroBecr22HjAs5bTPQdmeadUxqIkP
         oaPE3f7Lzmh51l1Q/Bowy/Kj91K2nKERrXvdqRCwaObakHfIFt89VO7HbQRqRUaRv0Pr
         +hKyCMUMOSUQxITm+0CTmss6J7BF2slZbpwRz2zS+y0uoGOLGmFWEqDy6hZcVbiibJOK
         uHpabJiaLClbPh4hAEuH33w7rlEUoKjTJnoi6Vw+7axtsLMtms0u95KRqGb+WF20wDtV
         x7JQ==
X-Gm-Message-State: AJIora/sv/iU2e/AJA0NA3zJTE6V/Z9k0smsml9UJ7tF7VAl/rferZNj
        MJwQ+b1V/BxpA+nGE24GyumybQ==
X-Google-Smtp-Source: AGRyM1tvKjTE5lH7ZBfFar8AtZLlU1qZ5MxnP7NFKK0HAHmBK3hBafLydCKrN97pZu5KO/gjBKv7aw==
X-Received: by 2002:aa7:db8d:0:b0:42e:1cbc:5e28 with SMTP id u13-20020aa7db8d000000b0042e1cbc5e28mr34978873edt.366.1655815185253;
        Tue, 21 Jun 2022 05:39:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-116-90-174.pool80116.interbusiness.it. [80.116.90.174])
        by smtp.gmail.com with ESMTPSA id c19-20020aa7c753000000b004357063bf60sm8003945eds.41.2022.06.21.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 05:39:44 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Tue, 21 Jun 2022 14:39:35 +0200
Message-Id: <20220621123937.1330389-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220621123937.1330389-1-dario.binacchi@amarulasolutions.com>
References: <20220621123937.1330389-1-dario.binacchi@amarulasolutions.com>
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

The model name was printed only if debug mode was enabled. Now you can
always get it from sysfs.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
---

(no changes since v1)

 drivers/input/touchscreen/edt-ft5x06.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 843e8b0522f7..89157deebfcb 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -529,6 +529,17 @@ static EDT_ATTR(threshold, S_IWUSR | S_IRUGO, WORK_REGISTER_THRESHOLD,
 static EDT_ATTR(report_rate, S_IWUSR | S_IRUGO, WORK_REGISTER_REPORT_RATE,
 		M12_REGISTER_REPORT_RATE, NO_REGISTER, 0, 255);
 
+static ssize_t model_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", tsdata->name);
+}
+
+static DEVICE_ATTR_RO(model);
+
 static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_gain.dattr.attr,
 	&edt_ft5x06_attr_offset.dattr.attr,
@@ -536,6 +547,7 @@ static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_offset_y.dattr.attr,
 	&edt_ft5x06_attr_threshold.dattr.attr,
 	&edt_ft5x06_attr_report_rate.dattr.attr,
+	&dev_attr_model.attr,
 	NULL
 };
 
-- 
2.32.0

