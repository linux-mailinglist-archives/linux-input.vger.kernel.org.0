Return-Path: <linux-input+bounces-6022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A19663A8
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9E6284644
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4741B2EC0;
	Fri, 30 Aug 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhmvuQOE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB91B2EC6
	for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026679; cv=none; b=c+orvFrXIKO+jFeO3JS1Eteuj7rnrdTFGRckrC+2HogZvC0AGr8+JeVBLOEyDBBhS4UEmljyE5Wq9hkraoq2A2Y4k5CJFshU/P2/CWBOWX+ide/2dkHEVBwqyE+KLBc3iEfwNmRbwEMBUFvcSv+zb2RnyIGKluWiY/ZSCeWQ0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026679; c=relaxed/simple;
	bh=vC6E1dmI+DVdLPbsboa4vE5TR88Fimwcbq1iFUmZlLc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fDJuYMiJnZSUz49wR6EGxqfgzRB8TNVWKrxwxWv8wHGFGlIrlG5bzsvAq4xU4svIQwLvQ6p/qBtoGZu5XPLzCp8ksohjCDLUrOmj+gHzoR9wEtD+eqdFeVxeIm8Q10rW0cO5iQ4YKF+z8ZgfzLoAy5cW0jguNio1SA9zozbG02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhmvuQOE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343eeb4973so2859931e87.2
        for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725026674; x=1725631474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rRGNMPrMx4PkGhanzqLIDkRAwzJPAKyu4iHvprRv2o=;
        b=dhmvuQOEfmmWVasF4VMsvhcJ1W7T7UbiuEEfTZIz38Cdq4puxvgfIxFQgBEqLLhqgj
         HgsLfnmZTIodM8Y+rt868ivihqsjJnw2HLX/LqpiVAt/v1aw13yz0GZJE60q90rrTZzX
         Tbp16+4bhz6dGK6UXXlRofH8z4My3zlbpq2P+1k2wqcg7r5dryGqlFCTU1822+380MrV
         rh1dGfMEOUgl02K4ROAdtSaYdYFT8wrHB9hJfjvBz43OzGwVtTN83kkp2J8fXyiXUBX4
         Qqvx73MnZUD5UkdxjWl8jcouTtl4MH6cuAoMDxamKRQYdz8iaWu8EwM8h4ytRs2bxlr1
         cmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026674; x=1725631474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rRGNMPrMx4PkGhanzqLIDkRAwzJPAKyu4iHvprRv2o=;
        b=iCm0mmoAO48AkrSpFzY94OEOrXj+BAxRf703jnnMFr+gQtkNewSvqccGYUb0EbPeAp
         NWaQAKIp2F31QP7TYePcHK+4sj4kSP4Kx5q7P/o2kdDsgPsD0geD/Uo05j3E7PPGxdXr
         OmjOUvR2CgN0BT4Wna/k17BmGCDW5GqZyHh0HlDOqYbgdGfndkhvgJ+M2YZAYgWAngrj
         aKYx6Z2MitztePBwWRDwQYyIdvXPoqCTdaHNCCWZjK1jYiWpldd60M6RBqypi87yFBnM
         wC/VgSli5FZCpQ0o8/OKcuAz5YUb49x2SukB3sgOENGl389idJ0MamJGwkEQUz9GyByO
         jeug==
X-Gm-Message-State: AOJu0Yx8IP62+dNi6Hg4xY/Dgr/oWdhcHevA66Di/fKBXbNCI6tTSHJj
	mmO7kOHpyQeJPpP87P9PuhA8MVFMKT7FJ+g6G1/UM35NzEmPxjEkDIf1yGj5Wuo=
X-Google-Smtp-Source: AGHT+IHbtCYQLg/fD4tXDbJPsa6LQjl1fw2InO4YLVPo9anHxLG26kTZRmZH5CPEsdKyf7ixXGeP0g==
X-Received: by 2002:a05:6512:3b99:b0:535:3d15:e70e with SMTP id 2adb3069b0e04-53546bde524mr1855327e87.37.1725026671382;
        Fri, 30 Aug 2024 07:04:31 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084118dsm616826e87.217.2024.08.30.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:04:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] Input: zinitix - Handle chip revisions for
 touchkeys
Date: Fri, 30 Aug 2024 16:04:26 +0200
Message-Id: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrR0WYC/32NTQ6CMBCFr0Jm7Zi2Gn5ceQ/DosAAE01rpk2DE
 u5u4QAuv5f3vrdCIGEKcCtWEEoc2LsM5lRAP1s3EfKQGYwyV1WrEr/sOPKC8YmJZK8HbDpdd0Z
 RZ+0AefkWGnk5rI8288whevkcJ0nv6X9f0qiwvNBYNX01GqvvL3ZW/NnLBO22bT/zmSPNtwAAA
 A==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Nikita Travkin <nikita@trvn.ru>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The registers containing the touchkey status varies between
different chip revisions for the Zinitix touchscreens.

This series address the problem by reading out some chip
revision and firmware data so we can take different runtime
paths in different chip versions.

Also read out firmware and register version as this may
prove helpful to similar situations in the future.

This applies on top of Nikitas series to handle touchkeys
that was recently merged.

After this my BT404 touchkeys work.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Move the variable keeping track of versioning info being
  read into the per-device state.
- Link to v1: https://lore.kernel.org/r/20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org

---
Linus Walleij (2):
      Input: zinitix - Read and cache device version numbers
      Input: zinitix - Varying icon status registers

 drivers/input/touchscreen/zinitix.c | 59 +++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)
---
base-commit: 669e9cb5f59903fbb1649660f3cb04e5217a7e58
change-id: 20240806-zinitix-tk-versions-9b18b20ebaad

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


