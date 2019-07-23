Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8971FF6
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 21:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfGWTMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 15:12:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:15335 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbfGWTMF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 15:12:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="169649864"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2019 12:12:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BA9FD81; Tue, 23 Jul 2019 22:12:03 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] Input: hideep - Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 22:12:03 +0300
Message-Id: <20190723191203.67575-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use use device_property_count_u32() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/hideep.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 84fbbf415c43..ddad4a82a5e5 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -811,8 +811,7 @@ static int hideep_init_input(struct hideep_ts *ts)
 	if (error)
 		return error;
 
-	ts->key_num = device_property_read_u32_array(dev, "linux,keycodes",
-						     NULL, 0);
+	ts->key_num = device_property_count_u32(dev, "linux,keycodes");
 	if (ts->key_num > HIDEEP_KEY_MAX) {
 		dev_err(dev, "too many keys defined: %d\n",
 			ts->key_num);
-- 
2.20.1

