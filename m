Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71615461CFB
	for <lists+linux-input@lfdr.de>; Mon, 29 Nov 2021 18:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241596AbhK2Rvd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Nov 2021 12:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350491AbhK2Rtd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Nov 2021 12:49:33 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0BAC0C2371
        for <linux-input@vger.kernel.org>; Mon, 29 Nov 2021 06:38:51 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id l4-20020a05600c1d0400b00332f47a0fa3so10956289wms.8
        for <linux-input@vger.kernel.org>; Mon, 29 Nov 2021 06:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ruCX8eVoLcb4z++H1NLtf45ZxtBRAGKbWDTghqrPFNY=;
        b=miHBgUQ+3jfhOTuy0GpMzV/ZUPgGU4FuNGA62qvFpnLInuIe5FLGynU2KOe8fAPugF
         yBJO+jabdN6Z4AUnfQsv29FpSQRMpG7Zr+BbGmdQBUGjT/KJR83X7FQt4r8QCtO3NHNW
         yuMC2wPlaHY+jNJoCg+VsvwfSl2kGQJ+Pi9Zf8cQ4yvR3nD1tSP2HSy9en/d/ZBaf+yP
         73b/y+R+oNvL0RW7r/Petaf6NnPpNxuN4SdoHmmYzsSnC6NoJckt0jibKXrJxHOLLJum
         EboYZ4c98U+gfVo7kZX3pFjlv73yt4eqQU65m1r0KxzFxF6S9qpQdS6+ccFPFbDEl5sn
         CcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ruCX8eVoLcb4z++H1NLtf45ZxtBRAGKbWDTghqrPFNY=;
        b=wNV8rU0EmoLfCysn8/b/yb8noa3E/eA9iyleUSxp13mAhMjtZAFfIpCsxrR7jm+bLy
         2f5tmL5r/U4DFeEF3wSdrHw+4H7HqUuh9/hJjyc9JhsAkTDZhnQesM0sJoAuiqQZjtq/
         ovEq4WGbfV0iopPN34EHbBeMm4hw0XKJ8S5m8pQ51PSqwqfBH6ba2rjB4DhIdZHLA8od
         JHVSpDAS+/opXnwO8dIs7X1TS8G6Lu04S2MAuFHES2KePBUieREH5E1EY1giE4/j8sPg
         meGxFWVUV5vCUkEbzwpBWgFVMb08JWvAE1g0VyAFVqQMV/a4XqHZrx/uDcqkcScIuIjY
         gsZg==
X-Gm-Message-State: AOAM533UXu+jJzJ0Lw7euaFrUwh9xiizi2WikEUxLK2DegEZzWs8sEqk
        15ex5sc8TGxV2FcxbC7RgPVK8b07Ads=
X-Google-Smtp-Source: ABdhPJyhn9AjqM0Cvl9RFbCpH4MtFTipANOCb9YbzhBVrvtGF9QIvnRl3EPmCWMYp051rdDhiM8/BueiBL8=
X-Received: from glider.muc.corp.google.com ([2a00:79e0:15:13:3b16:acb1:567a:b459])
 (user=glider job=sendgmr) by 2002:a05:600c:378b:: with SMTP id
 o11mr37775192wmr.157.1638196729551; Mon, 29 Nov 2021 06:38:49 -0800 (PST)
Date:   Mon, 29 Nov 2021 15:38:45 +0100
Message-Id: <20211129143845.1472453-1-glider@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] Input: psmouse: check the result of PSMOUSE_CMD_GET* commands
From:   Alexander Potapenko <glider@google.com>
To:     dmitry.torokhov@gmail.com
Cc:     dvyukov@google.com, elver@google.com, linux-input@vger.kernel.org,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Execution of a PSMOUSE_CMD_GET* command may fail, leaving the output
buffer uninitialized. Make sure to check the return value of
ps2_command() and bail out before checking the buffer contents.

The use of uninitialized data in genius_detect() was detected by KMSAN,
other places were fixed for the sake of uniformity.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 drivers/input/mouse/psmouse-base.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 0b4a3039f312f..a3305653ce891 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -546,13 +546,16 @@ static int genius_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	u8 param[4];
+	int error;
 
 	param[0] = 3;
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
 	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
 	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
 	ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
-	ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+	if (error)
+		return error;
 
 	if (param[0] != 0x00 || param[1] != 0x33 || param[2] != 0x55)
 		return -ENODEV;
@@ -578,6 +581,7 @@ static int intellimouse_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	u8 param[2];
+	int error;
 
 	param[0] = 200;
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
@@ -585,7 +589,9 @@ static int intellimouse_detect(struct psmouse *psmouse, bool set_properties)
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
 	param[0] =  80;
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
-	ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	if (error)
+		return error;
 
 	if (param[0] != 3)
 		return -ENODEV;
@@ -611,6 +617,7 @@ static int im_explorer_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	u8 param[2];
+	int error;
 
 	intellimouse_detect(psmouse, 0);
 
@@ -620,7 +627,9 @@ static int im_explorer_detect(struct psmouse *psmouse, bool set_properties)
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
 	param[0] =  80;
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
-	ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	if (error)
+		return error;
 
 	if (param[0] != 4)
 		return -ENODEV;
@@ -658,7 +667,7 @@ static int thinking_detect(struct psmouse *psmouse, bool set_properties)
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
 	u8 param[2];
 	static const u8 seq[] = { 20, 60, 40, 20, 20, 60, 40, 20, 20 };
-	int i;
+	int error, i;
 
 	param[0] = 10;
 	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
@@ -668,7 +677,9 @@ static int thinking_detect(struct psmouse *psmouse, bool set_properties)
 		param[0] = seq[i];
 		ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
 	}
-	ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+	if (error)
+		return error;
 
 	if (param[0] != 2)
 		return -ENODEV;
-- 
2.34.0.rc2.393.gf8c9666880-goog

