Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002D81B917B
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDZQLb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:31 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:26745 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgDZQLS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:18 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZY4cxPzsC;
        Sun, 26 Apr 2020 18:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917477; bh=jOswEKU7i79mQ5w2Qdg1LzFaQcsH2Fj/+9CwRqdDBhA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Em640gqYVGGxZXzgdZBfwtW7YT7djAa3FBa2FOHixg6W5ngkiUNJi3KNik3sG1w6g
         TOxKx7/IlCJsLU8EYmgI1wFSmjsBFpVdlgbofISo0nppu2N6tUS9vjbVquMFID46Eq
         CrSjU9vhAVnPg0447YjXV82emBoJP7TjatouPEEs/6eM+s28B94eSj6Ysw2yzrJV0x
         FOIuXbzVeP3zeL8nHU1Z/BKdYqmuG2mUhEGuqWp3Uj7BL45Ifn9bFDoB/XAbiUPEV9
         TNTXtPVAMXWDtR2Cj1QReUebxZRSrq1hdzYsYbjrYDeOjdcCGZ/XK+coUM5whfZgHk
         a7mtHru9y1K6g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:16 +0200
Message-Id: <45ca127938fafadddcdb502aed8a6aa0e531bbd9.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 09/10] dt-bindings: input: elants-i2c: Document eKTF3624
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

The eKTF3624 hardware is similar to eKTH3500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Rob Herring <robh@kernel.org>
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

