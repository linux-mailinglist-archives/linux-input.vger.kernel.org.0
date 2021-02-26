Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE3632677A
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 20:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBZTge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 14:36:34 -0500
Received: from mga11.intel.com ([192.55.52.93]:54527 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBZTgd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 14:36:33 -0500
IronPort-SDR: 6rB3hg69vXp0YXNvHUAdwqsK1jeqoNJ4YAr1s5CQ9aa7o8/0gUZN+N047d9vm/9LpsUE//m+ox
 cL2+d8/h0Reg==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="182554249"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="182554249"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 11:34:47 -0800
IronPort-SDR: Trk6veX8D49gkI1LpqD8cBdaVHUElkAlyhfAjMkpzg67VEdUmKU+f3cPq1X+h7U+95xMkm33uh
 AfrU0KFl6Qqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="425575024"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2021 11:34:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 780A811F; Fri, 26 Feb 2021 21:32:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 2/4] HID: i2c-hid: acpi: Switch to new style i2c-driver probe function
Date:   Fri, 26 Feb 2021 21:32:23 +0200
Message-Id: <20210226193225.47129-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch to the new style i2c-driver probe_new probe function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 7225a6bc42f0..70955f21349a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -74,8 +74,7 @@ static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
 	acpi_device_set_power(ihid_acpi->adev, ACPI_STATE_D3_COLD);
 }
 
-static int i2c_hid_acpi_probe(struct i2c_client *client,
-			      const struct i2c_device_id *dev_id)
+static int i2c_hid_acpi_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct i2c_hid_acpi *ihid_acpi;
@@ -127,7 +126,7 @@ static struct i2c_driver i2c_hid_acpi_driver = {
 		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
 	},
 
-	.probe		= i2c_hid_acpi_probe,
+	.probe_new	= i2c_hid_acpi_probe,
 	.remove		= i2c_hid_core_remove,
 	.shutdown	= i2c_hid_core_shutdown,
 };
-- 
2.30.0

