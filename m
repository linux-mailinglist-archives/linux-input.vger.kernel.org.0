Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3830F10AF56
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 13:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfK0MKG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 07:10:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49431 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfK0MKG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 07:10:06 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8k-0002KC-VN; Wed, 27 Nov 2019 13:09:50 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZw8j-0006Ij-Ju; Wed, 27 Nov 2019 13:09:49 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: Input: edt-ft5x06 - document wakeup-source capability
Date:   Wed, 27 Nov 2019 13:09:46 +0100
Message-Id: <20191127120948.22251-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127120948.22251-1-m.felsch@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The current driver behaviour was to enable the wakeup-source everytime.
After discussion [1] we decided to change that behaviour so the device
will act as wakeup-source only if the "wakeup-source" dt-property is
present.

The patch adds the binding documentation to enable the wakeup-source
capability.

[1] https://patchwork.kernel.org/patch/11149037/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- make use of common dt-property wakeup-source
- adapt commit message

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 0f6950073d6f..0e57315e9cbd 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -36,6 +36,8 @@ Optional properties:
  - pinctrl-0:   a phandle pointing to the pin settings for the
                 control gpios
 
+ - wakeup-source: If present the device will act as wakeup-source
+
  - threshold:   allows setting the "click"-threshold in the range
                 from 0 to 80.
 
-- 
2.20.1

