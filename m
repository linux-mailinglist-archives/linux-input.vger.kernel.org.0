Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8C5F11B6D9
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 17:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731457AbfLKQDj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 11:03:39 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:51024 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388818AbfLKQD3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 11:03:29 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Y1tl0DK4zwQ;
        Wed, 11 Dec 2019 17:03:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576080207; bh=AO4ukHwV9QpNi0US401dnW4qucmusMjSQ/kpCSF8EjY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=NAi+IgEn5gdlt/3Jqm8U2WEv6nA4APhea1eDhUw3egVvfTjQfZ0Wy8tCJ7UQz+WRF
         hLahOWk8eRVWehZlHD7usJkXV9neZPvHm87zAlt4ddBT26F3C1tOHJZ/7a9MEk8swN
         RrupacI0Kz9zHcHL3EFUSoFONtJ2uwO8VvZwWTha3yuF8YREaRfn/keleLLf/9/Brj
         2/NR8hFnWL9Vm2E6khvevcpSwFzeHRzkVPWRJIPzPZXWQDe+Byi8ZELdk5x/GHGgWE
         lXN/vjqsJ39abOPl8ciKN/+7x5a9N2H80Yn3sNAWm/ewnVCdWRy/V8/7IFtgfgB/gO
         OWSnu3TcW41lw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 17:03:26 +0100
Message-Id: <882916345a8aa2dc545a1bd2ca150cf913371d1a.1576079249.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 9/9] dt-bindings: input: elants-i2c: Document eKTF3624
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

The eKTF3624 hardware is similar to eKTH3500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 Documentation/devicetree/bindings/input/elants_i2c.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/elants_i2c.txt b/Documentation/devicetree/bindings/input/elants_i2c.txt
index 45fab32bbc19..1bc60303f0ea 100644
--- a/Documentation/devicetree/bindings/input/elants_i2c.txt
+++ b/Documentation/devicetree/bindings/input/elants_i2c.txt
@@ -1,7 +1,7 @@
 Elantech I2C Touchscreen
 
 Required properties:
-- compatible: must be "elan,ekth3500".
+- compatible: must be "elan,ekth3500" or "elan,ektf3624".
 - reg: I2C address of the chip.
 - interrupts: interrupt to which the chip is connected (see interrupt
   binding[0]).
-- 
2.20.1

