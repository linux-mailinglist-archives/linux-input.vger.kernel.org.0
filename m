Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29298874D
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbfHJAVY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:21:24 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43612 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729712AbfHJAUq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id 4so38576133pld.10;
        Fri, 09 Aug 2019 17:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXigDLRw3f4Zeh3h3qtvUDbXQuQlDC/z8RUtgr8saEo=;
        b=shcMcSyHlCtZ2biVIOjEACzdBrr0xp5X+p+4JKaZr17niQ5yt6yaT8E2tL/xnmzNPB
         RSTGvpAe6rPxgCbw3owUy4oOpfL6RPSyePOUfPQiiKACTaMGRDhMjNKmxN7bDXkFMsW8
         I7tNgqOYXq94DYF+kDidzguZZFRa785ZpQfCPoqgMeYxpLXdNx9hJ3N075CyFZjqEsIJ
         U2yee6//BSGPFlcLdbok/mQkyL/Av6+iiYBhsngf/hUDYNiB7WnHcGvvS2S+wGBMWSWb
         q72G+1jTTvzvD25dL8J8XsuFwvVhViaEt9BqRPdNYz6zEWfyz4oNUr8tzlARtrSmP2+z
         1BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXigDLRw3f4Zeh3h3qtvUDbXQuQlDC/z8RUtgr8saEo=;
        b=QXkL9qmRKjdzS+PbquDlrPCmFmhKe8ghH/zDcn5VDSeNVw84gorSYHNmh3pQGoVxse
         /wK2RLP2RRB3nx8hE6xEKXbxD9bQ/QGqTydTiUmbTGoLkrA93RMbgglf1Fbh8HThrell
         XqENgB9WTnel3XpMiUZ/uf1uegPnhsp0UYeH9b648eDmde031pc+6XfuHtrBC9C+1r3B
         lOOjBOS8kIX9a8S9r57rlXvAS48VDaMYPpTxP29GLV3Cpe2gVJG4nZeTgidSWGCuzSdu
         OZF53NuIRIZoN/db7BRMjKlbXljSabhV4IH4gHMLvPZUafSTyRNCKsuaZ8jN5EtSeCgT
         kyTA==
X-Gm-Message-State: APjAAAXEJAmJDxGmIfM2U2JVEo42jA7WcyBFPDeV6jUDC9dt6IplSWlM
        jUh9GYcBty7HJWUP5LIQluVGyr6+
X-Google-Smtp-Source: APXvYqy887Z5vEQ/4RXyoil8/ailm/mP/GjCkGpVBukZ1TaBQNd39Z9swNhT6ETg/S0Eq2UcncfNqw==
X-Received: by 2002:a17:902:2f:: with SMTP id 44mr22043692pla.5.1565396445433;
        Fri, 09 Aug 2019 17:20:45 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:45 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] Input: bu21013_ts - annotate supend/resume methods as __maybe_unused
Date:   Fri,  9 Aug 2019 17:20:32 -0700
Message-Id: <20190810002039.95876-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead if #ifdef-ing out suspend and resume methods, let's mark
them as __maybe_unused to get better compile time coverage.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index e9cb020ed725..0bdadd24296f 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -634,7 +634,6 @@ static int bu21013_remove(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /**
  * bu21013_suspend() - suspend the touch screen controller
  * @dev: pointer to device structure
@@ -642,7 +641,7 @@ static int bu21013_remove(struct i2c_client *client)
  * This function is used to suspend the
  * touch panel controller and returns integer
  */
-static int bu21013_suspend(struct device *dev)
+static int __maybe_unused bu21013_suspend(struct device *dev)
 {
 	struct bu21013_ts *ts = dev_get_drvdata(dev);
 	struct i2c_client *client = ts->client;
@@ -665,7 +664,7 @@ static int bu21013_suspend(struct device *dev)
  * This function is used to resume the touch panel
  * controller and returns integer.
  */
-static int bu21013_resume(struct device *dev)
+static int __maybe_unused bu21013_resume(struct device *dev)
 {
 	struct bu21013_ts *ts = dev_get_drvdata(dev);
 	struct i2c_client *client = ts->client;
@@ -693,11 +692,7 @@ static int bu21013_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops bu21013_dev_pm_ops = {
-	.suspend = bu21013_suspend,
-	.resume  = bu21013_resume,
-};
-#endif
+static SIMPLE_DEV_PM_OPS(bu21013_dev_pm_ops, bu21013_suspend, bu21013_resume);
 
 static const struct i2c_device_id bu21013_id[] = {
 	{ DRIVER_TP, 0 },
@@ -708,9 +703,7 @@ MODULE_DEVICE_TABLE(i2c, bu21013_id);
 static struct i2c_driver bu21013_driver = {
 	.driver	= {
 		.name	=	DRIVER_TP,
-#ifdef CONFIG_PM
 		.pm	=	&bu21013_dev_pm_ops,
-#endif
 	},
 	.probe		=	bu21013_probe,
 	.remove		=	bu21013_remove,
-- 
2.23.0.rc1.153.gdeed80330f-goog

