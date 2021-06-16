Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE2D3A9CE6
	for <lists+linux-input@lfdr.de>; Wed, 16 Jun 2021 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhFPOGT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Jun 2021 10:06:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:45073 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232796AbhFPOGT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Jun 2021 10:06:19 -0400
IronPort-SDR: 5rfEkgTTBZXFWRVpoZEvAnONnnkkac3ld8/poWqqaV1oJRumosI9PwRM+YCtvMFeY2XDptxlEi
 2aNeEgtUNoig==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="270030221"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="270030221"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 07:04:12 -0700
IronPort-SDR: kRg9gzqdUXcQLbjpv25Jp4+aJxSCf6Ix1akBjiQ6OZ31oGjCNCWVB0tDdINE8UApNCrK4iVuv9
 +uuQXyrC6WIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="479105228"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2021 07:04:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 826322AA; Wed, 16 Jun 2021 17:04:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: parkbd - switch to use module_parport_driver()
Date:   Wed, 16 Jun 2021 17:04:32 +0300
Message-Id: <20210616140432.39406-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch to use module_parport_driver() to reduce boilerplate code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/serio/parkbd.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/input/serio/parkbd.c b/drivers/input/serio/parkbd.c
index 3ac57a91ede4..51b68501896c 100644
--- a/drivers/input/serio/parkbd.c
+++ b/drivers/input/serio/parkbd.c
@@ -220,16 +220,4 @@ static struct parport_driver parkbd_parport_driver = {
 	.detach = parkbd_detach,
 	.devmodel = true,
 };
-
-static int __init parkbd_init(void)
-{
-	return parport_register_driver(&parkbd_parport_driver);
-}
-
-static void __exit parkbd_exit(void)
-{
-	parport_unregister_driver(&parkbd_parport_driver);
-}
-
-module_init(parkbd_init);
-module_exit(parkbd_exit);
+module_parport_driver(parkbd_parport_driver);
-- 
2.30.2

