Return-Path: <linux-input+bounces-5695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B7957A4B
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 02:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9578B21EFC
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 00:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61A517FE;
	Tue, 20 Aug 2024 00:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY7pnzw5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A173139E;
	Tue, 20 Aug 2024 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724112287; cv=none; b=BR3mWPcNzVQ1gfuibUsF7g+ssX2f+fKRCwAToAi1vgR9FXcN/uMSAuNhJmWajyiJpWdjqlkXZyyvhIkEmS7Rl4kThBqnLA4hC0hFTX4dSvRKxuEp+j2bqkcbmvBHuJr7KHvfjgKSlPIUqa8PbN/Evj2wdFJYggmmv0SVks/aU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724112287; c=relaxed/simple;
	bh=vZgIK8Nqmu/rnd4q2IxMbPnCI0TK+ZfH0oez5+0UGQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cppAslF117nyu7kKCTMlKCxzKGV0F2Jr2SmHlVNVbdmR+5EAh4dyLZF3awDRWK9DAPVpF+nK7HkVTvGc/IwrsBnhkNX8KLq0jDPhXvdKXuiByJ4DWkwAA+hCbBi7hNllB3BHIXxWDoQgdEeheI1Z/isIl0w/gkgudJInyDhNctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY7pnzw5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-713dc00cf67so2345151b3a.1;
        Mon, 19 Aug 2024 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724112286; x=1724717086; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16sJFH/2cM7Wc0knYYFUp+vrwe/LWApcoISqprPCDJU=;
        b=cY7pnzw5ZEASLhuTGU46vKY2V7G4KL+/cq/eLUOtsOKwuJGsltyRFw3CDfCcQAgJwu
         fR2mT/30ZTuLiOf5FEtJvN5TaRIqe7mJZ+606nIJJ5J8LbCDUhPldxsn7q2Zre/6WoA+
         3y6F419cZuVvQExXJao0SaOsgYZCeX98at0o0Pk5vZs5TkQtfFs3Z63IIA+TEfESprw8
         Yr7BuE5Ef119vdgX4KM9HXO1Ko3D9B0tTxFLKVieOcvhKD2bMOxYXmQIc4Ven1hKUDWw
         fNbgUBFQDjw26UHYsZpvEojcd7L1TuPPj7lvGofm8Qq8wA6MvhB09tyfSAht1ucqzBZm
         jn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724112286; x=1724717086;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16sJFH/2cM7Wc0knYYFUp+vrwe/LWApcoISqprPCDJU=;
        b=QLr9XtiVE57W7eru8fRbn6KG13hC3wdKwmGmTF2oDPSGejoRenUZtznQjd9ZXEfO/p
         l/Dotc4Y7JTJh9yhpOgDI8aHs7Rg57hzChkUdNn9hvei1RxNLG5wvO+Pnv526IgYE+o/
         EHmh3Nqz5H9z+KNoHA4o6KIM39UAVmeTgNj1RN7Kbxl0yMBs9Fn/JgnNPZ/hy6oWTblI
         xF69bO1VZHQO4uuZKswHupnYS89bJMRxGi23Fi/r4/YCXvxWBQTUsW7eD5eFffWIJUAQ
         /eQA1zYukW2nl7LLyOcW/Q52PvNeFYQXPCLFmgH+W8MZadVmOgYhAmuQQRfa8ZikKHle
         rsdg==
X-Forwarded-Encrypted: i=1; AJvYcCV6RKBwDdnorUsvVqT5RuZQCTO6rA8WkU3wMtwOlpJ0Mf8J0Dg0PVcWoesiYdRd+HZdf9zAmHQrCDyN7Bx5@vger.kernel.org, AJvYcCVK65CLQy9l/aJhiIBHtO9te5ViT6OR/kr/H/WSiGUH5F2CDiN4Cv2IXyponMnsv5SI0zYcgWW8p0TpTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGCEktmfemWG9GPNhyfyReodMQAlUuDRMPJ5iRszWp11Lc1pR
	I3rFvxmrirS5QysCV6odJ5ush9ulwByF9nXBVomSJ4Fm0hYJf/yK/xN9Yg==
X-Google-Smtp-Source: AGHT+IF2gXHgMR6bVZsbbo74OwCk1cxZdrjyu9Lg3Dbt0pVL9MnShLMogNqDukmPGv9rxlwPdaTZAw==
X-Received: by 2002:a05:6a00:2d15:b0:704:2563:5079 with SMTP id d2e1a72fcca58-713c4f3426dmr17283482b3a.27.1724112285588;
        Mon, 19 Aug 2024 17:04:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef6590sm7080702b3a.131.2024.08.19.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 17:04:45 -0700 (PDT)
Date: Mon, 19 Aug 2024 17:04:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Job Noorman <job@noorman.info>, Felix Kaechele <felix@kaechele.ca>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: - fix incorrect size when reading product ID
Message-ID: <ZsPdmtfC54R7JVxR@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We need to read a u32 value (4 bytes), not size of a pointer to that
value.

Also, himax_read_mcu() wrapper is an overkill, remove it and use
himax_bus_read() directly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408200301.Ujpj7Vov-lkp@intel.com/
Fixes: 0944829d491e ("Input: himax_hx83112b - implement MCU register reading") 
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 9ed3bccde4ac..896a145ddb2b 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -130,17 +130,6 @@ static int himax_bus_read(struct himax_ts_data *ts, u32 address, void *dst,
 	return 0;
 }
 
-static int himax_read_mcu(struct himax_ts_data *ts, u32 address, u32 *dst)
-{
-	int error;
-
-	error = himax_bus_read(ts, address, dst, sizeof(dst));
-	if (error)
-		return error;
-
-	return 0;
-}
-
 static void himax_reset(struct himax_ts_data *ts)
 {
 	gpiod_set_value_cansleep(ts->gpiod_rst, 1);
@@ -160,7 +149,8 @@ static int himax_read_product_id(struct himax_ts_data *ts, u32 *product_id)
 {
 	int error;
 
-	error = himax_read_mcu(ts, HIMAX_REG_ADDR_ICID, product_id);
+	error = himax_bus_read(ts, HIMAX_REG_ADDR_ICID, product_id,
+			       sizeof(*product_id));
 	if (error)
 		return error;
 
-- 
2.46.0.184.g6999bdac58-goog


-- 
Dmitry

