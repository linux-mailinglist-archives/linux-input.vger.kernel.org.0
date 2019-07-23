Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131397201B
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 21:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfGWTas (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 15:30:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:36486 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbfGWTas (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 15:30:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="160305583"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Jul 2019 12:30:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 90B0981; Tue, 23 Jul 2019 22:30:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] Input: matrix-keymap - Switch to use device_property_count_u32()
Date:   Tue, 23 Jul 2019 22:30:44 +0300
Message-Id: <20190723193044.68682-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/matrix-keymap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
index da312be94c3a..4fa53423f56c 100644
--- a/drivers/input/matrix-keymap.c
+++ b/drivers/input/matrix-keymap.c
@@ -81,7 +81,7 @@ static int matrix_keypad_parse_keymap(const char *propname,
 	if (!propname)
 		propname = "linux,keymap";
 
-	size = device_property_read_u32_array(dev, propname, NULL, 0);
+	size = device_property_count_u32(dev, propname);
 	if (size <= 0) {
 		dev_err(dev, "missing or malformed property %s: %d\n",
 			propname, size);
-- 
2.20.1

