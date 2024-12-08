Return-Path: <linux-input+bounces-8435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFB9E85D5
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 16:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70B392811D0
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096D11547E3;
	Sun,  8 Dec 2024 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFbfJ6Yk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A6149C4D;
	Sun,  8 Dec 2024 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733671424; cv=none; b=U2ql49wKnxcazgdqH2AyhTzYCe0CO7+bYoiPv34BDKO6VWVE6IoeXE3Ly0ayJGD/ZtEBnDcMlRtSkXfUuvfvsHKptoJFT+C1kFfBfzyS3rilsycwXu8b98lF7jghGkrC/UZv3HvYOyc+l1pUmuz5G32lxGoSPzaYyWH5OPVxycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733671424; c=relaxed/simple;
	bh=WrGOTKvOClLWlXSpaUWrUDujA7z142laht6bjQUKN8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DiU3HPpUEKaR5NuhL6QgoIRh9fe9nGDTs5ESbJCBctLJOXlenUiXkXURirNrO+BVvVZg8asfVkeD51w0uipizCq+reU8VOcg0v+M4ObAp6d8B15T8ry4hT8e374J0uAos4ML0omx3LmfQMX7CgODLjCRhGBcyBUkjYT85AuSwfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFbfJ6Yk; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a9c9f2a569so7287475ab.0;
        Sun, 08 Dec 2024 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733671422; x=1734276222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3C0Sl+6d2juKUb8gMYlerVVIRw5R00zzonVhN+UPlwQ=;
        b=fFbfJ6Yk/fZumO3zaUK/ATn/UPzzxT4ZthZe5qYuW7FWqCWjBk68/cL2GLhdITqPhm
         fLKp7BFj8sDwrBz0Ox1KU8bKaj/n2xt7UAV+hg1Z/rXJCW1vFh3yIzvaQ/bQODJYr4s5
         zi4T3cUhFJQ0elCmyyYSHUdB4iW1bYH9Cen6GIC/CEF7aUG5lnN23HwNoC977eLsK5Uh
         sKiWR+xO+D3JmB8EiJUNQfA2LCDQtekVSEuNWrHthM62578h/zb7BgdJak5SOiZIS9aA
         TPNHQ1PY4Cl8G4q2yIwZlkun8hmA2tZBwW6eweEVWtDgJGIvNH8m87f8fF0Pdy7ipI91
         0JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733671422; x=1734276222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3C0Sl+6d2juKUb8gMYlerVVIRw5R00zzonVhN+UPlwQ=;
        b=ELoUv1Gz49TkmwSIMt8xus9wOHuYKQ67u92Z5kixW1YI0VegsJQCn8vIGRtp9vMwlw
         Nocbe2sXjOJAeWeMPZtLJfB5bUnjtMPQlB3wmtdP/4xl4YfLx0Yk9Be2hH0Gv4o20oVP
         iOIhipTM2JL8BRdnP6h2aHYpG054nk9SYQK6C4iTSsjuabk+3WIFjqBvpwjoWllg405D
         jQtX+/OEpHn1ewUZAe1Mkd7dc7rKfC4POui/HYuYLQY8htgEkYQsnvOy94bnGZ/f8e6b
         mWwoNYJy4WGXnI/HQ+SRCueRfpGLVFPOfu2et7m0ccFp2uFGDBEbKrbcfbmt79vzOWF+
         gcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6QG8JyzIZEnnJzxHmAiZHjPcjImii+K315E6+wr0YU8ncmLCGzPpg0KqfYbprqfsUivfpgBGADFGKtQpk@vger.kernel.org, AJvYcCXFRuMz6jERzr5dEx1moEwFsyt8WbDyOShSSCr2wMLzjuZ8Dfe3zryPOLsnlFJb+ieHugBK3CNzIDVq@vger.kernel.org, AJvYcCXQVK5pBhlx8HZcOCfnUivO8f0fTKZuCrF7iw9QPJcknG2LDPIAovMszqUIk5zSh39KmjTINmM6+oQF1gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdcUpg4o2vcISpcnaMAoko+UCq8Pkh+q6ZwErY1LNTBRx6Qgh
	q2UBf8jEmROcwDZZo0jFHNh4XiLkB8tuZxlAtWspKQ3fTGG2PqQF
X-Gm-Gg: ASbGncsfFIGYqru/1L4ta0JM33dauo5mRDkmytitd8qQuH3aYp8ODAoXF+fb2ZWb2HK
	07i/fYr/nD3vKcLbDpC9ic2GmdjX/TDswqnZHyDKeL4d5gJEDVDFJAEYCU0ZicAMZ+uBq2HgH5s
	WY3/DjpgRI44JbxjkZ7G+tV+OG89hcBsNUiDQaUIBFcXBu0aOvLGIbWLIZPY1IJ2R9REDwRGdSl
	CMwxrYROwUFzY97brExmyrq/zkmjixO68AtA943
X-Google-Smtp-Source: AGHT+IF8ZOgCnvXKx258776dpeULeVlu0YwL8eE3pOQQ2e3nce+iX1uxzBhJsRxQNDuDtuG6q6Eomg==
X-Received: by 2002:a05:6e02:13a7:b0:3a7:8720:9ea4 with SMTP id e9e14a558f8ab-3a811d77228mr111544305ab.5.1733671422546;
        Sun, 08 Dec 2024 07:23:42 -0800 (PST)
Received: from [192.168.1.109] ([2a02:6ea0:c603:3558::35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a814fa40d6sm16846805ab.57.2024.12.08.07.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:23:42 -0800 (PST)
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Google-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Date: Sun, 08 Dec 2024 09:23:28 -0600
Subject: [PATCH v2 2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241208-pocof1-touchscreen-support-v2-2-5a6e7739ef45@joelselvaraj.com>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733671419; l=1971;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=D5VCowikjyGNB/6EL3/0n9I+B15dJNg0M46FH1kSG4I=;
 b=f6sOvZfMd2dOM/zYYWDPNlHGhfdE5ntlNMLXctTFG/FkqDhYSZg1jxfGgodlwaE/CoOUREBb3
 lsXQuDYLcNvBM9KSd5pIuF90xysZASMS3VMqyt8tn2pP+9YAHhml12Y
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
touchscreen. Also add pinctrl configurations needed for touchscreen.
These are common for both the tianma and ebbg touchscreen variant.
In the subsequent patches, we will enable support for the Novatek NT36672a
touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
Tianma and EBBG panel variant respectively. This is done in preparation
for that.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 617b17b2d7d9d..e93ed6effdd73 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -243,6 +243,10 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
@@ -408,6 +412,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	status = "okay";
 
@@ -513,6 +521,37 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+		output-disable;
+	};
+
+	ts_reset_default: ts-reset-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
+
+	ts_int_sleep: ts-int-sleep-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-disable;
+	};
+
+	ts_reset_sleep: ts-reset-sleep-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart6 {

-- 
2.47.1


