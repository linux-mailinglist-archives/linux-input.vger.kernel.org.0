Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308F34BA67E
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 17:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243498AbiBQQ4a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 11:56:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243494AbiBQQ43 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 11:56:29 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE622B3574
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:12 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id k25so8742861ejp.5
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5OoznANZWl9shnBBwKPZ8EbYpxoOhQ9+yT0F6ifynA=;
        b=lcvbGvwyTJgIDCzEbQPT1VTlt4oOgRaPvq2dmRaWPpUDCPK6xAmdQIebm56oQGz76y
         SBKYr7MW2cHGBA3iUfhi31vzCuyiw4iojgr+6RJ7A1kY3ApJwhY6Ns5dANARK7pFTxg7
         v4K/pM2tWpfJe4Cs6BSJebjMpM6+mDyHjKpqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5OoznANZWl9shnBBwKPZ8EbYpxoOhQ9+yT0F6ifynA=;
        b=CerkyvwtraWSAhw/h5sCU9f5dpebqEkXiMLr5PG6dIOBhY9a49QJKqJEfhnkEHfoam
         wRKvMOYdMUIJqGiAkq0EamDQvSAh1R6TpA/Nl1pL1pJ/kbe+HLM7s5fn0ygkxGd9FagT
         pVBcT3StKdPVnW4VlSQWfWzInRmYU04HqvR2XQi2XXPNtgZcC9k7LXYQcY2yOCfNqgvV
         jRSauEkRiJgSWJC/E/zSCl7Ckr0iL98YswqYpMlivcltaCXyGzCSpdUInqwnyq2U8Hvi
         pBKilcJLrDkgCKNhbqU9Ssi7H3LyMrBbhdSX31koenCwIXCfZ/sy0+DGVjnRhaWGwoyc
         6kTA==
X-Gm-Message-State: AOAM533cWsjMx6LU7Q2Q8ke/e3BvcEuiXm0Z7eJZghrTS+gDtCkOoIAP
        1FhSVuexLKUXRhM8uW2PT1aIj/GL3ztByA==
X-Google-Smtp-Source: ABdhPJyZzrukdF8f/D042+Aqpgvrx0Y8e/q2cA3EIHOM2T1Vcf70gO89ZldzXo1FVrWm9OX4YvN3Ew==
X-Received: by 2002:a17:906:ce52:b0:6cf:54e5:df6 with SMTP id se18-20020a170906ce5200b006cf54e50df6mr3030179ejb.740.1645116970597;
        Thu, 17 Feb 2022 08:56:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id v4sm965323ejb.72.2022.02.17.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:56:10 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Thu, 17 Feb 2022 17:55:56 +0100
Message-Id: <20220217165559.313366-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
References: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
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
index b3e492cfc41c..eb1231d1c0b4 100644
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

