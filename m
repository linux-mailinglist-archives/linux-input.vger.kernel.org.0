Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB001B917D
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgDZQLg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:36 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:1171 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgDZQLS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:18 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZX3hFFzHm;
        Sun, 26 Apr 2020 18:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917476; bh=XWxiQ6jajvnMhjPTh+oRxLg2bSDp+rmdkahKN65j0ZY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=giPoO9RtwE8Yqf77iyZhlznWWFJUFjpTapYs+Rq1ag/SdBN8ETkYuTbJNqbKAZc9A
         Vp/hYrgSQiFcsEGIZ7TqqTWSNp9qfbZXO9dw/Celg2DV2QXJAk9xy7yXFcp/5Bfw/H
         bTnj1M9DizgxjRrvIg/sVIRJ9pOGp2Z/BFWMOai3kNi/MOJG/hj4buQPG4mqg7BGBO
         gI6zAH770TO06YSpYw+Q8iv7RiAKGW2RLi5VUEGCw6/1sNTjcZS6QoVepGa9UUrXFR
         5GLDuBR7xfgEL9xrKStjQWNbDzHc4YPlRBPRU7UbKsIuo456LshY8IIDwFOiY4nQBR
         LPspn/LHi5WiA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:15 +0200
Message-Id: <64d0244628a921c0aae5ffed8060c9c8938059d4.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 08/10] dt-bindings: input: elants-i2c: Document common
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

