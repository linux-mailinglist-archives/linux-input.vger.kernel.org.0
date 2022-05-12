Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D310D5243C5
	for <lists+linux-input@lfdr.de>; Thu, 12 May 2022 05:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344861AbiELD7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 May 2022 23:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345522AbiELD7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 May 2022 23:59:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71CA2FFDE
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 20:59:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so6688666pju.2
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baiPCrLIIzLUaNl78W4C+3bJkaVPaj7MuH+01NyO5sQ=;
        b=VakdpXFzYKEYGmmzQgcZXHg3Q8/G3rpGPnilAx61/3J1uHcoSM5FVENm+DtxVNQrzt
         099LVxt2UlZROtNkWrBv5/h8syB6CDzYPfn2YCMtTQmgM5Ca2v5oxZ4LVRvv/W1yJNDf
         LkrKhwnQ4lXP4tAMXfAjO2w9nJId7JTAHffBE6dFGumd9HDh0dyqz9DuXFsIx3/57U82
         tyF5tXguHXpyFgLK8HqasIxXkKtFaD8GJLLoD1HW3HRHyfHTaaj+oVKumZtNHtYHD7K/
         tJgUZIpz2TxXvAWir+po6C51lHrm+mAncAZoNyrPfvwrM116eI0oNYb6E/XWbeasRIBY
         NJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=baiPCrLIIzLUaNl78W4C+3bJkaVPaj7MuH+01NyO5sQ=;
        b=QhXXE+6EzSl7QplF7G64LCclpS159E3t3N7P+L7fMtMmt1lmYT8I5Tt17/CxpRj5Lw
         +CUInR+NsAoYocOeDXasO18bEUD5+A5X8dA/9mz4OB0HZjMOZPoikBzsNYyFHEKNI970
         hI8/S2hHD4WpWlvmeO9eFkwRX2H/uWLFL+mntHucGkt2DEyLJjriMN0ShLnZ9ilE2x7v
         jlaGhI56FX5zSh3rCc17Mb3go7+U/ABQzulJbzjbNdvwgqLgKhZizLUus+nPwdhCpuY4
         i0yP4FNdY3N7J7CZFsWK2+if0dG2neVgj9gnwHtYS1Tz+otOLZC7MujNaWryqgoTm6rk
         1nAQ==
X-Gm-Message-State: AOAM533ODYmMxAOZ8dU9jM5m+iVw5QKt/XMB4jJtN0GDGlqDAI074/L3
        NlA4owzP0BJg6FPHOP4v+Lw=
X-Google-Smtp-Source: ABdhPJy+mWoVLz1YVBlEJhxS9H9IZMZS5cHiLE0iB3Wc5MlQ0TjUrLsmkuOs2M4sJrjx5yS0mzgyzw==
X-Received: by 2002:a17:90a:fc8a:b0:1d8:ace3:70bc with SMTP id ci10-20020a17090afc8a00b001d8ace370bcmr8815383pjb.37.1652327955345;
        Wed, 11 May 2022 20:59:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4f00:cef0:5442:bb64:66b3:8716])
        by smtp.gmail.com with ESMTPSA id j21-20020a62e915000000b005104c6d7941sm2486768pfh.31.2022.05.11.20.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 20:59:14 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, jason.gerecke@wacom.com,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: Only report rotation for art pen
Date:   Wed, 11 May 2022 20:59:09 -0700
Message-Id: <20220512035909.17523-1-ping.cheng@wacom.com>
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
---
 drivers/hid/wacom_wac.c | 158 ++++++++++++++++++++++++++----------------------
 1 file changed, 85 insertions(+), 73 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 5c7ee45..be9af54 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -642,90 +642,99 @@ static int wacom_intuos_id_mangle(int tool_id)
 	return (tool_id & ~0xFFF) << 4 | (tool_id & 0xFFF);
 }
 
-static int wacom_intuos_get_tool_type(int tool_id)
+static bool wacom_is_art_pen(int tool_id)
 {
-	int tool_type;
+	bool is_art_pen = false;
 
 	switch (tool_id) {
-	case 0x812: /* Inking pen */
-	case 0x801: /* Intuos3 Inking pen */
-	case 0x12802: /* Intuos4/5 Inking Pen */
-	case 0x012:
-		tool_type = BTN_TOOL_PENCIL;
+	case 0x885:	/* Intuos3 Marker Pen */
+	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
+	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
+		is_art_pen = true;
 		break;
+	}
+	return is_art_pen;
+}
 
