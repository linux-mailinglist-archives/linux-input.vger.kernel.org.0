Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0471067FA
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbfKVI03 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:29 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52542 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfKVI02 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:28 -0500
IronPort-SDR: A2FizKez/TzSTNeVIsmqayaDj7Q70IhP+Fs2gAMEgGiLoL3wOef4dapzbLcBkto0uHA0Us8iT+
 ZykxH6AA2dGVKlKJAXbyiITC6ci9r/N7QF8uzV5S+omDGpOEx0DkOzNcpNGCoNzabTJDTQlhRQ
 o+vCVeGNMMKnp0hD+aVz298G0kS7GVpqt7xmGHDrxcEbZYtF78mkZoLQRXqaaQ90jsxA+yx63y
 UL/SHr0VZkaj++a1mMcBBf9u5JvhotUDUKpq3GXZVKE54naTX1VcBZBanvEc6AUxYHCmArLCxn
 t78=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358977"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:27 -0800
IronPort-SDR: X36I+h29kYB8JKFqBgPfVSadAyhw1J0RpcInGTjZNM4Em+v2OSBRgAbEPFXQnidm2scBycIeBW
 cegempuayYyTa7L0FgO6X8J0B47r+yxRvEEsykgNPbvF+do15BEq7zkbu/SI9yKu98e/C4snUi
 chfbKycYNaH+maUPG8joOeM/P0P0A6LyVvGZMURm71jW1lfJQeXVUqY6qRSvYc7vxMmVpAmPbu
 DvhDYsoDXO5VCyBhW7XuRNDX/Py0b8dr2ryJFVjDatahPoqMgSx9IkDJH1chk/s+/bGA52/zON
 nzQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 38/48] Input: Atmel: improve error handling in mxt_start()
Date:   Fri, 22 Nov 2019 17:23:52 +0900
Message-ID: <20191122082402.18173-39-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

mxt_start() does not return error in any of
the failure cases which will allow input_dev->open()
to return success even in case of any failure.

This commit modifies mxt_start() to return error
in failure cases.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 31 ++++++++++++------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a5af1f91d704..1ebdca1ed815 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3974,12 +3974,13 @@ static int mxt_start(struct mxt_data *data)
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
-		mxt_soft_reset(data);
-
+		ret = mxt_soft_reset(data);
+		if (ret)
+			break;
 		/* Touch enable */
 		/* 0x83 = SCANEN | RPTEN | ENABLE */
-		mxt_write_object(data,
-				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
+		ret = mxt_write_object(data,
+				       MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
 		break;
 
 	case MXT_SUSPEND_REGULATOR:
@@ -3993,27 +3994,26 @@ static int mxt_start(struct mxt_data *data)
 		 * Discard any touch messages still in message buffer
 		 * from before chip went to sleep
 		 */
-		mxt_process_messages_until_invalid(data);
+		ret = mxt_process_messages_until_invalid(data);
+		if (ret)
+			break;
 
 		ret = mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
 		if (ret)
-			return ret;
+			break;
 
 		/* Recalibrate since chip has been in deep sleep */
 		ret = mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
 		if (ret)
-			return ret;
+			break;
 
 		ret = mxt_acquire_irq(data);
-		if (ret)
-			return ret;
-
-		break;
 	}
 
-	data->suspended = false;
+	if (!ret)
+		data->suspended = false;
 
-	return 0;
+	return ret;
 }
 
 static int mxt_stop(struct mxt_data *data)
@@ -4333,6 +4333,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct input_dev *input_dev = data->input_dev;
+	int ret = 0;
 
 	if (!input_dev)
 		return 0;
@@ -4340,11 +4341,11 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-		mxt_start(data);
+		ret = mxt_start(data);
 
 	mutex_unlock(&input_dev->mutex);
 
-	return 0;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
-- 
2.17.1

