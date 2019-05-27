Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9312E2B184
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 11:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfE0Jo2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 05:44:28 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36642 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfE0Jo2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 05:44:28 -0400
Received: by mail-pg1-f193.google.com with SMTP id a3so8821840pgb.3;
        Mon, 27 May 2019 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2iALwhxJ2jL9uqOk1VEd05RuFjSSsyWOS5QI19bVso=;
        b=h3rVlelG7JST4H5/ikCX/av5OwqsPcCNE78bfmrXnGHE6vDienD2JzXAsxQI6RuSuS
         EvlAfC451GVWWIfi+QvvocmxHfmWnjP894cCCDwMCABGh+x69ctPRbJJ02Rb2uC2jEwF
         uqrL45fFuEF5BY0nN1J9Vroy+9qeHIOzfkCsSN9yZxKtshKtgkWdXVqxp8opyiofI3KT
         ZADTFGmhEXtXHL+oyrMDVRxWz/pdJCr9H8CV/X+e2wiZGd9E88yBkCCanJhuhfHRSDS/
         Lmsy0rpBn9tRb2q77N/Zi03C1wrvj1Z/omfUFe7EiP8IZnbrbwDbwt7acSyyFdTG+Tqh
         6KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2iALwhxJ2jL9uqOk1VEd05RuFjSSsyWOS5QI19bVso=;
        b=XPvxOQeGUXRerPisJssS6hGMg0p1qABBuxtMKDt7oThjls9y++iuh2Q/P2shyFK1qo
         AQ6oApYDawT27cI/FjFQgLacOuaL52MLNpjXDmy9VyNDnz7aPwDA4xlunApCiXBtZgKF
         2wbO4y1AM52R9+A0avzLEVmo9drQbseithCYbXC4WjibHVhtrSOxPVRcIeDWRqEMW25h
         vxeGeqF43wcuaOzKl0X9zhS72kSj1QQEuMjKCKkCpfeSsKqpVLCVYVQNso3WNnuugsEo
         9WjQsnBeThUHkD709reWP0m4g6MgeizAsaIxMLEb8CwaIwCDTdmA89t4f8y/O6wqjL04
         VC8Q==
X-Gm-Message-State: APjAAAVKU56TO+xH3c1LgkwJIWyPOAsZ5VVTVzayb0wDwD3PqexL7JAR
        WCm02QEgjZITtzG2rjdjQaPNGu4f
X-Google-Smtp-Source: APXvYqymAM4mV0yK506miBQOXPFTvWufOmaaZgBAKPPvVOzD8sLFOw23HLUO5XVvziPXk9TA29QDXw==
X-Received: by 2002:a63:5d45:: with SMTP id o5mr1372683pgm.40.1558950267965;
        Mon, 27 May 2019 02:44:27 -0700 (PDT)
Received: from localhost ([45.32.43.45])
        by smtp.gmail.com with ESMTPSA id c129sm12879564pfg.178.2019.05.27.02.44.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 02:44:27 -0700 (PDT)
From:   XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
To:     dmitry.torokhov@gmail.com, pali.rohar@gmail.com
Cc:     peter.hutterer@who-t.net, hui.wang@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaojian.cao@cn.alps.com, zhangfp1@lenovo.com,
        xiaoxiao.liu-1@cn.alps.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
Subject: [PATCH] input: alps-fix the issue alps cs19 trackstick do not work.
Date:   Mon, 27 May 2019 05:44:22 -0400
Message-Id: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The alps devices which detected to use the ALPS_PROTO_V8 procotol contains
ALPS touchpad and ALPS trackstick.The ALPS_PROTO_V8 procotol do not
support the trackstick device process by default.

When the trackstick was detected to use ALPS_PROTO_V8 procotol,
the v8 process_packet method alps_process_packet_ss4_v2 will reject to
report the data when the device using ALPS_PROTO_V8 procotol is not set
the ALPS_DUALPOINT flag.

The alps cs19 trackstick is detected to use the ALPS_PROTO_V8 procotol
but without ALPS_DUALPOINT flag, the alps driver will not report the
input data. so the trackstick will not work.

solution: when the alps cs19 device detected, set the device
ALPS_DUALPOINT flag,then the input data will be processed.

Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
---
 drivers/input/mouse/alps.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0a6f7ca883e7..a54677cf7474 100644
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
@@ -220,6 +220,23 @@ static bool alps_is_valid_first_byte(struct alps_data *priv,
 	return (data & priv->mask0) == priv->byte0;
 }
 
+static int alps_check_cs19_trackstick(struct psmouse *psmouse)
+{
+	u8 param[2] = { 0 };
+	int error;
+
+	error = ps2_command(&psmouse->ps2dev,
+			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
+	if (error)
+		return error;
+
+	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {
+		psmouse_warn(psmouse, "It is alps cs19 trackstick");
+		return 0;
+	}
+	return -1;
+}
+
 static void alps_report_buttons(struct input_dev *dev1, struct input_dev *dev2,
 				int left, int right, int middle)
 {
@@ -2568,8 +2585,12 @@ static int alps_update_dual_info_ss4_v2(unsigned char otp[][4],
 			alps_exit_command_mode(psmouse);
 			ps2_command(ps2dev, NULL, PSMOUSE_CMD_ENABLE);
 
-			if (reg_val == 0x0C || reg_val == 0x1D)
+			if (reg_val == 0x0C || reg_val == 0x1D) {
+				is_dual = true;
+			} else if (alps_check_cs19_trackstick(psmouse) == 0) {
+				//For support Thinkpad CS19 TrackStick
 				is_dual = true;
+			}
 		}
 	}
 
-- 
2.20.1

