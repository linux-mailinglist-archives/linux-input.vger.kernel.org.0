Return-Path: <linux-input+bounces-14078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE9B295FD
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 03:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9978020204B
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 01:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0527205AA1;
	Mon, 18 Aug 2025 01:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPThXPig"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607F20ED;
	Mon, 18 Aug 2025 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755479007; cv=none; b=IMxqFRG5A/9hEZzbNOpA+3wdM7wplzTRG9Dpqg0TTPPXVDAJ2m1uHhWS3EhTIArIMBj5qwDTpI5DcFnthHyWny+AgOkaYElcSkRRVvHqGPm43PVewmZ8UJw3SdllvV/26VeNMnoC+xlATbVjsiU2d5VBfB3+RTfY37PVtDEpAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755479007; c=relaxed/simple;
	bh=lPWkM6/aGOC82OFr+CdZicGB7D5qUtsPzKDzWM+gvAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6LxrYl87n8U1on8nEFCPLfe0REOBJBJBEAdIGkuC9D3iUwKAi2ITUsv4bPyh3p2aUg+cylO/OkYJeWrX7mJv/0s57jClTrMpPC8q7jNMwsuQApXPGE4TQ76BLsqyiOt20oEJUgnm7vTU4GMw5aI92PkGA21Hjef4AFFlWTi6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPThXPig; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-321cf75482fso4090345a91.0;
        Sun, 17 Aug 2025 18:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755479005; x=1756083805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYwZB/8iXqdOiGxYCeYKtVmTqeIoc1DG08tofpYl6z4=;
        b=NPThXPigXVFyViKKKnbwfowK7hsL58eNcPKwrHJWdKiA4RYOmhWlsHSK3dJ/SDvLZX
         cCk9v1aqWaODVNrpaVmhFxc2/LYqhnqvIaWtkQfZXNIdD8jHA4IpmQjkBUpUw+egM6IC
         2Soeanj0Kf2R+jLSkrpo8ZNx7BM/Qyq3DoNpeHHEdgMZfX3clbiT+LydXV3SlrSOQVhr
         T6QSDCBNwOyiyirxw1/uGlXgh/nCIN1DMwGRRhoFSlnGxzloIBQHc3Ewck3PK4vhJfJ4
         uu7F8v4ifhATNAOitSOzhOAVjTO1AdVoG7shjqw3GwCQaX8+VTwfXlCVx/Gg4nh+pTh5
         7UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755479005; x=1756083805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYwZB/8iXqdOiGxYCeYKtVmTqeIoc1DG08tofpYl6z4=;
        b=JMa4voRiQSL/ztzhH/ipoLJrxOhxUsuu2RIdSXUQOAo21wU+vq/k/ZKIwCpd/9gSrP
         JbGTE5oW35XQLFxH729h+BAWhwtf2P7Olu/CMk/NWiZNMRlopSTAenQz0xcZ5I7T6SCg
         4gqUbBRKFdz+QTIdawAA1r6C0HCB/8raB1CI3YOqfzr0aVI//CPa8MABn4yXvBcbu1Gc
         v0eHcxQBW16giJtkc8spX9CKdgT07GfHtjO9km/hKj81bZD0PbeyT/1+3HhF/HKd0waM
         R87PEkZDwQpYDH/9gCmUUW0/caO5rBpAtciEC89XgV044z7XMZxxHjbr5tJB7e7qIFVC
         hMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8/XsXmtYMEMRPtN7sacfDAyClb5LcT/tebJuuVpUscEJsngJ0Bc0QxLZy/eZiajw9x3vnfjeVMU92dY=@vger.kernel.org, AJvYcCXbSMBaBAQlw9e/ZIusTJB72ZvbvZoj1S+bJavOmi3BegFUxyBBQzxxzmDVztYkMX45FfQ85kBG3Hqa6eF4@vger.kernel.org, AJvYcCXiF+1bvoJA+/n0U887Q8cEZbEJNYRURAUHB3LNr6l8nUNA9wN5AqWuGUMizG227+/FfYGz2qS51/aH@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxSFz1fI8qA/q+oq/f8rRCdWJe7oQTVx1FHTPXwEaOF2lmtZk
	ODMq8LEoNzS9+++JN97Z/1cb6wGniyWj9Z1OBhM7w6bRsJqZweD32MSUZfDREw==
X-Gm-Gg: ASbGncu6CGxTDtNj+WEMBpva2pKJob1o2rDj78k8pwCFLBC/Tl6mnwGG6yBPiEZqn+q
	W0/l2auD5fvUsxbinh/qvE+UOFwYpomz3RDbE4wArrYkOZijUm9NjmcRNfxiLc8HKE5bsTNGSgO
	3hdIygjTlmWivjZgEuS/ypP7NidMgQwia4ExOHzT7/uT9awaB901KLkUJH2XmQDXHD9CIqSOG1P
	MnAiYaeJxJJAztwuAc77AgL8uT15oLV/bNinuWUcHpqeJZBed1633571QWwHx4xIqMf7BQaqpxs
	phdanps0ZHjzXgqxj31Nl2Nxl1nbDDs+rrhiVNlFegYDogi/y7wwfDHsoD9driiROymWit0VvxY
	P/7UlO3CFT6k3+N6KjtzHiA==
X-Google-Smtp-Source: AGHT+IH0ywCqTDaTPt0HtiECHGQvjnjnnZey9w6/K0zpNKk7zCfmG+nuIjSSnBPTkE6xxC7lG8kb1g==
X-Received: by 2002:a17:90b:3b4a:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-323402c9ee2mr14424015a91.2.1755479005424;
        Sun, 17 Aug 2025 18:03:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d602713sm6726707a12.27.2025.08.17.18.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:03:24 -0700 (PDT)
Date: Sun, 17 Aug 2025 18:03:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Heiko Stuebner <heiko@sntech.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] Input: mc13783-pwrbutton: add OF support
Message-ID: <si3wootxtnyuurqarxudvflzoblryhrlgan5g2x7rip6aq5v3e@zoy2dcswd2lk>
References: <20250817102751.29709-1-akurz@blala.de>
 <20250817102751.29709-7-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817102751.29709-7-akurz@blala.de>

Hi Alexander,

On Sun, Aug 17, 2025 at 10:27:50AM +0000, Alexander Kurz wrote:
> Add OF support for the mc13783-pwrbutton so that it can be used with
> modern DT based systems.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 78 +++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 49bc5d25f098..11a97ce070a5 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -29,6 +29,7 @@
>  #include <linux/mfd/mc13783.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>

Please use generic device properties API (device_property_read_XX()).

Thanks.

-- 
Dmitry

