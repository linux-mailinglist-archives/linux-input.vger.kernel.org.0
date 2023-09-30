Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0264B7B4278
	for <lists+linux-input@lfdr.de>; Sat, 30 Sep 2023 19:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjI3RJZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Sep 2023 13:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbjI3RJY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Sep 2023 13:09:24 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65225E3
        for <linux-input@vger.kernel.org>; Sat, 30 Sep 2023 10:09:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso124990275e9.3
        for <linux-input@vger.kernel.org>; Sat, 30 Sep 2023 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696093760; x=1696698560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eazNkVg7ZDFPpoUK8MtMolTuUsmUKvo1Fk2+nn/9tis=;
        b=s2ijEURJA29nMB/sPvmwsqxRUpnTWdNNnV+2r7q3wbfPSk9dL0ieBOpJ4s6xBSVJdz
         mf3ULkfjVhEle4zlW6mAz0I3OHRO3Uk7tj8kYCHHQZuSv64NLrH5frDWri15ltjDyT/N
         hGN2Lmh9AmUYNm4Wc9p3b7KbvJxqkprpZJlLpjs4PU4wyIsYF7O8htwm6gJD2IjYKasb
         r5dQvoD7RuClhZdXEjn8cdGk8GJ4mj2f1wwyspXAY5jrPJEv3+6e2uqf09T6q4e5qO6S
         lCMYmA07uwq2YVvulv11XbZ+BbC5vgJi+f9HSjVnSOfo5arxi+pteQCOQqZ7qaYPmYtf
         92zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696093760; x=1696698560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eazNkVg7ZDFPpoUK8MtMolTuUsmUKvo1Fk2+nn/9tis=;
        b=KF7KUtHbT7JHws1F5AHNf+pdhE2+82HwfOe16bregu5HCuWoGJuWoiPgUAOG7DuGyi
         rRfB6YDp6+8HvS0YQoAPhlogRR6lx+LTn0xb0yqh35LAF3Eec7s7Rh3X+Q+g1pxAfwe9
         3HZY7QjQDow62x4LznYo8CEe1u3ToPVCtMOq4X2dzBdNTdKzsOZQncCGc+ySuQyLMo1z
         afFljCCCs96/xa99bp7f4eSWc/K5mbTNK9mXjbC7qrLtdu++kV894KUj+UTjw93SNa/P
         hFduQ3ynXoA5U9ACtVpkWCh1hGr3CWsvNbc1vwgqIl3xduR3ETJcDuSshLo2SZUmdQIW
         5pfQ==
X-Gm-Message-State: AOJu0YxeK12jVPFLnXTGS+J6wTFP2RG56Z7v/cfoNq0+fvOAfitNwEMA
        htC/MlDGdksR3eSBb5dMXp5lUQ==
X-Google-Smtp-Source: AGHT+IG4DP0rG8hSbn5vGlCzsZaU5QmzvewNIjlkJTKCQsqhf7QJQegEomHzUZFdmFtXgCazDnxpwQ==
X-Received: by 2002:a7b:c7d2:0:b0:405:48ba:9c with SMTP id z18-20020a7bc7d2000000b0040548ba009cmr6919155wmk.16.1696093760000;
        Sat, 30 Sep 2023 10:09:20 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b00405c7591b09sm3756368wmj.35.2023.09.30.10.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 10:09:19 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sat, 30 Sep 2023 18:08:45 +0100
Subject: [PATCH 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v1-1-cc3c703f022d@linaro.org>
References: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=5sBJCQ4u75bNy25N0FjR/mDIgxMYqHIB2eDzShxbXlc=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSJMNuTgaXNiiw1DN1ten1naj8/lY/MfD2nRrnn6jKlf
 YtOrEjuKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABN50cTwP15DgjeR5QTngvs7
 gnnu3lojst9U7/9t/fKtxk803O/svM7wz3TV0wX69xJkbvPpeJk5OkZ8LZwkwXjBPJrJNaH7hPa
 qgwA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This new property allows devices to specify some register values which
are missing on units with third party replacement displays. These
displays use unofficial touch ICs which only implement a subset of the
RMI4 specification.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index 4d4e1a8e36be..bd6beb67ac21 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -49,6 +49,16 @@ properties:
     description:
       Delay to wait after powering on the device.
 
+  syna,pdt-fallback-desc:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      An array of pairs of function number and version. These are used
+      on some devices with replacement displays that use unofficial touch
+      controllers. These controllers do report the properties of their PDT
+      entries, but leave the function_number and function_version registers
+      blank. These values should match exactly the 5th and 4th bytes of each
+      PDT entry from the original display's touch controller.
+
   vdd-supply: true
   vio-supply: true
 

-- 
2.42.0

