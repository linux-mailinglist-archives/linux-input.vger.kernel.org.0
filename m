Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3F03944CF
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 17:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236122AbhE1PMe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 11:12:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:63747 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231845AbhE1PMe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 11:12:34 -0400
IronPort-SDR: FYjCoiiZswcV8d66JjmYq0dk3hPVjfb+ZeYgqmUkEUT/h4//Y6uaaDMJ6e0xK+wboSf1bsNDte
 WCs84WNr3QDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="266856777"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="266856777"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 08:10:57 -0700
IronPort-SDR: VHLb01vnaADt6BTuH/Zt1mA5K8mBSrxkhU0bABsh5CNh5WothktFYarZBpEaJdpFxCSS9QUgni
 zpMjNofwM0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="548614851"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 May 2021 08:10:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2C0613B6; Fri, 28 May 2021 18:11:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] Input: resistive-adc-touch - describe parameters in kernel doc
Date:   Fri, 28 May 2021 18:11:12 +0300
Message-Id: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Validation script is not happy:

 resistive-adc-touch.c:53: warning: Function parameter or member 'x_plate_ohms' not described in 'grts_state'
 resistive-adc-touch.c:53: warning: Function parameter or member 'ch' not described in 'grts_state'

Describe parameters in kernel doc to make it happy.

Fixes: fb082cd59afa ("Input: resistive-adc-touch - add support for z1 and z2 channels")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/resistive-adc-touch.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index 0939c0e97efb..0353400c559a 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -35,16 +35,18 @@ enum grts_ch_type {
 
 /**
  * struct grts_state - generic resistive touch screen information struct
+ * @x_plate_ohms:	resistance of the X plate
  * @pressure_min:	number representing the minimum for the pressure
  * @pressure:		are we getting pressure info or not
  * @iio_chans:		list of channels acquired
  * @iio_cb:		iio_callback buffer for the data
  * @input:		the input device structure that we register
  * @prop:		touchscreen properties struct
+ * @ch:			channels that are defined for the touchscreen
  */
 struct grts_state {
-	u32				pressure_min;
 	u32				x_plate_ohms;
+	u32				pressure_min;
 	bool				pressure;
 	struct iio_channel		*iio_chans;
 	struct iio_cb_buffer		*iio_cb;
-- 
2.30.2

