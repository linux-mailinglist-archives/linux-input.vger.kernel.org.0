Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F0634296F
	for <lists+linux-input@lfdr.de>; Sat, 20 Mar 2021 01:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhCTA1i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 20:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTA1U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 20:27:20 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB34C061760;
        Fri, 19 Mar 2021 17:27:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id v8so3694122plz.10;
        Fri, 19 Mar 2021 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LIfAiKMbasGNOasGZfkQ+a3+Kv8U74AyNPwiY1+xi0I=;
        b=uEw4w2iLVHPG0fJofmmmmoqifikNfP+/AoJmablcbwQQiZxfrVffvjdz7RqdQTKyDi
         SRWQOctMGUsHlcn4fKTLg59aqndu+19g6rwEYXeAcsL3jj5Iyo6s/h+d7MJqnoywNMEv
         M9rWyglmUmI4jFnphek2qzC7BSjP0viUMctT1tBq6GHjMP2lqmy18B9kJnYN/m0cz3ZL
         lpz+0C7KIIjKIjQEQJ854MBos+nrGUDtEX1qDjHhvtqGQYFT2eCoKXpLcFMap43lP4XQ
         A/IpONaQM6rZVXw2u0T89deqtMgYyAp38W9SHF9RKGjWOA9HEq36RSyQ7kG+I5FydC/N
         1VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LIfAiKMbasGNOasGZfkQ+a3+Kv8U74AyNPwiY1+xi0I=;
        b=eOLDpxcuro7+2+PoW01y0YTER92m6t8fyJoqVRuWHFZcw0YEEs5AEOOUp68BrBt8AI
         2K3W5bt0OWDt9FpBW/lCNpm9GXAd0VFGT+vZLp+yCmeZkJC/hbYvV2vnlyvQJijnC6F0
         euMoWEtYcgJnnyunOZVHIyKN24PfN0bhssMvNPoDCdqAi6ymK2japptpMRk55aZH1BIW
         zWqF3r4ImoH0OCFoxk4FPXpvSrSZjjJb2aMYgYUQL4MzYeLTcfLXsz3l25f4qCohfxi0
         vVOCGHaXcFSnfNg9j1nE+LD7QIaQF3Ytf3lQ8xBxGKlPDBOk7fb0e3/GxYcqYtVSqw6f
         yduw==
X-Gm-Message-State: AOAM530wK3bQOQ3aP5sgOx2t6/Dm6zrDSC8xLdzr7n1lk800WW3JiQow
        lNA/DxPdXH/NiAr6c3p5aYVKAQtDOww=
X-Google-Smtp-Source: ABdhPJycP1Ktn0eveHth0/NXrwCXqUOVjsbqcd/PxG8fwDidOOKmw6sCLgTgJzcAAXXTnpS1dp110A==
X-Received: by 2002:a17:903:2301:b029:e4:9026:4c7b with SMTP id d1-20020a1709032301b02900e490264c7bmr16442674plh.76.1616200039685;
        Fri, 19 Mar 2021 17:27:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a468:a574:c1f5:b1a1])
        by smtp.gmail.com with ESMTPSA id s3sm6819678pfs.185.2021.03.19.17.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 17:27:18 -0700 (PDT)
Date:   Fri, 19 Mar 2021 17:27:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: do not use down_interruptible() when unbinding devices
Message-ID: <YFVBZCrmzvNJQstT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Action of unbinding driver from a device is not cancellable and should not
fail, and driver core does not pay attention to the result of "remove"
method, therefore using down_interruptible() in hid_device_remove() does
not make sense.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 56172fe6995c..ec63a9ff40dc 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2300,12 +2300,8 @@ static int hid_device_remove(struct device *dev)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct hid_driver *hdrv;
-	int ret = 0;
 
-	if (down_interruptible(&hdev->driver_input_lock)) {
-		ret = -EINTR;
-		goto end;
-	}
+	down(&hdev->driver_input_lock);
 	hdev->io_started = false;
 
 	hdrv = hdev->driver;
@@ -2320,8 +2316,8 @@ static int hid_device_remove(struct device *dev)
 
 	if (!hdev->io_started)
 		up(&hdev->driver_input_lock);
-end:
-	return ret;
+
+	return 0;
 }
 
 static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
-- 
2.31.0.rc2.261.g7f71774620-goog


-- 
Dmitry
