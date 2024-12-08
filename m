Return-Path: <linux-input+bounces-8434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57B9E85D4
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 16:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959CD164E0E
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2024 15:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D2C15350B;
	Sun,  8 Dec 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+Oj7OV/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6136F305;
	Sun,  8 Dec 2024 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733671424; cv=none; b=Slgwby7NX+ymvCf4jtwq/7Eo5yiYI2nCgpex2hvrqdXJmHzeNxJbfdiF0UgQNTiDOZmbHP9Ku88wUCweEFNcXYIS7FHGlrW2U1/iorn4mIJMCIeRLHMAxytivpe5HFQVuNHMoTajhGVzfVA3VNypXTMx66Y21zJPWj+OXG80QjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733671424; c=relaxed/simple;
	bh=qj0AQF8sdxK8eDd/wJ+QJyDy1IylslyTN4Yf/nFBbHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Es7FO5l0OouBXsNNsasZ4YcMWCcbsds70quIOM0oire+kL/mH+nz1O3V4YeIm6mcfYWkOwiAUe5sDBZUdHnSS7B9bTwVBV1l7+uZfffKzh2usO+72dpejFoDpwnNHCpJTQoXQNtQz8Q6QR/XWHt7rS6UsJYFuVv67D9ljWCeMts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+Oj7OV/; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-84197c469cfso110806139f.3;
        Sun, 08 Dec 2024 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733671421; x=1734276221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuaRJd/s2p0BBgmJcCTKuS2Shw0j2gcJR2sZ9AKudDA=;
        b=Y+Oj7OV/gDSU5YY4zvA1PlMNrqgJHCBiCcp4ChA1BS3VTWk5KbK0ytzOwCuUGnvb7y
         80F7Rp9SMO7Cmj6uPNHdaxH+9nii5ZgB3ehY9RJATN+5k+mv1kIPC36BQWQl93vMLJoC
         AGhesGmlGjlyX09qdAbbpshFGHinVpv607VVLajPMhTbru1f0enkf5vxK4ii7Wk4zpyH
         aCF05vctMFChnikS4BHRjKb4Q6gbNRETDn9xTESVfIdxT9zjFAf1pvK4VpnDkDPeAVFh
         pqle/OgEO6TLFlExnX1x3iDe3aUG1h7KgspPVXs/NyJt21Skl02gFrTgMHzuHo66hYpX
         N5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733671421; x=1734276221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuaRJd/s2p0BBgmJcCTKuS2Shw0j2gcJR2sZ9AKudDA=;
        b=LzoKitvPyhMFumnwNRE1042k8cLEZUjV834TBugqjUl+J+y3vnhmtXg0muDUQxoXPE
         fCP1hb8ZryegS1pf0DBBKqqgTgC2DLjpzmWHC54Shrw81wopYJiIKr5nuQU1nbdkdzuk
         v8i7cerrS0DGHy1wTcJtsCaJS2R2EiKShjlU7VPiH6rOwrs4n4ChxEPY3zP4DsEn5kLc
         d4Q9oA20O7a4wMtaboXV8bgHITjzowdSLLmRpwx5mW5h0JPKML7s9O8ZNBLjMgfHYP3M
         drnvKCvkyC1yLY9PHl+uilhHsDo+FJo1V9lzDw+Z4X6nfdMH2bDkWdZDii6FHYdORsTO
         d9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV1/RG2pY/SH8n/k9JNYSNy7r7L4zNBr2+KFKEbfX72XV/6N++8kYz3moaLVEDOcAdF2XYtbGoQCgB@vger.kernel.org, AJvYcCW1z/TwlR9nXb5Faz4wiGhGSXCvRAw14ZUoMCfnYLYOdPO5fR33VYteTTkS9amgTydLNgxcw06AmUzmlb/p@vger.kernel.org, AJvYcCWPLQi3vftFmGJ8YIXLfXA5frq88TwWsygN3oSiz5eZjGduhhh+rVSrq/dc1+yC8t+UnqNdtl6WWkiFI2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGhV8QB3bUZ7OUZXC/SXcrCcTy2xzAIWvKHqqcAtaoQdd1HmyE
	AyhDRdqYWMcm7BRvzWYjgepQ8cbj5VcsKVXHCHTQS/ETOdg2kb8w
