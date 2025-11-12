Return-Path: <linux-input+bounces-16027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274FC51EEA
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B84F1899281
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 11:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8953128A9;
	Wed, 12 Nov 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp9dJzVn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44F312839
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946325; cv=none; b=fbb7hubUWLJ4IqdvdT8MOJvJvcMUvYHWSh1AMj1w/ezG/3KTXHemMtGH+8X33r3g1fsy2W9IJakILV/uBg+Gz27szF1N4UiCUymkxssB4rLDf4TpYumHa3cJPZF7S2UfqysC/6gFrB4TcVnXm1SQ41UyFPzdpqwgURabcoCGe/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946325; c=relaxed/simple;
	bh=Gjco+o33Ze1VtTmwY3+n9x0V+5Bjmx76JK+PO6sbBb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkpWaiAfW6dHATvR+CSs8r2k+xjoYOa0l7GJ76O2EdMGM0eDmy0qFebdVL8+5/Ut9SrC0ZCT5B263B64Es/1pUsGCXK9b5N3mKye8DkM+qwpNjKz48uIxzsebuBvdYFZ96TPwKV2N5PVAiUNVrdhrziQ+0n8GtsRjkVyk/LtW8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xp9dJzVn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so270708a12.1
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946322; x=1763551122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=Xp9dJzVntfsFm6Hdqw2gc8lrNREsswKpHWO25P7JAixkO8IEj9GFCv2TV/A57HVNsK
         OA31dV371iQYe4QE+5SzJCZpuHnjIdHVh1PGFOyXBjKgfmbDzoRWO2yCoz+NYeeSZOPZ
         75YQWyULeLKPMBhWJZ7NhrtfqlTGtKFLaPP164si+N8UwslUEX0HxMmuTE+Dm7XMHr7h
         ary/9bOZz1FYET03D1da6LLHw/fXlwfBnrfi7Kxwg9NJHPfaEQe+EeUKejTbSGOJr0RU
         Dk+1I3IJ6ZPBsf2mI+olaM3jS6b42gSV0f1StWn9ubYaMYa+MVc8+s65pgJqEbmHFId6
         /QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946322; x=1763551122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=obXZJ59FsInsKuE2v+KxDlYfbqSxcR3I8UchyQCz97x2dhE+EUMIVPYn6wwvzEj+dx
         FQBBBNNwEie9+UsR/vbwZCnKa0ciMDyB8xGJILAjgTiIUwOx0ky0QIHRnptJoO+luVio
         sMietwuxF8VXHqbXkkjeSn/vJ8/D+r4esBt3joDDlqokne9wFF5qwiot2UzJ1PbWZMbW
         o1odjyCfFxNoOhuYn08yxSadq8iDgKbBLx3sUQoL5jfZKRrJmjIHHXtzYXGNaD8ktotn
         3jFy44mwBhSk9jj+OhCU4fDqBKWWQzc0+uplD8W31sxbSZiASotSbA2YfbgHZA8d/8SS
         fH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW94sdVn+9QbpnlH8IAphP2hw4BhsPRHPEzx+JG8G33xsuJMphM+7FWKa2JsFkNLhWbC6t7Zebf5AuD7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSVPiqUVYfIkL935PedZaw5HQm3VWR1uKiXV9Bw01FZ2Hdnwc
	jgntec9HeArfp1PmlOut33xdROHi/BFFMDYZCxIKFsuiAZhDPW1xZMKw
X-Gm-Gg: ASbGncvIHXwOy79OeX4vC0Unkci6S5Jmwq1+9cEDbudXs8SWb/RQXtqBfyUm3dQ2bGs
	LZzb/ll3Iws++M6HVsG1ZAh52tqArDHStTwXiYlzyltt2TF93JM/iHaYM0ISrtUPumL8Bwrh7e5
	nKwSNptBNj3crj5IOnMFu3Q2cq0yyGIPsbtgOKwKSIt36Q9EFS6nZhGwkylSDe2jAC6Qq0hjX0y
	AC6LTTWmo1mSiz5CzxiBZYBsBF8lZyTjvCu1jpZifZHpkIrB/ZcWa3z6Z//SZGTXgz7//67uXMG
	tvTD/ZSoCgOodtOBcR4foqrfGrPWy0Cz9XWGlbONvTRtzmrLVI1sGXJmhg3XilE8vpviRLpDFe6
	uiwGYHvp5FrBkrQfdUnqX7JOaS+96ledSjWiHgJeXoFJoQBQ/SnMpLmanwzTmSsCfVcWgegF3Hg
	8NOl8s4oOdKW9pCw1BiV/bF8p8ddvva0hqJOj7n0djvl97yQsBRtraZ9e0KikyxpvwQL1SGbTS8
	XseQa/HUpOwg+aQEAsoCUqs+nEdHXpGIOTXbjtn+91aawMDhsYgxWA=
X-Google-Smtp-Source: AGHT+IHJszkUFQqYlR5AFfzTGIEAaKvG8RL+kwBBJVNc77ojPYvNHMx8YbFZwpTAtKabQYIgMU5Dvg==
X-Received: by 2002:a17:902:fc47:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2984ee0ada1mr33966605ad.46.1762946322113;
        Wed, 12 Nov 2025 03:18:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:55 +1000
Subject: [PATCH v5 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-9-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Gjco+o33Ze1VtTmwY3+n9x0V+5Bjmx76JK+PO6sbBb8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUe9MqcoXO87L1RrfX5F5enpO+XeLfuuXJ0+02Ubs
 7Dj91SGjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPdGH472O74la/3mPRvl8BylqCRWoyR8UunDqpHsCo80ls1Q6em4wMm22qelk
 nzL8Uw5BRsPxd9cobzkyfXVcpMehOeLLkl9dURgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.2


