Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95361C9417
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 17:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgEGPLZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 11:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726267AbgEGPLY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 11:11:24 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C04C05BD43;
        Thu,  7 May 2020 08:11:24 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f15so2172334plr.3;
        Thu, 07 May 2020 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wWd34HVuHsrECXOLfOiza9hgo5IiNk8HLibDa9qt1hk=;
        b=B3HXldLBkSj6/7aetEGJvwO+sF2lj5StckhAfs/XMYWbmV5GzBhYyRmbkHMLnph+r0
         8TbstkBNZfIFvAMSK8mmN5wrBMHE/f26nqc+YtKBBA9+RAWIiUoHXMBd9g0jHrt5pyVk
         aUQiPXKHssV7ZnBtMffGPbiY9a2rxkdphaN0k2MAOILpEcX67G60y3q4dFbmOLLUMXld
         C8RhgFIyPlUNx0N7sqBFkw1jXIRetHeUv43S2dyBALXxdKAgZ59fmCAc5DoepTvkSR5m
         B+i2LPCfsunyp/YcEY3D8GCp5GFkSg3YeVsTltAfYEg7AuVI8qOlbL8WByCtPZTCv/f7
         Lqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wWd34HVuHsrECXOLfOiza9hgo5IiNk8HLibDa9qt1hk=;
        b=pdPWdsfqEcPdFubV8BTKPEVrqGZza40IxMjx7YOT4ACZ1mkcq0bFRRhCNGf9ZPVl4g
         FjryN+tEOuTySBbnkQhwmQwNxYXiD8ryuoQFG7RZWZmSMMVNEhHgXZS39uHnhTkVVEbJ
         75EmKtm9xqca5H44X+omesKFbFv6T/DplxdNXYqVS9hi2uBe55vRNfwhu04FEkeH6lSO
         2TCASeKZeudc8MqAJv09VzwvfkU8Btk3AVX54jd+fDZ5DleY7SJSmjamFlaeuwSYPHTt
         wPMXwdl2LV/yZw85TwrEJL/OGPHEMIuzU1y7RoCEaWNtlfXdZoUKwTyokpz9w3siUWmY
         j1zA==
X-Gm-Message-State: AGi0PuboETVB6GapAbQON0fm5bAXNu6YLy20aRu6pRcxkLjDDZ30bW0E
        Omwo9MwCUq9N8wIH8JKbpsM=
X-Google-Smtp-Source: APiQypIZ2IswbwUyjeqOeecIJgB7zUIvYdlUQDltk0PzFqqH5fkP457/E1W/wE70RR/bU0/jxhGcmg==
X-Received: by 2002:a17:90a:fb89:: with SMTP id cp9mr608836pjb.40.1588864284203;
        Thu, 07 May 2020 08:11:24 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id gm3sm144620pjb.49.2020.05.07.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 08:11:23 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] Input: s6sy761 - add missed input_unregister_device
Date:   Thu,  7 May 2020 23:11:15 +0800
Message-Id: <20200507151115.792516-1-hslester96@gmail.com>
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
 drivers/input/touchscreen/s6sy761.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index b63d7fdf0cd2..cd8a7bd9be1e 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -464,21 +464,28 @@ static int s6sy761_probe(struct i2c_client *client,
 					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 					"s6sy761_irq", sdata);
 	if (err)
-		return err;
+		goto err_unregister;
 
 	err = devm_device_add_group(&client->dev, &s6sy761_attribute_group);
 	if (err)
-		return err;
+		goto err_unregister;
 
 	pm_runtime_enable(&client->dev);
 
 	return 0;
+
+err_unregister:
+	input_unregister_device(sdata->input);
+	return err;
 }
 
 static int s6sy761_remove(struct i2c_client *client)
 {
+	struct s6sy761_data *sdata = i2c_get_clientdata(client);
+
 	pm_runtime_disable(&client->dev);
 
+	input_unregister_device(sdata->input);
 	return 0;
 }
 
-- 
2.26.2

