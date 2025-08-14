Return-Path: <linux-input+bounces-14027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3BB26966
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 16:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91AD87AEC32
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 14:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCCC1DD0EF;
	Thu, 14 Aug 2025 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bFLcses0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382491ADC93
	for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181915; cv=none; b=GNIo8yYZtCMDsPAX4hH3rvx0BPT2tLnuhifLPD5z5eBZJP6o8B2HuYXLKwfYu4MrY3qo6W/AFKgfL4b1yymTf9OXZcf/1CMVyQsFusdy+rQ+tUgWOMVSWt5Y60IRGmD0Q8Xu19iX25fQ5cGj56GcY2crVXCP9sJMcPpQT84I9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181915; c=relaxed/simple;
	bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXC4i3X5MbxOICm841wOswsigGoCmy2rfdztanKTAzJ9cfioDOqcWbb9SYYCT5M5o2iuHP2FkzcJsGoVbb/TZw6aOZaIx/JGiFcXTaGhKn2JVbo25Ux+JgZSrXKTJNxEumfAuq5wP1TjFML4z6tsK0rIQ2HTwyoQAaDvxCjQgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bFLcses0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b6548adso1887013a12.1
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755181911; x=1755786711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=bFLcses0zjuAY/MYv9ZkAsE3YP8T/TdgqKKtHwQPC3O73WMeeSeifhQfd6+ARIxogC
         ufvnw8mRlyRF+yAfL+tlAHhItN7kVFZRrEvZaUvVLfHxYihuSr0+4/yibt0d2dXT1B9F
         qzp9+PrnjCikDwQ6QknftpjoHECYIAvjFeRVOHRrRxYs8tuMR5/Ui6UB/cWv0brEmxX/
         sui6WHhY1zkRDh4g5CVet7QFnY4/8OJzxbuyS8/Gu6QOweGA+o9gDoo7OoEl/eQjUwAt
         DhiUwJty960e+Qs02O/dWoNX+vQeBjSg54cR62Uo1aeiIV+y54xi35eFbncFStbKHnIN
         8Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181911; x=1755786711;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQA2xq7mI4lOuuo7UB6QFY4SFCKqLwIJHu6LK04sK3w=;
        b=FYSPNqdoo3WgGPTgAPNOmmKtVwdQeUWrJLvrNfKxCQlILz83qivfz3Jcklr5dZ7zxR
         ANYdfeGY5EJznHSVPQpoAMfY5oV0YFRWtDD0leDPmbPFiTBdEoEB1TBlFW+qOcjRTVKi
         OCX9iyzxTKhT3e0DOTWFRVoG+pSNcCMGltS6XhxDGknSPGCRGzBrScCjZT0WQyUg6jyo
         VTO9++SasJ+2mXKFtN8JZoI1lrA+m4Hc+n9zj2xVe0HSV4tRQ3b2zfURTOJEr2AdrmGB
         6C1HpsV6Rn1NksLwKN/qDIp2FkGw/6qWqoUQSvTM1NjM/8JVCT5kc3DBW3Yp8yWAH9RJ
         c4ig==
X-Gm-Message-State: AOJu0YwVZldPRIlTMMo5ni+Qj+DT7ojGrJzHvXgazleT9FrQfsIMARKC
	E1GmrxbcsLzcQRnBDODAUCi3xkPbJoU8QKuSI6P272jM07vDyRYGsAnXMM05SnCAb2gxH3Ao0Kb
	5dTe3mAc=
X-Gm-Gg: ASbGncsMThhcX5D5GvY+TXY/9Pmx5EkNQE3Pfkxx9OFR+ocNLYg5VmIWwiW+ERvt9SI
	ad4S7xHKRmvkwQb+TLCOtWnpT8dNM4dW2kGbbioStJykS71k0n/mMXFvMEUlqnZ2rYE+qgXf+19
	Z/DPq5Rel5oZTTEaMZ+vlO1LPb15vCE2/q2c5+N4nEQ/QtBGhIPhe+J2vlyqy/Da+uAlSL9/B3J
	C66JqnTZ9B77uDL+r7XaQPronO/Q4dy/cmnsNjKVELwqsggY7RDPFdJ8t6Wc1B9GcWlbh0k3LZu
	s777zffTRwewsLtpMm+jzRtQQ7GA+F98KLgmCdpEJmI1pKl8RXdEvCWf3uOIHFmkp/jJ4PDx+SW
	iqUdjXDkhX07l3R1fosTOdIbPB8auO49jF8CK1lv2DEbh5AhbKgA0vVwlSvDpr2Wfk7rHJimCRO
	+3+UECwX9Nv61A80CdeJ9R8+ZV
X-Google-Smtp-Source: AGHT+IHZuS/oZEn88jAiJPpp+WhXM7T8yBy/Ysi9uIDwbivKnVr1Jq24OxxhTx8N5nmphntFZHpUlw==
X-Received: by 2002:a17:907:60d1:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-afcb98fc895mr322248966b.40.1755181911349;
        Thu, 14 Aug 2025 07:31:51 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a313esm2609421066b.32.2025.08.14.07.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:31:51 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/3] Add support for Awinic AW86927 haptic driver
Date: Thu, 14 Aug 2025 16:31:34 +0200
Message-Id: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbznWgC/3WOQW6DMBBFrxJ5XUf2eDAmq94j6mKwx8WLQmQq0
 iri7jVRpBCaLP9o3n//IkbOiUdx2F1E5imNaehLMG874TvqP1mmULIABZVyCiWdnW2glk0IwRu
 IntiL8n3KHNPPten4UXKXxu8h/16LJ71c/3dMWippgTR7XcdI+B4p5VM39Lz3w9dSe2PsIwMmO
 LJBRWhhwyzuCda+6s7C4qttLCOswta/8mm9YbBlF02gyqpnPrP2rbaawiKipxbroqNnLL5gsbC
 +UspA48ho3rLzPP8Bz6nRf74BAAA=
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755181907; l=1819;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=2wAPPbqLo2LqU/nTBFwRHUuMpcX/WMRKMRc0AgRIv18=;
 b=UNFalXxKRJe4q48UwiHxGuyPvJ7cfThabUPqEnrUoKjHX2vRTU8z9KxvpuK3vhrxgodGCfv9n
 1oqRrWAzr7ZDHjR1lcYyI9ZNgV7GmvP8hn6q/8c8bRhEhYZf7WAqFoc
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


