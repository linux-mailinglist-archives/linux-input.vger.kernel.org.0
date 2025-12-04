Return-Path: <linux-input+bounces-16461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37353CA39CD
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 13:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4F953087D4F
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 12:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFE7340290;
	Thu,  4 Dec 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="n1/ziDpP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3033C1B6
	for <linux-input@vger.kernel.org>; Thu,  4 Dec 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851359; cv=none; b=FYhtGgWuqib6JOiqk1m3YkVhdd/1ZzrgoMatd+3L65GFb1zyzChUjJgXxCt4zWIBVaEGDg5HwGD59gDA/DmZwEkFQF4Pr7vqY2rLusUJmy2tmBapviCctT6ZozPKj0+42RcoZjWJpueIuQU0mExzdAYllXGt1O6TIsP1yr20n/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851359; c=relaxed/simple;
	bh=l/XBAG4CUGdCd8uvlOy4ZQBjC1QnfFNVrAFe5tQ3xuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvAiDm6IvIUVrJ7A0JczRg6ManRyRNe0OPRwlFA5mXDbHvtW+SMxQlSypOSwRepmnAnbAMkHTmOuMGUwyl0is3sVXunsrPC8SG0SMuT1ocz9wR1rEopQzqGiTk0JOQNIKRSlVGJzKUNTebux/3FRup1nSbBFFfKnwmym6mIowys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=n1/ziDpP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so1422701a12.3
        for <linux-input@vger.kernel.org>; Thu, 04 Dec 2025 04:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1764851353; x=1765456153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezLwF9vcaQPh2qIuGSQT4jtvv+rSMrrNcQfR67LnXW8=;
        b=n1/ziDpPURE6ByEKefRnDKBtnf0GmLjl9ORBvvPWQiVshsDYSoA/leCDxLCUWmnBUp
         9l4B0Pj4FFnTX4c8pLbCy0cazgHFbL+pRIRdoFRsmmEdIrqycgvjspaM1E0IPdaHT/Vm
         MDmxW5BMF9a1DCeti7T7Zqn9v5z3phREuMzY1pZhfPEGtkc0qUSgz5a4zU6+2aZGlohY
         bvCp+IqEqC6qDWfxEC4hkVoSUL1DK7jd/QDJvNlc7lQyOPKvpH/c7TFQ2kdifWDAy97t
         ToqknvPvNl9SXp5TdMFrXYXpIJbL2sC28QIUz4YPVTxpZq/Jyt6pYsWDVtxkwNfxhbKy
         Td5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851353; x=1765456153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezLwF9vcaQPh2qIuGSQT4jtvv+rSMrrNcQfR67LnXW8=;
        b=e/VMvb6J3j4qhYGKBHHekKZujxBH/UetjTlNxn88r+7HfzLMmdvVAFMjn1kd6yR6Ah
         eW74LO9icSOenxySXh9IGG7bXskqpp1BUF5tjOckJwJqNEw8yK5JGbKeG3M/o/4zGDm4
         aX+vP5UgidjxyELl5TkFsHwG14ChiTbghUANeMR1nZkHSBVlw+Ndl0YloKodfmuUj6OO
         0PwskDu8dlQ5CerEEdwkSFozd9dGmGnzZRqdqcCYIfuD6WcbmyJvCNY9qMTMoIoi8UTm
         K9ONFneusncz301Tf/r3t7U0BnW06yQTaFuCwi4daq6BMG/lDPB75wSovsEiP3bNEtvg
         qIbA==
X-Gm-Message-State: AOJu0YyFCqC8boLlaVaNcqC+HPTiGYW3NyLHpG6gvazox440BMKLIrfS
	cnP8h8hJCShs6J2owdpsPurNpqmro5i2GM7RRkCAygQfMZWbA0C4zMP9LpVn+/xji2c=
X-Gm-Gg: ASbGncuR7dgP88op70s1w7acrdmeoRuWMXgmsUKRW1Em8xoVJ7m2ij8UX34bGPGCNFQ
	pYbKcC+I6X6P3382gfYEVKSFc12PZDw1sl6aizgKXhFY7mUhtvpr7Hx+50LUmndnZaygKxjZAIS
	ZYiqEgRfnOAAEyyHrCAj04PlYeFjjrl2ldoO7b4m2x13UCO/tJe4XyA4Cvm2EuSuMvvcnpmFzPC
	Rf4v/vpwHxHR7g+JOsevBbZdvCAuGxA1ajgoDJlswJgQdJIjtRSaK+7r7biwzWY1/eRTHVr1dqt
	DcvpqedofjoRgztcdtdtOAxzR7sQwwxNCvU9E27ZlzoE5NnFYd9HauTrsliXBCktHaCZ5cPOrUZ
	m6P6y0Z0IhO2GFtvD9C6HBjaBwJZ3yqO/c/uRgKylqwxUBxHVTxriYqXUvfvMLPk2kcCszKk0y8
	Rj4HtJVh1Ybi9N+HFmj56dTXlLz4cDd43r9mfUtMWhq1eLY7JmwzvjA+/ch8GRk3SYt/dm
X-Google-Smtp-Source: AGHT+IE3vTw9W8q4bFu/XYete6yOngVJe+jHbROTOV0J3HiQ6WjaS2FHPZPK9m9x4/GTh06qLnayww==
X-Received: by 2002:a17:907:a08a:b0:b5c:753a:e022 with SMTP id a640c23a62f3a-b79dc51af60mr653042966b.29.1764851353085;
        Thu, 04 Dec 2025 04:29:13 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm121351666b.64.2025.12.04.04.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:29:12 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 04 Dec 2025 13:29:02 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
In-Reply-To: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764851350; l=1297;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=l/XBAG4CUGdCd8uvlOy4ZQBjC1QnfFNVrAFe5tQ3xuo=;
 b=oUDOHk9OFhVELfWu4ySXOPeJM7FZNIQTDt1McgBSEATP1sZtX65Mo0qcnp/4gU21oQEh8Lwcg
 8DFYoi9AaQyB27J41F2T06/ZnrZKcCDteu0doYUSUO1371sZs8eXuol
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86938)

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 0a758fb7f4d413a84cdae695c38616fc6075db67..8c43bc9c1d8312f22ad0aeed84b23d52910e0ca6 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -717,6 +717,16 @@ vreg_l7p: ldo7 {
 
 	/* VL53L3 ToF @ 0x29 */
 	/* AW86938FCR vibrator @ 0x5a */
+	vibrator@5a {
+		compatible = "awinic,aw86938";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -907,6 +917,13 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0


