Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F64382CB8
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 14:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbhEQNAm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 09:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237172AbhEQNAh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 09:00:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0BDC061756
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 05:59:20 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1licq0-0006di-NM; Mon, 17 May 2021 14:59:12 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1licpy-000390-Uy; Mon, 17 May 2021 14:59:10 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org
Subject: [RFC PATCH v1 1/3] dt-bindings: touchscreen: add touchscreen-x/y-plate-ohms property
Date:   Mon, 17 May 2021 14:59:07 +0200
Message-Id: <20210517125909.12024-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517125909.12024-1-o.rempel@pengutronix.de>
References: <20210517125909.12024-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Te calculate the pressure on a restrictive touchscreen we need need to
know resistance at least of X plate. Some calculations need to use both
X and Y values.
So, add generic properties which can be used by all drivers

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/input/touchscreen/touchscreen.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 046ace461cc9..4b5b212c772c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -74,6 +74,12 @@ properties:
   touchscreen-y-mm:
     description: vertical length in mm of the touchscreen
 
+  touchscreen-x-plate-ohms:
+    description: Resistance of the X-plate in Ohms
+
+  touchscreen-y-plate-ohms:
+    description: Resistance of the Y-plate in Ohms
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]
-- 
2.29.2

