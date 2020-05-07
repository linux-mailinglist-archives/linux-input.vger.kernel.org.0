Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F921C941D
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGPL5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726356AbgEGPL5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:11:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F76FC05BD43;
        Thu,  7 May 2020 08:11:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x10so2172784plr.4;
        Thu, 07 May 2020 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zt3dWszzUGPIr1is87/3ZzRSaPFAJm76db1aD6xZhws=;
        b=TI0Y1zgsKvAwRGvVFzQgzAJe5FKsPk4nM6Qs1kkkV3SrYAqnMd/EWdCrqUe5JjReO8
         9monr1ObfM/RMMg+6Qy0g5hfQezijmL7qGV645Q7hl3DZAX/vzVDtSdz8uwfQs7ynM0H
         O8VtsG475Cnp3USWAolj5xZcr7y60g51TfZqlE4pnoR0Ug4BxPZuc8QY+ihNBy/x1DM4
         YUmDWXIxdGI2sMrOb9y+a/9LtG7L9/poXMtaZwDmREq1Ro82qAtLi9e+eMs8amEd4323
         o2CTewy/Ya2M7CJNdNsoBx1+CCVa/j6zocbtX5R4rIJHxeBHt8TVu5xEGBtzuedcqixU
         TNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zt3dWszzUGPIr1is87/3ZzRSaPFAJm76db1aD6xZhws=;
        b=lS8XaDwVvwLnmrgyl3QYMCHazgYOld6Ly7fBjdxK3iAxz351Hvq4r1I1Rwyr/Snu4c
         yC2lfBWz8LhVPEvyj3TnnNGzm/e9gR1fCs4WzLjszopXn/OWHDYDHLmPwtajB+ihHHDr
         ptPK72oPum+zowngow9ZHhtX31a65spi0EAF2m4lZDdaCqFI2zWADmX8aJuY66g1m9np
         soTBaHu8B43nUSEsmSN3f10GoIoHgnZbnN9zux13XHq4kAAz9qFzCN0AiLljwWH9IdkQ
         wxJwChyzmcbv/5L5TweqRDVPdHO01PLkB6VyZfFBUXQh/q0nmwPQYbeOf8yeSa6jLYMP
         V9Xw==
X-Gm-Message-State: AGi0PuaJJ6b2kU6WppFI1/goLZwILOA7w1krCWaXwys5rXoljINZC76N
        H9wVT/OOzFqsi/+KG36cBgpt87nd108=
X-Google-Smtp-Source: APiQypJ4IITkjemHUaedvi2tTs9YZUePEepBqshIpV75NrwzsADS0UX6wsRQ65tM/+jrQuiEF+T0Jg==
X-Received: by 2002:a17:90b:46d1:: with SMTP id jx17mr550749pjb.212.1588864316603;
        Thu, 07 May 2020 08:11:56 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id j7sm5080620pfi.160.2020.05.07.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:11:55 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: stmfts - add missed input_unregister_device
Date:   Thu,  7 May 2020 23:11:47 +0800
Message-Id: <20200507151147.792578-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver calls input_register_device() in probe, but misses
input_unregister_device() in probe failure and remove.
Add the missed function calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b6f95f20f924..4345aa98a320 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -728,8 +728,10 @@ static int stmfts_probe(struct i2c_client *client,
 	}
 
 	err = devm_device_add_group(&client->dev, &stmfts_attribute_group);
-	if (err)
+	if (err) {
+		input_unregister_device(sdata->input);
 		return err;
+	}
 
 	pm_runtime_enable(&client->dev);
 	device_enable_async_suspend(&client->dev);
@@ -739,7 +741,10 @@ static int stmfts_probe(struct i2c_client *client,
 
 static int stmfts_remove(struct i2c_client *client)
 {
+	struct stmfts_data *sdata = i2c_get_clientdata(client);
+
 	pm_runtime_disable(&client->dev);
+	input_unregister_device(sdata->input);
 
 	return 0;
 }
-- 
2.26.2

