Return-Path: <linux-input+bounces-10571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B225FA5487C
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 11:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE7B1894FD5
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 10:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E26204C19;
	Thu,  6 Mar 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3nZXF5/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC631A76BC
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258586; cv=none; b=NoFGzlL7hdrsN3Qm65+wTZdM03Bl5pArAphveW5nHnVU8qnHJeewAfLgSMkTErmA2U5y5AauzV9BkkYD4cn7dfyIUoKG5PCtn4vtaEk9tsdXTPf1oH2X4q848bJQGnyQLK6Db3yFlC6/sdnAlb6LPcI6NOajxallgtUv3LdpJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258586; c=relaxed/simple;
	bh=wdLF9WAxR22XqcYA7gK8+yGhNvwlObpcwbXvFtZiEFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FYOzePoROvuU9bZ4csYJFyHA+gCqrqacjhHdxdd4ttrKis0mYhUG6HccaGugqRg6L7FFlLsftOGCy74f+ozVc0QHbOE8XddTo3QpFO+OUzAsYmiXtlEJCuFj7+zestexgIFCBOLCp/3wslkThz83qEZw5wzlirfKSS2iAOlgJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3nZXF5/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so2959555e9.3
        for <linux-input@vger.kernel.org>; Thu, 06 Mar 2025 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258583; x=1741863383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntfm4QuEvNugJ4xYbOkC0QKXHv8rdJmW1XkWNgsvim8=;
        b=D3nZXF5/EgmrpyRYvBHvXgqQwreMtdW7zYzSUkjRcUyZhSQDGq0a6hTe6RCQ7Vix7j
         P2LDfsYrOR2prJdlpe7zZMpjr88e2KIBGZMcjg8PYRksQlNYeRw61n4ns410TZP09T/N
         X3a6Mv0yB6/0Ia5JmZeUopkD/Qi9yUucM3iWluMBdgV9q6drpTQMSyqIivK9X0qBN9GI
         wvySesvU115luFCgGGSQbJU+w2OX9U1pE694urQrIHmSdHvGNOAdMoQzg5XzASBU+CnU
         YSq4jvSMfuhp4xOUjdBqRKLZAc1ESr90iRfUj7WJq9yxRx+s32+CQo/vz44R2X+kaIhf
         vdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258583; x=1741863383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntfm4QuEvNugJ4xYbOkC0QKXHv8rdJmW1XkWNgsvim8=;
        b=Lj8pm6r+C0Earo6DL/fyXcvfMIGuB2MO3BBOgbFLV+pzQ1hITZGUVFx9SFOXEKl8HS
         GZEDHeG3DzKc/r32T2jNcdAXynHUCm8uFZoeLRByI2EucjOWZLZzVuMESQ84cZ1nXnDo
         chHtge5/8wURaB9cbC+Zxm57SnEnrQwc/dMRC7LVLpWiTMV3NeQz8eDO6PmtdAhptaEz
         lxMYjx+WUOV5S0tuKre065eF1OmG+aC5S7gPjVo3FbM5Jh6ig7NtiE+TS8MRNk6t63r5
         rLBgdCZvPB83chm9zQlaqNzWgSm7IcTD7iANCbwNjtQGytAd8w5IKBvF0n7q4rTS40mK
         cSwA==
X-Gm-Message-State: AOJu0Yzf11DH1uXL/O52cXDMwz/0fqdxCdeOYL3h/v6Tpdt91lGjDmPw
	aJ91U6ckOBtkCxoqfSEbAL2TCJCRcGUU56MGMrHkG0uCIiOODa2qeO0okpTfNmo=
X-Gm-Gg: ASbGncuvTK3YUcm3oKsN3AqErLulusEC9XVEMbvQRY3Zuz1mOuldmJqFWrSZJj4xm6e
	pSQshLnIEbZH+HBOKkkNQ0DFBBX02uncGp/AQ+1MxtoZr3k4P0YF3aVAmuzLr12boyh7YWEVxU3
	/LiFeIx/r4nzmHxvjrFS8VZdGaCsuA2EwyC8ye5N8MevhpvXU1O+PM+mHPmQm8U6MtfJW0nBGzY
	fG319C10P8IH67xVmLKfkRc9f07sr11ziy69oFIHLYvPFP0gwhrn3wWoX8b0Ap4ZqK2xqmepv92
	Rjp3J7LaZWYg/gbAjfKZTT9UgbFWnXe2V8ovNhz3XboR5r4kOXzuAZ1saNvRzE0hlQ==
