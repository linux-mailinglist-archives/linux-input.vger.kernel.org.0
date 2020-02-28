Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF26172DCE
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 02:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730450AbgB1BCX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 20:02:23 -0500
Received: from hermes.aosc.io ([199.195.250.187]:45214 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730148AbgB1BCX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 20:02:23 -0500
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id C17734B3D1;
        Fri, 28 Feb 2020 01:02:17 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: input: touchscreen: add compatible string for Goodix GT917S
Date:   Fri, 28 Feb 2020 09:01:44 +0800
Message-Id: <20200228010146.12215-2-icenowy@aosc.io>
In-Reply-To: <20200228010146.12215-1-icenowy@aosc.io>
References: <20200228010146.12215-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
        t=1582851742;
        h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
        bh=Jg1jO+WxbhVjuN1AaAS0cnMrPopTgQ7H+WzftYXVnhY=;
        b=d62hkHQ/CqvF2ocRNpLb8ySENCyFTSBTm4iraT1oTlZP+qoahVoY9n0PBWdjPJC4pcE+C9
        jsB1f8iG1xuHwQagRkJp1nkV35BynSvuUaIbp2eBjasgrLFILzo4J2oKTUzOJoybqupapb
        wQYQgVXxFEHYCZSuo8xj3gOktVSdJE8=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix GT917S is a new touchscreen chip from Goodix.

Add its compatible string to the device tree binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Acked-by: Rob Herring <robh@kernel.org>
---
No changes in v3.
Changes in v2:
- Adapted for the new YAML-based binding.
- Added Rob's ACK.

 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index d7c3262b2494..109e5ca8d6e8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -21,6 +21,7 @@ properties:
       - goodix,gt911
       - goodix,gt9110
       - goodix,gt912
+      - goodix,gt917s
       - goodix,gt927
       - goodix,gt9271
       - goodix,gt928
-- 
2.24.1

