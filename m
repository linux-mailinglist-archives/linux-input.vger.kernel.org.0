Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D06E326779
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 20:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBZTge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 14:36:34 -0500
Received: from mga04.intel.com ([192.55.52.120]:5179 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhBZTgd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 14:36:33 -0500
IronPort-SDR: 452iDf6s4syYs+u6WA+XI8VLJPzP9SV9NsJngC8WW+5XS4ZTqhsC2/aT3urlzsa2UYmrcefywr
 B9hAAHiuBOgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="183519109"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="183519109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 11:34:48 -0800
IronPort-SDR: p8A4BkKzUvM5PSJDwOEEtLry4Ks1U7UPpe1GyuwVDVDRFQl+xuSLrEd9wPqzOV7hqeH097O0hY
 OrwGwGYfwJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="443191951"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 Feb 2021 11:34:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8E3305D6; Fri, 26 Feb 2021 21:32:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 4/4] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
Date:   Fri, 26 Feb 2021 21:32:25 +0200
Message-Id: <20210226193225.47129-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
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
v2: no changes
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index a4810f199d59..a6f0257a26de 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -126,7 +126,7 @@ static struct i2c_driver i2c_hid_acpi_driver = {
 		.name	= "i2c_hid_acpi",
 		.pm	= &i2c_hid_core_pm,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
+		.acpi_match_table = i2c_hid_acpi_match,
 	},
 
 	.probe_new	= i2c_hid_acpi_probe,
-- 
2.30.0

