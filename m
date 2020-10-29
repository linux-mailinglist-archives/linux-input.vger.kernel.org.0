Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D0D29F2BF
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgJ2RPk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:15:40 -0400
Received: from goliath.siemens.de ([192.35.17.28]:36929 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgJ2RPk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:15:40 -0400
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09TH47WX011958
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Oct 2020 18:04:07 +0100
Received: from dev.vm7.ccp.siemens.com ([139.22.33.215])
        by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 09TH47uD015940;
        Thu, 29 Oct 2020 18:04:07 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
        by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id D963270FF87;
        Thu, 29 Oct 2020 18:04:06 +0100 (CET)
From:   Andrej Valek <andrej.valek@siemens.com>
To:     nick@shmanahar.org, hadess@hadess.net, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH 2/3] dt-bindings: goodix
Date:   Thu, 29 Oct 2020 18:03:12 +0100
Message-Id: <20201029170313.25529-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029170313.25529-1-andrej.valek@siemens.com>
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
index da5b0d87e16d0..e7d9404c86abf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -53,6 +53,7 @@ properties:
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
+  touchscreen-do-not-load-fw: false
 
 additionalProperties: false
 
-- 
2.20.1

