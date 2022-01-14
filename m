Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B058248EFF4
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243100AbiANScl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243134AbiANSce (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:34 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425E8C061747
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:34 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay4-20020a05600c1e0400b0034a81a94607so6318001wmb.1
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MvDm6chj8/OR9+iaUSWg8PUJVBeuAtEH6jWvTqle30=;
        b=WfWX+StJf1W7YZDUDy2Y4/pzgqNnbJB5yhmqQXNI6m/pBs+Jk/U9SjeF2YR5Tj3++2
         2aUAkfdzTv1uEP2ap4ejIVZDsi8Pc1wY2QplVY2fVLVVmnL4XITZfI+1KNMcvw471FO+
         A4vFSH5Uuij0PLt+VdHIvbstf4vunqVEcgiplqBoxcNGQS3D0sBBTXeXuqwY54XiOYYs
         igIf8ilPHkLPky21Ni1/2ccXX2t4mp+BOOawGBP/m/rf7Q05PlnhjRhKpbE91tw2sI7X
         6saPybCHbTrmE8xCcvervO921XmDQ9thEWnRsdoKkzKoPXp9DUySuhcHT3OFnDEQVjd4
         LNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MvDm6chj8/OR9+iaUSWg8PUJVBeuAtEH6jWvTqle30=;
        b=qKFU1xu+eK24w2+GpMXKlxAAREHfTE2TsVgYtRzCvJumGbYwrhlGzglELsx/kdH5M2
         WjxAezZxVuZomxygpU0KjUcMq8QUpHwihczgEuTORpQN9mWcoqXj3ygWKI6JeXP/JbyD
         gZuR/wW8IboSrKEAF+ViOFArSYW781YUGZbaybnYf9Vwgj7lBEDlog1OtESvUNI3uXlA
         0X6r1jm+Pi8psQWv8tOYwIfT7TgOfWYYflWT64A2wq6iSQGG6PKUmg/NwGV2iqtrB1Mj
         BopQx+wp0OXjDN/06Jmb9WXBboBwH+cukJukMdzZDAFC1jGZsGE6SUx1E+THMaCcUptC
         tGrw==
X-Gm-Message-State: AOAM532F5qqOQN+nOo4s9G6Q2ticE5ZUcWDf9XUufgOvic69F4WfS2Bk
        Qru71344uI3FY63PT9WxScLZnabH71thh53qjPE=
X-Google-Smtp-Source: ABdhPJxXb0FldDTrIzr8XBsZPladkRnhhCwiEWF2dQnXpNTtgHf95ZmXFtyY7Dw50Un9Ph2GjP8DkQ==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr9543167wrn.176.1642185152892;
        Fri, 14 Jan 2022 10:32:32 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:32 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 11/16] Input: MT - add INPUT_MT_TOTAL_FORCE flags
Date:   Fri, 14 Jan 2022 18:31:47 +0000
Message-Id: <20220114183152.1691659-12-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a flag to generate ABS_PRESSURE as sum of ABS_MT_PRESSURE across
all slots.
This flag should be set if one knows a device reports true force and would
like to report total force to the userspace.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input-mt.c | 14 ++++++++++----
 include/linux/input/mt.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 44fe6f2f063c..d84768329083 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -197,6 +197,7 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 	struct input_mt *mt = dev->mt;
 	struct input_mt_slot *oldest;
 	int oldid, count, i;
+	int p, reported_p = 0;
 
 	if (!mt)
 		return;
@@ -215,6 +216,13 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 			oldest = ps;
 			oldid = id;
 		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+			p = input_mt_get_value(ps, ABS_MT_PRESSURE);
+			if (mt->flags & INPUT_MT_TOTAL_FORCE)
+				reported_p += p;
+			else if (oldid == id)
+				reported_p = p;
+		}
 		count++;
 	}
 
@@ -244,10 +252,8 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 		input_event(dev, EV_ABS, ABS_X, x);
 		input_event(dev, EV_ABS, ABS_Y, y);
 
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
-			int p = input_mt_get_value(oldest, ABS_MT_PRESSURE);
-			input_event(dev, EV_ABS, ABS_PRESSURE, p);
-		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
+			input_event(dev, EV_ABS, ABS_PRESSURE, reported_p);
 	} else {
 		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
 			input_event(dev, EV_ABS, ABS_PRESSURE, 0);
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 3b8580bd33c1..58d5402d382a 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -17,6 +17,7 @@
 #define INPUT_MT_DROP_UNUSED	0x0004	/* drop contacts not seen in frame */
 #define INPUT_MT_TRACK		0x0008	/* use in-kernel tracking */
 #define INPUT_MT_SEMI_MT	0x0010	/* semi-mt device, finger count handled manually */
+#define INPUT_MT_TOTAL_FORCE	0x0020	/* calculate total force from slots pressure */
 
 /**
  * struct input_mt_slot - represents the state of an input MT slot
-- 
2.34.1.703.g22d0c6ccf7-goog

