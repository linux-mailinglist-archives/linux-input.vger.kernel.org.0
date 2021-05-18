Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E7338795B
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 14:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhERM7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 08:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhERM7S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 08:59:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CC6C061756
        for <linux-input@vger.kernel.org>; Tue, 18 May 2021 05:57:58 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lizIE-0002tl-By; Tue, 18 May 2021 14:57:50 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lizID-00078e-Ro; Tue, 18 May 2021 14:57:49 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and z2 channels
Date:   Tue, 18 May 2021 14:57:47 +0200
Message-Id: <20210518125748.26823-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210518125748.26823-1-o.rempel@pengutronix.de>
References: <20210518125748.26823-1-o.rempel@pengutronix.de>
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
 .../bindings/input/touchscreen/resistive-adc-touch.yaml  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
index 53df21a6589e..538c3b1ef1e1 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
@@ -43,6 +43,7 @@ properties:
   touchscreen-inverted-y: true
   touchscreen-swapped-x-y: true
   touchscreen-min-pressure: true
+  touchscreen-x-plate-ohms: true
 
 additionalProperties: false
 
@@ -59,3 +60,11 @@ examples:
       io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
       io-channel-names = "x", "y", "pressure";
     };
+  - |
+    resistive_touch {
+      compatible = "resistive-adc-touch";
+      touchscreen-min-pressure = <50000>;
+      io-channels = <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
+      io-channel-names = "x", "y", "z1", "z2";
+      touchscreen-x-plate-ohms = <800>;
+    };
-- 
2.29.2

