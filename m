Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F293757B3
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 17:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbhEFPlY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 11:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235481AbhEFPlH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 11:41:07 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3F3C06125E
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 08:37:29 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id s82so3619753wmf.3
        for <linux-input@vger.kernel.org>; Thu, 06 May 2021 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
        b=TxdA95xr9NvNrTqX2glo6DuRNrRFdtE85RIavTmpnvW546k6YjimPwfcuVXjPXwcCF
         rrK12TcDVC4TOR2Im2bSV/5Yt8oQIBx+4nJAz4z2gtd9vqerj6maM/0xDbDVFmZnyM9F
         anOYodAQO5oPW2skhSrdXa1+8OtfiT2mvIN43vmm7ay3ZQnjl86L5QGRqasdLcjuj4VZ
         kqB1avcVQUTFGE2xB6GGkogTe5nzZQJfSIMi1DtOybpVESuhxLSMPzDdNolXzZozqs9Z
         6nnYEfwk1Nn6qNLfjkvh6nYCxUBmw6feIndbTkCIpVgS7L7pm7J25YajIHH5XTHtkk1S
         n3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
        b=b3dSSFov9KjB71HMFs0JlcytfAdt4/DMCdf7pX/VL4U2UU1qakC+m4bf9+qoGkfkFk
         x/cyQSE3opROp4MA6bbmyWKbHGnd/z358JTWes+WwU6MKIxhjAI4UNmVPy8UTjOeZjuO
         2GJqstwFPJz8YKqmfGLotC3pY2X6cgqNGS77ik0G3E0VCkL8TdQxdDUAaosQuwjtiNHa
         klxm4JA6WAI6bCP1ygZEL/mdMPSjAKlG8ZyywtZx4uhw9sbBIeS1gqH5TnxTl2OI/2dA
         gJwsJ/Al6nQ8BllQqmawbnqDJNsYWM4mwkgQ73poIJ7n02QPhwdBxTWO8WEQcC20QluC
         eO7A==
X-Gm-Message-State: AOAM533dn6GinthBjjjATKuenoF5EKd56usfH0WDusX8xZCGJp7bj4lj
        ivtcdMidbxXQ2aNJ4Z4uYDzoaQ==
X-Google-Smtp-Source: ABdhPJxnDa8+QB/P9YvBx7Q0p5ZbONAbd3z3myIbhHyV4Pm3jy9jW1JOlvP0Wp/CbE3H9YaEACRDgg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr15842002wmc.131.1620315448603;
        Thu, 06 May 2021 08:37:28 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
        by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:37:28 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
Date:   Thu,  6 May 2021 17:37:17 +0200
Message-Id: <20210506153718.256903-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506153718.256903-1-mkorpershoek@baylibre.com>
References: <20210506153718.256903-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.27.0

