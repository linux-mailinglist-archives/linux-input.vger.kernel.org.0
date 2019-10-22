Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA63E0CE1
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733076AbfJVT4c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46584 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733028AbfJVT4b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:31 -0400
Received: by mail-pg1-f196.google.com with SMTP id e15so10560164pgu.13;
        Tue, 22 Oct 2019 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4y/5VwE/UlGgYr3QyrcPLtb/wmsPwbDIuZ2lbakaKE=;
        b=V7KPusGeHLpRexxKm4l1fM2Nsa/VnUGskG05cKTSasNjuTIF9AaUyaGxuEuk/Yu6eP
         EKkEPROhrwoyjAFagfkahsh78KGxz8RC011dzgfUDIKrfERY4BY3iQqW4xu0LG5A8MQw
         VBZ4v+3EpsODL8XmkAI1SCtNC31qaIg84EneMRlual9M3yD5S/xSCQHaxnRxV6Tn5tcI
         B1p4INFaSAEXIWBV0MnNOFuz3hBW1IoiBGa9KzImg9gBYv1DYioJrrDKx7YC1lkByBDv
         VudsDID7hLDEYPZ+PMCnSQc6xQ6Sy9Gj/B1bvvbARd1cwh3Ui0WIJbYBxEDxAyKWaLxb
         RAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4y/5VwE/UlGgYr3QyrcPLtb/wmsPwbDIuZ2lbakaKE=;
        b=Es28p0Jzx140SvMBBHSPlUyqrfj4vP6YP7kv+UWRHh+iv/8rolixdxp/VaP2onSA+i
         q+/M/cbWKY4gFQvQ4ikE7KoSnHLfWCdMzjrwwt+Lq32DF37ZgZtwwHYMH3vbJAmuXc/A
         2CKzWyTEqJNbEDILEzIJGSow+ooRfyQ/Wu2W85H2BhNnWFOKiK4jtLR625IuwTRqfgBh
         8aSSvHsfK7ohT0ldh+m2Mm+rXoWfwu+4tMNOo5/JDZexjWWFNfC4l1+xnvur6BLO3of/
         rT790WfAakbMTvXJXeDqw1s/VRj8H2YZ2fw+c0wRd+s4h21QG56L2dsfD5HyBu6aF+4N
         OO/g==
X-Gm-Message-State: APjAAAX/YxqIMBrLCJFmIYZQvQu3WpK9/L70aXO5OnuZF4tSWN6gohM4
        GFE9Bghrp7fW1rEHzS5EgNM=
X-Google-Smtp-Source: APXvYqz8ZeChw4ngk4AOKRjiRJinu4KmGpxpDbQ/Vw0A52hWWc8Hz4YetMi2CpkWGKSIxPU8zTYgHQ==
X-Received: by 2002:a62:6842:: with SMTP id d63mr6152795pfc.166.1571774190261;
        Tue, 22 Oct 2019 12:56:30 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:29 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] Input: st1232 - do not reset the chip too early
Date:   Tue, 22 Oct 2019 12:56:18 -0700
Message-Id: <20191022195622.66976-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should not be putting the chip into reset while interrupts are enabled
and ISR may be running. Fix this by installing a custom devm action and
powering off the device/resetting GPIO line from there. This ensures proper
ordering.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index bb116f41f1c0..bfea02202ded 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -149,6 +149,11 @@ static void st1232_ts_power(struct st1232_ts_data *ts, bool poweron)
 		gpiod_set_value_cansleep(ts->reset_gpio, !poweron);
 }
 
+static void st1232_ts_power_off(void *data)
+{
+	st1232_ts_power(data, false);
+}
+
 static const struct st_chip_info st1232_chip_info = {
 	.have_z		= true,
 	.max_x		= 0x31f, /* 800 - 1 */
@@ -229,6 +234,13 @@ static int st1232_ts_probe(struct i2c_client *client,
 
 	st1232_ts_power(ts, true);
 
+	error = devm_add_action_or_reset(&client->dev, st1232_ts_power_off, ts);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to install power off action: %d\n", error);
+		return error;
+	}
+
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
 	input_dev->dev.parent = &client->dev;
@@ -270,15 +282,6 @@ static int st1232_ts_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int st1232_ts_remove(struct i2c_client *client)
-{
-	struct st1232_ts_data *ts = i2c_get_clientdata(client);
-
-	st1232_ts_power(ts, false);
-
-	return 0;
-}
-
 static int __maybe_unused st1232_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -324,7 +327,6 @@ MODULE_DEVICE_TABLE(of, st1232_ts_dt_ids);
 
 static struct i2c_driver st1232_ts_driver = {
 	.probe		= st1232_ts_probe,
-	.remove		= st1232_ts_remove,
 	.id_table	= st1232_ts_id,
 	.driver = {
 		.name	= ST1232_TS_NAME,
-- 
2.23.0.866.gb869b98d4c-goog