X-Gm-Gg: ASbGncvxvBNlzi7ph4UkIYKdBs8k8hNeLFYAAfW7jQOEkjlUOe4sA9O6qqGjhHE1/Bl
	4rvhgU9X31/WEsdXlkwmnEhQwbMv9u/A3QgjyJnyHmsmOuheRUAqGLNzC1Tr5TNd58CkZa4MiBo
	6lBWW+Di6F9x+57z1bKe7azJQwx6s+yd7NqD+SK35/i5y3vQrHFo5qfkh/smrkaR9w5BY2GmBK8
	buXq8RYCLjbRnnNIttz2upEBuc2yPGTkCguBzfH
X-Google-Smtp-Source: AGHT+IF7EHSPVHzRrQeAE3D5a/Jgfz9fqUlcby4eg7FtaA39XYsC2c1NCztqiUGV6TsLAh/uZaadLA==
X-Received: by 2002:a05:6e02:1a66:b0:3a8:1195:f216 with SMTP id e9e14a558f8ab-3a811dd0cfbmr91528765ab.10.1733671420748;
        Sun, 08 Dec 2024 07:23:40 -0800 (PST)
Received: from [192.168.1.109] ([2a02:6ea0:c603:3558::35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a814fa40d6sm16846805ab.57.2024.12.08.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:23:40 -0800 (PST)
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Google-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Subject: [PATCH v2 0/4] Add Xiaomi Poco F1 touchscreen support
Date: Sun, 08 Dec 2024 09:23:26 -0600
Message-Id: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO65VWcC/43NQQ6CMBCF4auYrq3pjCLElfcwLMowSAkyTQuNh
 nB3Kydw+b3F/1YVOTiO6nZYVeDkopMpA48HRb2dnqxdm63Q4AWMKbUXkg70LAv1kQLzpOPivYR
 ZU1mghStSS6hywAfu3HuPP+rs3sVZwmf/SvBb/8om0Ea3zRkahAoqKu6D8Bh5TDbY4UTyUvW2b
 V+4G3UwywAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733671419; l=2143;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=qj0AQF8sdxK8eDd/wJ+QJyDy1IylslyTN4Yf/nFBbHQ=;
 b=o8LqmlHF64x2wYkurNh5TIrk2ZeDR82bJuiZ6o9TYQCeO8OnlcNQqg/qGHgkMMIF1ZKpQ5ADr
 XA23NmyUmQbAJAbIF0wknwdjg4MZ8EJsBK8Djt4nUTvdQowv0oUqPem
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=

In the first patch, I have added the "panel" property to edt-ft5x06 touchscreen
binding documentation. In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts),
the FocalTech FT8719 touchscreen is integrally connected to the display panel
(EBBG FT8719) and thus should be power sequenced together with display panel for
proper functioning. Add the panel property which optionally allows to link panel
to the touchscreen.

In the second patch, I have enabled the  qupv3_id_1 and gpi_dma1 as they
are required for configuring touchscreen. Also added the pinctrl configurations.
These are common for both the Poco F1 Tianma and EBBG panel variant.

In the subsequent patches, I have enabled support for the Novatek NT36672a
touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
Tianma and EBBG panel variant respectively.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
Changes in v2:
- Fixed the missing "panel" property dt-binding error reported by Rob Herring's bot.
- Change the "input-enable" property to "output-disable" in qcom/sdm845-xiaomi-beryllium-common.dtsi
  (Based on a patch suggested by Konrad Dybcio).
- Link to v1: https://lore.kernel.org/r/20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com

---
Joel Selvaraj (4):
      dt-bindings: input: touchscreen: edt-ft5x06: add panel property
      arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  1 +
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 +++++++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 +++++++++++++
 4 files changed, 86 insertions(+)
---
base-commit: f7d003800fcaa3f3619468992bd39963861ea793
change-id: 20241007-pocof1-touchscreen-support-c752a162cdc2

Best regards,
-- 
Joel Selvaraj <foss@joelselvaraj.com>


