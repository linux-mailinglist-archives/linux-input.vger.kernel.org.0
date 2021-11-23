Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C2A459DA0
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 09:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhKWISA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 03:18:00 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:32848 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230428AbhKWIR7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 03:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1637655279; bh=ZwzXkb7VIVdxLCW5G29KqfRqnSdsTMlAwEou3+9HlHU=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=P7ezOnX36U5pCWSpX5yAwrkaplxRVmWQTysAFkkv7xucS6KHchhBZI4lg8Hzeu2O9
         ReA5TLsAnW3smVRT3QgCRkRPBJQy2TOwVxQXJ6oWQoGAnfnrsRniuffgR35QBzWd1j
         ZlDADUNanq/4B2jUTblnddl2TXXHk7B8VNTHyU7U=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 23 Nov 2021 09:14:39 +0100 (CET)
X-EA-Auth: /RwhYz0QmzDyOu0Mab/Gl2HLnGb2fjjS+A9AEGk4uT5+XSEF3AQllxiYneAMpH54bwkArtfO5d8a6HvqNo2ElatayAP3KH8AZvW75rxawy8=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        vincent.knecht@mailoo.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RESEND PATCH 2/5] dt-bindings: input: touchscreen: msg2638: Document msg2138 support
Date:   Tue, 23 Nov 2021 09:14:30 +0100
Message-Id: <20211123081433.2797395-3-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123081433.2797395-1-vincent.knecht@mailoo.org>
References: <20211123081433.2797395-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Document msg2138 support by adding mstar,msg2138 compatible.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../devicetree/bindings/input/touchscreen/mstar,msg2638.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
index 3a42c23faf6f..2fb7e01bb65a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mstar,msg2638
+    enum:
+      - mstar,msg2138
+      - mstar,msg2638
 
   reg:
     const: 0x26
-- 
2.31.1



