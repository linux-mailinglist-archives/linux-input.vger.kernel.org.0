Return-Path: <linux-input+bounces-5678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BE957208
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 19:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD4B428256E
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 17:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68D817A591;
	Mon, 19 Aug 2024 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqt4qjua"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46813BAD5;
	Mon, 19 Aug 2024 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724088115; cv=none; b=iSbi75VohubR9KFh5AePyWSxnPBh0PZg04/PvxeQwwjy/wEnm97N1haXCwTbBU8OjdnJz5cHLnsbbvWGDGh0mEVIZ/qWAlsn4Sr4IbgtnBso8a5OPUZn1g4PWrKD2bkJ19Nng6IE7rvhTSf2FxxNCcoQrYcvx/Dwu8WgEmYgxD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724088115; c=relaxed/simple;
	bh=Nmz0iBI3HX19F5MOevl1YOsm9XNiw/iRArvFfhyVwAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPFb+HPm3o0Yr+lIkWSSSNVpsjE7zyn2GIEfPbn3r+U0UNDN0ahzhz28PLQuxDRCYGd7FV/Vn36uzpoZOHq+EgRy3rZCDt+1hDkK6O6vT40CxFn+e6xg8bi9JnK9uBSAyGS6xb9CPx8s7ZlI17v80/4tlQiLFNY0c8Tsj++H2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqt4qjua; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3b595c18dso3403989a91.0;
        Mon, 19 Aug 2024 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724088114; x=1724692914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1292ZXxDguRchN8qDs9u/NGX4Ml2NR0U7feEMuOmvA=;
        b=Zqt4qjuaDBbX1PIqbvlgibo2qwrwz804yZoQnjmemYmcPcZ3VPNIb9VN+Gkl87WNoj
         /XMvdwI8LfSI92JAkms7u5C60HIHspAVt6DiXTAZfEbPYDh4AxN89+1EIV9m8I0h5l0/
         mlvxzOT5TRA40QBV3rRrV4g6FQHTVO+gZ5RyjPZAC+Z51laYy33KIB47I2zhXMzL+lFP
         DgVsRsoabiBCi6srQqNy3AQ6ZBpxOzUrCtmd+6qN7KcWWslJvzbjtZtmUxJJiFwhI55C
         fzuDkjQ634PjZLrD/3U84UWTxMzSYr3p3BZsLq9ymwamRbQpo7GixziuSgMK1Eg9O2xQ
         TcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724088114; x=1724692914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1292ZXxDguRchN8qDs9u/NGX4Ml2NR0U7feEMuOmvA=;
        b=T1kkhWz9gda/pEzR7YY4nOLLr2rlco9zrzCNY1E9S5Sdd1bbLUEobSlrpYryZICs/G
         ikg8lpaA6SVx19oBcJ5dKaPYgrfYYpt+wkeSlMMDFZQJk/eZwjaohcLUE9uOJ/86I/yI
         l4MxtmNpDISK/42VyuCD8AM7tiqs2UMRLTmOuFeqc6e+ZIi1bV5qv18wCr067m9EMbCh
         BX9ebQqwyIxrns2bQlv5+JhpDqlynsLjd1zUha7619QatknnWOYccHknd4gkNNYhZAb+
         hqjTE6k+VwWVo4J7KQ+bVVJNQeP//wCvcvAtdY3VRvRS8W6WyLqc681rvtltwQi3RPBd
         9DUA==
X-Forwarded-Encrypted: i=1; AJvYcCWCB8jnm/jB3HMgzGRAJLWDuo4BlhQB6fTfTJ5xpt4jDRol+JOIJXpGKYNJbxSHPUBHwoqv+4IkZnKAoorq+ssddsj8f771fPnzSQaKgMXTf4/nqrc6F+ih1v2rWkOcSnj8a04ZpvTXHApLeT3GHIyQzgFjvOoMnm/MHYNpOQ8HZz9CLhyh
X-Gm-Message-State: AOJu0YyR8bmOaCkdC+vJk+DKu3gLoHpejF2I2LSr/JOyQUj6+92eAn6e
	OEzj8ZSCtJ9H8duRCTUayjWM1SaHy1aQ+rXoDpDDBLmyOy/mgY6i
X-Google-Smtp-Source: AGHT+IG1htEHXjCns67hpgxu3BGBDINNnCgB/XsfDFWkdFkrwwpy5jEpxxq0m0ZCRkDCu0CzR1ryGA==
X-Received: by 2002:a17:90b:80a:b0:2cb:5dbb:d394 with SMTP id 98e67ed59e1d1-2d4731ec386mr503184a91.4.1724088113566;
        Mon, 19 Aug 2024 10:21:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2f61fd9sm7602754a91.16.2024.08.19.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:21:53 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:21:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sanchayan Maity <maitysanchayan@gmail.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: input: touchscreen: convert
 colibri-vf50-ts.txt to yaml
Message-ID: <ZsN_LmeVJw8tyfMm@google.com>
References: <20240819142434.311760-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819142434.311760-1-Frank.Li@nxp.com>

On Mon, Aug 19, 2024 at 10:24:29AM -0400, Frank Li wrote:
> Convert binding doc colibri-vf50-ts.txt to yaml.
> Additional change:
> - add ref touchscreen.yaml.
> - remove standard pinctrl properties.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
>   failed to match any schema with compatible: ['toradex,vf50-touchscreen']
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

