Return-Path: <linux-input+bounces-8436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B259E85DB
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 16:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7D161884FBA
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AFB155725;
	Sun,  8 Dec 2024 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE1t/HxS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030515382E;
	Sun,  8 Dec 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733671426; cv=none; b=ZF1ETSCZv5zEtGPA6JkAKpDNCp/GMANi39png7XcxHHGa80T+FllwS2yl8Q/Bh9IZbcfapmTmhhuE52TN4b2GAgiD+C9kRNFg3d5/FrjUVJeJrlIFTJcyHabTNac6pkZVhJXWiadq41tQC8OLkoUglfd9b6eaSmyt4swB/c9wI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733671426; c=relaxed/simple;
	bh=STsYh4/3xcP3AUG05QsLSptN0p+oIKmqWJMKZ9jPPho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCrG+Y3v4HD8I0tOWpxOnR9jgoRYAY4uXUTbpp0DpM3pbUnbHgj+LnPxy9ua7TtEZVY2wxlC8Y4j17qaT39kW2ASNcPLJj/h49ytkCrxlO8X8g0PI8gjmxBgg9lmelxGOlBt9j9a0crY5fva7Qn7YbWH1NfSuwA+6SVSCIIE7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE1t/HxS; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-84198253284so138913139f.3;
        Sun, 08 Dec 2024 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733671423; x=1734276223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qobfFjICqMdm9WYbgLlk5ueBwx0BGj7d0hX2KdmQI+k=;
        b=dE1t/HxSio+rkmdkRNf4r3OXnz+TfCyKu9au64rraj4Oiznx/uDWHcJ7V1RtJ4bCDV
         KlixswxofzEhRMkmkbMas+cxCy+299dxFlbk6QwQGWcUlxJ26pWf08gQvwU+2xY144fq
         zO0Koy0YI/qrFxa+UCcGnaFJCRSz2GuBRZj3NQWngIcgV4A5sGehDdP/po1pf/OpIaDh
         Ung/ZfDjt2yTymUQyTVb2hVi1tzQjlhImC33P8NOzKQvrPo6DeIuw8+pKfoT0QOQ7BYG
         RF1HTRz7bCxszxx/WeBPlfeUyae+M+diPNytZ1JWaKXCddb1g15+waDMeZOhiTk+cJ7y
         0pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733671423; x=1734276223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qobfFjICqMdm9WYbgLlk5ueBwx0BGj7d0hX2KdmQI+k=;
        b=bdmkbzfHpM6x+gQdQxNqWh+IcucW+jUTU992fXX9PLyoeEkLcgaXlH6ngbp81ne1eQ
         UPejuJku2OIPQgSkG/YhTzuXE0qaOcvlwpQLeg039T5gPx61wJNvB6p3t+AVRPHXGb2Q
         K5cFzJtP9Dz+u05jW7HHyT74OwScFihIaplbOJ1FwhVL0LgEgR10ypqbXEiWow1S1Plk
         JjWFsRvnJBiugoljtAGdQHWcQEsEemTPewTFCUAAdDwsClkGjkKoQwdbNKoYe+t/spIT
         ROcf+CFixFXVomUEjmt4zDoyywyVlwdMRvb61QdUgOBztnqXeeaV1BgenFGvNVqiFRSG
         sYgA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Oldd/ySvnj8OsbNc9Fhw/AaiOAa8N0/RHjxKsIG4226wEJ5/UnJlisINxWG/veVnBfxn3/J/Oxi1@vger.kernel.org, AJvYcCUFTOmEjiorOpd1TU1XN0rksjNzdcx5ze9YE5bjNeHOYDxum7jli9YHkhyRCkvpnXds5aybFdDwglv0SFnh@vger.kernel.org, AJvYcCWJZNpQhr+o6WEEu1584DOYPF1kwf80SoAIgf747cmR2U9ceAGfW0z24zENvtti/tqzfdzIYUvBy9lvDhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSi1LA5N/KTnOhbKiZ3/9KLYOKK9GcZRqQabvt5KhSSvuTW7zM
	Ab0Hke06jhpRgavtmh5mr5ztlr5kHL3R2eLQBDB7w1hTUOTWBXRFY8v+CVQZ
X-Gm-Gg: ASbGnctT6CnrFw3Dfh2MJi4JbMe3GbS6la8KgA7dmjmiSJAGHbwR1+QXqhG2cVmxZ0R
	Cn4XW/QUwsbGpOekvDi0CmFJjZwEBQ4nmjk3xL0UikLiZ0wCGv7D1SHaJpzI2EpuboCLKMGz8IN
	3GmfUyczSSO+oMrohjGqY7zDB6BeKjmK5Xvf2FbZ3ELejnTfxRK0cXLXB9iGwYdfGezHAeLJ2Rd
	A7i4pHy3OI4E82m/hlT2pUs5kzqcwVlBlhd4csD
X-Google-Smtp-Source: AGHT+IFfeg5y4RSlYimIft2ImSdZS0QyDkz4SaQcnW05RaiWxsvGgIk47wctm9FIN2AvV1lGrAn0XQ==
X-Received: by 2002:a92:c563:0:b0:3a7:6792:60f with SMTP id e9e14a558f8ab-3a811c799a7mr108714725ab.4.1733671423540;
        Sun, 08 Dec 2024 07:23:43 -0800 (PST)
Received: from [192.168.1.109] ([2a02:6ea0:c603:3558::35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a814fa40d6sm16846805ab.57.2024.12.08.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:23:43 -0800 (PST)
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Google-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Date: Sun, 08 Dec 2024 09:23:29 -0600
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241208-pocof1-touchscreen-support-v2-3-5a6e7739ef45@joelselvaraj.com>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733671419; l=1325;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=FqSqpqA2qjZLgqXQYa7KbwDiQx3U/fzD+epPaq4QQWc=;
 b=4+hex7m71IId7u7oYwZe4uIuXQNNTS2tvv4yKVwDHqR1JeHjsZSFR0+VXZhYefWKmwCDj0bYV
 zRGP7zM33IeDtONk7FWm23g8QPEMF2KO0xEpJisNADdN/NILLpjNQTt
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=

From: Joel Selvaraj <jo@jsfamily.in>

Enable the Novatek NT36672A touchscreen controller used in the Poco F1
(Tianma) panel variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index e9427851ebaae..b58964cde8342 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "tianma,fhd-video", "novatek,nt36672a";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@1 {
+		compatible = "novatek,nt36672a-ts";
+		reg = <0x01>;
+
+		interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+		panel = <&display_panel>;
+
+		iovcc-supply = <&vreg_l14a_1p8>;
+		vcc-supply = <&lab>;
+
+		pinctrl-0 = <&ts_int_default &ts_reset_default>;
+		pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2246>;
+	};
+};

-- 
2.47.1


