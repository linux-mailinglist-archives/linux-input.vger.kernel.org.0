Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371287E6762
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 11:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbjKIKHY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Nov 2023 05:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjKIKHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Nov 2023 05:07:03 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCF62D76
        for <linux-input@vger.kernel.org>; Thu,  9 Nov 2023 02:06:59 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc29f39e7aso5403645ad.0
        for <linux-input@vger.kernel.org>; Thu, 09 Nov 2023 02:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524419; x=1700129219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXvBziOOzPoe9p06qPekw9ojRyDCzXj55skHWBeOemE=;
        b=ajmVrbMGWgyVyN6sBJtEnLZk7H61ypCu7jyPZaS89xXqfP5U34t67op+dEhLmB3pAH
         007llL49pH3ehzyG5i3/XhebxnJI7LYoNX1Byno1opPax8DsmQVHeHX/ck1UhdOAWcxd
         IwHUrN8sp6/H1F527JzVl795gW+6snJ6h9FQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524419; x=1700129219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXvBziOOzPoe9p06qPekw9ojRyDCzXj55skHWBeOemE=;
        b=HzY0znfmIqYa9fWn3B0y0WoiJ74P37qYGPkO5TNbZowavwnY7KcpeUV3rL3EFUkz/R
         2pp4oH3DB3izWpj1I78DNEye9YReuR8AC/9dhod9U7VJyFkIOfH+PrkwBHTB3ig+vqzm
         nQNIZs9zw+eKZyrAg6PEyAGOzaaaXGJcSVDYHg/SKFtE09rZ9Pd90dwYNgAaGNHu/QuM
         874vin8CHbeO6TLsjbJqI6eTg5asGL2q0tQr0S78FZBWz01S2D6phLxDyc054YzAk0ZJ
         aQArYMTmfADWU/iwhJpH/iYvUdD4s+jJGmJIbUVRY7sER0jhRAnBE9O32pCYvbqO6OzD
         PnaA==
X-Gm-Message-State: AOJu0YxHUbqEcQ6TVY4ON3qFP3IQiQgeUgxeuAFt+60RQNxwRnbo+Oxf
        ujUeTl/5QZm63Cm/Sgyskn4KmA==
X-Google-Smtp-Source: AGHT+IGjXFbBjSHLl5U/ebTbDrumNW0v2EVWcvyySgzvtZFdToUF1oRe0pnconHbHlzrFnCRFotkOA==
X-Received: by 2002:a17:903:234e:b0:1cc:50f6:7fcc with SMTP id c14-20020a170903234e00b001cc50f67fccmr5370038plh.55.1699524419209;
        Thu, 09 Nov 2023 02:06:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:06:58 -0800 (PST)
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
Subject: [RFC PATCH v2 4/7] arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen
Date:   Thu,  9 Nov 2023 18:06:01 +0800
Message-ID: <20231109100606.1245545-5-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This introduces yet another second-source touchscreen found on Hana.
This is a G2touch G7500 touchscreen, which is compatible with HID over
I2C.

Add a device node for it. In keeping with the new scheme for second
source components, mark it as "failed-needs-probe-touchscreen".

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 052109b0fa3b..d3f1277ac9b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -31,6 +31,15 @@ touchscreen3: touchscreen@20 {
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 		status = "fail-needs-probe-touchscreen";
 	};
+
+	touchscreen4: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe-touchscreen";
+	};
 };
 
 &i2c4 {
-- 
2.42.0.869.gea05f2083d-goog

