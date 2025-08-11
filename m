Return-Path: <linux-input+bounces-13898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F6B2070D
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE56D18C22D6
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3DC2BEC39;
	Mon, 11 Aug 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MpeiegV4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDD2BE7A3
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910823; cv=none; b=kbmMLuyFlFFfqoyHoVS4xSfWrJtEu/MMQlLNNd0juSZpnCn3CWiSrJAU/FKSycAcn0P3Ybp3ELGB9/sxnRSsEPt1anKG6Z1KvAk68ZE5kV0LCmCfn9m2VDdRr9V9ehBG0OTNqHliYtJ+4CbKmHHQQOLGma4ECLAcTAaLOhOM8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910823; c=relaxed/simple;
	bh=IteUFERyC3LLjXnKcbASB0b5pTZCcipeXnGOb9hHHf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lc5C45Lh2RMAbHUS07Fc//tS/J7xp+I/3lD24ZpzySqSUqhV3EZc1ci7Byj0HtfJfs2XannRkMFxKTwqKAARjYHpHBRfEiO5UOXSKZFGMRP39gACN1fFJocNXGetIGL1o2aFRRPywndfg6ZpsRDUifklLg1vV5f9cvXfmUoNJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MpeiegV4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so8176945a12.0
        for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754910819; x=1755515619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rI8qy4HURu1XEpiDm68Dqm4qhGh4Hz+ANesFdAjnAZ8=;
        b=MpeiegV4mabzOg7/9Svr9gGxq0YgL/3CBthUQ315+FmyD/EU07Ttg6hFqHVaXQ87G0
         yVgZzYCmdlMtgITJ3cf+qJdlPp4MwEbhLBN4V50/gZEV8w6R106oaldCF5cxHgEPQI/U
         hozS9NnJ2l7XME3Md4pawb3q+GCGilMpwSSW4FcXHev8AGpG+2tsIw0FeQ9iuxZdLwBv
         Z6Bh41c+Rfdj8ncppLMkqOwzAYpUuci656KoeXQ5Yq2nr3B/A+7g5Aci4rQXGimCQTDo
         k8Vx/P3q78XtnOy8COZhxTogB7uvZThUzmKo+/M2hbqRIhjVZh9p0jtkSfd513LOVqTw
         N1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910819; x=1755515619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI8qy4HURu1XEpiDm68Dqm4qhGh4Hz+ANesFdAjnAZ8=;
        b=v+GTvems6hej96rPh6S7iboSElY3N+Xmgteii/jsMxBeD5t4wEb3xi0gXtwcEcxPEB
         rc+rxMR8GNOpK+BJeGhrpud6noEVJfFS4wlG28YjWh8bIL2JwbDAhvJY69P725w869s8
         bKB/jmvh5jaZhr03g3qSSW5tfMdAqJj6GfVVfBmgzXfWQKwo8OUp1fPInaDOQssyJWIt
         44gUbznDvVzZTeyzGNT37Vgy3AXE9x3L3nzPmWH4+FbiI0BIKg+CvfWOkA6Vk6lp0kdB
         ZtaFJguf63wYBgSd0Y6Oe4ATI1i2nAMcf1mRmq56Qs7LAXxRUKBmqQLiP3RpqwSvEyOy
         KYvQ==
X-Gm-Message-State: AOJu0YxmxW0VmdrQFDzDDZXsO/DGtEpCxjAJ5wuvx9cb7NJuVvIcC5+g
	Pam0jb0dc+Anr+UHSjOOsl56N6px4g6BmjWkevFidEGyqxaTCNth/Xf0BhMIkqAlDoM=
X-Gm-Gg: ASbGncti5N/i58Ti55JslRqxlzwyI4KIJs74bBdLwUoQdu3peRo3ZNUYE++qTj+rcwV
	ov6e7fTPAHgifF23Jr99Q3NZbLisqOCO4YHX17nEhK7F9u7tELsUscoz326mTVH0ozqlzylmts2
	nb3UdORNJSK11JWqH5YPILheP338cQcHmz6SFumKJTYh39j8/vuKpYQGIpImbIrRphWOxGcyrIL
	24E5JVmvBM/W+XMXLTcKeEFpDa6pRn7zC9XyxgheN4tsCzLXiWu7+2/4dHCwIfJUiOpgkXZnZEs
	55ybpBherDwvHAmYkuZ/rBF9+7F80y0Qf+XiS22psYqd1hN9LC2BF07ne7Mx0P60lsP8GfIhuWS
	SESjUzcquacDhH2OnSueItQY9uJAadeMYG5nZVCGVt6JScBVM+h00iDmAUBaxUjGgqhLKIEs5SS
	Xw9kY=
X-Google-Smtp-Source: AGHT+IHMzaTMnoUFzm5ThvX3ZvXKmvvaip5im3KIpPyg4ny2jDuQ5DuInzjyOZyPMHnj8nvtXlES+w==
X-Received: by 2002:a05:6402:440b:b0:618:1606:92ba with SMTP id 4fb4d7f45d1cf-6181606c255mr6469667a12.28.1754910818923;
        Mon, 11 Aug 2025 04:13:38 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61821e562c0sm2467278a12.30.2025.08.11.04.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:13:38 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] Add support for Awinic AW86927 haptic driver
Date: Mon, 11 Aug 2025 13:12:00 +0200
Message-Id: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADQmWgC/3XOTW6DMBAF4KtEXteVPR4MdNV7RFkM43HxohCZi
 iaKuHtNVKnkp8s38veeL2qSnGRSb7uLyjKnKY1DCfCyU9zT8CE6hZIVGKhMY1DTd+NbqHUbQmA
 HkUlYldfHLDGdrk37Q8l9mr7GfL4Wz3a9PnbMVhvtgaywrWMkfI+U8rEfB3nl8XOt/TX+1oALD
 flgInRwZ9btGbZ71Z+Fda/2sXzCG+z4mXVbu9l1xSIiU4d1ofTM4j8Wi+XKGAdtQ87KvV2W5Qc
 dB4wTigEAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754910818; l=1519;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=IteUFERyC3LLjXnKcbASB0b5pTZCcipeXnGOb9hHHf0=;
 b=h/pHLl/o0HQGmPU+OV1yzwhLQnkVAznMNOs2rizQYz3UOp/uhETtHaMDmKk+EujayGBN2/tL4
 N7gIheldA0rB1UWVVil7coMepCSC9l03hZmOQEhAMFuxS5yb0Lof7ue
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
Changes in v2:
- Changed title and fixed license of devicetree binding
- Fixed typo where the 'm' in 'ms' was excluded
- Changed error handling return values in driver probe function
- Link to v1: https://lore.kernel.org/r/20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: input: Add bindings for Awinic AW86927
      Input: aw86927 - add driver for Awinic AW86927
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  18 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw86927.c                       | 841 +++++++++++++++++++++
 5 files changed, 918 insertions(+), 1 deletion(-)
---
base-commit: 3624e9a34b36d64a7037946eda28ae9599363a3b
change-id: 20250804-aw86927-9dddc32fcaec

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


