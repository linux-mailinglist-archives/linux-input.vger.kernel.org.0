Return-Path: <linux-input+bounces-5529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C594FA32
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 01:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165221F233F8
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 23:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502D9192B73;
	Mon, 12 Aug 2024 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlelNrOp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832EF170854;
	Mon, 12 Aug 2024 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723504992; cv=none; b=k//16fsxlwfQSz848B6YViDz+pktO+2lGadSbjC4ZNAGOIGW0qcA3IF7zV71Pm0+YnmubVrHrlGYWhwxMK1R/lBYqvzUly+IL2Q0mrVKVB2QETXuKrCyWiGiFgvirpywW2pQB9KJbWyEkZoKTYy7iRh6Sd/raXfDBOJZ/HBMVJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723504992; c=relaxed/simple;
	bh=tcdUzGo9l1HJRrmy8ZRiPP1ogzuaoHMi6M+Z6hlQyps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WS0fMqffc4/kO05RmxK/httk3d3Fl9ASFONzwKr91qU/BkiLhWhTN46RPBlDS/zkIVbGwxIf3cMfyJeBGq9ctibObhsVm4UzDpaB3lW5vJT4MLxWsB0cYOu+7eTLFQZ00l+s4mjFtQHBoMgE5YoTnXB0eRQHx6XSsO6R+Q9ol4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlelNrOp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f00ad303aso6641628e87.2;
        Mon, 12 Aug 2024 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723504988; x=1724109788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPcBm44IQMa0BXAs5xOl4Sdrlz+dX0zSI+ekXsUC3ao=;
        b=IlelNrOpB00oQgWc/gg2qg3tlnCyJUuf7ItoUCYOLCB4caT/rWjNElmuGiWMs/Fy2l
         oGnE7y/sr/4ef6ucctIkwJcaXv0JQ89WaYDCaNbjAZkLCCZ4TSvjkM8KNyjcWFh5AKxk
         dD0iEdln6SCQMxhvf699H2q09nLsOdXnSRmDIOYNmY9up/YAv2nWctvdaW8zstH2DMau
         TRK7wCamT8eIk/YfQsb4R3pfMSktW+b35OsbIu7UeK5bK/eesHBOFUiGIO1OS9g8McAn
         AZlZKtMwx6VsfVbiTXifjflyQhf5OWNPqOhFn2JIGj6xERrfN9FhWZvsYZy5E3MbJ5Ws
         fQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723504988; x=1724109788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPcBm44IQMa0BXAs5xOl4Sdrlz+dX0zSI+ekXsUC3ao=;
        b=SyCHzEvN7GDcdMv/Onq3/z44f4mot2QWM3tHYUcTqZvq1Swnr/s4aF67f3c+LGLi4x
         CZW3bKppV3c4zThOSMrMnCWWuKvIRWzV99FF+r8zHpxxhI9qbNesv0we1cVPYMptU5ZT
         Ru4L7up8wJt2rfmlHxq6gddUyod+Y+VTpMMvO6c/HECvbaIfu34REtwq/DLcEBclOsXA
         PdBcmExDzt3q/ELw9lSeYgks3ynVymYlOZCPbIO9pu5NFeg0SVDG0j4dJCxh/+pbiLwx
         k57QtJx09yUXr0DRv0n2KiEx1EPzd3iyLrtz3MAsKlmvN5fC0ARcVWgKyKMjhYlqUT4U
         kWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUqaNWRuwpSsnDMACy2ptLglKdZ0t8GOr+2FN1Do5Q0LfRzCbz9uMANqR9Cbd9FDyU1Hq4PlW4atHnflrVZ@vger.kernel.org, AJvYcCXVCJ7BKWiLspFz7BUXTMhOqQ2C7mLQXEPzLPV3PhyUBS+X7NHvs0Bqz3CIID6ooftFbXGfYp60rfSk@vger.kernel.org
X-Gm-Message-State: AOJu0YxNllojWEXvPMDtI9mfOxk3+vuJ4VuZHMs6ZonooMFYoL/opQ34
	lkr6cCu9eEv9F8EdrwNbd5jR5KFTC2DDiFZW9jXhhTaFhEDWcwA3Q4ujjyWg
X-Google-Smtp-Source: AGHT+IEN6HFjPWPqXKEAt9ig2cOJEb/xrFYk4E3Vf4RBZ+LMfcPfHdZtX26dV2WgG927KTg4sxakHA==
X-Received: by 2002:a05:6512:2810:b0:52e:f950:31f3 with SMTP id 2adb3069b0e04-5321366841amr1002568e87.35.1723504987309;
        Mon, 12 Aug 2024 16:23:07 -0700 (PDT)
Received: from [127.0.1.1] (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f1aaddsm869265e87.182.2024.08.12.16.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 16:23:07 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Subject: [PATCH 0/2] Code quality enhancing and add tag for dt-bindings
Date: Tue, 13 Aug 2024 01:22:38 +0200
Message-Id: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6ZumYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Nj3SQT3eTiEgtDs2IQM83YyNjc0tQo2dI0SQmop6AoNS2zAmxedGx
 tLQDJuGfaXwAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, igor.opaniuk@gmail.com, 
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723504986; l=1186;
 i=kuzhylol@gmail.com; s=20240813; h=from:subject:message-id;
 bh=tcdUzGo9l1HJRrmy8ZRiPP1ogzuaoHMi6M+Z6hlQyps=;
 b=aUoaMrFRZbw7ZhSdp/Ec3zaUauQKJkKgAR2Nu44n2w19jfO37De5VJxLTwsRgfXsKPnMoytvn
 +dXihzdP7MyD4m1Ofjz1y0Z5UpjeFo2pH47uT3hgev3Sbp14B1SS45A
X-Developer-Key: i=kuzhylol@gmail.com; a=ed25519;
 pk=/eJ3W7RpmVR/qw4I/gsAD36uT8x/VUHRj7nyehKlG2s=

Patch 2/2: add driver for Hynitron CST816X touchscreen
Changes in v4:
 Updated patch based on Dmitry Torokhov suggestions:
 - Moved from u8 to u16 to store coordinates
 - Removed __packed for touch_info struct
 - Move touch info from priv structure to stack
 - Added buf and size as new arguments for cst816x_i2c_read_register()
 - Removed loop from event matching

Patch 1/2: dt-bindings: input: touchscreen: add Hynitron CST816X
Changes in v4:
 - Added "Reviewed-by:" tag received from Conor Dooley

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Oleh Kuzhylnyi (2):
      dt-bindings: input: touchscreen: add Hynitron CST816X
      input: add driver for Hynitron CST816X touchscreen

 .../input/touchscreen/hynitron,cst816s.yaml        |  57 +++++
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/hynitron-cst816x.c       | 258 +++++++++++++++++++++
 4 files changed, 328 insertions(+)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240813-b4-cst816s-b4-f3237952c95b

Best regards,
-- 
Oleh Kuzhylnyi <kuzhylol@gmail.com>


