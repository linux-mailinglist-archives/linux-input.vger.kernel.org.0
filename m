Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0E08FE32
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfHPIi5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:57 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1980 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfHPIi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:56 -0400
IronPort-SDR: aqFHjrVGMWe/JZC1rW3Y9bUIQzHtg12F1JVq8lvDLqmiLcNibf1Df+mBACKpqyCDpnFL0fu5ll
 JQnqz3akg2NJ2yCvxEpQFdeSWbrTCwwZeoUB2ioTFz+SY1RBJUxG0OC6RQMRbRAp/aOzB8YaKI
 o8uD0h/hp24or5u4VUZv3QI/t646Fx+ynJx3hONdTCS6Ub/48HH0upLdCH6wWVllj9SfFrQymD
 mt3Tn6tAfyAGZhOyATqRuMa1EkUS7oCzJET7INHecP4KEOWHronzNA7n17qPX1Oz6fv62Gr6Fi
 c0w=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484322"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:50 -0800
IronPort-SDR: Uoz8Nmj8PKRr0iC7DA17jGPArsoTJUpEBaYLSNQtgnO1JJcivu8D0JAZnFjQz6yk1KMTcjJYjy
 Olbq1V0wHIruiDEoBI20en8YSNt7LFRFOShnWdgUJGysaAeJKP07pheAKTZLqfJMWB2lgawJa1
 6TfNXPWJGDEh2NLRZg7N0oJzy6XhGXvq2a7hWocTnFaEHZeD1aYEP+vVlcKRUEnDkwcAZqBzmd
 +00p5sqaelyfE497ihFyvWwiQDDuIUAi9HfRxyyATp/xRKuFAYu4ApOkrv95EyIvrv1U85XUOQ
 jtA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 40/63] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Fri, 16 Aug 2019 17:35:35 +0900
Message-ID: <20190816083558.19189-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>

In case of attached display, the touchpanel reset is controlled
via imx gpio's from  atmel driver and the delay between
touchpanel reset and the time at which the chip becomes capable to
communicate with the host processor, has be taken care.

However in case of detachable displays, the touchpanel reset is
controlled via a deserializer gpio which is triggered just before
the atmel driver is probed.The delay between touchpanel reset and
the time at which the chip becomes capable to communicate (as
specified in datasheet) was not being accounted for. This patch
introduces that delay.

Signed-off-by: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3b9544c0a209..bc94adec6631 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4407,6 +4407,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
+	} else {
+		dev_dbg(&client->dev,
+			"atmel reset pin not found in device tree");
+		msleep(MXT_RESET_TIME);
 	}
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
-- 
2.19.2

