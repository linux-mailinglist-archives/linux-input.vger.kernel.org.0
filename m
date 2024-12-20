Return-Path: <linux-input+bounces-8705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918799F98C5
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 18:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC991660C3
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEA121B18B;
	Fri, 20 Dec 2024 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuocUCnP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188EA2309A8;
	Fri, 20 Dec 2024 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716397; cv=none; b=bm7Ox8b/NljyjdI9Z9XxUFEy/ZJOfG6pnBs8w0ZomcIm7tCoDUn6GaKMRzgTsUEHLjXHZZAIu1qKwpYiss0/QCwNmLylJuaVILlF/0HmwqUN0oDQWb2rRBDgn5zai7ab9NTcwR1YbgvtYK/h4HFp9gtsCzzbYxu4H8ol2YaMySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716397; c=relaxed/simple;
	bh=hbjQoExTClH3tnmyoiybd7Hib33Ae5OC+Lp5ZS3dOCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqjzV1zOg0hqUUL/abMvYMjRjWAJ3EzVfChDDag8ASk0ttOakSs2a7z4E3xVx9JSJm3sORLMF71iBNH0sNADY2r5mltRLvWbzPKKhXdyZfs+XN3dxrZu9/fsxi+87XilkeVo+r/s4wJBI+bKVD+NOBf0Dt8oEVEk4Q6XaqSoOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuocUCnP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so24384715ad.3;
        Fri, 20 Dec 2024 09:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734716395; x=1735321195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwSUy0RQT5wsIXpR5xKodzx1ekf3+Fp75NF89Ltr3kg=;
        b=QuocUCnP9K7YZrSN2z2IkEAcfNJ9TTIpyPmVCSGn9jmkxGEMilABfU70rkTyimJkkd
         Ow3oL5wcPeThqmd2wi2ncpZwl9fhnmFflo+krIFrdkZxJOw9Kyldw1awjlPacx8UElQB
         9dsWmgFrFp75VFLTYezULk0dUku0W0VAG/HMGWedjNkzMFcqQkcnWHDn6yfEwOEp3XUx
         MLiNMQP4+vsZdGXivULwVgi1XR1MkIb5R2kYErYkcNoHgkr9Du7ENj0yq8G47QIwMD4R
         ZRiCiWM44Vq3wPfNay+ilPYPyhjWmOeYBq8Kc136aafvHxo9Hn8GLtHfjnPNUqbh1eIS
         1q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734716395; x=1735321195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwSUy0RQT5wsIXpR5xKodzx1ekf3+Fp75NF89Ltr3kg=;
        b=kkYvTkJBeEjESnbqyrvT1SF5lEqd07zMYqfxO1AyPPsov1+ztx+SImFRSP/5qUUkJ6
         iwUtlPU44zhlri19SLYPwKAyLOBMBtN/+D89rHKPZi/i+VclPQTj0TOAbYNf15+43owk
         2ZDE0hrFVd2eHq0Tl0AITb6IL4MC5fn0pkaiKTq9bIpsLqI4b4xYLRpzWxJ7A2xnUUbN
         kAoY5wUbWVVFuFS8biEOvlybUWPw11Z57kJdOmVkBGnByxkZnlKM3Ha8yzODe6/l00sF
         Jc/GWmzverct7uvzzFLCYQf4BPLG+cUrhDyqzRy2p9VIpfUIrZp66ZrAQBjeuEZKtxF3
         vccA==
X-Forwarded-Encrypted: i=1; AJvYcCUF6dWcWkbswNEJ0g9Yxkyc/oZ4hyIy/z1AmQjEzMuko8gjjhnJfiCLyV+fCK8G4viXMYFcYpHq8XVQX2jQ@vger.kernel.org, AJvYcCWNgu6zjZUMY3t7sqYTArm1Z+BQXxskEsgWtpCSeXKbLQG8yTzrpi8LqeJtaqsylZysWqrBbrgU6Scd9g==@vger.kernel.org, AJvYcCX5NYbtB6AOCu2TKuubObU8rJ9Yy19CBI7xu3zycJwfFAYCxYnw6IQNfUVlhmiyJSNI+T/uatN5J6PY9XKpN0O5yNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdoitbM/kkMUyO+SlxrYh+Vjibn2rNCe7WLJL3osuee2EgldJm
	Kdu8RGIXhDW+Rjrqa3xSrU295/QQ9eUsgNNbivpYA1hCPU5hSA/sDBo4vw==
X-Gm-Gg: ASbGncsgNLOFDx4El5V+NjAOVXjt+iIMBKg/gc1FPsogQaFeVwRwDIyU+9IhPYYT2tC
	zhMvrCHxKr5jf4jZXYkkyKuihq5duhHRcYTkqiCDMBo1cYDD1FosllP/CKoeUcVQERcNnGQlxrM
	vjbqSglx3s4UjQ398+KqMIaz87WTLz9nHFsFjOlivzvDivN2f82KwELUOn6U4+YAgIMUGRUsHxB
	CQeS6QawXXAEYi7eo98oMOjkOSAcx264BxDTTSe0gcUsYHQr1jVhva2UQ==
X-Google-Smtp-Source: AGHT+IHu/CnWaovkE5iELtI2WviCgFcU6uFxa1yZ5CVXIY9qSC7PqQ39uSQIarvB5s0gAIKLIcU/Xg==
X-Received: by 2002:a17:902:e54e:b0:216:7ee9:2222 with SMTP id d9443c01a7336-219e6f13c45mr55179495ad.35.1734716395239;
        Fri, 20 Dec 2024 09:39:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4f42:14ea:396d:8b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b27sm31370555ad.276.2024.12.20.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:39:54 -0800 (PST)
Date: Fri, 20 Dec 2024 09:39:52 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/8] Input: ff-core - make use of __free() cleanup
 facility
Message-ID: <Z2Wr6DuLCGR6gJhf@google.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
 <20241107071538.195340-3-dmitry.torokhov@gmail.com>
 <CGME20241220123701eucas1p23125e0738985ffe35cbe9624dff08972@eucas1p2.samsung.com>
 <7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>
 <Z2Wn2wTesz3nj-vO@google.com>
 <d9130467-7141-4a5a-a520-a0550031111f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9130467-7141-4a5a-a520-a0550031111f@samsung.com>

On Fri, Dec 20, 2024 at 06:38:04PM +0100, Marek Szyprowski wrote:
> On 20.12.2024 18:22, Dmitry Torokhov wrote:
> > On Fri, Dec 20, 2024 at 01:36:59PM +0100, Marek Szyprowski wrote:
> >> On 07.11.2024 08:15, Dmitry Torokhov wrote:
> >>> Annotate allocated memory with __free(kfree) to simplify the code and
> >>> make sure memory is released appropriately.
> >>>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>    drivers/input/ff-core.c | 19 ++++++-------------
> >>>    1 file changed, 6 insertions(+), 13 deletions(-)
> >> This patch landed in linux-next as commit 5203b3a18c1b ("Input: ff-core
> >> - make use of __free() cleanup facility"). In my tests I found that it
> >> causes the following kernel panic on some of my test boards. Reverting
> >> it, together with fd5ba0501d38 ("Input: ff-memless - make use of
> >> __free() cleanup facility") on top of next-20241220 fixes this panic
> >> issue.
> > Gah, I fixed this once and then undid it for some reason. I think the
> > following should fix the problem:
> 
> Yep, this fixes the problem. Feel free to add:
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you for the report and testing. Do you mind if I fold these fixes
into original patches?

Thanks.

-- 
Dmitry

