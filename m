Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F308D29EE7C
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 15:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgJ2OjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 10:39:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:59398 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgJ2OjX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 10:39:23 -0400
IronPort-SDR: lQgWhZF4XbgJyMMm+8ibkQLVQhnYdOeku13C0J4TlD31uZwsEXXA8pTUUl0UHXusO/k2Kz3w6Y
 5+XkGRPTbW8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="155412015"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="155412015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:39:22 -0700
IronPort-SDR: Hptkv6UPUiXzvYTL5f5nhw3TT+3RN9d0n4C1W1m25TIe8e4B9lm9KKlFLduzOzUU/7R0I24E1l
 pxNofDI4E4Sg==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="526753052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:39:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kY96G-001JPJ-Oa; Thu, 29 Oct 2020 16:40:24 +0200
X-Original-To: andriy.shevchenko@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
        by smile.fi.intel.com with IMAP (fetchmail-6.4.12)
        for <andy@localhost> (single-drop); Mon, 26 Oct 2020 19:45:07 +0200 (EET)
Received: from fmsmga004.fm.intel.com (fmsmga004.fm.intel.com [10.253.24.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 6DE81580100
        for <andriy.shevchenko@linux.intel.com>; Mon, 26 Oct 2020 10:41:29 -0700 (PDT)
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

