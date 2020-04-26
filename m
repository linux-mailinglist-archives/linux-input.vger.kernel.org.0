Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C471B927F
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgDZRsJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:48:09 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:57181 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgDZRr5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:47:57 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499Fk33Gmpz11D;
        Sun, 26 Apr 2020 19:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587923275; bh=QrdENjOdip50Y9u0cKEmz3gvoOdwpJXeDlhv5EruSW0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=EVR5Cbm2ACFDdS4WF8Ltc8CeRuGDw7DaJTgGWR2NvBrxKlPzeEvoxXWimbwWfxJ2q
         moIV6P/f5f6Ycc+m5+M7zW1OF8IR2HdyfEEcu310/G0bVAePQ6DZrbrqbcczFgqE+p
         kCdJOmnEcxed00l9Z34Dt3zXzai3Jvnmdb7ErhQ/MdMaPzzdl3u0nYSpF20dpVexiM
         u+pqMcexSh0QBEBNcM+au3MplsFNagA71Swo71HPJzNof8vW6S3XqNbGgtbyqCyGAe
         4g5UGhCh3/eOvQjr6BlH6GyCRSfWFtWZmt1Q1Vj0qfCUWYSvZhOkM9aAVG99Dc1q8M
         V/nQT+aBlOq1A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:47:54 +0200
Message-Id: <7bf9430a0e25bb185cbcc25f9307cf1ddf8f5ab5.1587923061.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 09/10] dt-bindings: input: elants-i2c: Document eKTF3624
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

