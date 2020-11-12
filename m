Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D252B03B9
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgKLLVG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgKLLVD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:21:03 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20909C0613D1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:21:03 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kdAep-0003Oj-J8; Thu, 12 Nov 2020 12:20:51 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kdAen-0003Am-MN; Thu, 12 Nov 2020 12:20:49 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v1] dt-bindings: touchscreen: add touchscreen-read-duration-us and touchscreen-settling-time-us properties
Date:   Thu, 12 Nov 2020 12:20:48 +0100
Message-Id: <20201112112048.12134-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to the TI application bulletin [1] we deal with two generic
mechanisms which would affect the precision of provided input events:

|TOUCH SCREEN SETTLING TIME
|
|When the touch  panel is pressed or touched, there are
|two mechanisms that will affect the voltage level at the contact point of
|the touch panel. These two mechanisms will cause the voltage across the
|touch panel to “ring” (oscillate), and then slowly settle (decay)
|down to a stable DC value.
|
|The two mechanisms are:
| 1) Mechanical bouncing caused by vibration of the top layer sheet  of
|    the touch  panel  when  the  panel  is  pressed.
|
| 2) Electrical  ringing  due  to  parasitic  capacitance  between the top
|    and bottom layer sheets of the touch panel and at the  input  of  ADS7843
|    that  causes  the  voltage  to  “ring”(oscillate).

Since both of this mechanisms are board specific and reflect the
mechanical, and electrical properties of end product, it is better to
provide a generic properties to address them.

The touchscreen-read-duration-us property should address 1. mechanism.
This effect can be triggered by device specific design. The duration ma be
dependent on the use case of the end device. For example a touch where
writing is required may have other timing requirements as the device
where only "buttons" should be pressed.

The touchscreen-settling-time-us property should address 2. mechanism
where the size and construction of touch screen plates affect the parasitic
capacitance and time needed between enabling power supply for the
plates, and actual usable voltage level to detect the position of touch event.

[1] https://www.ti.com/lit/an/sbaa036/sbaa036.pdf

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/input/touchscreen/touchscreen.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index a771a15f053f..8ba845f68d5c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -55,6 +55,15 @@ properties:
       values dependent on the controller)
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  touchscreen-read-duration-us:
+    description: Averaged time to sample each read to detect waves within
+      specified duration (valid values dependent on the controller)
+
+  touchscreen-settling-time-us:
+    description: Time it takes for the touchscreen ADC to produce valid samples
+      again after switching between axes (valid values dependent on the
+      controller)
+
   touchscreen-inverted-x:
     description: X axis is inverted
     type: boolean
-- 
2.28.0

