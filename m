Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B756110B018
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 14:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfK0NXL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 08:23:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41791 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfK0NXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHe-0001hH-6K; Wed, 27 Nov 2019 14:23:06 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHd-00061x-Oi; Wed, 27 Nov 2019 14:23:05 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode documentation
Date:   Wed, 27 Nov 2019 14:23:02 +0100
Message-Id: <20191127132304.22924-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127132304.22924-1-m.felsch@pengutronix.de>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
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

The onkey behaviour can be changed by programming the NONKEY_PIN
bitfield. Since the driver supports the reconfiguration we need to add
the documentation here.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- add da9061/3 references
- adapt binding description to be more general

 .../devicetree/bindings/input/da9062-onkey.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
index 5f9fbc68e58a..0005b2bdcdd7 100644
--- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
+++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
@@ -19,6 +19,16 @@ Optional properties:
     entry exists the OnKey driver will remove support for the KEY_POWER key
     press when triggered using a long press of the OnKey.
 
+- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
+    otp values. See nONKEY_PIN register description for more information.
+    Valid value range: 0x0..0x3
+
+References:
+
+[1] https://www.dialog-semiconductor.com/sites/default/files/da9061_datasheet_3v6.pdf
+[2] https://www.dialog-semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
+[3] https://www.dialog-semiconductor.com/sites/default/files/da9063_datasheet_2v2.pdf
+
 Example: DA9063
 
 	pmic0: da9063@58 {
-- 
2.20.1

