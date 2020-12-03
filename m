Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBF82CD69A
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 14:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387671AbgLCNWt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 08:22:49 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:25626 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387653AbgLCNWt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Dec 2020 08:22:49 -0500
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 08:22:48 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607001597;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=roHgNlmN+vU8M22GigtIWTMULnCCY+UXLgvb6z4Xc0E=;
        b=tN+WuVFkbyHJtY6s+ths9o3W50ynXhikRCPq1OvbqDMylUBdKX2sKOp43/pSujcV3J
        9ALoLcoK0UJfovjZumWG8fHVa4NzMbm+kWlT5En5B8jQqN4FmKhETiGGXEwBgv9rlHUB
        uVDg+Asi5XF0kNnnmYbsfUZOV3aD+FZKmLLKGPslIQFR55Oi81pgpeW7wdhVBDAwC74T
        L33gDIxp6+Sks9CuUTLl/LPVC6qtua5a4nzV9AKbiJIHKn4h0P8jmZvWkNGYGd70bd8U
        p0aGbj/DOJrBWEY0Tzsivt7D8kdiKn9u6MkK49YVWLdo9g5oAxkUw8uVbhnD7ccJZbfW
        AnDA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlbU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id Z061efwB3DDvqid
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 3 Dec 2020 14:13:57 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document vddio-supply
Date:   Thu,  3 Dec 2020 14:12:41 +0100
Message-Id: <20201203131242.44397-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203131242.44397-1-stephan@gerhold.net>
References: <20201203131242.44397-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Samsung touchkey controllers are often used with external pull-up
for the interrupt line and the I2C lines, so we might need to enable
a regulator to bring the lines into usable state. Otherwise, this might
cause spurious interrupts and reading from I2C will fail.

Document support for a "vddio-supply" that is enabled by the tm2-touchkey
driver so that the regulator gets enabled when needed.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/input/cypress,tm2-touchkey.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
index 90d4def83182..52dca8b64081 100644
--- a/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/cypress,tm2-touchkey.yaml
@@ -37,6 +37,11 @@ properties:
   vcc-supply:
     description: Optional regulator for MCU, 1.8V-3.3V (depending on MCU).
 
+  vddio-supply:
+    description: |
+      Optional regulator that provides digital I/O voltage,
+      e.g. for pulling up the interrupt line or the I2C pins.
+
   linux,keycodes:
     minItems: 1
     maxItems: 4
-- 
2.29.2

