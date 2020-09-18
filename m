Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B5C26FFF7
	for <lists+linux-input@lfdr.de>; Fri, 18 Sep 2020 16:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgIROeD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Sep 2020 10:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIROeD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Sep 2020 10:34:03 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D013AC0613CE;
        Fri, 18 Sep 2020 07:34:02 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id a8so6450004ilk.1;
        Fri, 18 Sep 2020 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKMONdieCxgxCroaWyWNO0AqXSg8A8t7H/Pr77coN9c=;
        b=RiziH461xgq1/ogIkGyo/fb1MNBKdYf+l0MPBLrBKnwFoPrvSSgFs4rhma6yuofTWn
         N92UQgMYQCxQz8JJ6SrfXX4ixkksbun724CUmGq4DK3MSGdEDAQ78moUi7WNCPo6woH9
         OH5IrCRQ5BacTxD+BXXCWmjI5FWCRRpnnf3SK93w3p+h4J2nE1bu8ST8UWaifdWYbElP
         wQZUe5PMgee5GALdq8u+y/msfizcIZ84u3DWvR9xEIpZGL1LKOZRCIKR4Zo6GAACs4KQ
         KOyRF+xB2Y0LeQKZKiTucaSRd9yj23IoqMCbGF9VP7ZYIxL7ZSLGWAzZdgCEoHA7wBw+
         /3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKMONdieCxgxCroaWyWNO0AqXSg8A8t7H/Pr77coN9c=;
        b=OLZFplgFyiUc7RV62NN3pntJDr6ajJvJ0r44zb0pJ4X0UeA8Ymz7WDZMSsQW735eOl
         Z2dnESCElEV270z81x2z1Un8AMwHF7h1GKsfq0VctIM+ANyGd9/7N2hOeaEXv2Llk3KS
         CRxOfIHrA9FslCuuh7cTO5B5Bwk3HgGRAqvWgUJF4K2O3C7CBUcmXAKY53Q8/LPqPjur
         Q/CWoMywSN5BpPo+OvZiDf8KPzEmcP/p/tPr4v3qBUceQGVW8xO93kU4HEDhzBcPQvb7
         Maj9pp9dhkHPCRDd+6bP3H0ygB4WUzgj/jyj5DktW38KgvhRPyPskggV6Ls2sIF6/7iz
         tbAw==
X-Gm-Message-State: AOAM530XGyU8HLieogdgZK92o3XZ6/TjKmDGjmsD+t24djdd/3o+D0Lb
        w1JIv6s+3/qSImMeJqMjy3Lme7rRkKE=
X-Google-Smtp-Source: ABdhPJwQAnskCg/xJN+CaLDsSZ335h7fGubZ/bsN2TIRm77rN59CfJ9NX/iZ+avFft5btaMzbXkgpA==
X-Received: by 2002:a92:6b0b:: with SMTP id g11mr26085925ilc.62.1600439641735;
        Fri, 18 Sep 2020 07:34:01 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id s2sm1744657ili.49.2020.09.18.07.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 07:34:01 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x:  Enable suspend/resume functions
Date:   Fri, 18 Sep 2020 09:33:52 -0500
Message-Id: <20200918143352.93135-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some people may wish to wake their system from sleep, so this
patch enables a suspend and resume function which enables
and disables IRQ wake functions.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 199cf3daec10..9b1a61447054 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -474,6 +474,28 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	return 0;
 }
 
+static int __maybe_unused ili210x_i2c_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(&client->dev))
+		enable_irq_wake(client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused ili210x_i2c_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(&client->dev))
+		disable_irq_wake(client->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(ili210x_i2c_pm, ili210x_i2c_suspend, ili210x_i2c_resume);
+
 static const struct i2c_device_id ili210x_i2c_id[] = {
 	{ "ili210x", (long)&ili210x_chip },
 	{ "ili2117", (long)&ili211x_chip },
@@ -495,6 +517,7 @@ MODULE_DEVICE_TABLE(of, ili210x_dt_ids);
 static struct i2c_driver ili210x_ts_driver = {
 	.driver = {
 		.name = "ili210x_i2c",
+		.pm = &ili210x_i2c_pm,
 		.of_match_table = ili210x_dt_ids,
 	},
 	.id_table = ili210x_i2c_id,
-- 
2.25.1

