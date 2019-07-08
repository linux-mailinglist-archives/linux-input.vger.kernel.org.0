Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447B661E71
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2019 14:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbfGHMdc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Jul 2019 08:33:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33868 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfGHMdc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Jul 2019 08:33:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so8218054plt.1;
        Mon, 08 Jul 2019 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KBezzKXC+quBmYtuOLs/KQOhhcAej9/sFp0EhMpVed4=;
        b=lbiuTy4NTNKv7+lo/RiO5xjrasMyJSle7JXu4HwcBCnmxVuYZm1ZKinniHnW7atbW/
         F4go8xH1I+droR2rm3k4ju1BcKA10vQxv23tCsaBNROc6sjh0Qa6grNQe5sBhO+p87pX
         4Fgtxg4RXC5sTlTyPpSd09lGUcY9ebXKXpO8PzCNUiQWpkh9jVB71kfNSQoEUi7UxZ4f
         e7UG0BJpIQdE/Ix2ghhZ+EoIIqWmxVVtNbNhqaeLpkqP3kMq4QicPL5K0Kuh8TvyQlbH
         FGSuXotNb2lUABwbMEPSWhp474/U5pzXb4ehG7oyrSvvYFDvvkRHQLGtjgPwU6N++5aH
         y37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KBezzKXC+quBmYtuOLs/KQOhhcAej9/sFp0EhMpVed4=;
        b=mmFRkMvll1dWzjbQ3+wKjQRcloNiLisxD92ulyJIz2CUzSj6hxEOrI/4iD5BvJ8Nbh
         A9Udqx8VAsD7Hl6qC+u/oGHdUHaV8tcW/RPE0rv+/ZC/h9UYBZG1lrszTsfo4JYLXLxw
         lJhewPMkEUm0fQPBBX8MRDsV8h21ieOuLlnjE/IoYpcj3LLUhmXtl/d7tUPt8VLY7CVV
         nZ0Kr0r3xx+EQR9gCwMEF9nXC+/bO0jdjqLAhRoAzlOrPHRUxWMB340y7ROIYYDaV8/k
         t8ADNztnM8RhXRAEWhmKJNS1zutpi2dO/ETnELCO54FaKASe/rNfqzKMrVOrB/46Hfp7
         /Sbg==
X-Gm-Message-State: APjAAAVXSgB8PB4ydidN5jmOn41XCJREMcCESIz5u98CpiEZwAGDnlqq
        9bhtHx3wsEix+4ykeoo7b7U=
X-Google-Smtp-Source: APXvYqwAEbLV7qkevKSnyycTL/ijhsv7uxN4JSwyzV/xBJqGacY6oo2Q77Q4VJoUtYtJbIWmT/pp9A==
X-Received: by 2002:a17:902:e2:: with SMTP id a89mr24664291pla.210.1562589211477;
        Mon, 08 Jul 2019 05:33:31 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id t10sm17102282pjr.13.2019.07.08.05.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 05:33:31 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 07/14] Input: cyapa - Replace devm_add_action() followed by failure action with devm_add_action_or_reset()
Date:   Mon,  8 Jul 2019 20:33:23 +0800
Message-Id: <20190708123323.11943-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_add_action_or_reset() is introduced as a helper function which 
internally calls devm_add_action(). If devm_add_action() fails 
then it will execute the action mentioned and return the error code.
This reduce source code size (avoid writing the action twice) 
and reduce the likelyhood of bugs.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/input/mouse/cyapa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index dfd3873513e4..e1d9ab558ecf 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -840,10 +840,9 @@ static int cyapa_prepare_wakeup_controls(struct cyapa *cyapa)
 			return error;
 		}
 
-		error = devm_add_action(dev,
+		error = devm_add_action_or_reset(dev,
 				cyapa_remove_power_wakeup_group, cyapa);
 		if (error) {
-			cyapa_remove_power_wakeup_group(cyapa);
 			dev_err(dev, "failed to add power cleanup action: %d\n",
 				error);
 			return error;
@@ -957,9 +956,8 @@ static int cyapa_start_runtime(struct cyapa *cyapa)
 		return error;
 	}
 
-	error = devm_add_action(dev, cyapa_remove_power_runtime_group, cyapa);
+	error = devm_add_action_or_reset(dev, cyapa_remove_power_runtime_group, cyapa);
 	if (error) {
-		cyapa_remove_power_runtime_group(cyapa);
 		dev_err(dev,
 			"failed to add power runtime cleanup action: %d\n",
 			error);
@@ -1298,9 +1296,8 @@ static int cyapa_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_add_action(dev, cyapa_disable_regulator, cyapa);
+	error = devm_add_action_or_reset(dev, cyapa_disable_regulator, cyapa);
 	if (error) {
-		cyapa_disable_regulator(cyapa);
 		dev_err(dev, "failed to add disable regulator action: %d\n",
 			error);
 		return error;
@@ -1318,9 +1315,8 @@ static int cyapa_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_add_action(dev, cyapa_remove_sysfs_group, cyapa);
+	error = devm_add_action_or_reset(dev, cyapa_remove_sysfs_group, cyapa);
 	if (error) {
-		cyapa_remove_sysfs_group(cyapa);
 		dev_err(dev, "failed to add sysfs cleanup action: %d\n", error);
 		return error;
 	}
-- 
2.11.0

