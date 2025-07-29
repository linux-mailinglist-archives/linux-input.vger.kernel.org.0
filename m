Return-Path: <linux-input+bounces-13714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DDB14D0B
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 13:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC70189C467
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C07C28E607;
	Tue, 29 Jul 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MchwqjiZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67D254841;
	Tue, 29 Jul 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753788745; cv=none; b=VnHDcrR1dksnBFmuD7gPnam2NsXxD/WH6ruoFqlHECoA9qf7WeVsOOwcA5btR6LgJn00Xw9bAZRL/aAtVhg4t6jwSAWtqBbXavTZvfd/Kk+bqS5KkHZm/MDfVYgQvObagVkjo2VXk6Pac/BRl2oti/20a0HETQIkTKxfPZlpBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753788745; c=relaxed/simple;
	bh=jAP66d+bFvajVfpxRmWAmBn6ZIQZfvgt/qSDxYS9R1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qtUmB2/4+0V1YfHbpwAKDCY9CCunuA0Y9jzosbHvv48M45h29oI5vXVzJHq1pQdYBJ61aGPpq2ZtRpBUk+2avgY8/KCYBRSfFA61iQLgPep9YVNOlbXIH5uUSE9rbO+1lCcJcExGonnCGUaXUg+sYyqALlS5n7Ywix/RWR8wYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MchwqjiZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78315ff04so1966793f8f.0;
        Tue, 29 Jul 2025 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753788742; x=1754393542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7lkZ8BtZL4dbxHeN6ZdjsvNo+WdudiW+KTRbnPFCrM=;
        b=MchwqjiZ9rUwxo3p8jttEVuC3Ou2aM+zhulNTI7HzZyWktulgLcgNuWzckrJpDvOoW
         uwFQ9XntWGeL+er/54XIxCOJ5bppgjau7hKfw6E0NCcMpIsIr7brwkzoMpPPJfvjb3bK
         ahaHc+57Fy/VgcLaezdVWwtPFkrStz4XOxMzfYwtCU84/wOMQGj8el6Xs4cNjG4LsSNW
         jSkaQhR1oqdnPWnLZK6mh95nzLklIbmtkF7gfxYgYzs7Z40lu+hzC+JNT1LwXgB+gzvE
         xiJVN+1mzBGjyc0A8x0Sc0D1ExPgNbK4q9Ee9PueKSooEWu1jBCKLahyn3KC0jlqHIum
         q1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753788742; x=1754393542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7lkZ8BtZL4dbxHeN6ZdjsvNo+WdudiW+KTRbnPFCrM=;
        b=LqFalNq/EqyTuhtil6ziKqndAicfaG4WT5HQAHaI0Q5AviNYX6fP3ziQy67MFH1ao4
         Gyr0UQZP871pkOoK43c4cdyjEbmmc+Y1yxfRA4Gp+MRTqmt1pKvtmpc/EnsOH/784ASy
         FVUOKVg2sE05VzitByOeu9PJt8LXXeMYZdeK9YXJCkM6PKfJPGWC0QLtXkT8C6aNEyeR
         Jwzgw/NEXf+5CmFITq6312Gz8xolwXPELDZRZPSlYE3bR24jrgkwILE6v+S6vftyn6mU
         qtPKmy2tOUoseDAM6w/PFDJEAVPnK/mB5e0CNUZ2nuI0gIgT1R7OgZqppJv/zmAz0/VW
         Tb1g==
X-Forwarded-Encrypted: i=1; AJvYcCUlDRNHci3emoacO6bSWW+N2w9BVqGwfEt1LsIQzjvOiEPEZgsZi5Rs4U+3hFxyPUYw4g5Sws4so3cfGQ==@vger.kernel.org, AJvYcCVKZZ9YeCwjR8V6UB5HCBLpgXfqbP1d47+58/ZJ9HpH12MINAc4D4w+ShMHe9n43E+X6y5QPmCERs1CVzQw@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzliUBs8mq2pM5BCDPufvrkMeP6qXfuE/CmlryAWK/HRqxK/O
	KBqXm9vrlm334K6Ql21GzAji+iLyOI9bbeMxE08eU6NKMToUBzQfoTPTishEyrBOOIg=
X-Gm-Gg: ASbGncsdPHeIFHsDKtrj9sftjKSdkKeXznjAuW0cVyyb15o6OEIWkvxifpxZIGZj3ed
	DXt/dlefltolJZf+dhnu0Axw5yDnKs/67xcStbBsvtCVHpjkKLn5/tFYGd1PT7A4gul7Se1gSTS
	UO/LKTUdoSyil9/8D8Su2pPss231SjZe+WC++yOhIuUJ45IIGHC9wMttHdVeog8rexVGt7F3tIM
	gFqN8qOcIy080EDt1Wjqouv/Soy6lhrkhTHpWuX5SpB2/HBFjCGw/AiQ7hSqj3a4l32bzRhIHCk
	z/rnBvSRs7iswOU7TVMpCDnmsfNk0pSS/LFTsGfBVvs15KNxin76ti+ZgFHVzS2RCJvs2p15Nq+
	iLgMXBkLw5Kt371MMPIwZZdk16P6Zzys=
X-Google-Smtp-Source: AGHT+IGEPv6HfbmoI0tLk/cGrFzIyOEWrW2EH2KOPx6k3fp2+Mdx9BgB4IXFtDyTgUMZkZ2xVJS5rw==
X-Received: by 2002:a05:6000:2289:b0:3b6:13a1:8861 with SMTP id ffacd0b85a97d-3b776777071mr11992020f8f.38.1753788741741;
        Tue, 29 Jul 2025 04:32:21 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587272b405sm171162925e9.19.2025.07.29.04.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:32:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] Input: lm8323: Remove space before newline
Date: Tue, 29 Jul 2025 12:31:47 +0100
Message-ID: <20250729113147.1924862-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an extraneous space before a newline in a dev_err message.
Remove it

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/input/keyboard/lm8323.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index e19442c6f80f..d9df10484755 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -259,7 +259,7 @@ static void process_keys(struct lm8323_chip *lm)
 	ret = lm8323_read(lm, LM8323_CMD_READ_FIFO, key_fifo, LM8323_FIFO_LEN);
 
 	if (ret < 0) {
-		dev_err(&lm->client->dev, "Failed reading fifo \n");
+		dev_err(&lm->client->dev, "Failed reading fifo\n");
 		return;
 	}
 	key_fifo[ret] = 0;
-- 
2.50.0


