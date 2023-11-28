Return-Path: <linux-input+bounces-283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EA7FB4A3
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 09:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23042825DA
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 08:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1432F19478;
	Tue, 28 Nov 2023 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SwGzLlVx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DD419A7
	for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:22 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cf5901b4c8so44632275ad.1
        for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161121; x=1701765921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=SwGzLlVxYnuU6rAgNgj3DZrhO26TdPHjJsVmCM/NrZV6DUC8GIS7AFsMT86M2+orCe
         sOha5G6nntDkOommdQkSqmgGX9tdr8zhz/5p/xn+mFv+Cr1pHv7mBI/1ddtNYsH9T/fA
         U3piRgAPk5ZbvU3l9vvmiLjvgpH1fM/NSV884=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161121; x=1701765921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9ycKtKFTX/BTOyRnkXgZtClc28FDD42zjunKgTjuA=;
        b=GrdhH5ANjoJcYuSZUwbZchrqcdbAPZFwfe2l1Zz31fd7s8ln2coETryiqhVxtC5KvV
         3REHgwH1fgPj+6Q9H72PuZfNtcuo5BlmfU0jpj0abVpTalBlIv1kpqIJECtC3546/ecY
         1J9HVpOQy40XdCXsF6NVsFoD6dmuiWpzRUQP1P5pk5HS5Q8fYl6qFTIHDJyyyPvutiFP
         OGxa6YTaZGoqD4gelzvH/0z1XcXZUuc7sOMpzz1tVoOFRJ6gNLpTYQCL8bG9HnyMJhzw
         mCJU3J7jaP8jI06oIgq9LvjZfR9126omV64QiOhlsIy57JuLgne0TanwxOhDEpccO/Fq
         xAog==
X-Gm-Message-State: AOJu0Yx6lgdAvV4ssgOj+++cSxwktbBLi7RHx9nflTdaoxFNeqsb1ozA
	DzypwMhvUFwabSkI2lEv0FVWlA==
X-Google-Smtp-Source: AGHT+IH69IcUw69JVhOmNdkKKnr/r6NBV02lgRCYBJhyyb9MW19+XXMSc7tXlITs3/tx986s7x1SPg==
X-Received: by 2002:a17:902:f54d:b0:1cf:b3d2:5f18 with SMTP id h13-20020a170902f54d00b001cfb3d25f18mr13659883plf.56.1701161121540;
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Tue, 28 Nov 2023 16:42:33 +0800
Message-ID: <20231128084236.157152-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..1d68bc6834e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -15,6 +15,7 @@ touchscreen2: touchscreen@34 {
 		reg = <0x34>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -28,6 +29,7 @@ touchscreen3: touchscreen@20 {
 		hid-descr-addr = <0x0020>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -68,3 +71,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
-- 
2.43.0.rc1.413.gea7ed67945-goog


