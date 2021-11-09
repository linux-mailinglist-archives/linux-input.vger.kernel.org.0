Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF2444A84D
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 09:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244042AbhKII3B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Nov 2021 03:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbhKII3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Nov 2021 03:29:00 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF58C061764;
        Tue,  9 Nov 2021 00:26:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u17so19559849plg.9;
        Tue, 09 Nov 2021 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0bK2Rvf8dX7EezezcjZ3iAVMSzAxI9Dy5fpPOnbhws=;
        b=DZOR3HrU39gR3T/iHxu8Uilzukk5pFSSmbyJwfGPR6ubwwDz+wXeJFbebQT2wuwEYJ
         TsLvjJUzTL2Qp4eD1+ANRdculRcKnwleA+8qWVFZ6GZaon+hYgVTJfrYUwhYykR5vlTP
         3CMBM9Z9KcpyHUdTjIKJ153IlFAfA/0BXKt1i8I3mUsd8Eqy7r3NJKiW1OJBGQEb10xq
         btCAj9nXPATZDa6cSyu06k62WrAa4F0c/Y3bQ1BbiGUpoNXv9X/nyYNRrzRtczUp3YH+
         ufoqM490E8bzweZ+66Y/t3Lgv5MUy0FMXICLk4B0XvuNxQ/jvIPHS46MjShPjYWCDp6y
         dmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0bK2Rvf8dX7EezezcjZ3iAVMSzAxI9Dy5fpPOnbhws=;
        b=mChlZPSt5JAO+KifKIGqxVcUwzOrltdI1zFEW/MGY0P0CE0xCLkgFy9+DS460e2WvR
         fcQXL6/4eMmqEZj4abWAAlemhMA1/s6uhbKQteGwaAjTC6rkEkzkGqpqCdFQSzsLJY/v
         7FGlTbbPWbJYNKS12tONBxStMKBZYZwk2ATm2X9S4EvGSgMjoPpH8bBp+rVAcAx097hy
         hsuiZ0mtbggrTCP99MLZAFuGCKSL8q70YlzBOeYb7aUQh9dzF0oUzwwsZMj4Ddni4das
         6RowCDUIXHEDBMj1o4VhaM+VT2zROPsM8kumW2VrIRPkvzRK5i3Nc9vTxTBqjqBAPxAO
         kZKw==
X-Gm-Message-State: AOAM531j/kUCq7NyHjLfEfgVEdaHk6WCsPzFJRDY0BtffQ2suQzdeM61
        LEyyR7tUIgNidGznEk+YcGQ=
X-Google-Smtp-Source: ABdhPJxH4KdtUOA28yRY5MX/LbN2HTjAq2CYReZAob7+ZZjUylQVHYFCjw3F3luO8yOOUgvS99wsRA==
X-Received: by 2002:a17:903:2306:b0:142:123a:24ec with SMTP id d6-20020a170903230600b00142123a24ecmr5495358plh.21.1636446374623;
        Tue, 09 Nov 2021 00:26:14 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id z3sm1760348pjl.13.2021.11.09.00.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:26:14 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drivers:hid: use swap() to make code cleaner
Date:   Tue,  9 Nov 2021 08:26:10 +0000
Message-Id: <20211109082610.131341-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
Use swap() instead of reimplementing it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/hid/hid-tmff.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index 90acef304536..4040cd98dafe 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -78,7 +78,6 @@ static int tmff_play(struct input_dev *dev, void *data,
 	struct hid_field *ff_field = tmff->ff_field;
 	int x, y;
 	int left, right;	/* Rumbling */
-	int motor_swap;
 
 	switch (effect->type) {
 	case FF_CONSTANT:
@@ -104,11 +103,8 @@ static int tmff_play(struct input_dev *dev, void *data,
 					ff_field->logical_maximum);
 
 		/* 2-in-1 strong motor is left */
-		if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT) {
-			motor_swap = left;
-			left = right;
-			right = motor_swap;
-		}
+		if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT)
+			swap(left, right);
 
 		dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
 		ff_field->value[0] = left;
-- 
2.25.1