X-Google-Smtp-Source: AGHT+IGfTbr6JhO0xYsYYnKUYMZiygPSfbhn9Cgj55ShmF4I2gr2O9JfOHtuext0rfjHkqMFS1qAtw==
X-Received: by 2002:a05:600c:2d16:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43bd2989f68mr54496775e9.15.1741258582923;
        Thu, 06 Mar 2025 02:56:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd831719sm17406675e9.0.2025.03.06.02.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:56:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] input: convert dlg,da7280.txt to dt-schema & update
 MAINTAINERS
Date: Thu, 06 Mar 2025 11:56:18 +0100
Message-Id: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJ/yWcC/43NQQrCMBCF4atI1o5k0rRNXXkPcRHTRAe0KUkJS
 undTbuqCMXl/2C+GVm0gWxkx93Igk0UyXc55H7HzF13NwvU5maCC4mCSxh8TwaeFA20uhaKg/F
 dsmEAwa3Tui2VMprl+z5YR6/FPl9y3ykOPryXVwnn9R81ISBwp5qmxqs1ujk9qNPBH3y4sZlNY
 k1VW5TIFJqiLBpXlxWXP1SxohC3qAI4yNapWhuulMIvapqmD9zoqKRZAQAA
X-Change-ID: 20241204-topic-misc-da7280-convert-20efaad588ca
To: Support Opensource <support.opensource@diasemi.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wdLF9WAxR22XqcYA7gK8+yGhNvwlObpcwbXvFtZiEFs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyX9UgiMec+Jkuqwmb/vnRfNsJpglm2TjPIvifTXq
 caV2I/CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8l/VAAKCRB33NvayMhJ0ZyGD/
 9JLMH75fDc+JZn3kyPSoLWA6NUk1y5pD4d24VcPcnhtBhsGJmuETnH5218iWGyXllL2t3satA1jrR1
 2ZMjU8d8ErEUvLCpO1gEz3t0MebOQcyZ4IsWqzl3kTXDashCCJ5ateMN54HRgJoS2yPK6uq5zRV2sH
 vJyhPHsL9z2R4JaYxJPGRVChone4axmtRW3Xhm2C1HOljtKBOlwdpnZp2675EAIA6Omcinz2lmVi7e
 x1XMGoS3WKLFVTmpGGa90UAUfQeGxvULMT4znYhASyxQAy1LuSuxBuAuSTOg1UGWnDJ7/iSzTMXV4E
 zukKRCQjnq1BIzLGzpL1USpd+jRTFV2xLRpfshZK53opT2+u8ROuqAMf1AUiMTeoplHMY5eemjwDsc
 durFUsp0f7K4l0wLEzRpkMAIfKPuzaXSZ2/AFfbIm9+JcVs0BS0NyJ9ZpWL7OYXBvFrDiDvY2Sorae
 wEKUZspv//O0Q4mZ/4Gt2PD3IE+/2IU+1SI4fw6ImPECBCbsuzPFKLHn4XBIxVw5R/5q/d7laE9Brs
 /TNOAxHDy237B5K08kBoya8ptoPqKv0GBpLoDgpvnlGsDigAEFKgRRtXtVVc74EvapkWZ3pM6EWouW
 y7+tgtDUGz/iNpYVIqsKDrECVP1hE96H/VUaM6JPfrLFWiDBIqx65mLBOuqw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert the Dialog Semiconductor DA7280 Low Power High-Definition
Haptic Driver bindings to dt-schema. and update the corresponding
MAINTAINERS entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Rebase on next-20250306
- Link to v3: https://lore.kernel.org/r/20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org

Changes in v3:
- Add conor's review
- Also fix the MAINTAINERS entry
- Link to v2: https://lore.kernel.org/r/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org

Changes in v2:
- Switched to flag instead of boolean
- Switched the array to unit32_t, because this is how it was defined in the txt, DT and driver
- Link to v1: https://lore.kernel.org/r/20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org

---
Neil Armstrong (2):
      dt-bindings: input: convert dlg,da7280.txt to dt-schema
      MAINTAINERS: update dlg,da72??.txt to yaml

 .../devicetree/bindings/input/dlg,da7280.txt       | 108 ---------
 .../devicetree/bindings/input/dlg,da7280.yaml      | 248 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +-
 3 files changed, 249 insertions(+), 109 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20241204-topic-misc-da7280-convert-20efaad588ca

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


