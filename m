Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5AC4EEEB
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfFUSug (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 14:50:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54936 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfFUSug (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 14:50:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LIoHEF052869;
        Fri, 21 Jun 2019 13:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561143017;
        bh=FUfdXghZ+WdB/YXoYFyffGxBU8NgjsmjyojagHwI8VU=;
        h=From:To:CC:Subject:Date;
        b=rd0vI8kpVHY9UilLPsPZ4pcRyjrmf/IXZlv3H0QqQ3nr2RkTdoCJG+KsoG34xcQas
         LEtN1gv5JK7uJdKFj3FO6zeZxBeUWX9E/uOKSLj5KYzKoTygdSrpWtccFm6cpleONJ
         eQ6GgCK0ANZYD0MO7zw8iJjmcApsFygGx8IGtcJw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LIoH91099109
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Jun 2019 13:50:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 21
 Jun 2019 13:50:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 21 Jun 2019 13:50:16 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LIoGYn078863;
        Fri, 21 Jun 2019 13:50:16 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during suspend
Date:   Fri, 21 Jun 2019 13:51:24 -0500
Message-ID: <20190621185124.28966-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As a wakeup source when the system is in suspend there is little point
trying to access a register across the i2c bus as it is probably still
inactive. We need to prevent the irq handler from being called during
suspend.

Without this modification upon wakeup you would see the following kernel
error:

[ 118.733717] PM: Wakeup source GPIO0
[ 118.751933] edt_ft5x06 1-0038: Unable to fetch data, error: -13

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index c639ebce914c..c885bfe783a4 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1200,8 +1200,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		enable_irq_wake(client->irq);
+		disable_irq(client->irq);
+	}
 
 	return 0;
 }
@@ -1210,8 +1212,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(client->irq);
+		enable_irq(client->irq);
+	}
 
 	return 0;
 }
-- 
2.17.1