-	case 0x822: /* Pen */
-	case 0x842:
-	case 0x852:
-	case 0x823: /* Intuos3 Grip Pen */
-	case 0x813: /* Intuos3 Classic Pen */
-	case 0x885: /* Intuos3 Marker Pen */
-	case 0x802: /* Intuos4/5 13HD/24HD General Pen */
-	case 0x804: /* Intuos4/5 13HD/24HD Marker Pen */
-	case 0x8e2: /* IntuosHT2 pen */
-	case 0x022:
-	case 0x10804: /* Intuos4/5 13HD/24HD Art Pen */
-	case 0x10842: /* MobileStudio Pro Pro Pen slim */
-	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
-	case 0x16802: /* Cintiq 13HD Pro Pen */
-	case 0x18802: /* DTH2242 Pen */
-	case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
-		tool_type = BTN_TOOL_PEN;
-		break;
+static int wacom_intuos_get_tool_type(int tool_id)
+{
+	int tool_type = BTN_TOOL_PEN;
+
+	if (!wacom_is_art_pen(tool_id)) {
+		switch (tool_id) {
+		case 0x812: /* Inking pen */
+		case 0x801: /* Intuos3 Inking pen */
+		case 0x12802: /* Intuos4/5 Inking Pen */
+		case 0x012:
+			tool_type = BTN_TOOL_PENCIL;
+			break;
 
-	case 0x832: /* Stroke pen */
-	case 0x032:
-		tool_type = BTN_TOOL_BRUSH;
-		break;
+		case 0x822: /* Pen */
+		case 0x842:
+		case 0x852:
+		case 0x823: /* Intuos3 Grip Pen */
+		case 0x813: /* Intuos3 Classic Pen */
+		case 0x802: /* Intuos4/5 13HD/24HD General Pen */
+		case 0x8e2: /* IntuosHT2 pen */
+		case 0x022:
+		case 0x10842: /* MobileStudio Pro Pro Pen slim */
+		case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
+		case 0x16802: /* Cintiq 13HD Pro Pen */
+		case 0x18802: /* DTH2242 Pen */
+		case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
+			tool_type = BTN_TOOL_PEN;
+			break;
 
-	case 0x007: /* Mouse 4D and 2D */
-	case 0x09c:
-	case 0x094:
-	case 0x017: /* Intuos3 2D Mouse */
-	case 0x806: /* Intuos4 Mouse */
-		tool_type = BTN_TOOL_MOUSE;
-		break;
+		case 0x832: /* Stroke pen */
+		case 0x032:
+			tool_type = BTN_TOOL_BRUSH;
+			break;
 
-	case 0x096: /* Lens cursor */
-	case 0x097: /* Intuos3 Lens cursor */
-	case 0x006: /* Intuos4 Lens cursor */
-		tool_type = BTN_TOOL_LENS;
-		break;
+		case 0x007: /* Mouse 4D and 2D */
+		case 0x09c:
+		case 0x094:
+		case 0x017: /* Intuos3 2D Mouse */
+		case 0x806: /* Intuos4 Mouse */
+			tool_type = BTN_TOOL_MOUSE;
+			break;
 
-	case 0x82a: /* Eraser */
-	case 0x84a:
-	case 0x85a:
-	case 0x91a:
-	case 0xd1a:
-	case 0x0fa:
-	case 0x82b: /* Intuos3 Grip Pen Eraser */
-	case 0x81b: /* Intuos3 Classic Pen Eraser */
-	case 0x91b: /* Intuos3 Airbrush Eraser */
-	case 0x80c: /* Intuos4/5 13HD/24HD Marker Pen Eraser */
-	case 0x80a: /* Intuos4/5 13HD/24HD General Pen Eraser */
-	case 0x90a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
-	case 0x1480a: /* Intuos4/5 13HD/24HD Classic Pen Eraser */
-	case 0x1090a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
-	case 0x1080c: /* Intuos4/5 13HD/24HD Art Pen Eraser */
-	case 0x1084a: /* MobileStudio Pro Pro Pen slim Eraser */
-	case 0x1680a: /* Cintiq 13HD Pro Pen Eraser */
-	case 0x1880a: /* DTH2242 Eraser */
-	case 0x1080a: /* Intuos4/5 13HD/24HD General Pen Eraser */
-		tool_type = BTN_TOOL_RUBBER;
-		break;
+		case 0x096: /* Lens cursor */
+		case 0x097: /* Intuos3 Lens cursor */
+		case 0x006: /* Intuos4 Lens cursor */
+			tool_type = BTN_TOOL_LENS;
+			break;
 
-	case 0xd12:
-	case 0x912:
-	case 0x112:
-	case 0x913: /* Intuos3 Airbrush */
-	case 0x902: /* Intuos4/5 13HD/24HD Airbrush */
-	case 0x10902: /* Intuos4/5 13HD/24HD Airbrush */
-		tool_type = BTN_TOOL_AIRBRUSH;
-		break;
+		case 0x82a: /* Eraser */
+		case 0x84a:
+		case 0x85a:
+		case 0x91a:
+		case 0xd1a:
+		case 0x0fa:
+		case 0x82b: /* Intuos3 Grip Pen Eraser */
+		case 0x81b: /* Intuos3 Classic Pen Eraser */
+		case 0x91b: /* Intuos3 Airbrush Eraser */
+		case 0x80c: /* Intuos4/5 13HD/24HD Marker Pen Eraser */
+		case 0x80a: /* Intuos4/5 13HD/24HD General Pen Eraser */
+		case 0x90a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
+		case 0x1480a: /* Intuos4/5 13HD/24HD Classic Pen Eraser */
+		case 0x1090a: /* Intuos4/5 13HD/24HD Airbrush Eraser */
+		case 0x1080c: /* Intuos4/5 13HD/24HD Art Pen Eraser */
+		case 0x1084a: /* MobileStudio Pro Pro Pen slim Eraser */
+		case 0x1680a: /* Cintiq 13HD Pro Pen Eraser */
+		case 0x1880a: /* DTH2242 Eraser */
+		case 0x1080a: /* Intuos4/5 13HD/24HD General Pen Eraser */
+			tool_type = BTN_TOOL_RUBBER;
+			break;
 
-	default: /* Unknown tool */
-		tool_type = BTN_TOOL_PEN;
-		break;
+		case 0xd12:
+		case 0x912:
+		case 0x112:
+		case 0x913: /* Intuos3 Airbrush */
+		case 0x902: /* Intuos4/5 13HD/24HD Airbrush */
+		case 0x10902: /* Intuos4/5 13HD/24HD Airbrush */
+			tool_type = BTN_TOOL_AIRBRUSH;
+			break;
+		}
 	}
 	return tool_type;
 }
@@ -2332,6 +2341,9 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
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

