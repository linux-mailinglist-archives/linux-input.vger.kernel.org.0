Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233C115A37B
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgBLInJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:43:09 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:21926 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgBLInJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:43:09 -0500
IronPort-SDR: t5OXWPlqqSSpvlmrkyv4lQxKbNQ9+/Pqxivph6BJU+r4GPUnWEJXYMzk2L0iyZgLdpER/tq+h1
 yXSWHvGW1tuwtwz7LlghEF2WnvJfmvLHJiVSRqLvIj2EyagppuAwxeIONYbMFrNrkJmu8LhQUg
 FpXhK5WpmP0GBrTDwL5NQbLGLY2nM5Hm7L9JlZrGCO5c4EPtw2CILYiFUjAew77mo8ywLUsvRD
 SegE/Gf+2tihsXhJ5jEr0N/1yhEHMM0093La+Lbs1kCW/ikrvHN0zxjHkWZePiGj4cBDiVtZ4D
 twU=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47666980"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:43:08 -0800
IronPort-SDR: xHmzvPSEfzFleHXfxkl6OoopIXjr+kKAa2mLIiHHotJHF9jqWvD8RDpAEvRUV9f+eoHMtHykwL
 ISb+uCu7laht3G3k2uhIdPzRqFr9xWK4ctn9Jbof5UrM1MM9BBhUNZ1Lcnt1hoKihXpB0JpFrB
 1Whloyk1isUUePQGFZoirzd4dcX7JdoDDHaYG/s9OjoB04e3JKyWueX6d1YlTF5/L1KvfEx9YS
 wmNz+8YcOVyOdYlVx+LV0u1LvFde6eqGb6fZmMnu5GiJd7qmNeFmQz8vPSnm12uSzHCR0xikJH
 HFs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 05/48] Input: atmel_mxt_ts - output status from T48 Noise Supression
Date:   Wed, 12 Feb 2020 00:41:35 -0800
Message-ID: <20200212084218.32344-6-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 2895a6ff150a49f27a02938f8d262be238b296d8)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 6e22e01f1aa2..59ee743ec8d7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -324,6 +324,7 @@ struct mxt_data {
 	u16 T18_address;
 	u8 T19_reportid;
 	u16 T44_address;
+	u8 T48_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 
@@ -978,6 +979,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status, state;
+
+	status = msg[1];
+	state  = msg[4];
+
+	dev_dbg(dev, "T48 state %d status %02X %s%s%s%s%s\n", state, status,
+		status & 0x01 ? "FREQCHG " : "",
+		status & 0x02 ? "APXCHG " : "",
+		status & 0x04 ? "ALGOERR " : "",
+		status & 0x10 ? "STATCHG " : "",
+		status & 0x20 ? "NLVLCHG " : "");
+
+	return 0;
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -987,6 +1006,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id == data->T48_reportid) {
+		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
 		/*
 		 * Do not report events if input device
@@ -1666,6 +1687,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
+	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
@@ -1747,6 +1769,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_SPT_GPIOPWM_T19:
 			data->T19_reportid = min_id;
 			break;
+		case MXT_PROCG_NOISESUPPRESSION_T48:
+			data->T48_reportid = min_id;
+			break;
 		case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 			data->multitouch = MXT_TOUCH_MULTITOUCHSCREEN_T100;
 			data->T100_reportid_min = min_id;
-- 
2.17.1

