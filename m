Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A087D21EDDE
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 12:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgGNKXy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 06:23:54 -0400
Received: from vps.xff.cz ([195.181.215.36]:46176 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725952AbgGNKXk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 06:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594722218; bh=XAdHa1hy943EkmZdCmSbORjRP3twqUeW2Bi627ZbOdE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=nhMYmZ3NN+TH1TCTMYUDj5O0FumKLt1l2sRZrVSf1T/PKmHVj0VSujbZoDG6Mnzyu
         epKX23Bl09/hGM7mGHoHRf2zR2mgICKTlpt9HfC2CFuFOClBvsyGLM/7e9QCIfZ+lT
         Jkx51pFi8DTRE998eTRhk91+W9erJZAz9mBg3qMs=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: input: gpio-vibrator: Don't require enable-gpios
Date:   Tue, 14 Jul 2020 12:23:00 +0200
Message-Id: <20200714102303.3007896-2-megous@megous.com>
In-Reply-To: <20200714102303.3007896-1-megous@megous.com>
References: <20200714102303.3007896-1-megous@megous.com>
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

