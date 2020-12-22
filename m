Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512462E040C
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 02:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgLVBso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 20:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgLVBso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 20:48:44 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3728FC0613D3
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 17:48:04 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id x1so1814406pgh.12
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 17:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDIsemzKxtHAHJzZ7gM2znDYcSMfv5fCVTIAtVLgQq0=;
        b=XyBE7ix/IGBl2i/qY1H64EnvSZqbuoYHI08Fji/IL0onEa3zvWZKkG0A7t9q0zzwTm
         /L7+1P8Z8hLmOwcRheSvWcic9wqCI0ApgxaSMoQOSKS7Nc+CUbZSsraWjMT9TBfDUcvh
         CgFzHvDU6rSUaF8qY8Ah7Yg7IZxQso80+ThTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EDIsemzKxtHAHJzZ7gM2znDYcSMfv5fCVTIAtVLgQq0=;
        b=Ho+XXLjVGN4JJlPbRLnwWWzW4mKGbc4xz6ghyvSqEw1enfBJvVEbzzoO4MUwE8rzTR
         SwNeRRPVnfiRARQeJXLsys+OFumB+vVrrsjK358Wpt3V/lHg3rzsuMKnL3dgYSysB8Wc
         Zvz7w4yxGlNiErVyu4VqtyxWvxv6Qf3ru1t1KnvYQQeKbLpktyiYc+qDGPhi34/9T7wm
         9s0fmV9AqEuIftd2ZOd6vfRbacghzr++6yQrSOBRe7Z9IExiOIt0I9GKGSdiaVQMKjl7
         MPgbaKdRsMm/5Rg1jmcyy8BDCsh2Bmp4Ser2HMQodQ0XzriX++97JEzJ14TGnVyqx6Zg
         wfvw==
X-Gm-Message-State: AOAM530TqvnS2d0gzgq1IYy6p4O+3dI3fydHCx7EWVid9rAZqYl8tAQA
        rWCd4bBSz33hLmbi9p9lv8QjsA==
X-Google-Smtp-Source: ABdhPJyeOYYYdWY8GIzSUI6oLRjRJUQjm4MDkpIUwbwPAOv31gexN4eY7F8uUQDeD2+3ET+UKs8uDg==
X-Received: by 2002:a62:764a:0:b029:19d:9fa8:5bc6 with SMTP id r71-20020a62764a0000b029019d9fa85bc6mr17274769pfc.76.1608601683803;
        Mon, 21 Dec 2020 17:48:03 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id h8sm20164316pjc.2.2020.12.21.17.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 17:48:03 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dtor@chromium.org, swboyd@chromium.org, dianders@chromium.org,
        rajatja@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: input: cros-ec-keyb: Add a new property
Date:   Mon, 21 Dec 2020 17:47:57 -0800
Message-Id: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a new property `google,custom-keyb-top-row` to the
device tree for the custom keyboard top row design.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 .../devicetree/bindings/input/google,cros-ec-keyb.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 8e50c14a9d778..f105eae1cf445 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -31,6 +31,13 @@ properties:
       if the EC does not have its own logic or hardware for this.
     type: boolean
 
+  google,custom-keyb-top-row:
+    $ref: '/schemas/types.yaml#/definitions/uint16-array'
+    description: |
+      An ordered u16 array containing the action keycode values of the function
+      keys, from left to right. Specified only when the board has a custom
+      design for the top row keys on the keyboard.
+
 required:
   - compatible
 
-- 
2.26.2

