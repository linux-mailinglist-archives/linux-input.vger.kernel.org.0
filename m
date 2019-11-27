Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF8110B012
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 14:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfK0NXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36703 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfK0NXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHe-0001hJ-6L; Wed, 27 Nov 2019 14:23:06 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHd-000623-Pf; Wed, 27 Nov 2019 14:23:05 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix dlg,disable-key-power description
Date:   Wed, 27 Nov 2019 14:23:04 +0100
Message-Id: <20191127132304.22924-4-m.felsch@pengutronix.de>
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

There was a bug within the driver since commit f889beaaab1c ("Input:
da9063 - report KEY_POWER instead of KEY_SLEEP during power
key-press"). Since we fixed the bug the KEY_POWER will be reported
always so we need to adapt the dt-bindings too. Make the description
more precise while on it.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- change description according Dmitry's suggestion.

 Documentation/devicetree/bindings/input/da9062-onkey.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
index 0005b2bdcdd7..9f895454179d 100644
--- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
+++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
@@ -15,9 +15,8 @@ Required properties:
 
 Optional properties:
 
-- dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press when triggered using a long press of the OnKey.
+- dlg,disable-key-power : If this property is present, the host will not be
+    issuing shutdown command over I2C in response to a long key-press.
 
 - dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
     otp values. See nONKEY_PIN register description for more information.
-- 
2.20.1

