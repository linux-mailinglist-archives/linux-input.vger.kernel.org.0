Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E1E2AD217
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 10:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgKJJIZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 04:08:25 -0500
Received: from david.siemens.de ([192.35.17.14]:38739 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728048AbgKJJIR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 04:08:17 -0500
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AA981fE003460
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 10:08:01 +0100
Received: from dev.vm7.ccp.siemens.com ([167.87.134.60])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 0AA980BA003590;
        Tue, 10 Nov 2020 10:08:00 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 9497070FF87;
        Tue, 10 Nov 2020 10:07:58 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     robh@kernel.org, nick@shmanahar.org, hadess@hadess.net,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH v3 2/4] dt-bindings: touchscreen: goodix: add info about disabling FW loading
Date:   Tue, 10 Nov 2020 10:07:18 +0100
Message-Id: <20201110090720.6650-3-andrej.valek@siemens.com>
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
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index da5b0d87e16d0..b61e019ff1a0b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -53,6 +53,7 @@ properties:
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
+  goodix,do-not-load-fw: false
 
 additionalProperties: false
 
-- 
2.20.1

