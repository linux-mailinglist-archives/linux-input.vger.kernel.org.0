Return-Path: <linux-input+bounces-750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E7810B0F
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE651F2123D
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCDD171A3;
	Wed, 13 Dec 2023 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0ucNOWu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BA1D0
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:10:49 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b9b90f8708so4436876b6e.2
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451449; x=1703056249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utm54ZP33VafgEwETPNY9sOY3TXE99YJLMrShqVJkHU=;
        b=d0ucNOWuRnPj1IPnwgzBCi/Y8wXy9lL9RsvzGWJXzFSxR1r8q/ZRqOXxuJ1HSS8T76
         B9xjA7qWIv7JBL8NTT/Y5ZWSiE+KsIEmM3+xLSfuaete+jGMHe7lE2pBUri968u4F8P8
         Sa+W/151rLzOlQ1TmIjE4Bnm3Ce37B2P6HMEzDJFVH04KvgTXIDHDd6UkJ3stQqsQYJ6
         K6uiJpCWNL8fUOYIcysRs+JsRDg9DUTVUcTDXdeUU4iNf/mM0ytbJVzuKQqG/qec56US
         dbk5vx1OsEulT04Bs5DbhrIsP/Vw0wujQRIeF1YMWFlYPw+PXA57973Bf/WzbqVKDjxE
         m2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451449; x=1703056249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utm54ZP33VafgEwETPNY9sOY3TXE99YJLMrShqVJkHU=;
        b=td0VP1Hv8eAAPTgyAm6p94z6OObX8cG2gRmuvxX7zl1mToC9aH9xDg0ts/lFigGsDu
         FxwfWj489JI2V+5eqRAbicOSZQql78M9aysyR3xwiB8azElyJOrQ2iLZ+6HH8wCqtd4L
         H3GtAC55DmDFjh8voaaKfK5zXs53g+E+rho92vrqLuK/4QhY8q3bMI1cDyCUDqz8iawS
         6AIfsjwBeg+jRniK4FyHYE9yLMxG7aiXdKgjpTZC/RtcC4fJLVBZi8EmTuxMmqTtzdGH
         ID/0T3JiZY0LaMb1CgJmZ+0RwuNEpV6UwJdYW4nI7gBSiwgNnRsN41wQozEP2lLjeC2G
         n/Ug==
X-Gm-Message-State: AOJu0YxdTVI/mUmUrOwOzqZmt9s+OATNJxSgtMfX9pqNFDwZuDfVljr6
	ZftKqFU7x/tZguAgBHCiSVQ=
X-Google-Smtp-Source: AGHT+IFMhODsNvuRoZ9WnrJGYniP/LJxPqu0LIcrV6lUgrkfLxkOx38SMrktkmqM17LY4NXcFyHmcw==
X-Received: by 2002:a05:6808:1454:b0:3b9:d36e:7262 with SMTP id x20-20020a056808145400b003b9d36e7262mr8891925oiv.60.1702451449045;
        Tue, 12 Dec 2023 23:10:49 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a0021d300b006ce77ffcc75sm8308118pfj.165.2023.12.12.23.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:10:48 -0800 (PST)
Date: Tue, 12 Dec 2023 23:10:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: omap-keypad - Drop optional GPIO support
Message-ID: <ZXlY9rsBIF7OUjfv@google.com>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-3-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-input-v1-3-9433162914a3@linaro.org>

On Wed, Nov 29, 2023 at 02:51:47PM +0100, Linus Walleij wrote:
> @@ -180,7 +176,7 @@ static int omap_kp_probe(struct platform_device *pdev)
>  	struct omap_kp *omap_kp;
>  	struct input_dev *input_dev;
>  	struct omap_kp_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	int i, col_idx, row_idx, ret;
> +	int col_idx, row_idx, ret;

col_idx and row_idx are not longer needed wither, I dropped them and
applied the patch.

Thanks.

-- 
Dmitry

