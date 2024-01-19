Return-Path: <linux-input+bounces-1345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D456E832F58
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 20:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BAE91F23DD9
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 19:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D0056447;
	Fri, 19 Jan 2024 19:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CruyDL4g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07056440
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705692170; cv=none; b=GK037wtYikdKtX+ewIePuRW4hN3dN9NhAz2xmImyVoSP4XXWMNVvVLbE7zxcbswk76mb3VAf2g7cO6VpTxJ35y/BFlvijnHmABAR41SsqubxGa9w63fok0B02T7botWusen8QQehtjLH2xuV174Pu8kKzlhfOaeKv5CYy/Tr1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705692170; c=relaxed/simple;
	bh=7SaoXnKENyP2A2/QuVxxqqtiDWrSey0wo1LHzJ78iQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4WJtBEFl8mNmoLdr4tUXxObREV/2dYSXKyVfnXjLuwJqvUziiOf9Vx++TVAhTUC2SEFO/+DknLZF6s8PbVzGo+m4+5Fej5OHZu6a7gLN34MOQyUqcl7uR2XcVhUg/TDv3AeiMEZdshmN8tpcueH2j3k3EjN8C+04BdUm6LYLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CruyDL4g; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6dbc9dab55dso355798b3a.0
        for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705692168; x=1706296968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vDAi4KqapOjCWbEC/u51sCQijieT389gbY8Tpl9lC8=;
        b=CruyDL4g6vkDfdHHqgoBowXAXgIOjvUYKKe8YN912zENMcd3bU4v8y0WWrUnRQkGsR
         FmsJe3TVO/1JzLRVdI5TPCh4iSyhr63ky2HM3y+uvQ9d4IfalItnNAU2m5a4CyGbHEK8
         Y05nFiux6Tn2hfzzOe3leu1/FNqDaCHVkyvfh25kBW9kTOMi8wqSGW7X+H3XbOvxD0T9
         Nz2pypK70CYVVK7aBvEHul2L175VlPUdYYHYzIZtpHqIEXCg/9VZrPnGDj6f9/bVvt6m
         z5toHbdoP8QsvRaw+q0rF+Z9434oaHRLY3Ppkj3m7EjEbAQc5IwqlqOA2onmuzXwyniC
         czEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705692168; x=1706296968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vDAi4KqapOjCWbEC/u51sCQijieT389gbY8Tpl9lC8=;
        b=F0TsRIHqkj3bt0FjZj5fuJ3ss1l8YeC/NR+9+5jckRFzuN8+WDqT2bUbrczpyjaI8u
         PpL0Fufszjia8rmsRxYgCcroIBfyQ9gZcyslJ06wr5mQAdypEBudBRmJCvEcWaPbPG8U
         +SjyyC+5ihJQ1A6wgwmvmTKZFhUZcFhokIiniwZ29vFQjDJc0teRPJBW4PDzzuuecPs5
         GAARX9zLw+IGPXx6nFDqZ4xk6sIz6p6Wb6XncXQLcjLNQ623jDKleGHnqP4hATauVrfJ
         5lORuxjLtPny6+TmS7Tbg9GOwvu6O9kUjLv95nVQ2YDMsaKL6oEV4PV96QuwyndnCQq6
         0jaw==
X-Gm-Message-State: AOJu0YzWeM57+4M7gv7cwgmHB1yjFLJ2y/XO+1ryO/EUwkjSBO0ijMVI
	o2dGOGk02ieNkDkiB7KkA61yIRPZf0Re3wsX0VbHDY7wGLFwuXU0
X-Google-Smtp-Source: AGHT+IEDUnSBTWpekJ8ZeNuP8N5eylLLfPn/iro4N5a0n1aXQOcSL5MQVCAdx9YFqCgioyzspGWarQ==
X-Received: by 2002:a05:6a00:1914:b0:6db:9c1:7164 with SMTP id y20-20020a056a00191400b006db09c17164mr1870907pfi.15.1705692168120;
        Fri, 19 Jan 2024 11:22:48 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:97b4:2663:16e0:cf81])
        by smtp.gmail.com with ESMTPSA id w67-20020a626246000000b006d9b32812c2sm5677871pfb.101.2024.01.19.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 11:22:47 -0800 (PST)
Date: Fri, 19 Jan 2024 11:22:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: linux-input@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	hdegoede@redhat.com, andy.shevchenko@gmail.com, frank.li@vivo.com
Subject: Re: [PATCH -next] Input: bcm-keypad - Remove redundant of_match_ptr()
Message-ID: <ZarMBRUuX_TL0i4c@google.com>
References: <20230809101626.2664651-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809101626.2664651-1-ruanjinjie@huawei.com>

On Wed, Aug 09, 2023 at 06:16:26PM +0800, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Applied, thank you.

-- 
Dmitry

