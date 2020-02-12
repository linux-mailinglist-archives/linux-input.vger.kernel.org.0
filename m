Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A2A15A3BD
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgBLIrM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:47:12 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:5140 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgBLIrM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:47:12 -0500
IronPort-SDR: fOy+vc4Ykexg2rAn6t6sQkNfPHvzThpPXw6PxvNBfTtRu7wk/WjDS1Dxl9pRXrTUE9am4q7bMT
 ay8z1X/aNFZwlNi191v9qKQCQReddtiFBzev8tF8ZR+8KckmhR58UcKVINiOcNsvxvEDJb6oEp
 U4+Xzjfin/u4Dyb3TC1vjsa08xmOuIV2dM6Lmet8kv6ngpgolG93WvIg8OGLcfm/5XiJcX1ffJ
 zucVErb9SDWsZcgMjY2oYzbvwr4Qikl3MrtW9mCtMSjRKWQ68H8MLqd0hOna2QsJRxOhmZZWYq
 dic=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686299"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:47:11 -0800
IronPort-SDR: OPjzyoNIehf1LkwreltCylrx4xOql3bqx2e5u85F6EwqZlt+QYDwNVjI07oOc/s50PF9QMleG8
 kRjQK4bhs8/DAVqaQXmsWbNx2uGR0DTmx0VVFS6tzc33KsJc7CsEZmwzJxfUAJisRBr+R1459U
 m6FPhM+UcODwGNTrnyCTKwzgbGLFgYBYTSGjTX6AMaItABH+F/dL3l8BGe+uVTY7MXtU9xKkra
 +QRDvbQf9hcyZnbMXzD2dCW6Iae3egSus5lHOWtTy4Jlw65sXh79Ug8ZmLLo8xNPU0ZY0zwTEs
 s3w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 40/48] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Wed, 12 Feb 2020 00:42:10 -0800
Message-ID: <20200212084218.32344-41-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 07228df847e3..3654f4b399d9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2183,7 +2183,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

