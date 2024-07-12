Return-Path: <linux-input+bounces-4985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9392F4D9
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D98911C21E30
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980F4179AA;
	Fri, 12 Jul 2024 05:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9RadSWB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324917BB6;
	Fri, 12 Jul 2024 05:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761121; cv=none; b=DX+HYIoa9VUREOB/gNiuizlxY28nRaf9zZujifNZuPckJGtrKcFC+/8I3W2R+vpMo2iYND0zaZxiRlAtddTyjaVai88wAoZVQ1GChZtk270B6kxzbbDlSkRDqLHMErk1ZMoZdNg36VlMzkx1fReNqp73LsJe9fWoVN0RE3B3KNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761121; c=relaxed/simple;
	bh=BUfEUvhWXNX4qKdtnJmxmKSGdoO7upq5iS8gxLM1oqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jeE1e9fH4Y1qPn3r9a00mnJoPLC9sAmjCNeTWyxKe1kLnDgtLr9YS70tFhqEwBlPVVMGPPp6hAxS2IRs5ic+buHS8Swc3lEuKxFlwptP97eU/4/6YWZxp1uH0j4O/+kKTBiFPYCUvhOeyHFq6uL9SeMoVsfXdnnAcVWofy71+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9RadSWB; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d9dd7e5f6eso869066b6e.2;
        Thu, 11 Jul 2024 22:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761119; x=1721365919; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xdXM1xefvbib+SCCoqACgMJZqpDx6wgZvNzxH3nooc=;
        b=N9RadSWB1a4twB6QEO4xWNZjQKaOUOFZdkbe99Qd8T8kpNHg6iBgRt7eAeM/ZB6vUv
         K29xMKr4+7hVdfeKR2FdZu7vX4FSe/mcMqlPPXODngw/ZOQk6sELE3S+aaWQhnMJe9u9
         dvpWmWF7PXgeTDar0oO8Y/PZuTxqHrSmUHO8g0nGzTrD6yicSqR/XWDzpLNhuy9y2ND2
         DdMKdEsKthhkJWUWUWP0Xqfs7plH2YG1OAQDut82kaObGifemErgxyfWzAztQCj38/1p
         w0NTnKUF4P6d/cQ7dteel4mJMEzIuWX3+pkMXFgmife444R32QkCs0KoiNzI2+1ZYYyC
         XAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761119; x=1721365919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xdXM1xefvbib+SCCoqACgMJZqpDx6wgZvNzxH3nooc=;
        b=V/k8DDtKIkEgMslQ2HuXIXd56NLvlAamY0RvnCvTTmIaoyaCXyDC+6QMo0hDQeD0l6
         8of8FmUMlubdx5IXygNlrsAc0fJW0dUHSFe8R1G64m5D7G6pANk7l96jDeo3bapnkK0x
         GFl0T4v4DHXLrPUYNlPKMGiW4kt0hPkesu/K6w892vtGR4kHKap077Va2BNTvS5NUJRK
         rBAh+YEy+CjhSuIALD/CEsfUttGwLEMlgcKOZU5Tc5SWA05hz6ful7ACCXn/hrBe/dL8
         G6SVWPkkgik0n0yU4q8VKuMCuTAoyGo6e+HmaSkgNpHy9wCJLGHB4J7Q/WOmNFL7ZASA
         oeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMUa5ZSOnNN7SlSmCIbix8MJjtrrBDZjkuccSymSvI0mUMAoxG5/G2hIJhSLbWEsgYcf6GuEpXSpEdH/GssOCwG3ZNcKy+NrcyGAOlFqXRfZuNBhy5UJMIBZ4dkPEX/r7DvRg0fiOjihZTntFu9c4=
X-Gm-Message-State: AOJu0Yz3z25J3Qbu3WUbexnh4ETyIC20q+X/e8s953UHZM5Mmdt4iXn/
	o6Rcb4ZR/XjPzE1Y5OWlQz3JIRAyekxYXuAbKQLlzP7bXbMqfrUB
X-Google-Smtp-Source: AGHT+IFWoXaex25DyxV/7If9eCC2vtVHuS0rQ7MKDZI+ZXuVIDcyRW5yjW2niu9hjIIZWdxvG1AI+Q==
X-Received: by 2002:aca:2b03:0:b0:3da:a032:24b8 with SMTP id 5614622812f47-3daa03231fbmr4471341b6e.19.1720761119024;
        Thu, 11 Jul 2024 22:11:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b54edbc49sm4036306b3a.22.2024.07.11.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:11:58 -0700 (PDT)
Date: Thu, 11 Jul 2024 22:11:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sangwon Jee <jeesw@melfas.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Removal of MSC-5000/5080 touchscreen/touchkey drivers?
Message-ID: <ZpC7G0AVMB98og6H@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Sorry for a somewhat wide and random distribution, but I was wondering
if anyone knows if drivers/input/touchscreen/mcs5000_ts.c and
drivers/input/keyboard/mcs_touchkey.c are still relevant these days?

Looking at Melfas web-site it looks like these were the 1st generation
of their chips, manufactured 2000-2007. The drivers were contributed by
Samsung long time ago, they rely on custom platform data (no DT support)
and as far as I can see we never had a user of them in mainline.

Should I simply remove them? Does anyone know?

Thanks.

-- 
Dmitry

