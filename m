Return-Path: <linux-input+bounces-4905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F012892A81A
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 19:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61AE2816E7
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 17:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EE3148FF2;
	Mon,  8 Jul 2024 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSLnUyJO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241D149C7E;
	Mon,  8 Jul 2024 17:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458704; cv=none; b=gheTHKav1OmdscMFu/RBT0FNjwcIKIfEQyTd5uG9ySSRzZsIC508jDtpSZo2O+0zvxLb0KlouPcu1v+dzb2GWVISEMW3CIz9CAOhhyYKrEG08HQ3GzrthVHDrq28MIJwZwti7LUWy7D0YfsAJVcfSxKLFrcGGY1eKJvWRawsdbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458704; c=relaxed/simple;
	bh=APOKFIr1SgMd2jyTWNlNrszt1hUq4EMwIy0rdhYMZ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAW/5j6Qw4ltYIRYPP9mh05HVjJSc2MzEV4ebNOZ/5pqcnEB2M+hi0KzaQDlyIn9KqX7IgMNUBWapNTHuj1w4NRS/zwI0Hz/IG3D0eNJ9KiwxzkcX/3fUC2mw7j7WmQYXIA7ar9q4X5X6PGKkZ4KulQ9Y64njcJibFj3qkMYzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSLnUyJO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b0e9ee7bcso2379704b3a.1;
        Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458702; x=1721063502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt0tMUEkzdV0wxc/818/AlxwGzejskA1bdOrhHyCTrg=;
        b=BSLnUyJOnUyC4JfMsGEYlEo4umt4hSGnt51yq+Rao0IB1l839D8+hln3+TxLmwj5bY
         MBDVW53Kq82LlaK9AVLeUPPt/MN/ss0wwvdCVuq2p+U6jYZ8nUBKDhhAiJZ9KCdu7OKA
         kMoqwFafo8jT4EKG8tXUVjLyuWpkv3/vt5GpGm8sJ0Nq1gkAkDC1rJVAk3TIReZ5T7E+
         HiNK1jGiZWnRIZhmFSBdr/WSik4D3ndhOAgxtqVZYnXRxuQvFeAtldFfUE7eQZRfdtm5
         I8S2J2PYKtuc/5nu31zpbUiOIIdRewDbP2yh/k6E9kFY5pfPlA0aIPXMff2Wj80h2aTA
         jF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458702; x=1721063502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt0tMUEkzdV0wxc/818/AlxwGzejskA1bdOrhHyCTrg=;
        b=UCcRF3SxpYotcuIABAxRDZoIbF+j7TPG58GK+Jwf8beRrI7kgM3PRjxVkbhh6agZ9Y
         lcxrwFWf2HG7F8VnMeieW11ZVclqZQDzfyTMi1rBNnXC8SUja4ht8T4PGFGliEcy7I1+
         eNBmJx/ig3D+epJkyXI7V3Nsq/3wcva4dZaK35Pv8MK16cLoEFoi/mUOleSQHAWWSp4J
         uK7up5lEhswLjqdJXsRjathVtTSC7MAUX9/niGiYYzpG2d/UMv6paBDPW6SdDqf/lR66
         UhH0PLu2CbzCR/3hGwtRA+iSRP3fAdFnIUcXocWMNj1sa3Zdzc5ZIded53hGODHMaEU2
         l0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy3b1q8eApq+VBOAu+qT0568TxWHLK383ndY1U8y3uaK2+YR+yf8XHnkb09ZCr/Do8vTsS/xjSjImPlPyEjq92uvkryqZCbFYcaK3ZB8AR6rOG29LPwJZFRQ2YqctRIRWi4nmycAWIWX8=
X-Gm-Message-State: AOJu0Yx8xTcPbltrTG7EIUstj3zJ6eJCMaVRob4MmFkSNjpcvAUYgVsY
	sMOcsFunS3PF9FXNZaadOp/CVI0iBHUzq1nX4hXcLj/0sBSSu8TK
X-Google-Smtp-Source: AGHT+IGjYAlk0pW4CoJmEyH/1a3UARBmiHebpaD6kWN9BLP4vvc3l+Bv+VjXM07O9HMcU6UhnE0RFQ==
X-Received: by 2002:a05:6a00:1ad0:b0:702:24b3:d036 with SMTP id d2e1a72fcca58-70b435e7827mr429688b3a.22.1720458702262;
        Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2a4:59f0:2144:2c00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b64d0sm96863b3a.189.2024.07.08.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:11:42 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:11:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Input - constify read-only struct regmap_config
Message-ID: <Zowdy6eeTEZMZyH1@google.com>
References: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>

On Fri, Jul 05, 2024 at 07:38:49PM +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_config
> structs in the input subsystem that are effectively used as const
> (i.e., only read after their declaration), but kept as writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       Input: qt1050 - constify struct regmap_config
>       Input: fsl-imx25-tcq - constify struct regmap_config
> 
>  drivers/input/keyboard/qt1050.c           | 2 +-
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied the lot, thank you.

-- 
Dmitry

