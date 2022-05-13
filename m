Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29158525F3D
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379114AbiEMJkE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379028AbiEMJjx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:53 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15F52A768E
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:50 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u3so10681071wrg.3
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VLGDt9e4tXlA7Mt8BvOVBgx9tBgjbNn1Ls+c9OEeFJ0=;
        b=kc/+pCQKX0fAoMH+ATG43DWyWNMpT3IW+Lk7j6oUlRKuVyrZwAwa6C5NgDXP0usiH1
         42FQVkVZK6Kb8llWqyRQNewAAALW3382SLIt1JPMTFL30uBNkVkhFDq+1i5Sw41CUdcq
         j0IhF+E1T8RJ8uai+XdQFCaE3pDIagECrRdYmpx5FgIFERndbYMStl7RpQtA+ERm0hU3
         0zv+w4bblbsZbNiS9plvHZ/9FlOI/xAu5Mc/H2lDiEVxCXXokJihxx3+wlOwuME6TSPw
         4tQg3515EQ2bJE7JcsmlB/lJTRIZfuf9nQ+WR+OxWV6W5qjHPKs/ecIqr173Dx8uGILP
         K5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VLGDt9e4tXlA7Mt8BvOVBgx9tBgjbNn1Ls+c9OEeFJ0=;
        b=t9h5Jbq9mtW0bDzWjd36z3e8vAMnOmMKWfmRJ7JR/KrWpeK06Y0/p/Tj9bEALamxV8
         2ANUYytXpjNdvE9MPPYP3NDc9UJhfc95zl5Ilo9f2WSf7ZrNhZQKx9MycjBmVDJzb1QN
         Bjn/M87cGeofUk8F3RXaQHRVWlGD38DcPjWl+s6JWaBGDpeQeimHV/5HqYje97Lc2XMt
         XEXokBfqd9G1mJQCMYDVYttGH7TDy60eoDjzGd14WaOeukrQKdRXM20CQG4/dwKIl1Qx
         uiPMKVjMGYjG+iJPBTAqZo5Q5m3OIsx9MwEy+xXvkNlqapSUhJC85ILZSOHzXrbWQ7rX
         3NDw==
X-Gm-Message-State: AOAM531igDuAJKLUvsSAscQeDkIl2KO2340bvyp4TRcR2ul3XHO1TIe+
        wLrfqCciiIXtF5L8/jrMK7pQQS6km2SuxUUSjoM=
X-Google-Smtp-Source: ABdhPJxc3y+BSgKQdqJ7+4jq0CaMkPTiAEfL9nU/LCXcrIbIXhYCU8+YI+JM6jwkeG/rJu6PVdEdoQ==
X-Received: by 2002:adf:df05:0:b0:20a:c402:6811 with SMTP id y5-20020adfdf05000000b0020ac4026811mr3157783wrl.275.1652434790322;
        Fri, 13 May 2022 02:39:50 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:50 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 10/17] Input: MT - add INPUT_MT_MAX_FORCE flags
Date:   Fri, 13 May 2022 09:39:20 +0000
Message-Id: <20220513093927.1632262-11-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a flag to generate ABS_PRESSURE as a maximum of ABS_MT_PRESSURE across
all slots.
This flag should be set if one knows a device reports true force and would
like to report total force to the userspace.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/input/input-mt.c | 16 ++++++++++++----
 include/linux/input/mt.h |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 44fe6f2f063c..6dcef47aac71 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -197,6 +197,7 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 	struct input_mt *mt = dev->mt;
 	struct input_mt_slot *oldest;
 	int oldid, count, i;
+	int p, reported_p = 0;
 
 	if (!mt)
 		return;
@@ -215,6 +216,15 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 			oldest = ps;
 			oldid = id;
 		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+			p = input_mt_get_value(ps, ABS_MT_PRESSURE);
+			if (mt->flags & INPUT_MT_MAX_FORCE) {
+				if (p > reported_p)
+					reported_p = p;
+			} else if (oldid == id) {
+				reported_p = p;
+			}
+		}
 		count++;
 	}
 
@@ -244,10 +254,8 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
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
index 3b8580bd33c1..b23216cf9923 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -17,6 +17,7 @@
 #define INPUT_MT_DROP_UNUSED	0x0004	/* drop contacts not seen in frame */
 #define INPUT_MT_TRACK		0x0008	/* use in-kernel tracking */
 #define INPUT_MT_SEMI_MT	0x0010	/* semi-mt device, finger count handled manually */
+#define INPUT_MT_MAX_FORCE	0x0020	/* choose max force from slots pressure */
 
 /**
  * struct input_mt_slot - represents the state of an input MT slot
-- 
2.36.0.550.gb090851708-goog

