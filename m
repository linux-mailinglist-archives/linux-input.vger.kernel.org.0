Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EF54538D3
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 18:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239089AbhKPRxd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 12:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbhKPRxb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 12:53:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F17C061570
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 09:50:34 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id n29so39148208wra.11
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 09:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ggQW6txR3GoncqBXOEGBHARu4dBm+t1/tOV2SLaD0zU=;
        b=UpsIH6QZTykx5qdN7GT+bYZz4YajOs2kO4+VB8DiMZh66PbEN5egFX+38/FwPS2Jfi
         bQCXlXvNYd7yJrPM6+Iw43+Bnynsey6n4ZUIOOCb379p2UIlPoPaNMrzvrMaouJZ507f
         T/ipPDaXgR8lhkdyjce610Z123CSa72EeKHmQ9U77cQJBxm0tJxXacY79I8Ok5uS2E0F
         pc++nlNFwxgbwIBoFpAkfowKlU4BKUxReiij5dF7ZE3NS+aiA224GvTbI1i7j1MtOIsL
         umFmAzfGtac9S0dn9C5i34t+DEmiWo8DVQnl+hwHQp7NwtiLo+PAZ7fB7wVjkK1SWQvH
         es0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ggQW6txR3GoncqBXOEGBHARu4dBm+t1/tOV2SLaD0zU=;
        b=Yv7ZKJKCCQ7724XvIiA+H0KlZwMItZ/jT06H7NgSDYymGcEdv7At1MPDy8DSdreQrE
         AiHZEAE8sWRdlOHwAihLLqmkg8P7twAMBdY4meBbiI/tkVvqZvyiJ1iLTnjhbtryrnXx
         vFJiXILK5vgLnUuqMJIuakS2zHZYFg/4PuHplZhpKAgPV9jo91k/lsNiXAr8IGPJ9H4Z
         4+o4UDorbRNkwgBrBcu6icTWZJh9D0sRMDBtwWcY5r5q4O00eH6ET/iQQc6iaKWhKfpb
         dGRVh3lxi0Armel3+dHISVLwtAvYGPvSZn8US3b0ukZNjptGGZOiBAV1kO+0kvqhBmmw
         6Yww==
X-Gm-Message-State: AOAM533ayJJ9hLdoL3FzL24A6xtRzCORIjVbN78j7ARsDivf7AqB9O5o
        ZV6cKfHfY3ibqD3TpuKUCO3aTA==
X-Google-Smtp-Source: ABdhPJxjPMCdka/9Q0QCaQLZWXrbWUOVj2gQl7NcHgy6jBOgdmNirOcOTVPVXRu15Q11gPpyGc2DDw==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr11685596wrn.90.1637085032368;
        Tue, 16 Nov 2021 09:50:32 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id t8sm2902762wmn.44.2021.11.16.09.50.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 09:50:31 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] Input: synaptics-rmi4 - Add I2C wakeup support
Date:   Tue, 16 Nov 2021 19:01:39 +0100
Message-Id: <1637085699-1914-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds wakeup capability to the I2C bus, and prevents regulator
shutdown when activated.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/rmi4/rmi_i2c.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_i2c.c b/drivers/input/rmi4/rmi_i2c.c
index 50305fc..dc70ea0 100644
--- a/drivers/input/rmi4/rmi_i2c.c
+++ b/drivers/input/rmi4/rmi_i2c.c
@@ -273,6 +273,8 @@ static int rmi_i2c_probe(struct i2c_client *client,
 
 	dev_info(&client->dev, "registering I2C-connected sensor\n");
 
+	device_init_wakeup(&client->dev, true);
+
 	error = rmi_register_transport_device(&rmi_i2c->xport);
 	if (error) {
 		dev_err(&client->dev, "failed to register sensor: %d\n", error);
@@ -299,8 +301,10 @@ static int rmi_i2c_suspend(struct device *dev)
 	if (ret)
 		dev_warn(dev, "Failed to resume device: %d\n", ret);
 
-	regulator_bulk_disable(ARRAY_SIZE(rmi_i2c->supplies),
-			       rmi_i2c->supplies);
+	if (!device_may_wakeup(dev)) {
+		regulator_bulk_disable(ARRAY_SIZE(rmi_i2c->supplies),
+				       rmi_i2c->supplies);
+	}
 
 	return ret;
 }
@@ -311,12 +315,14 @@ static int rmi_i2c_resume(struct device *dev)
 	struct rmi_i2c_xport *rmi_i2c = i2c_get_clientdata(client);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(rmi_i2c->supplies),
-				    rmi_i2c->supplies);
-	if (ret)
-		return ret;
+	if (!device_may_wakeup(dev)) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(rmi_i2c->supplies),
+					    rmi_i2c->supplies);
+		if (ret)
+			return ret;
 
-	msleep(rmi_i2c->startup_delay);
+		msleep(rmi_i2c->startup_delay);
+	}
 
 	ret = rmi_driver_resume(rmi_i2c->xport.rmi_dev, true);
 	if (ret)
-- 
2.7.4

