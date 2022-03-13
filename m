Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EAC4D76E1
	for <lists+linux-input@lfdr.de>; Sun, 13 Mar 2022 17:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbiCMQgc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Mar 2022 12:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbiCMQg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Mar 2022 12:36:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630374F445
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r13so29151718ejd.5
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=AO4Ap8WIv/52qmC93QaffzAsFms88YxOs0wlud5GaxoNd7eJJhi/yQC9SEhnGkYxjc
         R0z4Qf94JBGcW8L7LgRrGCrqTIqsOD36R8DlAqpcgNnyXlY0jq0Nbzae/Evnsn2vLBXS
         BK/5GW1oWb+3SmjJWOcUjwgVNkGwucDowv4B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=XWkBwFlWsu2/BOY3LZijVggag8sBqeZKoKvf9daMGIz5HgLw/tiFDi2y2hDUhrBNsB
         +0j9hFhRDLTrfUNqLomgdWfWVsDBcG5D1wXHC5u4Rkg+TIHXhB8xMOAgHOu4GktgNruG
         B4dvN7Hm6n2S4EUCg4RKaLoQ7QPLs+R1GSUt4ewoqsDXx0Tj4RAhVy6dP6w9iXShyJic
         W76UQLHWK3EHrB/9v6Y8bQ0NHDIw0RrkJmmkqUefZnC5FD2cFEvegsqI5k4YYJWuKZ3K
         QFy5xioXg8WZy25mBxzGm/YOyN3C+1Bbxdblzxs+dtslY68SKuFgZSEDL6+MugpcQC0g
         p5zg==
X-Gm-Message-State: AOAM530QOtZIqjUaK84Svg6JKSqeKJ5skdILx0tMHsYVixoBMtm7HIQK
        pTVIJwmF2+KC0+3niolYVSf8cw==
X-Google-Smtp-Source: ABdhPJwazOO68OEGFZD7JckqMduhMlTW1p+fq7M1wDnXZU02GOnKiN/L5yShY3Te8S8KUXn7xsi/5w==
X-Received: by 2002:a17:907:206a:b0:6da:b2d9:5e32 with SMTP id qp10-20020a170907206a00b006dab2d95e32mr16100146ejb.176.1647189318984;
        Sun, 13 Mar 2022 09:35:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id qt22-20020a170906ecf600b006da6ef9b820sm5725028ejb.112.2022.03.13.09.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 09:35:18 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v3 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Sun, 13 Mar 2022 17:35:01 +0100
Message-Id: <20220313163503.5183-5-dario.binacchi@amarulasolutions.com>
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

