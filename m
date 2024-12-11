Return-Path: <linux-input+bounces-8491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4495D9EC6BC
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 09:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F2E167288
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 08:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798BE1D31B5;
	Wed, 11 Dec 2024 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMB+9+JA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6183C17
	for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904942; cv=none; b=q5355DrfHrbCarvuEzxdKFY/8N8pYriI4rFNNEwHy2uVkjYgLTHDChySfSddnLjI7LViygfEn0sPEJI17lVtiSjaCtNfAmpLSP+YNiNTMQylEO3z1mGgz0a82Ub1L37//ys6LxTtjEPTLV0EiLlJ+JCX+XaY06GufuFjGQpciYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904942; c=relaxed/simple;
	bh=7G9MHCJJhHRTHCJ8gpKJ9FPxTkA8e8UPWFpBiu7s+Ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dPCl7Ddf/i16u4Deex2vVrMR62fPImMUXcZnkw5OiTutusw1d/E18lyOBAu0IKr7/UGjdBNiusjlxMJ8dzXrEdTeXbjfI8KBgRwkXdofMjrgRkoLbGawn3zojx/M5i3ExNvKd4eOHG8vAFasdvc9ExL5v9A9ix2Mm2vH0VTz+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMB+9+JA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a736518eso71156245e9.1
        for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 00:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904939; x=1734509739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yxgK/TxJ7wHnjGiR8cbuZnsbzeChAfn4qWIe3hfzYQU=;
        b=zMB+9+JA1IYuqvch2QqIURyZmAXGkioXpniONvzjpTRu+TXGLFyGAxOodsm+SSwKWH
         qGjTStZ47O3Q9nLRjqwIscOBmU6jSDOHSaCn/mFqhly5lNi29HktxJC1PqLbp2XeM6cQ
         62fqMWHpGeJSjZUxsoa5QwzbCvWiJ3M/aGsNuun3+yN7vmNkIdBeW/DYmmRdffZFOWNY
         Q1My5DL4p9W4IvdA6mNnsWSQu0VUtyyjgn9GhW1zgxBWD8euMH9341zSY8oK2Guu8TL5
         FFdf4JA4CQu11aRpTKXwqt2evB+30adW3JVUPymQeFrtkjBQydRfvL8mYDyZ6DZxuVEG
         cj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904939; x=1734509739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxgK/TxJ7wHnjGiR8cbuZnsbzeChAfn4qWIe3hfzYQU=;
        b=ZziEH3C4BgOh0eQPFH3rTbzPqyowDYrh3nq4og0dgXjDHk+otgtO/mNvolV5F8Te+G
         /U98TWbXSQrxXpttnQ9HAFXt8HZ/CzGrbnc1flk3TJZ4+8K2AClOMT0Yx41mLvAtEHYd
         mV/tvePsYu03NoWbxWU9Pzl1WbByS1a59DxbQtErRb8SYlPj7LmixUWXIThzLkenYN6X
         TDeR/QdK/w3gTjzJ/c93oP7u21DnTuVrl5h3UulBjhS6boKDKm2o5VN8569lGCPZe60p
         c3z79EfEUc++qV8JI7Xa8vYlPakcWgZ96HO1SlYKOLgTQMQSZxyVBbY9skp+BOqtBbTt
         uabQ==
X-Gm-Message-State: AOJu0Yyd5SD9Q1L6Gf/8UCnJd3r5rfFmOcED/KCIe8MykGlT/15S3egY
	WUf2NvDCdLNOKKgaQUrVobLsuNroy9nl7nfy+cTO9l5YgcXLolknPprnPSRNgJk=
X-Gm-Gg: ASbGncs2ThBhfYS2Ew92y3+EdlMyVznGcosiXgVrM1sjpEPO2melUej/YumF4Vu2CfI
	7ii0Dpe1OUQBXtOTqWjWIoy8Ku0bJ4aIYTtLtRR49Nsf8l5mvZ6uc5tku6H8wGllBYRUgBZS3xX
	EHQNcw/QjBi9/NMMWtosS82siZ7vLbkmb1HnBoxiL87mZhbWwORjj2KBqWnF36zm0so32rN79sH
	ajvRDT9vKEYCJ534ylWhaF4ug7PFTlMNifb5nOObm2235tm1W/Vy51ttCUXhdU5leI/xNvrsvs=
X-Google-Smtp-Source: AGHT+IHy9dA/nbxdrn6PzRTLWuAKp+Tc2bYh4Sh+eRKZe9n04mj/c3DsdVUotTROQXnsxkH+oU1JoA==
X-Received: by 2002:a05:600c:3b94:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-4361c430af2mr10615575e9.22.1733904939023;
        Wed, 11 Dec 2024 00:15:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361f6d878asm6231805e9.2.2024.12.11.00.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:15:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] input: convert dlg,da7280.txt to dt-schema & update
 MAINTAINERS
Date: Wed, 11 Dec 2024 09:15:35 +0100
Message-Id: <20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACdKWWcC/43NTQ7CIBCG4as0rB0D9A9ceQ/jAunQTqKlgYZom
 t5d2pVujMv3S+aZhUUMhJGdioUFTBTJjznKQ8HsYMYegbrcTHJZCckrmP1EFh4ULXSmlYqD9WP
 CMIPk6IzpaqWsYfl+CujouduXa+6B4uzDa3+VxLb+oyYBArhTWrfihtbo851GE/zRh55tbJKfV
 POLkpkStqxL7dq64dUXta7rG2r/I8kOAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7G9MHCJJhHRTHCJ8gpKJ9FPxTkA8e8UPWFpBiu7s+Ag=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWUoo5aK+/+aEFFXXu2IKP4chsZqIiJHBvOzpFD3I
 Swv98IeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lKKAAKCRB33NvayMhJ0SacEA
 CsHDb/rEgACpUHHcsN0KNWQfVGDO0AqHtcb4+Zy8kHA87FkugwWcIaJ5jj8QkkhDJ7eBeKDP+YP+JB
 MZTdnqRj3zd3hkFxPFOfTA2h+3YjC1TIbIt9WhaK5PCSxCqwPi8pJeb1Pij2Y0g+VI32bL1lkPru9i
 ZUAoOWUo3tPif/w3JWTYDvze284H81H+9ND1gZeBKmEdN1xgGwC8wOO6lw5cqqqtcuhxVBVFv8JMLv
 C+at+sbrp3B9ISbrbEasRQqyDs2Wg7tksREh5Sr2Gxc9AWy+YWulJ+W0HcpBnuFAfSCeuAUFOqJ1Vf
 qrUZzLi/knfmWjMHv9EJt/a5hz1OCrpDue1jPzy34gwQ9uWfFfk3naCgyBgBZWUEE34yziiwp/BpfF
 MY+rREgavCYj6xxm6XrQFWheItaL3UVL0XvijBdAzsp/qHQ8HMnF1h0UouBsH3cW6Fx2FGtwY8KvzK
 0n7TWWt4saQwLAvdpASnY+2h/np9z0bb949c8EhFlQBgxz+2eFJ/0iQ02EVQferkuwrkk2tAuAwQB6
 nVp1cW7PRxZYsuS243LztmK8UXre324rC2V646Fnw5h02DodvomAPdcFk6xsy59TZY8zyMO29JmJNv
 HumqFPcqGSA583OFhSSD1Pg/53Ixi45kJebJMoBmaGjbe3rB2a1p4hvNMOyA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert the Dialog Semiconductor DA7280 Low Power High-Definition
Haptic Driver bindings to dt-schema. and update the corresponding
MAINTAINERS entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241204-topic-misc-da7280-convert-20efaad588ca

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


