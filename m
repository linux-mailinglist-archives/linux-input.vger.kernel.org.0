Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1804B388AD7
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 11:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345045AbhESJnw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 05:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344932AbhESJnv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 05:43:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04866C061761
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 02:42:32 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ljIie-0002Bk-GX; Wed, 19 May 2021 11:42:24 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1ljIic-0007Ox-Qw; Wed, 19 May 2021 11:42:22 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and z2 channels
Date:   Wed, 19 May 2021 11:42:20 +0200
Message-Id: <20210519094221.27792-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210519094221.27792-1-o.rempel@pengutronix.de>
References: <20210519094221.27792-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For pressure calculation based on plates resistance we need some additional
properties:
- z1 and z2 channels with additional measurements between plates
- actual resistance of the touchscreen. Currently we use only
  X-resistance.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../input/touchscreen/resistive-adc-touch.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
index 38b4cbee9429..7fc22a403d48 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
@@ -27,6 +27,8 @@ properties:
       - description: x
       - description: y
       - description: pressure (optional)
+      - description: z1 (optional)
+      - description: z2 (optional)
 
   io-channel-names:
     oneOf:
@@ -37,6 +39,11 @@ properties:
           - enum: [x, y, pressure]
           - enum: [x, y, pressure]
           - enum: [x, y, pressure]
+      - items:
+          - enum: [x, y, z1, z2]
+          - enum: [x, y, z1, z2]
+          - enum: [x, y, z1, z2]
+          - enum: [x, y, z1, z2]
 
   touchscreen-size-x: true
   touchscreen-size-y: true
@@ -46,6 +53,7 @@ properties:
   touchscreen-inverted-y: true
   touchscreen-swapped-x-y: true
   touchscreen-min-pressure: true
+  touchscreen-x-plate-ohms: true
 
 additionalProperties: false
 
@@ -68,3 +76,11 @@ examples:
       io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
       io-channel-names = "y", "pressure", "x";
     };
+  - |
+    touchscreen {
+      compatible = "resistive-adc-touch";
+      touchscreen-min-pressure = <50000>;
+      io-channels = <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
+      io-channel-names = "x", "z1", "z2", "y";
+      touchscreen-x-plate-ohms = <800>;
+    };
-- 
2.29.2

