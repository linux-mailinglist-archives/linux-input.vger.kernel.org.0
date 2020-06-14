Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033F41F8739
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 08:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgFNGTI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 02:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNGTI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 02:19:08 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72DAC03E96F;
        Sat, 13 Jun 2020 23:19:07 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id h3so12425015ilh.13;
        Sat, 13 Jun 2020 23:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9KK+F0d4mciiuo9VaW5QFXWP2Ch9Rbbv4U0+fODdYfw=;
        b=HDUWrCkggu0J1UgH7dQO1nYEXZBkr5iknhM0hWr8Cxnps2IFyJvHAbm6BhL5HSHOiL
         WX37C60DJVxnU40AE6VWz63fnS75SQgC69ZoK7b/4wqZFHl/156yjZLfXFBhaqHKs106
         KoJLVkVbIXH+4J8MHF1Z175hMrrlHTeDtn62CqD6mnQ54WNqw5M/VJREluvKXfAxAfP/
         0U+8b0JwdnROS3sjXzFelRhMmBiRdzI5LyeP2gNsQCUhskCB/SuMwoUdzPb24surrQ99
         1kQ2hnm8DG3Wc39OJrUbpKTLvfNB5vzFrmr+MyV+IExRyF84+5aA59fAIPji1X7t4f2A
         RAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9KK+F0d4mciiuo9VaW5QFXWP2Ch9Rbbv4U0+fODdYfw=;
        b=Pvskfe3YELDqtHE9AKbtoTSYEr+/8K9DF692tdR4SEZPNoqs+lJk3WJVooQO0vODBU
         86HotH8N887NrM4IHzqu79f8J3P8BR0EqxrQPZJQXSY0OQsV7ToVQ9Zu7TXeJzhrV2V0
         EifZTd/yA5RlPAU8W80E72WgoF4fM4XQZyh0N+wgLW7cG4KzNNvtit93t1+vL1RPU7/q
         Q588uZrY/TqF2DT9YfDTK03QkgtE1m6P9ZhTZwKzwlBkqB51UYUV5e1mi+m3oBPCArhi
         dahQL4pM3/LilL6w/Ym099Aznhq1QuWimb5JeONwZRlG269KoO5AdPuTJ5uw35E7rYbx
         LrPQ==
X-Gm-Message-State: AOAM532ur2yKCAhgs/fH0TCx2Jlckbb3tt3qC/riiG1pPYfpVW20lvjB
        XX9uzX6EgyyDi2o/BwCHRTY=
X-Google-Smtp-Source: ABdhPJx+RHJDlWRBydGsMDNESumPn7fohMgnWm/IsMUtg/EAwn/mNh1mHSYHhLadFHOzD269hdoBBw==
X-Received: by 2002:a92:d1d0:: with SMTP id u16mr20748595ilg.7.1592115547052;
        Sat, 13 Jun 2020 23:19:07 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id c3sm5798908ilr.45.2020.06.13.23.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 23:19:06 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu
Subject: [PATCH] Input: stmfts: fix ref count leak in stmfts_input_open
Date:   Sun, 14 Jun 2020 01:18:59 -0500
Message-Id: <20200614061900.75253-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

in stmfts_input_open, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index b6f95f20f924..1ef282d7cc14 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -339,11 +339,11 @@ static int stmfts_input_open(struct input_dev *dev)
 
 	err = pm_runtime_get_sync(&sdata->client->dev);
 	if (err < 0)
-		return err;
+		goto out;
 
 	err = i2c_smbus_write_byte(sdata->client, STMFTS_MS_MT_SENSE_ON);
 	if (err)
-		return err;
+		goto out;
 
 	mutex_lock(&sdata->mutex);
 	sdata->running = true;
@@ -367,6 +367,9 @@ static int stmfts_input_open(struct input_dev *dev)
 	}
 
 	return 0;
+out:
+	pm_runtime_put(&sdata->client->dev);
+	return err;
 }
 
 static void stmfts_input_close(struct input_dev *dev)
-- 
2.17.1

