Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E956A4BA683
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 17:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243466AbiBQQ4W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 11:56:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243475AbiBQQ4V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 11:56:21 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12442B356E
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:06 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u18so10755692edt.6
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkNoYNUdMWUv78TVv7dUpEnHWbbsKCSUGZ841DxfDXg=;
        b=kNG2y4vTHfwVT5ZUdw17DeytDBOvBXqaeQVnYkRz58LebKYzpekZe3ulVobtXe9imC
         4NU8IFZh2iuZOdYGV6LA9Q3Fe0DjDbqZQlE2bpmUK3dVMqQJwGIIvW9h++GwtN4UOVrW
         P7O53RA6umyQ2Ml51ZsldU+NFU2yh0F4yMf50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkNoYNUdMWUv78TVv7dUpEnHWbbsKCSUGZ841DxfDXg=;
        b=rm5Y2aRclundqXq1gyfXAKXtdGmTdAwK/mz+huikSNkskvygM4mVbGSK1cKmMfgZbd
         2HkmW1Vl57BOW7oWIEaX+jpbL3UI1jPiCOFSob/BtX1qyOEkUu0rYrpPACxQPLxTcQZ3
         sT9igjYCbp0HRW0sI7TV4ocBqYsAAEpLK1n19Kv6QTO71p/nvXGRi04m/0WIGgGzOUm8
         Z/0F7sQFIHenBPEPnxtSh3rUph5IXO0VW2//G3bI50yfhJO5q2tJkaA4f8IF649DQlCW
         7lMcpd7ttbG10FVdOvs8mieKRO056VYPtGcDVDiZewj1ItVVz7iCwjyi3WxjtD7Sg1OR
         ntXw==
X-Gm-Message-State: AOAM5302VDXk6aaDIT3pEiJZ2TmrXVetmT9GQYQhtbl6IQzJoD90AKF8
        6UvlsgpTMKYSsd/zck+yE1gL9oSZGEtSkw==
X-Google-Smtp-Source: ABdhPJzTlY+mJt8FL92Kf18Vbfo69m10h0e3Uf353OwM/w04jd3IjrDMoIcpBwdo9lB+0Ht6G701Jg==
X-Received: by 2002:a05:6402:1e88:b0:410:ebb4:c329 with SMTP id f8-20020a0564021e8800b00410ebb4c329mr3597202edf.300.1645116965327;
        Thu, 17 Feb 2022 08:56:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id v4sm965323ejb.72.2022.02.17.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:56:04 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: input: touchscreen: edt-ft5x06: add report-rate
Date:   Thu, 17 Feb 2022 17:55:53 +0100
Message-Id: <20220217165559.313366-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
References: <20220217165559.313366-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It allows to change the M06/M12 default scan rate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 2e8da7470513..aa8517c6f65b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -85,6 +85,14 @@ properties:
     minimum: 0
     maximum: 80
 
+  report-rate:
+    description: Allows setting the scan rate.
+                 M06 supports range from 3 (30 Hz) to 14 (140 Hz).
+                 M12 supports range from 1 (1 Hz) to 255 (255 Hz).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 255
+
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-fuzz-x: true
-- 
2.32.0

