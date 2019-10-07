Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377F3CEDA8
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 22:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfJGUlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 16:41:12 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:31126 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGUlM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 16:41:12 -0400
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 16:41:11 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570480870;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=y8f+sYJ91TtDU2vlLy6NOO6jQnF4cVdmsVnnIDoLyiA=;
        b=tSQzyzLm+Fo00HDpoT/shtrZaJXvf+YCYrtHYnGmKRz7jmQ4yTOKk7f5B+cnpNTkMS
        IgQ56PznddGW9Lk80Be4NZc70MDQsKyEYzjnfkXbvjZfvwpKPj4iuYH0ybGtPKF7yd5f
        EU2a5RMA2XDkJT83nIWVlP55sde3nQ8nRcQtIdY6YGKlK2t1oyIU5LTMIU+5+5Ig8nBC
        Ilrn13Kz3s9H+h89vQnyrP+UXR8SMUFNBVa/gIFGX/sps6uoyUp7Pj1GzzOfz+rB1hU8
        /8iKSR7w4lICTXq8ldcI6r7dwFoHTfRtokt85sjVsL8uLhv6hrljoqqWSLVs/6ol0ChS
        jXVA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXt87vtBtcfg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv97KZF45U
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 22:35:15 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] dt-bindings: mms114: document melfas,mms345l binding
Date:   Mon,  7 Oct 2019 22:33:42 +0200
Message-Id: <20191007203343.101466-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007203343.101466-1-stephan@gerhold.net>
References: <20191007203343.101466-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mms114 driver now supports MMS345L; document the
melfas,mms345l binding that is used for it.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
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
2.23.0

