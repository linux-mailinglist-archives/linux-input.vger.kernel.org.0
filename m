Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220F61A670A
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbgDMNcv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:51 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:28891 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729920AbgDMNc3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:29 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gH5FLCz2Ft;
        Mon, 13 Apr 2020 15:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784747; bh=XWxiQ6jajvnMhjPTh+oRxLg2bSDp+rmdkahKN65j0ZY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=CElRXrTwwR6p0xH3/DMHcFAdKItfiOEV0OgYlIRxi2RAYATPcWaPyngj+ClngR9Vs
         Y0oVgF2kJxKg1lWT3NK1qzh1ds4+xE3ZwHLI3tjJwrQVU5Gnz19OYe+jBfO6Wc13h6
         arErBP6Hw94k2aMffVjpnxUh9zSAhZQBpehC6a0PY0ErK2IOd7IRgVQGV+6vv2AW9N
         IOFfpGcDW2ftGo9U95bSVY+I5mU2GkZuExrU1QmKccjRfwLPsbCKSZQcSCQQEm3pLO
         EoEBGp5Cjd4I6HKmxaB7v1Xjqxs8WEJ3VhjBA3FlaZK8G1ipbplGoqts5iJ8+NW2Q/
         1zGAlzlIO1szw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:26 +0200
Message-Id: <e3b15cbd41d336a2d9594ee1708dddb2ada66b77.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 8/9] dt-bindings: input: elants-i2c: Document common
 touchscreen properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Document support of the common touchscreen properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 Documentation/devicetree/bindings/input/elants_i2c.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
index 5edac8be0802..45fab32bbc19 100644
--- a/Documentation/devicetree/bindings/input/elants_i2c.txt
+++ b/Documentation/devicetree/bindings/input/elants_i2c.txt
@@ -14,9 +14,13 @@ Optional properties:
 - reset-gpios: reset gpio the chip is connected to.
 - vcc33-supply: a phandle for the regulator supplying 3.3V power.
 - vccio-supply: a phandle for the regulator supplying IO power.
+- see [2] for additional properties
+
+For additional optional properties see: touchscreen.txt
 
 [0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 [1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+[2]: Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
 
 Example:
 	&i2c1 {
-- 
2.20.1

