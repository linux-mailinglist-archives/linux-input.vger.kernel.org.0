Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA57650A8AC
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 21:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391695AbiDUTEg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 15:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348745AbiDUTEf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 15:04:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31F041FA1
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 12:01:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so11878144ejd.9
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=ka0bSzqelK6lJUthcRpFwJgtlNk/odO7kgggb5rUBc+F9MxHrAiagKn17SvGC6jvkl
         BTE5CZ+DkTc2VSfuLv8wBIWTDffVF0jwMdBKR7zX4NT7PHstkijKl8PQtxkOShOghHUz
         bzl8LWmOaNwYy0ryHBX5rA1mezy5nnM/gyp+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b85JvDSGn8w4tr7JpVbjtxkbsu1O4D+F+hX3OsbfqCs=;
        b=aqY3DSpURzJo+S3M00mz0kQhN2lKnAd9syxRwfEVSiSzLq1j3VDJKNyf32+fyxkjpQ
         HpoiLO3jT3dyBoIG1HBEeC3rWIuB80SztLW2rl8NsX/1/egfhH5wqyDgPzV40reDNcb2
         zx11BUS7cwCeY6DCQDK/Mqy1NmXcC3m5uf0f6rHCW5o2RTtKPShxAeW3yVrrgnBTJ0kZ
         FWNvvH+TTLBeHjCUQ+n3nB7iQKd0r177m9i6T0zPAUSGJltLc1aQ8HVNOf8miEeewAld
         jWoR243EgZzg+uS+SMrWChRNQ34j8O+ZxwHPx/oyhXwfqMWhgmCk0HygWFJNuMTRgfR0
         OAEg==
X-Gm-Message-State: AOAM532kEhtzr0cYgh9hgdBfozOXagp5JuCDc2VFx3Dk9ghW8gJICmfD
        UXWYxsBGyWdVXA1MxdTPglNrLg==
X-Google-Smtp-Source: ABdhPJxVGUh+88fza3C0hBCin08Pv3Ewf46UwISRqQuu2FYh8ryW+j/atM0tg7WYIEtPnpITj/krSA==
X-Received: by 2002:a17:906:2bcb:b0:6e7:f655:3b96 with SMTP id n11-20020a1709062bcb00b006e7f6553b96mr801376ejg.175.1650567703496;
        Thu, 21 Apr 2022 12:01:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906284b00b006e108693850sm7975142ejc.28.2022.04.21.12.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:01:04 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 4/6] Input: edt-ft5x06 - show model name by sysfs
Date:   Thu, 21 Apr 2022 21:00:01 +0200
Message-Id: <20220421190003.3228699-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421190003.3228699-1-dario.binacchi@amarulasolutions.com>
References: <20220421190003.3228699-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

