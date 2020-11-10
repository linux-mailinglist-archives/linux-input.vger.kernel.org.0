Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC68B2ADE04
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 19:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731503AbgKJSQr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 13:16:47 -0500
Received: from goliath.siemens.de ([192.35.17.28]:49959 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730174AbgKJSQq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 13:16:46 -0500
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AAIGPLW019676
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 19:16:25 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.14.175])
        by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 0AAIGPAK032366;
        Tue, 10 Nov 2020 19:16:25 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id BCE4970BAB5;
        Tue, 10 Nov 2020 19:16:24 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v4 2/4] dt-bindings: touchscreen: goodix: add info about disabling FW loading
Date:   Tue, 10 Nov 2020 19:15:48 +0100
Message-Id: <20201110181550.23853-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-3-andrej.valek@siemens.com>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add information about option how to disable FW loading for each boot.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../devicetree/bindings/input/touchscreen/goodix.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index da5b0d87e16d0..379ef69a54d31 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -54,6 +54,10 @@ properties:
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
 
+  goodix,do-not-load-fw:
+    description: Disable FW/CFG loading
+    type: boolean
+
 additionalProperties: false
 
 required:
-- 
2.20.1

