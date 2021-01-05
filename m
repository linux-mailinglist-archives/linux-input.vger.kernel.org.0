Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7872EA34F
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 03:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbhAECXV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 21:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbhAECXU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 21:23:20 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EEFC061793
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 18:22:40 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id w1so613317pjc.0
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 18:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5v4P5OpFzV6txdYAKpaZWpOyrHHIe3zcVp3Rukxxyc=;
        b=Fd9C5eh1l5XGQUug3JLCx6bXUXKY2FUOKpd6xlqkQRS4CPI390Ko/dfC8c7+vc+ZCB
         8LRQiiZclIEgvq2hT9O1puypOipuNsqJg3xHYYFMfBXXj6OYTmYqXk4UNMPP8vIfNzbd
         MvNlgkR593pRrJ5kR/GRGLiJPzW26BDErirJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5v4P5OpFzV6txdYAKpaZWpOyrHHIe3zcVp3Rukxxyc=;
        b=U9reaChMrtO1ZfoxTEpLeUEMVGJRrDgSGV2zpWxmMgwL1bqyI12YBoKcPbJbLzktwA
         t32tO6WXNZ5ElPftb8NiZfnnPonMtOX7RNFGqwWSaO30obL1M0hOPEANHr6usnHveKG2
         eDA4Gtpvn+qluKGbF7y7N8uPtFg2hR2VaqIoPBPzvJefDnjwyEBltYhYwEgKLcCATSl3
         ptGGUabr3wocLIz8Oquuu+b5uLoTzeLg+MeyuNZKzKSvw/sIf4XJeBuOcHaGRQLX0RuV
         MxCWL3s88VmvUpEFkjNFp2DodD2/eEGf37ZZRdidE8dj8OYdtGQ2Gs7H7+fVqVU94BjE
         qelg==
X-Gm-Message-State: AOAM531OX+FbIWyceulqWRns9DcnWBPpDH6ZuNT1Q7aSTllDXM5/4jAX
        CX7wF4TnUEZdVq8qM+BRIqwUuA==
X-Google-Smtp-Source: ABdhPJwgn2j95/Q5PEpRXUFGNFU6+5GQKsifIo8y/OfwXh0gOAuL2TXdXcMbclnQUpdHu4w07X64NQ==
X-Received: by 2002:a17:902:778e:b029:da:feef:8f2d with SMTP id o14-20020a170902778eb02900dafeef8f2dmr74759358pll.25.1609813359737;
        Mon, 04 Jan 2021 18:22:39 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id t23sm56732903pfc.0.2021.01.04.18.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 18:22:39 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
Date:   Mon,  4 Jan 2021 18:22:33 -0800
Message-Id: <20210104182154.v3.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a new property `function-row-physmap` to the
device tree for the custom keyboard top row design.

The property describes the rows/columns of the top row keys
from left to right.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

(no changes since v2)

Changes in v2:
- add `function-row-physmap` instead of `google,custom-keyb-top-row`

 .../devicetree/bindings/input/google,cros-ec-keyb.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 8e50c14a9d778..7acdb33781d30 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -31,6 +31,16 @@ properties:
       if the EC does not have its own logic or hardware for this.
     type: boolean
 
+  function-row-physmap:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    description: |
+      An ordered u32 array describing the rows/columns (in the scan matrix)
+      of top row keys from physical left (KEY_F1) to right. Each entry
+      encodes the row/column as:
+      (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
+      where the lower 16 bits are reserved. This property is specified only
+      when the keyboard has a custom design for the top row keys.
+
 required:
   - compatible
 
-- 
2.26.2

