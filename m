Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3A517822D
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbgCCSJW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 13:09:22 -0500
Received: from mga07.intel.com ([134.134.136.100]:26036 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732642AbgCCSJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 13:09:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 10:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="233831866"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2020 10:09:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9516C2A7; Tue,  3 Mar 2020 20:09:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/5] Input: edt-ft5x06 - do not try to allocate too much memory
Date:   Tue,  3 Mar 2020 20:09:16 +0200
Message-Id: <20200303180917.12563-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When mode switch happens we try to allocate too much memory in case
when num_x and num_y are being assigned to their maximum.

Since the resolution should come from property in such case, reassign
values back to num_x and num_y to prevent too much memory allocation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index a05c6b597d43..1023d4134b8d 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1178,6 +1178,13 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
 	touchscreen_parse_properties(input, true, &tsdata->prop);
 
+	if (tsdata->num_x == U16_MAX && tsdata->prop.max_x &&
+	    tsdata->num_y == U16_MAX && tsdata->prop.max_y) {
+		/* Reassign num_x and num_y from properties */
+		tsdata->num_x = tsdata->prop.max_x;
+		tsdata->num_y = tsdata->prop.max_y;
+	}
+
 	error = input_mt_init_slots(input, tsdata->max_support_points,
 				INPUT_MT_DIRECT);
 	if (error) {
-- 
2.25.1

