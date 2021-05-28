Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE853944CE
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 17:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234676AbhE1PMe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 11:12:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:63747 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhE1PMe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 11:12:34 -0400
IronPort-SDR: n0mj7xxzTmAVs/Z210EZDPLJ6GkF4zo9ySUHpi/adTw9B8zKfkG1Nsi9NSDxSGuk0orhhcS5hG
 OG6U7WDNYYSw==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="266856779"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="266856779"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 08:10:58 -0700
IronPort-SDR: Nm2G5GFOzHzqxBNit1dQzutVjWxu269j+yJxxvSj/ZxJrty1mLACwS8V8rVOSMWAnySt3aPW1H
 D8rEbDQ80iQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="615783892"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 28 May 2021 08:10:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 417294F8; Fri, 28 May 2021 18:11:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] Input: resistive-adc-touch - replace OF headers with proper ones
Date:   Fri, 28 May 2021 18:11:13 +0300
Message-Id: <20210528151113.85943-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
References: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver is actually OF independent and doesn't need anything from OF (*).
Replace OF headers with mod_devicetable.h and property.h.

*) use of of_match_ptr() is actually wrong here, since it may provoke
   a compiler to warn about unused variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/resistive-adc-touch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index 0353400c559a..ea1884fb49a1 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -13,10 +13,10 @@
 #include <linux/input/touchscreen.h>
 #include <linux/iio/consumer.h>
 #include <linux/iio/iio.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DRIVER_NAME					"resistive-adc-touch"
 #define GRTS_DEFAULT_PRESSURE_MIN			50000
@@ -307,7 +307,7 @@ static struct platform_driver grts_driver = {
 	.probe = grts_probe,
 	.driver = {
 		.name = DRIVER_NAME,
-		.of_match_table = of_match_ptr(grts_of_match),
+		.of_match_table = grts_of_match,
 	},
 };
 
-- 
2.30.2

