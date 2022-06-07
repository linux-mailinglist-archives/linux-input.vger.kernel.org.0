Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FB853FA84
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 11:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240347AbiFGJ4R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 05:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240275AbiFGJ4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 05:56:15 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255A4E7329
        for <linux-input@vger.kernel.org>; Tue,  7 Jun 2022 02:56:13 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u3so23392817wrg.3
        for <linux-input@vger.kernel.org>; Tue, 07 Jun 2022 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=kIbaL3300jIhHXnjE4TUkzvN0aDpxTdjXOfBc8eQ9P8NML1oCAcaCraQFv2cmkhCwe
         xolxDgKM2SYwGu//bLBxIQEY+R1qd+cBPF+xdHHhdXwgS8MgCtadhKJHMFVbErA3ntqo
         DxwLOuLslmfoQo4HsR6k2fHnh0AvXDDy59Ua0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=7PLjSt2A2zOnETPzuSdvlTeEh9Eg6ytnr9zBHV2/+9/sp+Jh6y9JBN/MWi92qfkXyN
         Z+Mr6OezdHx2Z1mCvIVaPOsgge+tHBTnYt+EdAtGAg8VDlex7ntPZq5wG8LJQA5W/yCE
         0BYkj6T2IvZYuEEBQNGygbG3+nhtUYcaMV9w2HmCw7ttoTCFLcBtrHRVXi507J2T9Ahi
         dB6S8ewAKDNC0/Azvla3wghkX+0o887eoXqvkcvKu/yLmslEO3k+lg6BPTFXkGFT8SBp
         AcjkasOLyTeUya3lvU0vACqfjvltXK/oYF2b2iRNHc3xS9JrGB98uXq3+XuqReVdkgci
         k/GA==
X-Gm-Message-State: AOAM532eNP8L/vf0ylibhuRyqaRjBCH/U3pDlBGDU6tFY6sRYYtBTOCv
        ajYXpui8XeGSqtnItwoS2Mcq3w==
X-Google-Smtp-Source: ABdhPJyr5/9ERYDgZbl0CtGb5qkjZthxagPrxoE8uMCuUwGOLm+tgE6eIpJABbxb1PEHO2Nw9BCvFg==
X-Received: by 2002:a5d:6c61:0:b0:210:7277:774c with SMTP id r1-20020a5d6c61000000b002107277774cmr26694747wrz.212.1654595771585;
        Tue, 07 Jun 2022 02:56:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (mob-5-90-137-51.net.vodafone.it. [5.90.137.51])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4b8c000000b0020feb9c44c2sm17693546wrt.20.2022.06.07.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:56:11 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Tue,  7 Jun 2022 11:55:54 +0200
Message-Id: <20220607095556.1034338-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
References: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

