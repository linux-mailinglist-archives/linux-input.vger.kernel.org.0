Return-Path: <linux-input+bounces-8437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75A9E85E2
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 16:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF851885083
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 15:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089EF156886;
	Sun,  8 Dec 2024 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXZzSVKO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DC1552FA;
	Sun,  8 Dec 2024 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733671426; cv=none; b=LEhBqctzptaKDGPJ5wyKCAtmCmb8ctVEtgALimcV3LSUJE0wrYXQ7Y6unjVQ6ZBzVw9/A+0cSTs0HFwHxLo+0HYME2r9IcnkjIpDN2JPPiSmE+S9owbraspAf72KjmkHjlp1ugjukOzBCjDj6jZOr4bXbAFlZhWphySm7dfoG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733671426; c=relaxed/simple;
	bh=l7xRXUyEbDsdN6IdmsbR3YkjSUxnY4sXvYptP3ftvXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8M93QROPdJdK3XXw57g0X0I9CLTXKbKB9dO0W6vAqXrkmmNkmmSX5rNek6x6Bf/OKudABblO1mflcSAFuyCz6HSk8KDQ+kEvBcWEKCHs6KhWhbamHpAKPwr+ZgRTa2BmekqJcZKNgl/LD6m4/ev1JDVMClNrMrIKsZTCLkXIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXZzSVKO; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-841d8dec20aso109271839f.3;
        Sun, 08 Dec 2024 07:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733671424; x=1734276224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeViGyIUjK73sGY5mddjcRzCRf6wXH+e3Spekfc6Nfs=;
        b=BXZzSVKO/2SOoymnN0SKkNoCOdcm3AFXf1k/r8ryop9kWWbMNhRb1uRYdrnoo2Axpd
         3MwvOefKWyINi50TPbhMiNPEmTd+CmxNgUInY7PRds6r9pa8kMVX7sZyjYljufO68fnU
         l2K7FXeNxDbd3S2xsWdMLEstbHw+hDNYNoENBGi1sE8GUGDZh7XtusIO7wikA6SfrSrf
         8VByXIhd3WyQUDCK9aaQOLUzSA2q5RwZ3H0+5wAR289DtoDXyha6a2NClsWYPV77e3uU
         xrcL1cihPQ9TgcDvCeZV/vI2zaDPLcio4WCbXnIFoGuauP+9FrEShvjiZnRKu2Hpil4s
         95BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733671424; x=1734276224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeViGyIUjK73sGY5mddjcRzCRf6wXH+e3Spekfc6Nfs=;
        b=aiMFRol3h5lZai5kuyG+WdbHRug3yiXWbpUNuEcoeagMbBDhcV6pxpHgirusiIWdmT
         Ee4bW73Rpc3Wkm8OdPu9RmzNSIMd4L3scMBVr28HbHTqPSmyGa8I1j+Xv3mPcEupINZS
         91fExhdrtz1XaHnWPPi0938M92Vmy2FpuUGbkGaEf3BVO/P2uqIw9hSB7E7O37/mHKkt
         4ZziV15j9Ktu64JhAzkio1iVFopfqNihsMncnsS7naeDMuMnVCruAg1yfeNuroNfF9QG
         S/pL7e2H6D3q2Eba3rhJgWX6hU4uPvaU/1iXLbd4OAjC4qQ9thYH/tuBU7rK6Fkr4F4I
         FdVw==
X-Forwarded-Encrypted: i=1; AJvYcCUcC5g7ZjZP/a1WMydSr3pF/ZCS4TR47U0Qo6U1dLJayuVJmNRvxnX1JHo14sGRCund/u2jUkmJqVkcVvfm@vger.kernel.org, AJvYcCW54y6MiP4jGVqI21IRY+eYda3WxPryNBU64tsW8ZyPC9AWkuOMV+GfZcZP4ZrpzIYPf3XXA9K6Memz+ZE=@vger.kernel.org, AJvYcCWpRJDZFwQFLyYN0Q60IY2KJQD/eOZd8E+CRJnAvCISZsBx0e4p84nQ6hTfXdpT3uEVh1KtGfS3R0HZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxspJTe6S3eW2mMqgqQrZ42KZT8dhpVBu2wjn7II0KZ0P5gpdMt
	Se2ra+I4FtB42D/8SLhfs6BS+pYBRTc75VP4ew2ZyhptE/OVdl/d
X-Gm-Gg: ASbGncs4ZnqeiYj68v6VT+3pTIg5RoEj4P8Y0ypEjTWixSu0lxKFhni0zpCYdw0q0d6
	9+sTqK+3PQgCiCgx5TAOliar/Gdamfen3HcicEJ+0UarVh/KMpoSza5+ARScwDKQNN2+zWWrYrH
	0p+/qErnuX4r41mTdOmNZUEajMJZowygGTuOsLtAqnMjMCaIOT7GItW2F3RqRP0vwV1taqmwfcI
	5UH7Z0+WR8yj99JV1c27RK4roHZtUdDypatABOM
X-Google-Smtp-Source: AGHT+IGdj7s0fZzu0zpwyTVptfjyqi79gKbWrdVfA4prZH9hVU3A0jrN0xfjCiteQ73LifT7k/lQbA==
X-Received: by 2002:a05:6e02:1e0c:b0:3a7:a69c:9692 with SMTP id e9e14a558f8ab-3a811e2a4eemr82547555ab.21.1733671424511;
        Sun, 08 Dec 2024 07:23:44 -0800 (PST)
Received: from [192.168.1.109] ([2a02:6ea0:c603:3558::35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a814fa40d6sm16846805ab.57.2024.12.08.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:23:44 -0800 (PST)
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Google-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Date: Sun, 08 Dec 2024 09:23:30 -0600
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241208-pocof1-touchscreen-support-v2-4-5a6e7739ef45@joelselvaraj.com>
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
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733671419; l=1288;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=6J8U1Z0ISgWZeNHHwG5GD8wzmGFCDFOJTCpfO/uYYlc=;
 b=21suvVmg5Fivexqi0n1maBWSR3R0hLmLEwv3phoyYyBuE8bNkypXBMw1mz728Oazi1dTh+KkB
 MGmc8gB0RCtDc96ZzrjJF3a4cVlIfn6eI+lm8AVg5eZDJLZsf6WlS8L
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable the Focaltech FT8719 touchscreen controller used in the Poco F1
(EBBG) panel variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 76931ebad065e..2d6f0e382a6cb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "ebbg,ft8719";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft8719";
+		reg = <0x38>;
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


