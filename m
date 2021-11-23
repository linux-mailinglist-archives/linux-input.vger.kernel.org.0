Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3464E459D9C
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 09:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhKWIR7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 03:17:59 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:32846 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231158AbhKWIR6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 03:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1637655280; bh=1ik2lIfFWQwygKDFBz1wycmemRjU/mep6maZiu4NSAU=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=YmO1gcScKVg/BTHwIa5MUH5JH846VDcV/b6h/l99uHGlIOfdUiUzEfJvhfUKpoVAd
         7LbkmddVoLUdJwTmP/a8RapIhsF9MsZSfRisH7Nd0nwIKjD7AHLYx0yeWLhkfrMmKt
         rR0I4bO+qkM+2625+z1yyLiMJ8TyzDZ8RP90uxZg=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 23 Nov 2021 09:14:39 +0100 (CET)
X-EA-Auth: 5x2kE+nod+nU2crg9xqb15IIOzLPW3JahqhomVKn7nqfdmvrGHev0sjKvK5VprcHN8+2xKdt25rN/BhBgAwm0HvuDVR0PSNBgcC5DqiE4fg=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        vincent.knecht@mailoo.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RESEND PATCH 4/5] dt-bindings: input: touchscreen: msg2638: Document keys support
Date:   Tue, 23 Nov 2021 09:14:32 +0100
Message-Id: <20211123081433.2797395-5-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123081433.2797395-1-vincent.knecht@mailoo.org>
References: <20211123081433.2797395-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Document optional linux,keycodes support.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../devicetree/bindings/input/touchscreen/mstar,msg2638.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
index 2fb7e01bb65a..af4f954de958 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
@@ -36,6 +36,10 @@ properties:
   touchscreen-size-x: true
   touchscreen-size-y: true
 
+  linux,keycodes:
+    minItems: 1
+    maxItems: 4
+
 additionalProperties: false
 
 required:
-- 
2.31.1



