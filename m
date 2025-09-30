Return-Path: <linux-input+bounces-15174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AEBACD0E
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 14:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB59216C3D4
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 12:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924A12FAC0E;
	Tue, 30 Sep 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hd0gzNx1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E827B331
	for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235141; cv=none; b=DT4SHPR9uy3ursB9+PBNDLOgtGkqGigC5UQ0oJOvksu6LvnD6By9CMflc9XVJ16lcZoe7FaY7nsm6+ZA7YmSs53UjahsAe4CefaIFtorkc8FceffxzIcVrGP40mXPPxQkfQRFi1FwnS8Jx7eDPdzjtO4x7647/Bz/b5ipzOL2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235141; c=relaxed/simple;
	bh=heMBj5Se7D674ot+jB86uM824vbkgYvDDTYr2KtcYCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSo08Is5GjVIb1tu4kr6q7AAssXNeQDs9kOKa2OIGpJYDsDt8B1sHjhleE5dDI1K20CHpvpseiT7ab+5tDhRvaSw2UhFW0yMJJIdIe+laPvFgmPx6pj54Z9XOgkLzJI7wb3t8TD5XmJYzIAOjaj5k7cno2zmfyqRsyusZM/nzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hd0gzNx1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so13244255e9.3
        for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235138; x=1759839938; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1AXE3E4du7FCwUTXFpKPQhJu66seghaqwcG1g0MMZMA=;
        b=Hd0gzNx1SK5r5C939TAWQwIJt/DaYSupEPAymjMLw305ZOwoHMkalatSRydfV56KnD
         kKFtPEgR7HXNLhLHDW74pzu6OHDn9ne1nuRAQmPDowthoKF/FRcljrWBMB6xcIBXxgFW
         PDWsUH6iC9mB1BlT4X4HlUqspE5vSmY+B4Ygw71Qg16MFpJ7l9yYW4Fi02bz3pKb97iH
         en+t8ZvOx60Xt8S8wdFF5UTAlXTfTov91SjrVljDQ6JaYc+vneqxEDKvgqtN9QElaVn5
         +A47MGK5t6Kl9jo5FqbIWEbmIpfpbom2Hzif3h3peHWr1SZ1X2EnzXFqg2Z4gPzp/X13
         4Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235138; x=1759839938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AXE3E4du7FCwUTXFpKPQhJu66seghaqwcG1g0MMZMA=;
        b=YX45JrY3Z2xAoH5oQ1r7seEKnhrCHZn1ttKFibs8kTKIrynD3NdGoo47NPnw4qveaV
         KOF734JO6XbAf0SwlNo5t1+sOiZkt+ERnGwVr0A5jpFN+YJim30f0XA5jw7CpZdjWdy5
         uf2bj7zkgZ00pa/sQtMwoi6HUOeteIybOcydrCjpvJMiqf5Psw3H8TxzzweGM2Kzrtju
         1VC7zHU8v/Dr76yp9Q31T4KOAerhjBzwjj10/RD0NnK+dbk7OowexgLDofgyia3dInfG
         mqmgTdZEjF5ubk09Xq282xPzN2vSLzuFBhTfhxwU+vKa5oXh7Kl4/eSeRYLXNpSgd3zp
         9VQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfee52tawQDamdGLeqM6GT71l7BUPGulepGrjuFwSNmbAy1+rBCrNFBdyzQoUsmTx7BFBx5Bnt3XXK5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMANWVjdZwWxlYoc1/NvsmbkA5jmy9TRxbAW/KyjIPk6itJayC
	JXkZIWknREnM0O7jYMeAQ0UPau9zZHmV8IkBdd+X3PuoXPhtjE4WcAC1N+oO/3zsj5w=
X-Gm-Gg: ASbGncv24YYJZfmCkHnCt07ZNT8LnDDBXb53lnWx+BijpK33dvuYrz4jfWrgQF9+HJB
	7/C1FHxYswg2/DB8U3cr6P6G7Iw4jPFjOp9Y/uAxxPz9nBMLQYWBjrnprtscandDQpWB43gM93i
	HJk+j1CyvdJ+1RPMsqJXjLQX+fxMt6tqNtcevfP0m2e0BbJV0Iw3PGg/pGyZaLdrIBPvI6qpDNS
	zo7xDn+YypeGWkDxY89ZDoPU9GtyOAmBB/E5u+s3j90MPgaMUAo6G1cMP633prfrXqdKu2qtZ/r
	Ew2J4cFz8oZhQI9fymfyAG/zZ6dssMlqyLdK6xdKjrdRqII1lj5KYzzEM1CdIxOXmP/KM4usnZk
	CzZkmmzDwIWORPgxPM6eLwEmcW4y/KVskfKi5GhiW9yO7n3fITMCW
X-Google-Smtp-Source: AGHT+IGDWKfvS7xIHf+6vDs/q0NKQ2FRZkP9GQRKEpMrTz9/x83MNNzlklURhvJCRHqO6tBrQqt6Dw==
X-Received: by 2002:a05:600c:3105:b0:46e:1fb9:5497 with SMTP id 5b1f17b1804b1-46e329e4d87mr203921765e9.18.1759235137830;
        Tue, 30 Sep 2025 05:25:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e5b622f37sm13662115e9.1.2025.09.30.05.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:25:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:25:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] Input: aw86927 - Fix error code in probe()
Message-ID: <aNvMPTnOovdBitdP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix this copy and paste bug.  Return "err" instead of
PTR_ERR(haptics->regmap).

Fixes: 52e06d564ce6 ("Input: aw86927 - add driver for Awinic AW86927")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/misc/aw86927.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
index a0c88a7e1e1c..8ad361239cfe 100644
--- a/drivers/input/misc/aw86927.c
+++ b/drivers/input/misc/aw86927.c
@@ -759,8 +759,7 @@ static int aw86927_probe(struct i2c_client *client)
 	/* Software reset */
 	err = regmap_write(haptics->regmap, AW86927_RSTCFG_REG, AW86927_RSTCFG_SOFTRST);
 	if (err)
-		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
-					"Failed Software reset\n");
+		return dev_err_probe(haptics->dev, err,	"Failed Software reset\n");
 
 	/* Wait ~3ms until I2C is accessible */
 	usleep_range(3000, 3500);
-- 
2.51.0


