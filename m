Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBA3178229
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732295AbgCCSJV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 13:09:21 -0500
Received: from mga17.intel.com ([192.55.52.151]:50614 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732284AbgCCSJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 13:09:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 10:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="287065207"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2020 10:09:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8DAFB251; Tue,  3 Mar 2020 20:09:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/5] Input: edt-ft5x06 - use U16_MAX instead of -1
Date:   Tue,  3 Mar 2020 20:09:15 +0200
Message-Id: <20200303180917.12563-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Explicitly show what the value we supply for the touchscreen resolution
when it can't be detected. -1 is hard to compare with when unsigned short
type is in use. The change will help to avoid signed vs. unsigned error
prone comparisons.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index cb67104c6934..a05c6b597d43 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -23,6 +23,7 @@
 #include <linux/input/touchscreen.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/ratelimit.h>
 #include <linux/regulator/consumer.h>
@@ -983,8 +984,8 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
 		tsdata->num_y = edt_ft5x06_register_read(tsdata,
 							 reg_addr->reg_num_y);
 	} else {
-		tsdata->num_x = -1;
-		tsdata->num_y = -1;
+		tsdata->num_x = U16_MAX;
+		tsdata->num_y = U16_MAX;
 	}
 }
 
-- 
2.25.1

