Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DF1231E5
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 13:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731370AbfETLBy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 07:01:54 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40272 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731332AbfETLBx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 07:01:53 -0400
Received: by mail-pl1-f196.google.com with SMTP id g69so6561247plb.7;
        Mon, 20 May 2019 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmVusOGH+GOOLFNfFS+v085kQTbudSCxdmKH/aKofHU=;
        b=GWvIKwCG8q/IawfL7yqNiyGfq7EGhV/0kfZcUH8bxpzHDb54v7B7vkE+pGYx5hbneK
         H0+4HO1YfUQBdJF8Sirs+rLxhJjrnhZaOJ5mP3T2V5nUZXy8I/jRSPRQyNwjZxdI+vlJ
         Eatz57NnnFCz8kB3fhRU7W/lBNgmN9kY5by+hdNCZZ7Hr4pGejGPOHZDszwx4K+KTN5D
         USux0Fp2z5xKKPSgILjqq9kL/q2hos/wuBxad89orOiSLdometeZYhf2qzl/Mah1bpo2
         Xp0hW3KGzD+FIEOnvfPsLgiI9qF0T+38YFLaEbqxLZokwI17lA3SyuHnDEq7lJn183CG
         r/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmVusOGH+GOOLFNfFS+v085kQTbudSCxdmKH/aKofHU=;
        b=rtmmKYz/u5EuOivV9QcWK5/vOhmMFflxuxxHG9LcHaW/oEkIL86s5v6uVv7Gj8NkeW
         jXVx/JOqJZAa34rqI0PNKvBCA9z+Q9aqqKwPwAMZwsbm5qexk0SFFxI1wfn+B5jvSSh0
         2bZoXb2TIliW+C0jyAIKeymgr1qvZKNJirQ0nE48kfvKb6khd1CPx5upZIYwk9ett6mX
         s4u1xXMin38TfSQsdlyRtamaRhDFgYovPLyMhrebMTXkd76bbWy5nlJoqY74X7kl6Hri
         diBgxl5VcBb3MxMCylLA35pfYhJfyDP7PJemz+az50qe5j4qYuZepnCXB/pwmJgF6Cut
         f8/g==
X-Gm-Message-State: APjAAAVmcNUu3ZBkK6kJh0TNPOpxk7c2sXVG7MJFK41E4jFw4moAItiG
        LmJB28/N+3e2Y7Ry67LQof4=
X-Google-Smtp-Source: APXvYqzzFjGhqtE8tkyQCi421m0syDJKw7KJ5STeB+QqQrcFL/J1M2iT6ZFwrJemjyZ28brKj5pOpw==
X-Received: by 2002:a17:902:4203:: with SMTP id g3mr56745535pld.288.1558350113231;
        Mon, 20 May 2019 04:01:53 -0700 (PDT)
Received: from localhost ([45.32.43.45])
        by smtp.gmail.com with ESMTPSA id s32sm16248735pgm.19.2019.05.20.04.01.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 04:01:52 -0700 (PDT)
From:   XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        hui.wang@canonical.com, xiaojian.cao@cn.alps.com,
        zhangfp1@lenovo.com, xiaoxiao.liu-1@cn.alps.com,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
Subject: [PATCH] input: alps-fix the issue the special alps trackpoint do not work.
Date:   Mon, 20 May 2019 07:01:49 -0400
Message-Id: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

when the alps trackpoint is detected and using the alps_v8_protocol_data
procotol, the alps driver will not report the input data.

solution: use standard mouse driver instead of alps driver when the specail
trackpoint was detected.

Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
---
 drivers/input/mouse/alps.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0a6f7ca883e7..516ae1d0eb17 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -24,7 +24,7 @@
 
 #include "psmouse.h"
 #include "alps.h"
-
+#include "trackpoint.h"
 /*
  * Definitions for ALPS version 3 and 4 command mode protocol
  */
@@ -2864,6 +2864,22 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
 	return NULL;
 }
 
+int alps_check_is_trackpoint(struct psmouse *psmouse)
+{
+	u8 param[2] = { 0 };
+	int error;
+
+	error = ps2_command(&psmouse->ps2dev,
+			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
+	if (error)
+		return error;
+
+	if (param[0] == TP_VARIANT_ALPS)
+		return 0;
+	psmouse_warn(psmouse, "It is not alps trackpoint.\n");
+	return -ENODEV;
+}
+
 static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
 {
 	const struct alps_protocol_info *protocol;
@@ -2912,6 +2928,11 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
 			protocol = &alps_v3_protocol_data;
 		} else if (e7[0] == 0x73 && e7[1] == 0x03 &&
 			   (e7[2] == 0x14 || e7[2] == 0x28)) {
+				if (alps_check_is_trackpoint(psmouse) == 0) {
+					psmouse_warn(psmouse,
+					"It is alps trackpoint, use the standard mouse driver.\n");
+					return -EINVAL;
+				}
 			protocol = &alps_v8_protocol_data;
 		} else if (e7[0] == 0x73 && e7[1] == 0x03 && e7[2] == 0xc8) {
 			protocol = &alps_v9_protocol_data;
-- 
2.20.1

