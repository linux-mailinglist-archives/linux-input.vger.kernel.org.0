Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77B62B903
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfE0QXJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:23:09 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:18754 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QXB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:23:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674811"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:22:59 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RGMpYO004696;
        Mon, 27 May 2019 18:22:53 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:22:54 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 10/10] Input: stmpe-ts - implement tracking index
Date:   Mon, 27 May 2019 18:22:25 +0200
Message-ID: <20190527162225.32136-1-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.25.2.60]
X-KSE-ServerInfo: SUMMAIL01.UMK.KLS.zentral, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.05.2019 13:23:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The tracking index specifies an minimum distance between
two touchpoints so that the latter will be discarded, if
the distance falls short of the configured value.
Beware: When using the XYZ acquisition mode, an increase
in pressure leads to a position report anyway.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 5 +++--
 include/linux/mfd/stmpe.h            | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 1d114278e7e9..ec1bbc19562e 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -91,6 +91,7 @@ struct stmpe_touch {
 	u8 fraction_z;
 	u8 i_drive;
 	u8 op_mod;
+	u8 tracking_index;
 	struct {
 	struct {
 		u16 x;
@@ -332,8 +333,8 @@ static int stmpe_init_hw(struct stmpe_touch *ts)
 		return ret;
 	}
 
-	tsc_ctrl = STMPE_OP_MODE(ts->op_mod);
-	tsc_ctrl_mask = STMPE_OP_MODE(0xff);
+	tsc_ctrl = STMPE_TRACK(ts->tracking_index) | STMPE_OP_MODE(ts->op_mod);
+	tsc_ctrl_mask = STMPE_TRACK(0xff) | STMPE_OP_MODE(0xff);
 
 	ret = stmpe_set_bits(stmpe, STMPE_REG_TSC_CTRL,
 			tsc_ctrl_mask, tsc_ctrl);
diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
index 07f55aac9390..4e3217b0237a 100644
--- a/include/linux/mfd/stmpe.h
+++ b/include/linux/mfd/stmpe.h
@@ -16,6 +16,7 @@
 #define STMPE_ADC_FREQ(x)	(x & 0x3)
 #define STMPE_AVE_CTRL(x)	((x & 0x3) << 6)
 #define STMPE_DET_DELAY(x)	((x & 0x7) << 3)
+#define STMPE_TRACK(x)	((x & 0x7) << 4)
 #define STMPE_SETTLING(x)	(x & 0x7)
 #define STMPE_FRACTION_Z(x)	(x & 0x7)
 #define STMPE_I_DRIVE(x)	(x & 0x1)
-- 
2.21.0

