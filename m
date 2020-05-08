Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721031CA321
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgEHF5k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:57:40 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38668 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgEHF5h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:57:37 -0400
IronPort-SDR: iq+Xz+pkTfcg99ODonemdncCofNRYnrtv6cBmTTnoBNSNcgbXQnUBaMUWx3A5vz169+n1pSHQK
 yqdlboIhuX63FzBW5RPfEJY05+A4uTw65hPiooqj4Zn9AsWpLpi9mJ5PtyfigdNwA67x3ZdeXJ
 XId3Kn82osJvcl2j+LaIjr7FZ3BY448cYlvWEsAq4zPXmDDfF0p5MUScTxt9QN4RuZ1eW9qfQT
 B26y83fE92Bobwa+qHtzbhrZGT4NLfrJ56oVxcDYhFmjGQtshcdZguNwpJuBiWy3S+59SYpU4Z
 LY4=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670052"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:57:35 -0800
IronPort-SDR: Jht1gashke8s99GRPq4ALeztPIodd5iUctQdzP1M7u4hRj/ISCzP8cOu5+8l2cBk7WqSdKPPb1
 yxsUkfZAX2efAhS59sSe/IqZH5/zK4P3sAewCvmX1ZnQ5gQL2Gnrbr9nXgD319DUn2TtXEV/FK
 jIuAnbXEndG32vS9Ggsq2RzfcnOy+X2pyY23rh36DbrIvPcVVHgp6bLp1lclb/0ml2S0IzbEtR
 WCNYtTz0g/iC5FNdP0v+llCuFtIhCyKpKPuouzHIIQPxkibmfxzvcPQZ1blSco/Cuqh8ufS2Vw
 cgg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 09/56] Input: atmel_mxt_ts - handle reports from T47 Stylus object
Date:   Thu, 7 May 2020 22:56:09 -0700
Message-ID: <20200508055656.96389-10-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

This patch handles reports from T47 Stylus object

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
index d05249b02781..ba58cdd5b76d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -823,6 +823,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 	int area;
 	int amplitude;
 	u8 vector;
+	int tool;
 
 	id = message[0] - data->T9_reportid_min;
 	status = message[1];
@@ -836,6 +837,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		y >>= 2;
 
 	area = message[5];
+
 	amplitude = message[6];
 	vector = message[7];
 
@@ -865,12 +867,20 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
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
2.17.1

