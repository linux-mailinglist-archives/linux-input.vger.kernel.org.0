Return-Path: <linux-input+bounces-284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10D7FB4AB
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 09:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89382B21A35
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 08:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF3A1DA35;
	Tue, 28 Nov 2023 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7OCSlHr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9201D53
	for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:27 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cf856663a4so36006275ad.3
        for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161126; x=1701765926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxKs9xH99OQyNQM5ja7w5sBqIVdDZ2l2tkwooD9gc1c=;
        b=M7OCSlHrgPke0dbRqhyKdV1U2j9DpXjb4BCazCV3m+84qXU2FL1ddycrfXCIqHph/f
         ho6kJGxPgWAnRHqRtJAJRY2tqfLbYFoAVS5FClxouPLTXDerBCtgJN1NI8jPG81stcAm
         tovPvDMh9jBVtmUBDucEX24Dj789D8LC366RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161126; x=1701765926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxKs9xH99OQyNQM5ja7w5sBqIVdDZ2l2tkwooD9gc1c=;
        b=ZGMTKNlc33van0i6V3v4u7n/UJdtd3F8mWy81Zuc0iFPuY/EfVtujAhiEZf4GHKymG
         dDa688hTXM7+OSaJGFqbKap5QRGbuMVRIi1RFA+ibTfKq6HL4Rzub6G8aPHG3aggz/AI
         3SuyNHcv9YKmVKkECl8jtLzn3t9aW/qBt8omEhZTG9soYeF1I8RywqXPaOzAqIY1Wg98
         ViFSeMTs0vrNWrolvumLYK9SSW0ww1AyUmL0mbEpqOKUCI8q6ffjb2kzVv+gdc8fq3SU
         Avavp1pl6esNKvJMqpKpZtBxTzYl49XWNa8HB6r328+futJWRWhkPmgVmONLgqCsUWhn
         ktiA==
X-Gm-Message-State: AOJu0Ywupwn4lF2ldwFAwhz95Cky5ONmEiYwDT8aOydjco/aRqr0AC62
	AN0OcShzeTVSykK1Z9R5JZjZcg==
X-Google-Smtp-Source: AGHT+IEHq/8o8TRy8LBy9PDIxcsp3BaVE1rQDjyRLP/di+1I1g3a9pBwAwe3ppG7Mgw8ZIdwK6eHKA==
X-Received: by 2002:a17:902:988b:b0:1cf:b130:e9af with SMTP id s11-20020a170902988b00b001cfb130e9afmr10074896plp.20.1701161126645;
        Tue, 28 Nov 2023 00:45:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:26 -0800 (PST)
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
Subject: [RFC PATCH v3 5/5] arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen
Date: Tue, 28 Nov 2023 16:42:34 +0800
Message-ID: <20231128084236.157152-6-wenst@chromium.org>
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

This introduces yet another second-source touchscreen found on Hana.
This is a G2touch G7500 touchscreen, which is compatible with HID over
I2C.

Add a device node for it. In keeping with the new scheme for second
source components, mark it as "failed-needs-probe".

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1d68bc6834e4..216d8b43be05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -31,6 +31,15 @@ touchscreen3: touchscreen@20 {
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
 		status = "fail-needs-probe";
 	};
+
+	touchscreen4: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0001>;
+		interrupt-parent = <&pio>;
+		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
+	};
 };
 
 &i2c4 {
-- 
2.43.0.rc1.413.gea7ed67945-goog


