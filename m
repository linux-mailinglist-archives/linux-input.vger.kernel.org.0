Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA03E0CDF
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733071AbfJVT4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45275 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733069AbfJVT4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so10569856pgj.12;
        Tue, 22 Oct 2019 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGYkPx9V52TrYmEaMjn2Ckv8a3Uj2F70nwOiXmtkUdM=;
        b=vFY+Gi/JpeXDDOLXp392Zc0u1FhRoCdC+Yh3C+I3LU/iSCbApslxVR8cVt8wcK7voB
         2KAoDFW082z7tpJA7zqSwE6ZaiIHbyBp749sijVDrrqIa7ttPfd4xclhLkV7qu1INE77
         4Xg8BTbihoprN4Voz8x6XGBTTcL9OoDmqmA25re1pLGm32+hteedo59tpSYea3y2DtIc
         sWISqc8Yi7f9Ztq0ihG7D5buJpX7k2Vt0uzjumTwC/O+UKNG3Mv1fpMRZX4+c1jq6buR
         qFAlcbQYIvAuqt3lnxBVuFR8fhbqP+rMtufzqhUdqLlE36kj5ATXsQzwF09LCoD/u5Ca
         kbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGYkPx9V52TrYmEaMjn2Ckv8a3Uj2F70nwOiXmtkUdM=;
        b=VzB0F08bOMS9tNKrgdc1qsZilQWPe1GK5zQez3bEiXRSME1SeOFLfYnZxEnXaVoGo9
         uoybXgloQiPqx1pp0XfdzVfe4NTwpFDBTVt4ImMILz99d+h7BXDLjeMn5ayzMGa3OTvX
         OW50pKw31MuPTNDOzeIVLLdCB8nbuN0I2em7hbOQNC/N0E19o26UQVNJAl5feCHU5mGT
         ln31Jzz95lxb3yukTcoRAmwg+ER3TcsyXdeZeUnTFwnQAANM91nxh6ZQtzpCG+nKEhyO
         a2ggE5AS+U966xGUPnCEERV6TMNyfBuqKNBSaeXMtK19ba7x5uO0dYBNQ0GTEV1HWFMx
         Xwmg==
X-Gm-Message-State: APjAAAU6W+J/xhQMlJ8aP49EF9P0OSjfW5henopzlbqG8Mk4raG8vShS
        tVJBK7DstlOv4N2Kke0H48y6AR4M
X-Google-Smtp-Source: APXvYqxe37Zg9/B2PR3UtQn30XIVByBPb8ven8GlJlMYRBD7b+jG1CL9qKSJ9vsqtbTOjn21g9Zabw==
X-Received: by 2002:a17:90a:9f81:: with SMTP id o1mr6885073pjp.60.1571774189374;
        Tue, 22 Oct 2019 12:56:29 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:28 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] Input: st1232 - rely on I2C core to configure wakeup interrupt
Date:   Tue, 22 Oct 2019 12:56:17 -0700
Message-Id: <20191022195622.66976-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When I2C client is created with I2C_CLIENT_WAKE flag (which happens
either because we have "wakeup-source" device property or the flag
was passed in when creating an I2C client manually), I2C core will
take care of configuring interrupt as wakeup source on suspend.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index f1b97075aa9b..bb116f41f1c0 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -284,12 +284,10 @@ static int __maybe_unused st1232_ts_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(&client->dev)) {
-		enable_irq_wake(client->irq);
-	} else {
-		disable_irq(client->irq);
+	disable_irq(client->irq);
+
+	if (!device_may_wakeup(&client->dev))
 		st1232_ts_power(ts, false);
-	}
 
 	return 0;
 }
@@ -299,12 +297,10 @@ static int __maybe_unused st1232_ts_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct st1232_ts_data *ts = i2c_get_clientdata(client);
 
-	if (device_may_wakeup(&client->dev)) {
-		disable_irq_wake(client->irq);
-	} else {
+	if (!device_may_wakeup(&client->dev))
 		st1232_ts_power(ts, true);
-		enable_irq(client->irq);
-	}
+
+	enable_irq(client->irq);
 
 	return 0;
 }
-- 
2.23.0.866.gb869b98d4c-goog

