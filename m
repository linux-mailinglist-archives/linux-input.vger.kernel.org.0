Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA121B9285
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgDZRsY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:48:24 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:41275 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgDZRr4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:47:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499Fk23htxzwy;
        Sun, 26 Apr 2020 19:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587923274; bh=e69dQImWAeV3iuPB2cdoooKHl0z18xRdJGsPXkuwYGo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=SOnOHKnTUrHtuOYQVIhxmgYG30+ewvbQnnYfCZT2OyoLQcSVx6NmtlRGhm29Mp6iO
         BThGN8V9lQRj5p4pQjNjnXwRsgpurSNyJ1RKfJHtb8u1fzcfOjsQn/f7YYGuKudSs3
         1YW/RDAcAFFQWb9aNAKhKt6f0VwznT76JQtDaj3jOGwIdDLt6uYJgIhptjIUtKIWkZ
         yKqc071Ky7hW8Err3x6YCj/151ltd+PhcKPaw0wSlNAql7Ghdr0KHPb6TicPuKeKaG
         cCuP8Fv0ivob70H9F79ccKNEE4Z/I/fCC2h8/x3Kakw/ZYo/3OY84Mtauuk+86s/QD
         BUmwVVFf86vzA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:47:53 +0200
Message-Id: <90bef6c9f7dedb62161acf6d77a77e7d0e88f77b.1587923061.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 08/10] dt-bindings: input: elants-i2c: Document common
 touchscreen properties
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
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

