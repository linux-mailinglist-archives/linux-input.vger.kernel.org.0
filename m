Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDAE67957
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfGMIsb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:48:31 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37329 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfGMIsb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:48:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so5923620plr.4;
        Sat, 13 Jul 2019 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=tDI8G+2+M7z8o0TmWljuhtuQWAg2+Q4ptZoMEkLjlJs=;
        b=Dk2VHMl3Wm8ORpxqr3YMKYObR6/AiQmNCMddaKSceCrD7hDX5cV89RDlyzzPY/bMaB
         x8nVjAS2TxIZdEs4YmTnQgQ84+XrDq9u2a9M+tfH027OO/9KfbiZ1/aQMPCpM0j4Dy48
         JiReAfQgX25inHIaJAYS0e7ESULAj6ZxbSR2pFf3SHnvQ0QSQ4zcBp1HwzE5ka3Q9VR1
         B5SLJvaH3Av1FO7DqjQM9E2hrD6pvIYRzSWvA4RNYAlzh6AeWB6XjY1iTyI3WwaJaAma
         5W95Ku2bVZc8QKfGVBzCqDmPYNJVUkSXDxx6lA4jdMHcw12XhJm3QgjM8LDvOekp76wH
         fR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=tDI8G+2+M7z8o0TmWljuhtuQWAg2+Q4ptZoMEkLjlJs=;
        b=e+QYwI2Sp6+XEFhrPLx7Uev06tsAcbIDAJAVEfoCSzh/Zg07eTng2v6Hc9QzCla5n3
         +synwp89yO0lXlxA7xTaw3WNrS1+8jK93bOhDdBwiGS6bj2ZndzOxN+ajTTRlumIkANi
         UajGq8R79mDWlnc6S9ZeE8472w/aXTDzrZFqvTOG6VXOKQCpGXxKs8MU0jOR4V6ZaDls
         dICWVAymGO6GyooJl3qTUgZR0LBjjtSZdrndNO2+2NHVC3G9aopNMUR912MZuMoPbJ+o
         o76b124IQ8kn4eYx7jN4EUea1F9RtJuv2XBvSj5gJAnU1zQG/ebQ7joDLvR30QCENRLx
         0c3Q==
X-Gm-Message-State: APjAAAUkcbr6KA5XR2XtfUbFDNV1QSdq3GYI/OFVXrSBQ6UBuOMHA1dg
        wxsWFOJyeAlQpINGKMHdywGekadM80g=
X-Google-Smtp-Source: APXvYqzJZ70mXs5OpPKDchKgdhqsNOyPFc8RBCjgvWH8a90y1q2Q0k7WfxcQ3Fm5GiWt5s1AVfbjuA==
X-Received: by 2002:a17:902:fe93:: with SMTP id x19mr15449050plm.77.1563007710051;
        Sat, 13 Jul 2019 01:48:30 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f12sm10239581pgo.85.2019.07.13.01.48.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:48:29 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:48:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyapa - switch to using devm_device_add_group
Message-ID: <20190713084827.GA103694@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of installing custom devm cleanup action to remove attribute
groups on failure, let's use the dedicated devm API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cyapa.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index dfd3873513e4..c675f156948b 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1238,13 +1238,6 @@ static const struct attribute_group cyapa_sysfs_group = {
 	.attrs = cyapa_sysfs_entries,
 };
 
-static void cyapa_remove_sysfs_group(void *data)
-{
-	struct cyapa *cyapa = data;
-
-	sysfs_remove_group(&cyapa->client->dev.kobj, &cyapa_sysfs_group);
-}
-
 static void cyapa_disable_regulator(void *data)
 {
 	struct cyapa *cyapa = data;
@@ -1312,19 +1305,12 @@ static int cyapa_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = sysfs_create_group(&dev->kobj, &cyapa_sysfs_group);
+	error = devm_device_add_group(dev, &cyapa_sysfs_group);
 	if (error) {
 		dev_err(dev, "failed to create sysfs entries: %d\n", error);
 		return error;
 	}
 
-	error = devm_add_action(dev, cyapa_remove_sysfs_group, cyapa);
-	if (error) {
-		cyapa_remove_sysfs_group(cyapa);
-		dev_err(dev, "failed to add sysfs cleanup action: %d\n", error);
-		return error;
-	}
-
 	error = cyapa_prepare_wakeup_controls(cyapa);
 	if (error) {
 		dev_err(dev, "failed to prepare wakeup controls: %d\n", error);
-- 
2.22.0.510.g264f2c817a-goog


-- 
Dmitry
