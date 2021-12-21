Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE4347C75F
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241755AbhLUTR4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241754AbhLUTRz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760D9C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:55 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2401939wmj.5
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9DSFngfggMTRU52qjDLCHxShA19z3IYvtKyKtu3j4z8=;
        b=WO3nfI/GdUOiP6AfWmOzgudE4OABCS8qWUW1n4G4uFIXYuMvTQV32sBBTV6cwXufpI
         r6Csdcq6ksgzhLak7Ansn5A7IhHfI11E1bmJV+F5izXCH+EmMzszfK3aaKRxLkIb6g+l
         sNSiydjKg8x2p6G/VwfG2LWYBF7rjnyCGtVsf5pKCN9R7YkahOo93MAA91oNKU/COsv+
         EP1VuW1sHlSUn9c6dCz7NpfNVBrKM+FRLNM+tQc7EUjpKUydOgsmm6UME/XvaFMHosf5
         eo4eLiIPAn0JD98yxLYGYmMB4O4AaB4qOVOBt5nbAkfcVzpyVOAwMFbAI/+b/fA7LLYr
         Yw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9DSFngfggMTRU52qjDLCHxShA19z3IYvtKyKtu3j4z8=;
        b=l7wsp739M74Ot34hAziJIl64AeV7JVArmZGW87fSmjl5JbYbV69VwugHf06tz8yCoV
         T639o7i+1E42hX3kbCyex9NmQav+POdSSWAb3H4RDWKyX7cBmEOuADuEZ+SDVHHU/1tW
         hvLFSshGBXVwVL/Jm61GNLPxCw4Y71//PSdQc2YnTyaxnN+CYqvd89NHIWgFqB7fITlb
         xwaCrYAHXDj+dJHQbOmA7YEFr+r6uXBv+UVjO7VxtsI/TBBg4Yehija+0fh2QxAotNHm
         XmjOJQAwBhxmHEFUOB7d4xM9E6Ukj5q4B23xgW3/eFNkLdbmZOS/o4zEMUp44aAFrtK6
         5Kcg==
X-Gm-Message-State: AOAM533/FhOi7z+UTz23xSPKto/AeKbo9XCSKNajCPB8/VZx/YS5Xd1E
        VHxPBLpf3q7Y5IAHlNoi17v29GWs+t1VCI7ST7s=
X-Google-Smtp-Source: ABdhPJxvHX8WLsvCcIqUAanqMioG/bNqidxVgeq3VSTy0oUSoQLiYglyOklAm/UmwDbmO+MwMa20Dg==
X-Received: by 2002:a7b:c202:: with SMTP id x2mr4006943wmi.57.1640114274051;
        Tue, 21 Dec 2021 11:17:54 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:53 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
Date:   Tue, 21 Dec 2021 19:17:38 +0000
Message-Id: <20211221191743.1893185-14-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a function to switch off ABS_PRESSURE generation if necessary.
This may be helpful in case drivers want to generate ABS_PRESSURE events
themselves from ABS_MT_PRESSURE.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input-mt.c | 18 ++++++++++++++++--
 include/linux/input/mt.h |  4 ++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 44fe6f2f063c..e0bf5917a8b5 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -52,6 +52,7 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 
 	mt->num_slots = num_slots;
 	mt->flags = flags;
+	mt->abs_pressure_gen = true;
 	input_set_abs_params(dev, ABS_MT_SLOT, 0, num_slots - 1, 0, 0);
 	input_set_abs_params(dev, ABS_MT_TRACKING_ID, 0, TRKID_MAX, 0, 0);
 
@@ -244,12 +245,14 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 		input_event(dev, EV_ABS, ABS_X, x);
 		input_event(dev, EV_ABS, ABS_Y, y);
 
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit) &&
+		    mt->abs_pressure_gen) {
 			int p = input_mt_get_value(oldest, ABS_MT_PRESSURE);
 			input_event(dev, EV_ABS, ABS_PRESSURE, p);
 		}
 	} else {
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit) &&
+		    mt->abs_pressure_gen)
 			input_event(dev, EV_ABS, ABS_PRESSURE, 0);
 	}
 }
@@ -312,6 +315,17 @@ void input_mt_sync_frame(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_mt_sync_frame);
 
+void input_mt_pressure_toggle(struct input_dev *dev, bool toggle)
+{
+	struct input_mt *mt = dev->mt;
+
+	if (!mt)
+		return;
+
+	mt->abs_pressure_gen = toggle;
+}
+EXPORT_SYMBOL(input_mt_pressure_toggle);
+
 static int adjust_dual(int *begin, int step, int *end, int eq, int mu)
 {
 	int f, *p, s, c;
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 3b8580bd33c1..c870a513bde1 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -38,6 +38,7 @@ struct input_mt_slot {
  * @flags: input_mt operation flags
  * @frame: increases every time input_mt_sync_frame() is called
  * @red: reduced cost matrix for in-kernel tracking
+ * @abs_pressure_gen: emulate pointer pressure
  * @slots: array of slots holding current values of tracked contacts
  */
 struct input_mt {
@@ -47,6 +48,7 @@ struct input_mt {
 	unsigned int flags;
 	unsigned int frame;
 	int *red;
+	bool abs_pressure_gen;
 	struct input_mt_slot slots[];
 };
 
@@ -111,6 +113,8 @@ void input_mt_drop_unused(struct input_dev *dev);
 
 void input_mt_sync_frame(struct input_dev *dev);
 
+void input_mt_pressure_toggle(struct input_dev *dev, bool toggle);
+
 /**
  * struct input_mt_pos - contact position
  * @x: horizontal coordinate
-- 
2.34.1.307.g9b7440fafd-goog

