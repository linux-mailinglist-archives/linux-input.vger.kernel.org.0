Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C41E1B591F
	for <lists+linux-input@lfdr.de>; Thu, 23 Apr 2020 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgDWKZZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Apr 2020 06:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725863AbgDWKZY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Apr 2020 06:25:24 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D539FC035493;
        Thu, 23 Apr 2020 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587637520;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=fHH3s50mbhR8q8N+Q4b54KKJBPxiB7cbCT4UniR/S4c=;
        b=Rc7JLUSQGzS48TG6x0BLo02IO28cHEHlSrpYYOywbLgyGtOGt4O0xd5rCrXSFFAXup
        wpdTpfyZ1AktOrCaRoar2gP4I11eg4axj94RADF5SNSYqarMwNi/CN1/GwCOezqKq1SG
        Amlto29OXVw0d5ySPVOkGz+X+GGg7AhNd9rzTVak8U6FZnl4qnfo6IKAG2xmkAn5+aqP
        h/XLR+vv/YeHQR0bFfwDjJzFKWUTQ7KSvhnhESKLewpQPjmba64UsJU6+1yPO47crLqR
        o+PqBx4u8gKhNkBBsqpuzEcdPqMnRAgbbBLPjICNXL86rHI1jEhXZqdyIkqjfqXbjaSQ
        CQEQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3NAPF8nV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 23 Apr 2020 12:25:15 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] dt-bindings: mms114: document melfas,mms345l binding
Date:   Thu, 23 Apr 2020 12:24:31 +0200
Message-Id: <20200423102431.2715-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200423102431.2715-1-stephan@gerhold.net>
References: <20200423102431.2715-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mms114 driver now supports MMS345L; document the
melfas,mms345l binding that is used for it.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Andi Shyti <andi@etezian.org>
Acked-by: Rob Herring <robh@kernel.org>
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
2.26.2

