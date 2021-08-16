Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835283ED187
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 12:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhHPKAx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 06:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbhHPKAv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 06:00:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCD2C061764
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:20 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h13so22779304wrp.1
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBoxvVvKIO10DrkILesFRlS9T4rPMo1Wo6Rp+HkgNL8=;
        b=mwgWYYs3jhmzNTP1frncbH6jlYFn9yJQQpdyFyVM8aZ0f2G7n5pp4gSLBu7LmbXMAQ
         3ixzhmwfkj2iqmwBLT+o4/5zI4u3u3ovhgHymcpssfM2FXx0gXlIHvDfLVj2eHu/hmwk
         a2dC4qaiCqF0Xn/iTSro0LnJ8WzaWff+BrNB/is7hg50sU237irbHGHwWGpGn1TG7i1n
         /a05fMWkl/yAgpEHhMw/j2U1LK3NtTiR1iaOXd3nqgmO9t3b68wkW6PRY8PM7zjibzrn
         s7yteN36gusb23G9BcxERhrmJmB/nv/D3BGoqLy0WX2pgVg2k8rT5BbmniGqCkE/Ge9U
         wcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBoxvVvKIO10DrkILesFRlS9T4rPMo1Wo6Rp+HkgNL8=;
        b=DbdWF2fd3vh8I5tWiHh3h3ZP61gItlz2dD/0SVsnc5ZP0kS0B1ol8xJuBH+L5xiAab
         kTOSHQV6CHLYitvquAibGUNcu9TsUjhJN1RfiLfsjXng+O6OMGnpr4rxSbnU0PjDrOTF
         PS9aLtMqQMHgRPm1z4/aq/JSIKhHRa4mOfYROQo1uJSPYbF+9XN029rmTT7pn+gBCESr
         6gebdDcPwrjXahA9nHm4+kb4ArlHEkRN1qiN+T72nxGNK9doFv8M1As5c5vXWw5X/jMP
         KPyigmGQlk/K3B0bUdpmOENxpMV3v3duRgsCqYp+d3zsA0VdHq90CaUlzgGZS45R3VVz
         /Vcg==
X-Gm-Message-State: AOAM5333JG787eAwxiceazuNMgag/08zNezl1PuFOQsdr5THTrX7x9yZ
        +C0Ck5nwtzPLwxsKyfYU8huzdQ==
X-Google-Smtp-Source: ABdhPJyYrhUAaACuFODtSBZtIZlyvpK9x1xyyBxkLAEbEhAK4IaQ2YxU2/fK0vVgFlBvSAk9ahkggQ==
X-Received: by 2002:adf:db07:: with SMTP id s7mr18139499wri.106.1629108018662;
        Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
        by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v3 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
Date:   Mon, 16 Aug 2021 12:00:11 +0200
Message-Id: <20210816100013.100412-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
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
2.30.2

