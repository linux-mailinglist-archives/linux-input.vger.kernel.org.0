Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 780F2A4B22
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2019 20:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbfIASXV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Sep 2019 14:23:21 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37799 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbfIASXV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Sep 2019 14:23:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id b10so475488plr.4
        for <linux-input@vger.kernel.org>; Sun, 01 Sep 2019 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=3G1nRQbjs8SFiG1yiAC43aJ9B5eOgf9o/zHOW2uk/Jk=;
        b=ADU5QFdgu0CyiNCFlch2vvAeTZ1ACP4klB8PKxA5d7m9g/AeoLDiyEbpHKLcR+rdqr
         1XmPV/9ZI9rn+J62POtlBc66BWNW3APxwv/hBL9mqCJ9ZXHHB99FsDQmpLkY7qwYnbm7
         4Io7yAR68DVLvds9/kNJ55A5aN43HFz7SN+9ySQPdOjzwru7l0NglYR3itrn28gvsLms
         noLAQ6qCL8nineT70+DsdsL2r67hqx/Dai3sFnM2CjvUREMxFCc+C4XkamBG9XBUQPg6
         hlqIS82IjuNKGs2+WqkSKTtRZx2LTzpsukjeZoVnnsOKcoDVXjTDVCcdIH3PQcgRi3b0
         hCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=3G1nRQbjs8SFiG1yiAC43aJ9B5eOgf9o/zHOW2uk/Jk=;
        b=aYZJnZNZGJ5RYtr/HaghyuMds4Ul/Q7VAuvPsO9fetBE8cnhAITtML+hXYI+BhiTvL
         YOmUma+nH/I7XCewVe0ZToHmROd1uiPApSH1YWNVsrrcyUTWP/XU1r+C3vtdU+ALE3pz
         7myP8oWZ3z8faRIRq4GusKOHLvg/xtNwKDiKJZLsybCOc1V9s4wXYPfb3mYB/g161Naq
         vvDMBc51PcyI7RvzQyXTQl60zMjV/L3PwvY7gofI4k8Pu0LetZUdn7lCj7jFFyLlltWO
         guO3lFBsIuUG363ZTUMKwnN6A2E0glAPB8F2XwUTolloG1JVl1LiA1pAXZSGk1AL15Rn
         dKlQ==
X-Gm-Message-State: APjAAAVursUao1r7IWBvh+lWHHABoa3mzKHY8qOrJElad4JPLCuRYaSN
        vYG9LYPNtCEX8Fe6VgR11+Y=
X-Google-Smtp-Source: APXvYqzyaW6hW9TytFUpjpf9xvSsMdssCGj0OIX5JV3JiY5PlRmqRybnHE9bM56Zk6EhZUDSRfO7UQ==
X-Received: by 2002:a17:902:6b88:: with SMTP id p8mr25452515plk.95.1567362200258;
        Sun, 01 Sep 2019 11:23:20 -0700 (PDT)
Received: from ahmlpt0706 ([106.222.7.131])
        by smtp.gmail.com with ESMTPSA id 136sm15333416pfz.123.2019.09.01.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2019 11:23:19 -0700 (PDT)
Date:   Sun, 1 Sep 2019 23:53:09 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     robh@kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] input: touchscreen: Add NULL pointer check before dereference
Message-ID: <20190901182309.GA5574@ahmlpt0706>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In sx8654_probe function, if call to device_get_match_data()
return NULL, it dereferences driver_data from 'id'.

To avoid NULL pointer dereference, add check to make sure
'id' is not NULL.

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 drivers/input/touchscreen/sx8654.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index de85e57b2486..7121a3d41555 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -333,7 +333,7 @@ static int sx8654_probe(struct i2c_client *client,
 	dev_dbg(&client->dev, "got GPIO reset pin\n");
 
 	sx8654->data = device_get_match_data(&client->dev);
-	if (!sx8654->data)
+	if (!sx8654->data && id)
 		sx8654->data = (const struct sx865x_data *)id->driver_data;
 	if (!sx8654->data) {
 		dev_err(&client->dev, "invalid or missing device data\n");
-- 
2.20.1

