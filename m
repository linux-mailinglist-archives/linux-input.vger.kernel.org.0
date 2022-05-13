Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2841C526C98
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 23:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384656AbiEMVwL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 17:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353675AbiEMVwK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 17:52:10 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D5125287
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 14:52:09 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r71so8323790pgr.0
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urItSZ+G6Q/5OIBZdP4pvnOKDMIH/GVsxmOa5TtyLXw=;
        b=nfCgXa+NaJKF+JbLUnjYUt10dl0c0g8MVp23MGiU1ZpYNljFb4Tu+h7hAXJOi5XApb
         afg7SOseoyksDzJggF+r5HHI+rdh4VwAztEIqc4cIU7vhSyig6NBKFz5BYFAIReTz80B
         AqXkcs3nPYzXp+6tSytZlHEwPI3j/yUcD1Dyb6388e5prYNNoY+eFHXBchspqvV1zkvQ
         izlmviBCot7Ffk1QC0WQpOMSJ9DGfARS+tIGMzYDoMAwkq9TPUA0/EsMGeuX6aN+jLz1
         IrEmIDefS/rucmQSui9S4Y6mD6DqvJb05I64AH2NZhtGnmKz3YIt3N8T4io94JtUo2Zb
         7U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urItSZ+G6Q/5OIBZdP4pvnOKDMIH/GVsxmOa5TtyLXw=;
        b=s6/DtZS2SIEwmVjWHKtcq31sQD7dpKPgRj8WrydQrCzJ2flNRUUdMGL8ZZMf2KnGQp
         wSeulRbeeL1LqELMAs7HZOIPQ53Gz+XdizrRhFK7i2bb3+QlBUvzsZ8jDL6oKtDXSEU0
         rTZuaAJfzGaXq7BwOLwJGx1m02Znfh3rIpykynyuYguuxsXjeFPY1mG49zQXjnH6faG8
         AOLRNf+SFkxjriGdKCJ4oKHzZKpl/TaB1OZUbdtRJWUHgzuf3EXwu23UaDIN8dpz9E/Z
         wKkIWZ5BEeK0lq7TYAH2qEyUmlbTcPFd4FCaeCnaWKtlwzvgnIrsqVV8hY1I7c9VFC6/
         r28Q==
X-Gm-Message-State: AOAM5331glyWgGg9TBSHRStLNO7tSAd8wcrg2u/Xx2vsxrO+rAuwZtyv
        rhAvxMFGslaSkKM1eGrdlkQ=
X-Google-Smtp-Source: ABdhPJwBGVTD/+P324+9Z+REmWTUUQwjUDc6foUxU9gH4dRVcQQFAfPHo9etNXrgBb/bPcuxzlD3Ig==
X-Received: by 2002:a65:6047:0:b0:3c1:43c9:a4d9 with SMTP id a7-20020a656047000000b003c143c9a4d9mr5547569pgp.324.1652478728518;
        Fri, 13 May 2022 14:52:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4f00:cef0:71f2:2d00:2ce2:66bf])
        by smtp.gmail.com with ESMTPSA id x8-20020a17090a530800b001cd4989feccsm4033245pjh.24.2022.05.13.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 14:52:07 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, Aaron.Skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 1/2] HID: wacom: Only report rotation for art pen
Date:   Fri, 13 May 2022 14:51:56 -0700
Message-Id: <20220513215156.14914-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The generic routine, wacom_wac_pen_event, turns rotation value 90
degree anti-clockwise before posting the events. This non-zero
event trggers a non-zero ABS_Z event for non art pen tools. However,
HID_DG_TWIST is only supported by art pen.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
--
Hi Jiri,

This is kind of a version 2 of the last one I posted two days ago.
I updated the logic so it has less changed lines: 29 vs 158! Hopefully,
the logic is easier to follow now. Please ignore the last one.

Thank you!
---
 drivers/hid/wacom_wac.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index a7176fc0635d..3bee4f46003d 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -638,9 +638,26 @@ static int wacom_intuos_id_mangle(int tool_id)
 	return (tool_id & ~0xFFF) << 4 | (tool_id & 0xFFF);
 }
 
+static bool wacom_is_art_pen(int tool_id)
+{
+	bool is_art_pen = false;
+
+	switch (tool_id) {
+	case 0x885:	/* Intuos3 Marker Pen */
+	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
+	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
+		is_art_pen = true;
+		break;
+	}
+	return is_art_pen;
+}
+
 static int wacom_intuos_get_tool_type(int tool_id)
 {
-	int tool_type;
+	int tool_type = BTN_TOOL_PEN;
+
+	if (wacom_is_art_pen(tool_id)
+		return tool_type;
 
 	switch (tool_id) {
 	case 0x812: /* Inking pen */
@@ -655,12 +672,9 @@ static int wacom_intuos_get_tool_type(int tool_id)
 	case 0x852:
 	case 0x823: /* Intuos3 Grip Pen */
 	case 0x813: /* Intuos3 Classic Pen */
-	case 0x885: /* Intuos3 Marker Pen */
 	case 0x802: /* Intuos4/5 13HD/24HD General Pen */
-	case 0x804: /* Intuos4/5 13HD/24HD Marker Pen */
 	case 0x8e2: /* IntuosHT2 pen */
 	case 0x022:
-	case 0x10804: /* Intuos4/5 13HD/24HD Art Pen */
 	case 0x10842: /* MobileStudio Pro Pro Pen slim */
 	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
 	case 0x16802: /* Cintiq 13HD Pro Pen */
@@ -718,10 +732,6 @@ static int wacom_intuos_get_tool_type(int tool_id)
 	case 0x10902: /* Intuos4/5 13HD/24HD Airbrush */
 		tool_type = BTN_TOOL_AIRBRUSH;
 		break;
-
-	default: /* Unknown tool */
-		tool_type = BTN_TOOL_PEN;
-		break;
 	}
 	return tool_type;
 }
@@ -2323,6 +2333,9 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 		}
 		return;
 	case HID_DG_TWIST:
+		/* don't modify the value if the pen doesn't support the feature */
+		if (!wacom_is_art_pen(wacom_wac->id[0])) return;
+
 		/*
 		 * Userspace expects pen twist to have its zero point when
 		 * the buttons/finger is on the tablet's left. HID values
-- 
2.25.1

