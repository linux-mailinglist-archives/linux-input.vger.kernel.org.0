Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3862EF82A
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 20:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbhAHTcr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 14:32:47 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:28624 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAHTcr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 14:32:47 -0500
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Jan 2021 14:32:46 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610134195;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=0XsUlmivodqVELnYxvBDwLWV+prIjoRPh7hSsFfBfcU=;
        b=WRdq3XG8Gz5+3GekNQ65XttIiOafdQaEMW6PO4OHoZqcEKkaZxns/I/4c3Zb+BEuh8
        3jQTi/UvNg0AXHkbEb+NmTXQ5dWo2E2d9josFa2XYjgmleEpatasLXmKKZflEnr9WPIl
        lRsbWvhaG9AhKSXFxBu3hX9PAb5Q74jCJNViovvrJOusAkcese8O4VsrK2pkCoh739gx
        +aA+TH2cObUlB0WWkSDNcQQXLFkK8+UuW5wEvxjqUXFnQOmubPr5mbvgEknI3yEFyMFb
        MOWBJLb3GuouR8NI0H0nBveBvbRJkbVw+qOQmp7YSPhdkn+8sttb0VXiDfbBvYFe8CrO
        0CEw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB6m6Efvw="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x08JNkLk1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 8 Jan 2021 20:23:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ondrej Jirman <megous@megous.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: add iovcc-supply
Date:   Fri,  8 Jan 2021 20:23:36 +0100
Message-Id: <20210108192337.563679-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment, the edt-ft5x06 driver can control a single regulator
("vcc"). However, some FocalTech touch controllers have an additional
IOVCC pin that should be supplied with the digital I/O voltage.

The I/O voltage might be provided by another regulator that should also
be kept on. Otherwise, the touchscreen can randomly stop functioning if
the regulator is turned off because no other components still require it.

Document (optional) support for controlling the regulator for IOVCC
using "iovcc-supply".

Cc: Ondrej Jirman <megous@megous.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index bfc3a8b5e118..2e8da7470513 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -56,6 +56,7 @@ properties:
   wakeup-source: true
 
   vcc-supply: true
+  iovcc-supply: true
 
   gain:
     description: Allows setting the sensitivity in the range from 0 to 31.
-- 
2.30.0

