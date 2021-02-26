Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894BF3266EC
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBZScm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:32:42 -0500
Received: from mga11.intel.com ([192.55.52.93]:49620 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhBZSck (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:32:40 -0500
IronPort-SDR: 2Q0wjAGGDLqEqyykHnEcPM78q+v+P5oIvXIWzIi31g8grxd22UPfNKLag6Yg2ND+wXnKHwKjx6
 P0HydtYjYukQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="182539841"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="182539841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 10:30:53 -0800
IronPort-SDR: FfdUG4pIQYKJ65VNmNYBSLA2/a0UhKX4vovRLtxw4abe6ymkgA1eowstpLIIIVO/Lpa6sknvWB
 RwsGneSdzJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="598522234"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2021 10:30:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1B2CD17E; Fri, 26 Feb 2021 20:28:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v1 1/1] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
Date:   Fri, 26 Feb 2021 20:28:25 +0200
Message-Id: <20210226182825.11394-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver depends on ACPI, ACPI_PTR() resolution is always the same.
Otherwise a compiler may produce a warning.

That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
none should be used in a driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 00bbd218f1e8..d35ff3f16a5b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -131,7 +131,7 @@ static struct i2c_driver i2c_hid_acpi_driver = {
 		.name	= "i2c_hid_acpi",
 		.pm	= &i2c_hid_core_pm,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
+		.acpi_match_table = i2c_hid_acpi_match,
 	},
 
 	.probe		= i2c_hid_acpi_probe,
-- 
2.30.0

