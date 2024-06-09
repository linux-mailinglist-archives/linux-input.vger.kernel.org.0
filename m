Return-Path: <linux-input+bounces-4271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60065901852
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444951C20D26
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 21:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F153B4E1C8;
	Sun,  9 Jun 2024 21:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4ZMMV1b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906101865C;
	Sun,  9 Jun 2024 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717969272; cv=none; b=lOzlzfwao6jtsgoB6TXaGc3xkrrISJ/z1z8tert5nCcbKQr+YU+0Z2iY83yRHQnGHrqp+Liwnv+w99jJZvl6P3nOFGA2TVCTDe3y8yQHhbcb2uNTfwY2OldlY+kAY6633C+4Tzk0e5PJZ9yloys8nfew+yYy1OOFTDTlDZcaHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717969272; c=relaxed/simple;
	bh=/pUyIs0rg9z+B+eOOx1A4RTdvAOOAsqyUvdGdwh+okY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEfQ3vlmlPV3bweAt/q0k5mQCpZ3QH7j0yClN++RqmJnriyZybuXTqnEAY+w3cqPn9b6EXSJQ981J2m4EmIAdq4RIrH5cP8pJ2CmLX2Rz/eRM5OrSptmw0a0n1N/9ui+V5WS+Fp3gENXpVLd1x9yLJBJ6ydyzZ2oYk3kRarCvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4ZMMV1b; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-681ad081695so2829499a12.3;
        Sun, 09 Jun 2024 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717969271; x=1718574071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ecB0puB5CrDlsinl6SGmOW0Gy36kwzCicVzoDhVT234=;
        b=X4ZMMV1bEtpE5vkEEnwLfy6zNT+xv7NUECseTKh/VPsJAfkhhbQbi7olpcsgg/cCoz
         TH6i2URhHXJ15PdTJ12hK19BqRkFB0EQa76AedJNRpYU9oYl4oV0QnwOckLFPusZAuCc
         DTbp1EPqa1SMglACE/AIyzJKmHhpnE5aJhEvEAbJsP/Rh7pIOQk34ZQqkp9VWLSA16ih
         hyoCd7+DMYPuEonNXi42WHgOI0ZFWVkZwUZKuAYRN/XOiya8C3pRSNNIC5qd+2pCKfhU
         7Izyt/3AisadabUAPMrZ3+f1nV9HQi0cEywH45HvtxZckUW4gPz0b381zpvlWkd5Ezjs
         g1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717969271; x=1718574071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecB0puB5CrDlsinl6SGmOW0Gy36kwzCicVzoDhVT234=;
        b=qyQ+mzB0vnbYcldm1Ux+ZYHB2JsGEdwUsLIrPTwpVvq5FuiozdrO80MFSwh5ETqwo3
         wj9XVHLgUM90gftrE/pcodx6XIGUMSGBoX5FmZ4V1h02rGqZVOqzaW3/6COBX4CyC7EV
         idYf7rHcQAUlpx+lojBF510aWbfof6YpRfjuw8HcO8dOT9NrrPOoMnWJMsKUfuYlpTAB
         ugShrcZRxouh/5Svs0JRR5f/W9N9pEqkzcp+0FcL9wNOheq+ZepLn3/DIzJ7Y2SnEbVR
         UYdPtOjIz65wJ4EpP3N16cH0CeJmXubs3wPgIed438uKqK1uQjGlkMsNP6qUH7lYPOyw
         8GmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqXlvLtAKun28Z9BGBtviJxfimj6KZ/JcbPYkdM9EXWi/rv3uZ9yNLuPoj6baw2yv8mKUBbPD+rtnY5PlQmCdQPJxJT/7hXZbsAdBEOJj82uNspMnDhxBTtHa5WS0Boa0qHSsURAkLRieBwj+JSA8/4OTH6erDIZFvv0Fk054DQd5YSgrHCNn7Tvs=
X-Gm-Message-State: AOJu0YwfFsNHNpxghYchvcGmNpTFSYPqEzbEsRhuT8MK19Rs1iKVMB7s
	MATjeBvga2z2jcogUclMGtMXEIznpa6UXWQrfCJbD3O0QPSj0igI
X-Google-Smtp-Source: AGHT+IEk7CZrjiNn9uOB0qE6L+785ePUGnnEV1E6FDTKO1MeBm7ssikwhiPxAL52SO+W9GI56JjdWQ==
X-Received: by 2002:a05:6a21:27a9:b0:1b5:77db:c76e with SMTP id adf61e73a8af0-1b577dbc806mr3287548637.54.1717969270619;
        Sun, 09 Jun 2024 14:41:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2cd57024csm4817204a91.20.2024.06.09.14.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 14:41:10 -0700 (PDT)
Date: Sun, 9 Jun 2024 14:41:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: touchscreen - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <ZmYhc89_PXsKQqj8@google.com>
References: <AS8PR02MB723708364CC0DF2EAAFEE5968BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB723708364CC0DF2EAAFEE5968BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sat, Jun 08, 2024 at 04:34:49PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter).
> 
> The refactoring is mostly trivial except for "usbtouchscreen.c"
> file. Here, in the "mtouch_alloc" and "nexio_alloc" functions,
> it is necessary to use a variable with a predefined type instead
> of the "usbtouch->priv" variable (void * type). This way, the
> "sizeof" operator can now know the correct size. Moreover, we
> need to set the "usbtouch->priv" pointer after the memory
> allocation since now the "kmalloc" return value is not assigned
> directly.
> 
> This patch has no effect on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

