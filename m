Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FACFB3C18
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 16:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388409AbfIPOED (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 10:04:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37015 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388403AbfIPOED (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 10:04:03 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbk-0000tE-Fj; Mon, 16 Sep 2019 16:04:00 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbj-0008GD-ST; Mon, 16 Sep 2019 16:03:59 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/4] dt-bindings: Input: da9062 - fix dlg,disable-key-power description
Date:   Mon, 16 Sep 2019 16:03:57 +0200
Message-Id: <20190916140358.30036-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916140358.30036-1-m.felsch@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
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
 Documentation/devicetree/bindings/input/da9062-onkey.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt b/Documentation/devicetree/bindings/input/da9062-onkey.txt
index d1792452ceff..648b1930df1b 100644
--- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
+++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
@@ -15,9 +15,9 @@ Required properties:
 
 Optional properties:
 
-- dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press when triggered using a long press of the OnKey.
+- dlg,disable-key-power : Disable host triggered hard shutdown using a long
+    key-press. If this property isn't present the host will send an i2c shutdown
+    command on a long key-press.
 
 - dlg,key-opmode : Set the nONKEY behaviour. This value is initial set by the
     otp values. Check [1] for more details. Valid value range: 0x0..0x3
-- 
2.20.1

