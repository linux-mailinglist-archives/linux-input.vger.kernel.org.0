Return-Path: <linux-input+bounces-15098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB5B9E90B
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 12:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E5A4220C4
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 10:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68822EA730;
	Thu, 25 Sep 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jWpOKZ/v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DD2882B6
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794869; cv=none; b=rYdt7d1e1WzkvPkDADQJok7PGWVqLUu01+/Ks2Ep/pD7MwphHbYUMm+E5s4WF6R231+YnLwj9CDXDP3If4zyR6dlpsQTAlMj12Hcs9weQ1onqvf0zYhi620fzLi6ucCN295qVNgO/RYKWkwZl17d/4JDE9GB2yt16igGDmfnJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794869; c=relaxed/simple;
	bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e3NHM/4hz2U/nMTgJu+gq21r6MM7uqjyEcsEukem01/gTJBv8QdAFzL3ZM5bquWkfFyuj/oGN8pKAQb/vTFYYKngIsbecmcE8E8H8AvDVY6MLEWA0ylEf1BIwagsGUBQJVZDDy174t1rZSGUE11cyGeB0PgdQ5banEVqzXd1kJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jWpOKZ/v; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07883a5feeso169172266b.1
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 03:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758794866; x=1759399666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=jWpOKZ/vV5bo8kKY/+8WnshsBI5H2/ZX4tO2y1i4Uker22Xzy8Q9xX46ydvqlNG3lz
         mTt495ck8CjWQfaPrqal7UJUnsNJ93NOJDGYaTCEC3J8wirC6UCJYuzfjUT/4Pz8QdIB
         ohnS4mn0OZCvRNXMCN67LiplQkY01RVxwquMi9td9dfoVmMsraiLDfqmwXYR1UKhceXt
         XUg4CZOLsGBwSnLEEo22CX7jARb5XV2DTmtAAc2X0O9B/0q2fvjx5EeywOX3+v21mJ1W
         vcP0mTvpsR60kGEC4c4WK+K1+aGvatO5NGHQeleSEkK3qpCsMQ+BPErcrQlHb9vxc8b1
         uzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794866; x=1759399666;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=FmC7jifY7EaxsN+jlNXVXJjpHiYswdvzAJU09al8+ptTPwIW65gdM4ragi3P/ZqRI1
         2PHxkkdPTKdcO4UR/P/LGSDffItDVnE11PeEzqDsIgq22Lq9iRgtN/mmarDU1aRhhCrA
         WA0Mvy1Xgpp4VdcOOhz+nOQKB2ZeSd0C1YM/uQeuX0AkBxkiNDrwU8dozj1H6pKFcpJ9
         HHMJ9U4kULzTBOVOqQwP+qd1xbSl6rTwEDy6IuoBDShpqkxT+FsIoq7oZP3vpUhFJh/7
         kzBldpDKYqG2RnXwnoVjOsDpc369jX2nmDVeQZWqS1p+B3iY3SjnkRcsBlB8EHnV7d+p
         387A==
X-Gm-Message-State: AOJu0YwfkBLe+9/RqWadSuvkv0BVrXQXDxd7M3OcZTKb0CIZt0wZOhCc
	qofZyCa2EX1EGFAnDP5J3JjPTqxolzDKk/ADyFgDXXTYhuAobF1f3aTtA716qCh11NGbk7Fhc1T
	CXl1C8ioUHA==
X-Gm-Gg: ASbGnct7NMYvEts4udoaxZ9hZxNNJ0s96n7TAV3+M3xrGC4RkXJkKXfy0PM74OWZFp+
	wZfhLmmHkVoUUjICbVrsghrMIzcHC6hkeBllPryTJjieysBo5ruSdTqz/GLuAzGduLQokxYkXuW
	g1u5uWwPhSKOq5QNv5AG3/pMNpu3t5SmvuXnIdNM0h7RqDGdD4dGYHhdPIskM9KhOfprX9GlP1c
	AiUDr5sJO/otnYS2J6g0qlhx7HmM3cikZwdNkuq66OV/pxam8cjBlJBOYLlpaqLHzbp6y/2WvNx
	+CHxtbB27uUvDDXiCyPGPhXKiGM2568MONFMBDUmVeUFbKBtivZyXFvhxCiIwLChAskvwaaYLYw
	zPYO0Z27sQDhA8q4rFUztqiEAwN8zXDgGvgxYBg6Yo4XorKEzbg51C4Yub3Dfumzv48dapEowrL
	hBatDa
X-Google-Smtp-Source: AGHT+IE8TAQ0ieTHgs4m7gim+fRDgMGDmFFmvRIfockvNvymGGa0I6tPXCyGsiDJM+I3Aju2cVvIZg==
X-Received: by 2002:a17:907:94c7:b0:b2d:804c:f5c with SMTP id a640c23a62f3a-b34b684a76bmr362320866b.4.1758794866008;
        Thu, 25 Sep 2025 03:07:46 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7746sm134270766b.59.2025.09.25.03.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:07:45 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH RESEND v3 0/3] Add support for Awinic AW86927 haptic driver
Date: Thu, 25 Sep 2025 12:07:27 +0200
Message-Id: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758794865; l=1819;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
 b=K6q9xHDFqVzGDg0/K3TIC4M42C44EAjwZ3LnaQSldYEZrPR+LSp9uqb03ogPaOSd/mx0AmbMf
 4OybTK6Nk29BQYXsj4zEvBALFeNtIKQfZxmoX+kXzUcHlaZ331S+tPO
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and a driver for the AW86927 haptic driver, and
add it to the devicetree for the Fairphone 5 smartphone.

This driver does not enable all capabilities of the AW86927, features
such as f0 detection, rtp mode, and cont mode are not included.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v3:
- Removed obsolete FIXME comments
- Adjusted Error handling to fit best practice
- Changed formatting due to feedback
- Removed obsolete terminology from patch subjects.
- Properly credited reviewers
- Link to v2: https://lore.kernel.org/r/20250811-aw86927-v2-0-64be8f3da560@fairphone.com

Changes in v2:
- Changed title and fixed license of devicetree binding
- Fixed typo where the 'm' in 'ms' was excluded
- Changed error handling return values in driver probe function
- Link to v1: https://lore.kernel.org/r/20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: input: Add Awinic AW86927
      Input: aw86927 - add driver for Awinic AW86927
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  18 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw86927.c                       | 854 +++++++++++++++++++++
 5 files changed, 931 insertions(+), 1 deletion(-)
---
base-commit: 3624e9a34b36d64a7037946eda28ae9599363a3b
change-id: 20250804-aw86927-9dddc32fcaec

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


