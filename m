Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BA38FE2C
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfHPIim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:42 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:53868 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfHPIil (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:41 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:38:29 EDT
IronPort-SDR: o9Sne1YlyX5ktyy3v//+78AjJYaW2JDSRiR0BeLknzmCdHktvBHp0pD4JotCeLuCf845Fe5exj
 ro5dfsKXr1sCBwv4Oj9Pn935pFOlgz+K2yJnOY1O8hIjtvRuAm5Uy0DX2ttZOiIZSE37M+ca2L
 St/rtK0R/qyLF4jO7hKmB7ftRiR3I6Bu0crl/sS6kcTJKGuClYwVaQWJM8w39sQwmLW9Thivks
 sWMth8acoPaXrGTclEF3ZGaKi0a/GIl/ChCH6gp+M/TgQhA7cRZtLUOa+mzYiYap/l92xWkHOj
 iAU=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="42311176"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:31:35 -0800
IronPort-SDR: 0a/inh3Kj+i+d6sZUXuAhhHiL07++jxx5Xn311LOqsP/WXCKcAdKyXknB3mbSSGUvqTtMtVwn/
 EPmw5svv0bxCLQGqqQBNpVlzSAUqQIp78kRikipKBLtvu9yusEm3ho0oaZhcp4ZiAj/I36UkHd
 cG8ttRNmDsHHyNIEWg1Q7q16/TBEbrAWQVq7t6FdurzdS96+Bz1TfDMDCXcenDOVjgTmYJKfRz
 ileHXn4xo7VoEgnSPEmLnReXX9YuMYvOsGr8+yqkMi454/9zqwycVnfOiKFJTJuxtPaxhV6ubK
 qRg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 09/63] Input: atmel_mxt_ts - handle reports from T47 Stylus object
Date:   Fri, 16 Aug 2019 17:30:36 +0900
Message-ID: <20190816083130.18250-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083130.18250-1-jiada_wang@mentor.com>
References: <20190816083130.18250-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 56405a5ea08eb34cfe83f3121867c9de0a5c48c1)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 99b87042dfe5..adf63ecf6b8e 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -822,6 +822,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 	int area;
 	int amplitude;
 	u8 vector;
+	int tool;
 
 	id = message[0] - data->T9_reportid_min;
 	status = message[1];
@@ -835,6 +836,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		y >>= 2;
 
 	area = message[5];
+
 	amplitude = message[6];
 	vector = message[7];
 
@@ -864,12 +866,20 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 			mxt_input_sync(data);
 		}
 
+		/* A size of zero indicates touch is from a linked T47 Stylus */
+		if (area == 0) {
+			area = MXT_TOUCH_MAJOR_DEFAULT;
+			tool = MT_TOOL_PEN;
+		} else {
+			tool = MT_TOOL_FINGER;
+		}
+
 		/* if active, pressure must be non-zero */
 		if (!amplitude)
 			amplitude = MXT_PRESSURE_DEFAULT;
 
 		/* Touch active */
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 1);
+		input_mt_report_slot_state(input_dev, tool, 1);
 		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
 		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, amplitude);
-- 
2.19.2

