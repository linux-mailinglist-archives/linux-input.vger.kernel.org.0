Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087DE178231
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 20:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732248AbgCCSJX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 13:09:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:42392 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732629AbgCCSJV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 13:09:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2020 10:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; 
   d="scan'208";a="351889942"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2020 10:09:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 81CBB107; Tue,  3 Mar 2020 20:09:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/5] Input: edt-ft5x06 - refactor condition in edt_ft5x06_debugfs_mode_set()
Date:   Tue,  3 Mar 2020 20:09:14 +0200
Message-Id: <20200303180917.12563-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For better reading unroll nested conditions to simple if-else-if.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d2587724c52a..cb67104c6934 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -666,10 +666,10 @@ static int edt_ft5x06_debugfs_mode_set(void *data, u64 mode)
 
 	mutex_lock(&tsdata->mutex);
 
-	if (mode != tsdata->factory_mode) {
-		retval = mode ? edt_ft5x06_factory_mode(tsdata) :
-				edt_ft5x06_work_mode(tsdata);
-	}
+	if (mode && !tsdata->factory_mode)
+		retval = edt_ft5x06_factory_mode(tsdata);
+	else if (!mode && tsdata->factory_mode)
+		retval = edt_ft5x06_work_mode(tsdata);
 
 	mutex_unlock(&tsdata->mutex);
 
-- 
2.25.1

