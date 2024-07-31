Return-Path: <linux-input+bounces-5243-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 989CC94315A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 15:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36873B23B4E
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 13:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66A51B29AD;
	Wed, 31 Jul 2024 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="vKCmkXhq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57071A7F7F
	for <linux-input@vger.kernel.org>; Wed, 31 Jul 2024 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433851; cv=none; b=WQdzq2WkO/ggT0KIAg+bpB4Ysbi2teIdo9ySV83ljvG38dyniYeIbnc8O40Pct02ZpTJ1G2x460GwfTkdhRALOYB+ldOdIrv5V9ZRD8u2uH2cq4KSTRGrE37FZgSYubY9nFKmrPrR1LM0icDbwNQQUHnnFkyB2xQOmHnenUbeX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433851; c=relaxed/simple;
	bh=VrYxixv9GrSlHcpoMIf1d1vd1y+GqlVfp7maNLmLfT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIPh5ZBPrbS0FDB913GUDeDWy9q1eZITpDqXAoW5ySo2sSNlLloG7LDyW7caKqRVreBdbmE9GUp8XMuS4p3P+OxBLZ2dyjmxTdIF1WgjhT3c6F8/IRptjz+Sib62uhI6I9HHCYAA66BdDW5sjygSP0XyG5qE9/FkZTWvSowmhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=vKCmkXhq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280c55e488so6011275e9.0
        for <linux-input@vger.kernel.org>; Wed, 31 Jul 2024 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1722433847; x=1723038647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7hnFzPJEcOIabXbhmUEAZBsUSgPXLCHLtzI2HnWZ9g=;
        b=vKCmkXhqcyL30fgTsWyLB0EZQY9l7bkeQ6Ivv+K7AxYyvZYifLPuWXzFGfZ37liwW2
         konY01DVoCpXf97OPmPKdw99zH7GPpb9x8LcAv07wRs1POZhScJ5T3UiYhWFc8mlka2f
         K4KjV9QBYkPmrZosO9MqdwUwhoPWSLUxZX4dleE2IhmgpdYffls92lrztqDpmc7u/ar0
         JqomhloqAgAEYi77dLQhVxKU/ywhPNPnvve4Ymkz3uuu7prpTAk7u2FXo+9VVVCjgQlo
         9P6zWUh2i3QqmCHJHju5VO0PmJyg2nYMEPjEur/cE6QtCi8N4xHvkhKGJozDdQ1vy4Kr
         N3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433847; x=1723038647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7hnFzPJEcOIabXbhmUEAZBsUSgPXLCHLtzI2HnWZ9g=;
        b=fWjDA2zkXYC9/PlGwl5/wGoKtZPKdbM4wfrIJ5J61IJhuVEkgBSGBh5/vrFT5tl4vM
         Rsn9qzYbhkinGVx8BQiuyeOsAl+5hc1C9MqV0eP41KjC4Vj5LWqQkDxg6qkH1AyI73R8
         viG8EuNpP/qj0u9e42IL5QTLltEzMwfr3sCHbq/Sp0fa5f5eN70+jVBPxdPMB593VZXR
         /e0HI3HsRMsWb6a7qjQHche/i3qrqiIOQyp7G1VQ9shrxAIIW0iAMvc9wzpuIGpUa7ZS
         lCXBbvjLWwb0cM626koi3+eptLzTPaiMlmflwZz7QCZvDwnETSv4mxQp/0RDA/ec03sM
         ObxQ==
X-Gm-Message-State: AOJu0YylD5kqNt62EVuWaGph2Fmo4y0F1xo28baqG/s7LPrTGKzAmwb4
	yiX6Go3BmVGAuucVz1eNth5cwcbOpKZXx394gxujxxOH/tFb8eHH49c5GC5lM6voTHZVNiQBjaD
	ugVo=
X-Google-Smtp-Source: AGHT+IGtHk37P70L5w/N69KdcbAk942SnKefdRks2f4UU2B9nujaFdFMGK2y3KLXZi4xOhR3p8WzDw==
X-Received: by 2002:a05:600c:3b17:b0:428:9a1:f226 with SMTP id 5b1f17b1804b1-428243e1b22mr38734125e9.1.1722433847072;
        Wed, 31 Jul 2024 06:50:47 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb6403bsm22795905e9.35.2024.07.31.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:50:46 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] HID: hid-steam: Use clamp() macro
Date: Wed, 31 Jul 2024 15:50:04 +0200
Message-ID: <20240731135003.80609-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use clamp() to actually clamp the value to the range [-32767, 32767]
(as mentioned in the function comment) instead of manually mapping
one specific value.

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/hid/hid-steam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index bf8b633114be..3442985d52ce 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1341,7 +1341,7 @@ static inline s16 steam_le16(u8 *data)
 {
 	s16 x = (s16) le16_to_cpup((__le16 *)data);
 
-	return x == -32768 ? -32767 : x;
+	return clamp(x, -32767, 32767);
 }
 
 /*
-- 
2.45.2


