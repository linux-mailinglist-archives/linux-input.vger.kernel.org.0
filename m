Return-Path: <linux-input+bounces-13839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B4B1C853
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0130C18C23D3
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 15:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05A528F95E;
	Wed,  6 Aug 2025 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="scYpNwRr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195C28DEF0
	for <linux-input@vger.kernel.org>; Wed,  6 Aug 2025 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493023; cv=none; b=Oa9qsW5JeMj6Nd/O1SQ++dBdbn7JRf+7fx5MNST99AjJp5w/7mARg3c7rrZY62B4Wc0UF7tgLqjolbPQWagYno+WNyEk1hZm25rjaL4NWouWr2Skis7cDR5QvFvofnZLH0tPgMMyYIuaUHHFEI+DRCugoFQz+xAKwqtG2brr5fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493023; c=relaxed/simple;
	bh=XJj/+Ii9ne9FVPI/eszO2aSskv5085eVs2yaTGWarcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iYgL4aed0qesWyWvYWsiE4A7OYGciSLiwwNav1M7ifyS5Gi2kDgKm22zVbGq6GEQteFr/u3KzrEqgO7+quydIcEJzFyGW5Bnt8B1JwGVnYmqzGEk6x0FMHtQ7cl5q0Pnykjc+14wERg9GsjYGI7oWqjPA9AQfP3l7FZhRgHQ1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=scYpNwRr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af949bdf36cso791438266b.0
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 08:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493020; x=1755097820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXNDxz+vD1qrumGSjygzCNxB/cloZERXqd/svDy5PxU=;
        b=scYpNwRrI3m+cydN9NbfpAbpYxG2Gj3p6jVHu06y7Nm/h3ip44dvKfkup8WIZwV0ha
         i8W4j9YL5zDbEPXK1qVpFvG7R+yRBnGpLFaydGKOVXwPldkrm7gG3SCHKVvZby7dBMTk
         qfMP5rwcehqi24w900h5To/Tym9bv5pbKxaqO5mOzbxXMvSFWqGyITVhE+A6o+I++GME
         1aip0poL4zqErGbZDPKGyAW8v99U9gDYmaGGnZEFeNfCom5p2tgSgmHio1XstCzoS/2C
         mBmosHeVLSL3q60+iB4vaiRPG7SnRv50xbXCdD7cz4OpWbuE5FQdkVUhFKwAfZtBKqyz
         RaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493020; x=1755097820;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXNDxz+vD1qrumGSjygzCNxB/cloZERXqd/svDy5PxU=;
        b=AEuIidQ5j//w9E+FNkpsPQJsXRmFYRMcGe4EfxFxuFNtSAe6iii90RKLxMXLZCRNUm
         KqlyHl/IdlAYR0F/vdG4gpyoKhJqc+rOjh0+tAlV8Sg+SDSODIXzgFp345TkRc6YB/0d
         ALxPV+LR/P38MpEKS8OWFpTvVtZLxTJDsVxgvIKPiskUJ/hnTt0NBtSIzuEutHfDMxxS
         P82MjcvYI0Qjf3cNXrAMDe1UKQl/4yUWAt7MxMPOow18Ri2JWFLrLZTrJyjwIxGIT8JM
         x8XIgsDqA//CT2AjQFW7h2c6LdAqvY267eCJKNrRlULsTUNksLmr0DCMw+gKemw2qouX
         Hkhw==
X-Gm-Message-State: AOJu0YxoWhc/tz2bRAHytjOBlzQExqKrJNoEUoH1C6Jr+e1WV+Y3QK14
	cmNSKQiSDCnQ3X5f4yWbHsRRBKCJiMVPB7ukDW+1n1ZWS0+T8JIUEiHDiai+kEnw+I4=
X-Gm-Gg: ASbGncvLgEiFMEWRJ16lKWiDeJlMumOAQ19dhC2pExEHFBHDIe6d5dlYZN7qbXXwqHt
	P7MJD2ACnwfzS4VuCKVAv3+QkE4kmOGlowrpy+tYW624Y3SYQnCZ8LEJWZQlbRBVTpLe0LVQCky
	lmkZmFTp1nUzBhS4KwqKp3ue1hNaJKRW2Rik3QAiwuS1HTTRDWbHYk0mvy38la/869PyW+xU3qf
	+4xUD4rOWBy6U3tYGmlnOcw7WW9Ap/bAho63AGZ8ygf1k3l2SmuSWRIt3FoEzF50F6tFDXXr2ey
	+EWI3qN+voPSFfa+5Skjq1XRklo3kVR5F4b+x6xnnkwDSOkhAfBBcX2hfv6a4ouQITixBDZh9aG
	clW9CqcTZwgqLQE+aBRqS2n++8MLAc4w/TcIWbg9e2/pEJxW28ycHhBeB9wUdf073yz5UC9wkI6
	P0CtkrMzTpdOqlHw==
X-Google-Smtp-Source: AGHT+IFGxksQxksr9gdwZChs5Q7bTY2ry/u6i3uopbyTI4KkbR/QSULpJPg3RPcCg7fhSoD/RX3RLw==
X-Received: by 2002:a17:907:7f18:b0:af9:2502:7772 with SMTP id a640c23a62f3a-af992bc37femr303160166b.54.1754493020271;
        Wed, 06 Aug 2025 08:10:20 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm1120100666b.51.2025.08.06.08.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:10:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/3] Add support for Awinic AW86927 haptic driver
Date: Wed, 06 Aug 2025 17:10:07 +0200
Message-Id: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9wk2gC/3XMTQ6CMBCG4auQrq3pz1DAlfcwLsZhKl0IpBjUE
 O5ucaNRXH6Ted5JDBwDD2KXTSLyGIbQtWnoTSaowfbMMtRpC6NMrkoFEm+lq0whq7quyRpPyCT
 Sdx/Zh/urdDim3YTh2sXHKzzq5frbGLVU0hnUTLrwHmHvMcS+6VreUncRS2c0nzZ/W7PYwvkUd
 ApOtGbtp3Vva5MFAMITFInimoU/FpKlXClrqhKt5m87z/MTH5SnElYBAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754493019; l=1235;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=XJj/+Ii9ne9FVPI/eszO2aSskv5085eVs2yaTGWarcc=;
 b=bdtHg4oKQcgns5dedD3nEjg/wB17OzGg5zzZbVVTORzPqFBn4Q/wt7aXuBTPE7Pq0fa0CN+CN
 XlnMIvCr7uSBsuHZZZUpFgzhBW7tuaWKKIMZykbrRCv3BKVqL0J6pe+
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


