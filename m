Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4A2E11B6DD
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388078AbfLKQDp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:03:45 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:62306 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388815AbfLKQD2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:28 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1tj75jbzww;
        Wed, 11 Dec 2019 17:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080206; bh=Ied8n5JGgcT/Q6GVeD3SNToh2Vsqko/Bq33v2AXfFoI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GWZfg/lmm50OYVE/ONG2Zh/HK5dnCXByevprO5MhDC0/ZzVbxTDX91SnX6s5+tF1R
         e47phCs+3f/5khR7iD2nNVfltIXOmQqJv6WSsdlP5GguneVmDkzzE9/5iHE6D/vwvk
         IFnYumpFr+U8m74VzAt/GeUnOWPq59Qe56oCy5EmXrXkF/8j2U1r25rzyhu9DQa/Lw
         0+xi01+XCs1+EAqkGARQK9p8A5WjdUATs+HeTkb+VPEfjWwD1s4rowBprbItFJg5SQ
         uBt3cMFF5xJmytXmHKhSjcTOuE1mcH+dHFBtjucOdUItkJnEw9WaAa/7a+ws50O64R
         5D3M7iR4yDvIA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:25 +0100
Message-Id: <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 8/9] dt-bindings: input: elants-i2c: Document common
 touchscreen properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh-dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Document support of the common touchscreen properties.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
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

