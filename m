Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C15E7E675E
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 11:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbjKIKHF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Nov 2023 05:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbjKIKHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Nov 2023 05:07:01 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A58E30EE
        for <linux-input@vger.kernel.org>; Thu,  9 Nov 2023 02:06:55 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc37fb1310so5734105ad.1
        for <linux-input@vger.kernel.org>; Thu, 09 Nov 2023 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524414; x=1700129214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEwbem2dUlV4PdFvgxehEwFjO+wcgltSG0KbchvjnmI=;
        b=nF9TanRcchKTlQLg3f7JsPamKJ7EkQPrapPlnbCKQkXFHSN3WYwRpCCnknAI8uuxRO
         q6i2jnQlhVbNeisCkbxNRTINXdewdqNd9QRzTTH6EtjKqCTLYjr/ue5GUf+QtIx6YIBx
         VztaGn50hHTYZIE+jwaOQ+s15Ri5eTOeRw8v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524414; x=1700129214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEwbem2dUlV4PdFvgxehEwFjO+wcgltSG0KbchvjnmI=;
        b=pYHTFMVvtwuq4LbX7sGeVLXNJSAYlTYeG2VwfxmJHSkihgJ6DqLlvVUSOagiCz9Xsg
         /hPA+3qawS9PF53v/dEtHS1AZCht6XwXUPzbcsQ9UbPzTUnUF3FDQ7FaGxYxP+6fEif5
         f4/1u1RjefB4pkVLhOQ912Th2V99dONCo0OZGQZn1xWIQLGlTlP25auUpeF6Qpa5ihs6
         OWuKdwRHWNLO1xnLUvdGg1xmoAZ6TUfIJ/vLUoO0IKg/uTzyVEH1EoQDire5LEca2Rru
         bl6SDUz0ByMsh0JdOYUmyNCTwnClMazDSCiGtcBNhpxIS6TjXoakdukBHuskFDnb5m1S
         hBkw==
X-Gm-Message-State: AOJu0Yyn3w+cyhalPM9ganpThd9Ew4S02BQizqiKHeOs0gqfb+qVe2wK
        28pjg0CcaDrySZyeijuhiUv3UA==
X-Google-Smtp-Source: AGHT+IEqvxAt34/tbw9mX55Y4YBlm7iDQwp+MvYnRdV6qPSukdlOlKZvyMezlSiJe3j/GHyYqBRycw==
X-Received: by 2002:a17:902:8603:b0:1c9:e229:f5e2 with SMTP id f3-20020a170902860300b001c9e229f5e2mr4402418plo.34.1699524414545;
        Thu, 09 Nov 2023 02:06:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:54 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>,
        linus.walleij@linaro.org, broonie@kernel.org,
        gregkh@linuxfoundation.org, hdegoede@redhat.com,
        james.clark@arm.com, james@equiv.tech, keescook@chromium.org,
        petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 3/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date:   Thu,  9 Nov 2023 18:06:00 +0800
Message-ID: <20231109100606.1245545-4-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of having them all available, mark them all as "fail-needs-probe-*"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..052109b0fa3b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe-trackpad";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe-touchscreen";
+};
+
+&trackpad {
+	status = "fail-needs-probe-trackpad";
+};
-- 
2.42.0.869.gea05f2083d-goog

