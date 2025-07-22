Return-Path: <linux-input+bounces-13630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F4B0D767
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 12:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E21B561547
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A33B2E03E8;
	Tue, 22 Jul 2025 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aQdW4ASG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E46288C0F
	for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180637; cv=none; b=doys2ASVstniAgpHxIjM2BItstfXsxAq1FZeFGGdDlE0PgsaGAczP+0WBJfY6ncX5IdxTirEvTYrusYtxhcxvp1xZI8foMvHqXyhuGZEc2TqCWjXkH8s40fOjfmhENawWCSsrKWL2ALGIH4nLJ5CNcJQxIIKgyCjWk8NCT5F888=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180637; c=relaxed/simple;
	bh=fzd736V1k3v1vCZM3Ch2IkXksn65O+KzpQBR36Q5RZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J849q3l6gMaT9BSG2MjB7rq9Ugm1X7j255sXNQP+uWc5gBKitYEPuu1JglU78bEIHjMxtwoIGrJxPN3UuQQTa7JdLr7tM7V5RpxSAd53x4aqVt0UQ8nzHjxSbvKv8IzYkghupYF/MEwEPML+Pdno88N4sMr09BBIL97y0rGwwwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aQdW4ASG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so1008040066b.1
        for <linux-input@vger.kernel.org>; Tue, 22 Jul 2025 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180634; x=1753785434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=aQdW4ASG1bp0gqACBVl3iJjxfuEc5eLH0pdzr4+7sYUZoWWmbEH/UeBlxLudj6sCSO
         06QfNhJCbypwXm+PEQJ+pDJ5ExOqglUTqvb8NX0OCgeEsYG4qNju3oH+7Ii7SixLb4tx
         305wuJR4ktHZ2RpkPhk78rP/4zoJ7UG4Ea/Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180634; x=1753785434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1iQ+DzVo9DQ7ELRKT5wsmUCmjLHRUNTNjWFoL4XTeQ=;
        b=nR/MC/gjeuaDrVHgq0t/iyzUyQl73cH24h2CjpvVWtYcPBPaLVsftIH5cXX0CkyHVD
         A76hb8bvyaHXR1t3jNfCUMqHAYVfyIrauBM2olAlKsz6g+hjKkIqUqIjuC/m9zfGGGpK
         7cdxrbDZLAx51GEuAR5w3bNW19yfb8NBzRb0xPa3ntjXgQwJXMtC1h+MJNc5xHjjQx1N
         BNWcqMeE2geJj4sVkYkUHPfGPuMsB0DIrlltD6u6wCrUxnoVMTTUtf4SpVx+Sa/H7dpW
         /EUW3qBUA6dc73l2jwJ/BgfQdy2cFLwe93FRWSacfSHk57sc6S1KIrUmmB+54N1t87Mq
         hcFA==
X-Forwarded-Encrypted: i=1; AJvYcCXbZJnLvHWqz7PWwN5FOrIF1d1bb8C37YIHDVQpJwneGPHyM/sKIJ6Tw9Z+KEs6YdNC9M+wDfESR7PKUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1MeHkOKV4P5OBweBP0ET3hPY7iG4DXFWQZaDZkZavOm4UXuo
	fr8m+ouHFx/z4HSE2sK0OL7i4/6Ie8odMr6ZhoC02VVZlKsnsPB5bM0NYm3BjVYg/Gg=
X-Gm-Gg: ASbGnctJGVLnOJFeW3BFV+jW66lCpvSgckKqCestAV+MlVofpSnmHqcIEkVn+WS5ZVD
	cKxQ6844bDOQTYeNYNKHnTYSy0O9dgIBuy577TZDuSbTaeb7oNvH/zSFzYglST35DIcNrGBZER3
	6NN0aZKD5tnGUvWFNuCQTmFy4KaGSDbbj7OFG6j7HfX/bBA7TVqqjGhIZW5WL+2590NZeIhU9Nc
	Je2u0CVvhFKyexbpvAIw28hVYq4+vR2gxvGbVXGOMRL4zje6NpwDkRPAxsLD28ULJGnzMPgvvE7
	o2pa8QJon021V4sv7XRdotYSciuKbqlPYHyzPuAhJXIO2q8w2XFQTiKL2ypE7wx7gWkeR/AY4md
	+fU+jjY0akHqQI+odeKZkXKmZ1oBbWWBcSu+eWpgLqzULsFDXqG7UlQY2He4=
X-Google-Smtp-Source: AGHT+IHSThhFTO10wKsOhlI2B+/WINETFfgihIq5+JjYua7ZAoLLp3FbG8jE6ltycXzk2pFdKzcM2w==
X-Received: by 2002:a17:907:3f15:b0:ae0:5137:6d6 with SMTP id a640c23a62f3a-af152bf63cfmr214633166b.9.1753180633782;
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 22 Jul 2025 12:36:14 +0200
Message-ID: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
branch: tsc_de_glitch

