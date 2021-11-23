Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D86459D08
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 08:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbhKWHu1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 02:50:27 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:59256 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234316AbhKWHu1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 02:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1637652360; bh=ZwzXkb7VIVdxLCW5G29KqfRqnSdsTMlAwEou3+9HlHU=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=g8dtRKTuTVg5zX/mtBUDaXW/KKGHcilLuBfYxZPG8YmxL3UpiPVok/IDkMMXjHXE8
         yrqd8eRBzHSCbqCUB2FvPjzDKVT3Fl9P5ZOtEDVc5dAit6fEMRVG8agGAWMS4vSPux
         osTPZaw6wv+qQ4DUPPDigvTrDLJnmvTE2knP4Q1A=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 23 Nov 2021 08:26:00 +0100 (CET)
X-EA-Auth: ivi0l6uolw6cY/tYzbBGto2Nome5TNXoNj2SwVcik7VzWM5AGV2G91PQBUJLgHv1LBD5IEkXVr7M+2baINybQNxUmhwVaKbLW5d7HB4irBo=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        vincent.knecht@mailoo.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/5] dt-bindings: input: touchscreen: msg2638: Document msg2138 support
Date:   Tue, 23 Nov 2021 08:25:31 +0100
Message-Id: <20211123072534.2775264-3-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123072534.2775264-1-vincent.knecht@mailoo.org>
References: <20211123072534.2775264-1-vincent.knecht@mailoo.org>
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



