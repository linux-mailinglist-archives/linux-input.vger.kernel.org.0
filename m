Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E41071FF7
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 21:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfGWTM1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 15:12:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:13169 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728935AbfGWTM0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 15:12:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="253325243"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2019 12:12:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D1AC981; Tue, 23 Jul 2019 22:12:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] Input: atmel_mxt_ts - Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 22:12:23 +0300
Message-Id: <20190723191223.67638-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4a5f482cf1af..24c4b691b1c9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2990,8 +2990,7 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 	int error;
 
 	if (device_property_present(dev, keymap_property)) {
-		n_keys = device_property_read_u32_array(dev, keymap_property,
-							NULL, 0);
+		n_keys = device_property_count_u32(dev, keymap_property);
 		if (n_keys <= 0) {
 			error = n_keys < 0 ? n_keys : -EINVAL;
 			dev_err(dev, "invalid/malformed '%s' property: %d\n",
-- 
2.20.1

