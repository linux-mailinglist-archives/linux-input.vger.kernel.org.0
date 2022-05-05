Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9688251C45B
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 17:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381505AbiEEQAd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381495AbiEEQA0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:00:26 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F1B1AF27
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 08:56:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z2so7993915ejj.3
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=anjXQPAzHgfLeiJhnxLOhpmVM0ix3W0HpeI5dndfdG63W5yw4GjLwSLrD0KT6+ZwIG
         +A1Fc/eghyrW1Z8sN56/fkklP6EHByA9XgSVZyLeVBD0IF4FdpqTn5GgdsOpbBIewJWv
         lfsXvmN+cRJJhVbrdyYSVrgM2M4QFaq9oDVss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=IANXaUuX1XzqL9CF6u1smSFo1/j6djV50nON70sYWwo0+oHcx1Xl8mjWMApoxn3vvE
         xBCbb9sPAcqAFEpDm6+Mz91s6NDaJxD4C3Z3Dgp9lj7SazdnMamjtpwcW4q+71YfFUzi
         ukkvIe6to4WTk/CUOAK6KHQOXIYwKW6/jXngCDHcUknpgnmRe+vywkQfr5JpBO065O/E
         DSkG7AKV+On7AeHE5nKCB+CZ3LoMppEYWAuYtwt8E5X/7yOCikcd/2pgRfQw4fksu6Zh
         wtCPBYlhA3VJ7MXdRDdCw8DwVIY1hK6bMydfhkCL+/VIOFCPXlrsKjNH2wRlGTv+DjNd
         VaSg==
X-Gm-Message-State: AOAM532HjkmnFv7/R1JwaIcVaDXgHFqaSxk4GmbmsVmtJAO5L04IalTI
        r4s2QsqgglIw+T2qu+0rDIraJQ==
X-Google-Smtp-Source: ABdhPJzWRO2Wx2BMsS4OBl2O7ow2FES7+AzGTKLpGtm7KiPShnz56I/ZwcBznwExt7ykNjgKYkO56g==
X-Received: by 2002:a17:907:d9e:b0:6f4:2983:c371 with SMTP id go30-20020a1709070d9e00b006f42983c371mr24154521ejc.558.1651766205542;
        Thu, 05 May 2022 08:56:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm1009328edr.15.2022.05.05.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:56:45 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Thu,  5 May 2022 17:56:33 +0200
Message-Id: <20220505155635.419653-5-dario.binacchi@amarulasolutions.com>
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

