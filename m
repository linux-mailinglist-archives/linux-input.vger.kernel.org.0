Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181D219ECD4
	for <lists+linux-input@lfdr.de>; Sun,  5 Apr 2020 19:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgDERQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 13:16:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27408 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgDERQz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Apr 2020 13:16:55 -0400
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Apr 2020 13:16:54 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586107014;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Be1YVcbsbQCiE2Oy1b4tp++StNE0IP1Y1QoF6p581vc=;
        b=thOXkFwmsl0avg2eoeAC6KN2VHctkjiU00hVw9GDIO9PYgpHI4mVMmxWnkra/3PfCd
        XpEnPt2n9iG2J7vb8/Om9wxwF06GivC+G8fmZp1IK0gYzoNQWHKrEH1S2ezuQUSkaqEn
        Rqi9bjeGK4+XSLzIaeI0X642HT300i5h7cS/lxi9eDU62qw4yDOA+HdUyvzehDSiQ1wh
        n/MELEkryymq6fnXs3mXD7MIQ/MlVaCEes/8hBJKB74OPYJTp/z7tp3gOXnkPiePmeOJ
        4yCHP49C7JJrZ5P4FEkmZWUiF/mdye8xDv1Y3SzDQv0tSZFsj8kUzqLkjb2J870RfuS4
        rt7A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NfqU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w35HAoxim
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 5 Apr 2020 19:10:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: mms114: document melfas,mms345l binding
Date:   Sun,  5 Apr 2020 19:09:04 +0200
Message-Id: <20200405170904.61512-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405170904.61512-1-stephan@gerhold.net>
References: <20200405170904.61512-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mms114 driver now supports MMS345L; document the
melfas,mms345l binding that is used for it.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andi Shyti <andi@etezian.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Pick up review tags

v1: https://patchwork.kernel.org/patch/11178503/
---
 Documentation/devicetree/bindings/input/touchscreen/mms114.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
index 2cd954051d29..707234cfd7e6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/mms114.txt
@@ -1,9 +1,10 @@
-* MELFAS MMS114/MMS152 touchscreen controller
+* MELFAS MMS114/MMS152/MMS345L touchscreen controller
 
 Required properties:
 - compatible: should be one of:
 	- "melfas,mms114"
 	- "melfas,mms152"
+	- "melfas,mms345l"
 - reg: I2C address of the chip
 - interrupts: interrupt to which the chip is connected
 - touchscreen-size-x: See [1]
-- 
2.26.0

