Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5797C2332F7
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 15:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgG3NYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 09:24:51 -0400
Received: from vps.xff.cz ([195.181.215.36]:54970 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728737AbgG3NYv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1596115489; bh=XAdHa1hy943EkmZdCmSbORjRP3twqUeW2Bi627ZbOdE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Ko+QELrCTZGDxpAlkAuQKsdGtumL1tTsHm8rcsqQQ0UVOMSElkzFgpxpwm1TYnGsm
         yBzlVPcxR+jsUFH1V4q1Y0WScaGF1OdFYsrk/FQzwU3PiHECyeVV9I3ApmzcNwp/7R
         ESOR/l/6MrfAe+hr4RTLNZLKylUEF8cyCMi6FC6Y=
From:   Ondrej Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: input: gpio-vibrator: Don't require enable-gpios
Date:   Thu, 30 Jul 2020 15:24:43 +0200
Message-Id: <20200730132446.3139980-2-megous@megous.com>
In-Reply-To: <20200730132446.3139980-1-megous@megous.com>
References: <20200730132446.3139980-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is possible to turn the motor on/off just by enabling/disabling
the vcc-supply. Change the binding to require either enable-gpios
or vcc-supply or both.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
index 2384465eaa19..082ac06471db 100644
--- a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
@@ -24,7 +24,12 @@ properties:
 
 required:
   - compatible
-  - enable-gpios
+
+anyOf:
+  - required:
+    - enable-gpios
+  - required:
+    - vcc-supply
 
 additionalProperties: false
 
-- 
2.27.0

