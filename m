Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51927299413
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 18:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788116AbgJZRla (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 13:41:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:13616 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1788121AbgJZRla (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 13:41:30 -0400
IronPort-SDR: D1mPUGe8DQVETxHgPwKsCSQ2IA3hqvPcLKv8AEC9m024+pGwouzRosBXtqToKBl21LMLY/mSeB
 re7i5/wrvsRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="229595781"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; 
   d="scan'208";a="229595781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 10:41:29 -0700
IronPort-SDR: CbSfWwai0fuKIrXOOyqrHNIjPzZVRMMi48Og+QfDixNRENecZdbcQXozI3rhwVNRSTvy5VxP3X
 j+YdqM1ZeYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; 
   d="scan'208";a="350200903"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2020 10:41:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 68DE913C; Mon, 26 Oct 2020 19:41:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] Input: edt-ft5x06 - use U16_MAX instead of -1
Date:   Mon, 26 Oct 2020 19:41:26 +0200
Message-Id: <20201026174126.19449-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Explicitly show what the value we supply for the touchscreen resolution
when it can't be detected. -1 is hard to compare with when unsigned short
type is in use. The change will help to avoid signed vs. unsigned error
prone comparisons.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of v5.10-rc1
 drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 6ff81d48da86..34e9cb9c0691 100644
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
@@ -1005,8 +1006,8 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
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
2.28.0

