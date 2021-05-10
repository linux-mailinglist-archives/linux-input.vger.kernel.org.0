Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8CB377F4B
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 11:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhEJJ1m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 05:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhEJJ1l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 05:27:41 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C17FC06175F
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 02:26:36 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i13so13319326pfu.2
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuM2qFwJUXSo3sJ0uUDN99Vl7wLqkoUYd3aEZh6X+Fg=;
        b=ZFPLINz9K5Y2ICiDxQuHLQZPjY+KDhrgcDQITj7nAsKoaCeUvw7yepmVPyZy+zjzlA
         tnDIxC2wl08YncNdYK9+9uhlsZd4ofUuztqW3IXvTESANrefMFhUs+gTrQOwVkXw+d+p
         3VwZsmhkIj+KlQfez3qd9328zjCOtjaoJImWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuM2qFwJUXSo3sJ0uUDN99Vl7wLqkoUYd3aEZh6X+Fg=;
        b=p5g05iN43igABDHQsFXvREIvrM1M7X76P9VEBuDADYOTKW2hhU7at3eIAFCAGBFn/v
         vBY7VGTTi2SRIxew2dKWMpKdrU1VtSJoRotjwRQUSxwfE1fnEaZh1EYQaJcd7xuaI16S
         sq5xxhIBAu3ShQ7OM9w360LGb0RvvYxDc/A8np+uje08XjDycvcV3zgAWV3Leu4IRi7E
         9CdQJlWyBl160tFTMFaWahmLkePfSCCRe2uB8PxvsLNqoAazw/oH7c0NH+qDMqqWXTju
         azlS7CfnZjF/Dl8KIaTq4t66fA3/fjkCJLo2kB5TpIB+hNAvWPHGW0sSkU5I4+vDssJO
         yLWg==
X-Gm-Message-State: AOAM5337Pw2pLRYY1t7E1tuAhlqowBkECFLvTqHPy6vSVDADeAO6EVuP
        hGIgcZbDn98TctL2hOG+CusnTQ==
X-Google-Smtp-Source: ABdhPJyjbHbTp9INK0YHJwsBYB1iYZU0TdNo61ldaxVdgeUWxk/SS1fexDBLZF8U1jD9dWDvis5I3g==
X-Received: by 2002:a63:f90d:: with SMTP id h13mr24293046pgi.18.1620638795597;
        Mon, 10 May 2021 02:26:35 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:179a:d92b:9be:4135])
        by smtp.gmail.com with ESMTPSA id a16sm10671391pfc.37.2021.05.10.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 02:26:35 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hsinyi Wang <hsinyi@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
Date:   Mon, 10 May 2021 17:26:31 +0800
Message-Id: <20210510092631.3141204-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a 'cbas' device node for supporting table mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..40030ed48854 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
 			compatible = "google,extcon-usbc-cros-ec";
 			google,usb-port-id = <0>;
 		};
+
+		base_detection: cbas {
+			compatible = "google,cros-cbas";
+		};
 	};
 };
 
-- 
2.31.1.607.g51e8a6a459-goog

