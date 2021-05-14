Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E07D38091E
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 14:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhENMGd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 08:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhENMG3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 08:06:29 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1FAC06174A
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:05:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so1250834pjo.0
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQYcCupFxg8InoP1/2l4FLzi8zH3ZsXDMqBqASZIVVw=;
        b=h+oc/D3mYJDcntABEZ7Xencts0Pcq4IP1wsAn22ViNoE8u10MaXUcYFxtvJdiEfiV9
         XrKR63MUl98qE31wy4jHiZXJQ9su4mubotYfQ8BdnhRvX2w546zD6PISKWPSNJypKdDd
         o5pPKzmyociU/gI83QN42ywVCdKDNG6V50DYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQYcCupFxg8InoP1/2l4FLzi8zH3ZsXDMqBqASZIVVw=;
        b=GFPJXYx4lS/C/KlgWb8cCQwbJq8oIZn8x4lXONz/NqYqSLBfONyHttOZWjFQJG5plp
         KnQP1oYc7L6hsaZJaFmvIcLSFubyOeHVe53LYjbrpyrBVcHa0YPHhuOcHc08+7rB/31j
         nFO73EKqQzUtlxx6tiirFdwhM16glNzwz1Ail13fUeOs8OYLQgJTfYrfVxajas/x36Yy
         UYUftmDR0SYzmLYCBQaaAc5d5LNHGfy2T79B68ysqNH6wA55Abd5k2JE7V351/eeNOrQ
         al8Yeo3zXnK/qQ/Zg88+eHaYWda24ded0plWZ1e99GgZrzgO7AQJUymtVLce/fC9HULD
         CkCg==
X-Gm-Message-State: AOAM531XvnXRqzmKwg+dFO1ChdS20Xqse92LNUAHfnAgPDb+Wez32xnq
        kIFQktDzLzhZftz0aGvKgo59TA==
X-Google-Smtp-Source: ABdhPJxTGEutiLz4dIZ95IKEFr/dFQx3NVMgYvn0N6sOU8DscXO53wP3u6K6hMm1/3zSOWBZprpNdQ==
X-Received: by 2002:a17:902:d508:b029:ef:b008:f4ad with SMTP id b8-20020a170902d508b02900efb008f4admr4040933plg.8.1620993916755;
        Fri, 14 May 2021 05:05:16 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
        by smtp.gmail.com with ESMTPSA id q24sm4117786pgb.19.2021.05.14.05.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 05:05:16 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Stephen Boyd <sboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v7 2/2] arm64: dts: mt8183: add cbas node under cros_ec
Date:   Fri, 14 May 2021 20:05:06 +0800
Message-Id: <20210514120506.264838-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210514120506.264838-1-ikjn@chromium.org>
References: <20210514120506.264838-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a 'cbas' device node for supporting tablet mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v7:
- remove a label from cbas node
- fix an erratum in commit message (table --> tablet)
- dt-binding patchess merged altogether with mt8183 dts

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..1512605a438e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
 			compatible = "google,extcon-usbc-cros-ec";
 			google,usb-port-id = <0>;
 		};
+
+		cbas {
+			compatible = "google,cros-cbas";
+		};
 	};
 };
 
-- 
2.31.1.751.gd2f1c929bd-goog

