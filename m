Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FC0106800
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfKVI0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:37 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4485 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfKVI0f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:35 -0500
IronPort-SDR: X8nzEv9CkszHrMqWs2Cn5Wt66os8qBWEgXHc5S4D/fXg03w4QsHvgzsD39ltMDSJQax6tKXORU
 Jm9G4N3OL9d/59dprwMTMvDedSqS2YIIB+mv8TqIDvdNW9v9Cgxzmkp2rhNg82IPsayIRy/Q6M
 uk+zRyckdLj7vLgM0ZGkkcbZ7RqhqJA6VAeiHnoEwLtkO22DcUntkVPMhgpiMu7urOl7WyZkZ/
 w8mGZdea4NBM5iLVlcgPnPn3UpdrE0voxAI/i3ta3vwH74AcDAhlbtiw1a3r8kIsrcV238iQ9O
 u80=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419509"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:35 -0800
IronPort-SDR: eMBpF+qqcc94Gu8//rsvd4oNWAT7u58kxzZJNGumGQxAFgxz9ba562TU+xg19KPcX+20yuVW3y
 e+RudaxAMODHwxU/XIRi/VJCjT2BC78p7yqkpPkC/KPZNcuPTlnlJ5v/YOkznyutbRWXMS9h5X
 9+alIxLLKJe+xL/or3QebaCj+faUNBYqXmNvwHJe7CFBl+TKccspjIcR1Y6vHrSyDK+2L+sDa4
 3A0B8e7cY3tj2u6njJfHIN7nwvYBPasljQMBesPSvhSVqqiMN7tKtgCBPJv2eBbkjrC7/oXanM
 whA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 40/48] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Fri, 22 Nov 2019 17:23:54 +0900
Message-ID: <20191122082402.18173-41-jiada_wang@mentor.com>
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

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 110c966e7f3a..92af95bd4eed 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2186,7 +2186,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	dev_info(dev, "Config successfully updated\n");
 
 	/* T7 config may have changed */
-	mxt_init_t7_power_cfg(data);
+	ret = mxt_init_t7_power_cfg(data);
+	if (ret)
+		dev_warn(dev, "Power Config failed to update\n");
 
 release_mem:
 	kfree(cfg.mem);
-- 
2.17.1

