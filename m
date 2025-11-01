Return-Path: <linux-input+bounces-15859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E702C27F25
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 14:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 803D54E9FAE
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 13:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4732D0628;
	Sat,  1 Nov 2025 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SdtaO3jk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33422C0307
	for <linux-input@vger.kernel.org>; Sat,  1 Nov 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003534; cv=none; b=b6D+Bb3JtHKZHCVUmzSXjU3IBFR4oNWjq5EzsV7uOBMn/eF1wxkbeIJjV6m5EnvxWzebMwJDLoFEZaGp1+58R+gDRI9fVlLpmoPwR5hCRTZi+DkF9+XaBLdjYCE1YGT3gj5BDcYOZqOiI0qgVZOVUU7nAxblzyNLJnQyJa+8F5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003534; c=relaxed/simple;
	bh=Z98SLm/EfpTZZ+75oYqs1vAnViW8qDAEJMAoaxRjcMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sp1hoyijEIxnur5HBhejSF+f0qtNap2yzjzniCBtTsrnBtXMlAPtJ81RENjZOaUhWYzfNjmYF2ekQYDpus/oPIIdnBETX1nntMMduhYVKumwO5j3y10jF6UOoKIJjnBBW5GsBT4RNO12WaQhPK2ltLgTMTZQuQHfLPDZ6g5XU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SdtaO3jk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so18539215e9.2
        for <linux-input@vger.kernel.org>; Sat, 01 Nov 2025 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003531; x=1762608331; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=SdtaO3jksgTLqU+mS3qclYS5VWLHEev1z9DX2gw+YhZLE+lYolFpb210a5XBvsUhOS
         rDc8D46VdPJtVb0QB9oP10HOGB170XfZvhDbqd1ul/hrq7JhGQAIY+GrqRM79XtGSV11
         21RmS0OrKQWNnlX0XL/CVqiHhOG0+KQQotDA2FniWnm89DCi9Np+pJ+NCgsVAGGe7RKK
         lgcrCz91r6nGf7KySwGW5SSHOynTR2jZ4uEQ2MjjhTJoUdjnDwX2wlwx2ugpUPn3/l/v
         pllDQvO9kO075YipdWvZAb/nTR4b66nXsKvyB8wqLj3AGFXrUC0DlWucXQeNBlLiJZ+F
         RymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003531; x=1762608331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=nNKEQhs/qPcUqUzK++bLqf4qwfjEMWUkgcwIeTCrvA4XGrMwdq2JrgnySk0OqGh4F/
         J7B55tjlKB4bFgFddM5tGNIuYlQDAyEK6a8uvJpn4eebpgzWR5Y3uROX/KilRZfdmz4b
         08DASSzh8tZ2aXiXzCKSSPn93U1/v0MHfKRSMRddYO+aGbycAF/r5iL3IKdf/h5vVLSt
         VpToiJyChWTGmqjKVhcoP+reMhGqDJ3lgzJTF8yp+JFn3rgo7pBsB4P66NZzylSeJtc/
         0yUvxC+XqPGQJJE1bCGteohSeVEI9rtdwnKOktBBvwZR/OiQRSUw3KgeDxCGBYex5G3S
         e8uw==
X-Forwarded-Encrypted: i=1; AJvYcCVty6Ok++ngV8N9M9zre2flg7nk7AaAPLOfuXLX6nLzhl2Zb/SdNJFNZOA1hoRHNq1QRIzG35JVuvSCHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzehOfdPwvM9DooeEGhFT5nVaC+gtV7PCIMuHWuZ0P0eeD+YwE7
	VoAFWhx/MwKqX53BqVF2PCFd3B6q/2+60k03iXbXppEiYwXDacYzxmhWSFN7L9rGMC0=
X-Gm-Gg: ASbGnctETJqMFd6Fss6k76qTBI3qzbUxuEkRQL7CJMwU5nvBD1QWuKOvDAicU8vIgq3
	b8TRf2hJx4isSy0LPR42Q9T6oyfVsWH7Q1hHd+IBPq5HNPLNLleFGniWSqXcS0zrIFK+yaHMZ/4
	HZR7esILLbvvqxuL6g3LWKTT2FjqHEPAUlWZ4FwZjU7sicorqib1OnRWNiEGuQG4irQk16wCcQS
	VKvuX/EvpfwotHm1hJ/7bA6mD49OSSkqKhiq89mXyKSxuWFFVdQadsvt8KF25tORZtFaWui7utN
	OURYdv+0VFcwcKiQmL8IwfmIQ6gqMq3eT1K5KRaDivIePZM+GyA8D4LnP+E5vvdQTEgppZMvHlB
	swzDOkFc9c69nxIo2yhIJgtA/eWkRFwa2QFwWF2G0F6N1AwXLPCmQpxr0iiIRpSB9b7IEueY1xA
	iawc/8+g==
X-Google-Smtp-Source: AGHT+IHfkE8YJK+hEniklXFT4GhX0FQkyrWL8TAH+8xEiRGBmRw2WAmAAnJ/Iz+FCPOhsKJuLyo9JQ==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-477308aa8acmr60161545e9.25.1762003531066;
        Sat, 01 Nov 2025 06:25:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c48de65sm47854815e9.1.2025.11.01.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:30 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to be "priv" but we accidentally pass "&priv" which is
an address in the stack and so it will lead to memory corruption when
the imx_sc_key_action() function is called.  Remove the &.

Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/keyboard/imx_sc_key.c | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f6..b620cd310cdb 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -158,7 +158,7 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
+	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, priv);
 	if (error)
 		return error;
 
-- 
2.51.0


