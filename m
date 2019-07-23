Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1A171DDD
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 19:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388567AbfGWRiE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 13:38:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:21101 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732983AbfGWRiE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 13:38:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 10:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="180811825"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2019 10:38:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 199D381; Tue, 23 Jul 2019 20:38:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] Input: mpr121 - Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 20:38:00 +0300
Message-Id: <20190723173800.66553-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/keyboard/mpr121_touchkey.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index e9ceaa16b46a..ee80de44ce3f 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -253,8 +253,7 @@ static int mpr_touchkey_probe(struct i2c_client *client,
 
 	mpr121->client = client;
 	mpr121->input_dev = input_dev;
-	mpr121->keycount = device_property_read_u32_array(dev, "linux,keycodes",
-							  NULL, 0);
+	mpr121->keycount = device_property_count_u32(dev, "linux,keycodes");
 	if (mpr121->keycount > MPR121_MAX_KEY_COUNT) {
 		dev_err(dev, "too many keys defined (%d)\n", mpr121->keycount);
 		return -EINVAL;
-- 
2.20.1

