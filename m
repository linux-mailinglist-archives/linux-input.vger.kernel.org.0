Return-Path: <linux-input+bounces-5826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F371F95DC1D
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F541C21FFA
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9D4185948;
	Sat, 24 Aug 2024 05:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByBIcNRK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A917B51D;
	Sat, 24 Aug 2024 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478674; cv=none; b=YUhQtgEUlH5YqeeGmFBFDJbDeJsa+OcooXOzaQtToBGdmbyxdALuZZ2j17B2ZvptYQV68qY8Eo/ZjWyhRiBvUutRSt0xb8CqSjM+1GYawcNEENHZgcBwjFYgKwlvhBJaRTxhYDlsGf8UbZioflSLOaijCyy4jQMHOsP8WrQoa/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478674; c=relaxed/simple;
	bh=rRtkFYuVY9i9DtMdTHLPYCWG2ssElqwmzvgesJlrxkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHZGCi2u9oE6V6lj0SjU2z5fzkbr4298m58BZt7g6c5yxaPnM5pY9sO9qe8z68QNhl9MgL6YiuYnbzLE5eyeUlPlhhjpEmT218JC+iC6F9tF5tWbdIJMAZ7AilUT7SdLrL61NSRHOHk45ArrgPxexPWupEBCsjX+TqYl/v/n/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByBIcNRK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201f2b7fe0dso25808355ad.1;
        Fri, 23 Aug 2024 22:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478672; x=1725083472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az8mzLSvgpvxTnIRjRc4nRA5yr1Q3pk0TUweK6xj7q0=;
        b=ByBIcNRKhNr6Xfylx/dkVamicltFLf0Bbl6DkgfwQpCIU8poasSAvXF2vcYTAbX3He
         vxfqXdJeE9Tsl+WS6zYmI4BQRj7ZxTA9fVVsK+0Cy+Q3F/hdUIAvYwCGg/+xEKosVMVz
         6nU6IdAv0JZos/2bWKaKcs+ES44FGBPzr262ZbSkmc8dYedgxrduGXweuU9yYS/InTBB
         QYJGBoIcx2uRIsV3jgaGuJetUE+vLUup0KeQ6bfnMhtKrzLrY/bqWlxedDiBl4Li4aH3
         TEcd1vpIFTtRVSDGGTbSvyvHS7Mz3eUceKgXRMracL3WxwEjgAfyMGoso6HQTAgXsH54
         voxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478672; x=1725083472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az8mzLSvgpvxTnIRjRc4nRA5yr1Q3pk0TUweK6xj7q0=;
        b=Pe9Kr/+0omRrNVaLrvVdHfeoBxd3aGk0PLS5BaRfTOroLgA591avYe0FdL+7DSXGSe
         uifS1PyelFH7FUQSm8Y3l6hj5d8/DqEIjnyH1XBcwPpkhPgt6U3sUbQHw5QeMEbuQG29
         ZbIpuOp8N68fGUJJFMjN0dzZoCRYfsK2vH5UmpgeHMhixffGvNNPkyjxguadjH/EAQqI
         DwoSmfDiNb4kKcRLQr11BwJekrnFtq5ACvGxuJAXlQIOMIYieKDmh2BB47PeWfW/vgnD
         6omE1AMqfx3AItafFYQMlYUcMLHFyEJh4vhTswwKPOhkyPXuqiTr7f9Pg6RvCVZNaTBn
         aEiA==
X-Forwarded-Encrypted: i=1; AJvYcCVwyKm5Bjlymj/HbHhSOiMxKJcRAA7qqLL/7t4BLkWVwc5OdqE03plg3EOViHKSx70c77F4VsGwOs1F8Q==@vger.kernel.org, AJvYcCWtHwvtYLDwcOEZTImXV4H9U+uteiigz7x7+0A3WHPbkZLarq0W1au5F8Yl+q1plV/H5HvX423UOyS6H4Em@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+D2QSnFxQURdO/9pDKERi8uXvsF/8jcmGGFHlKg3SBkOZPX9
	MAln6XaJ5fnJqVApVUEnnHAzTfk97oeAcdSoqBdiPlquoKC4Nt4X
X-Google-Smtp-Source: AGHT+IHGuMlO1L1aYaMH5Lp/IpwQcR0p5c5VDWGk5IHdjMfD57mIFjYRu7HHLx2T2bcAjODyi8+r5w==
X-Received: by 2002:a17:902:d4cf:b0:202:23f1:ebfa with SMTP id d9443c01a7336-2039e4f3ae3mr51042145ad.52.1724478671799;
        Fri, 23 Aug 2024 22:51:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] Input: zforce_ts - switch to using asynchronous probing
Date: Fri, 23 Aug 2024 22:50:42 -0700
Message-ID: <20240824055047.1706392-19-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver waits for the device to boot, which can be a lengthy
process. Switch it to asynchronous probing to allow more devices
to be probed simultaneously.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 5df4f9e8fb2e..4b8c4ebfff96 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -850,6 +850,7 @@ static struct i2c_driver zforce_driver = {
 		.name	= "zforce-ts",
 		.pm	= pm_sleep_ptr(&zforce_pm_ops),
 		.of_match_table	= of_match_ptr(zforce_dt_idtable),
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe		= zforce_probe,
 	.id_table	= zforce_idtable,
-- 
2.46.0.295.g3b9ea8a38a-goog


