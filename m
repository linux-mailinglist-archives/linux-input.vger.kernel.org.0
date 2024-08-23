Return-Path: <linux-input+bounces-5753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5B95C828
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 10:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786291F22416
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500891448E3;
	Fri, 23 Aug 2024 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0U9E0bY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FD13D8A0;
	Fri, 23 Aug 2024 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401975; cv=none; b=oNQfDdwgurGFZY0HINo04zM74tTNkRQnX7qUKV46DJZDh0BbCb0FE5DzDf4tS/DhDqFslV9Gi+hwkoQrfPffAUNUdMiMlmZKSqhgwDDAonMbyUS/bI4emhT3OngUatA90YtEurTtRSgGQt+6KpiAifL3+9cULqLB73Bg/K0RJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401975; c=relaxed/simple;
	bh=NV8JjnDoRrxNVYgq/FNfOB/FO+JK04wojIRoTm2lX5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR17uLZcP8N37RlgA8g/bKG8atiqumxvFWmIpL7nvP3OPYD+SNscfPRJgVo8fvUHuQGBgCy+dCrJL3iSE1smZAxJwQGvccQwUwmnbMlR3dULNlfZfihGEtyyvpy9gJiQr/1gbYaye6QOQXa8B53DfVt97ZGWcD5EUHnuu+6fP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0U9E0bY; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5d5b22f97b7so1700430eaf.2;
        Fri, 23 Aug 2024 01:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724401973; x=1725006773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yp4pKPaH9PczaTr8JGBibTa2Z0QRF52/s5tchcuFGOI=;
        b=C0U9E0bYFAYT4WWhxso7ZK0VOaSBh3cO0KjWcR9mkXpn8Bwt+8n3TSA8U6U3zxYi4K
         7rITDdCg4hQQDMWe9ZLGQ59IXp5eMP02zVT4c+kOtA328Ax8ZkWSBm83+QldwSV8DeG7
         bUQM4UlGX88QPmZ6WMxYYahX6SkrTVxXwQRLC7LvqDQ7ZdkjGOPNprIniT3iqhuR7ArN
         jO5ppjJ7mZn2ydwB4lKC/rvjmQ2KKZTVy1iWXi8TlH8PNjkvs1ZYW+30SMDwPb1JkBGB
         CVW+Qb5vvYS1mziGJyEc4sUlQbFG/Cs6kqDZoPM59thZS756DIeG6wZE+Lz3AAO8lnzp
         wzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401973; x=1725006773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp4pKPaH9PczaTr8JGBibTa2Z0QRF52/s5tchcuFGOI=;
        b=iFjjkjkGXkTqIHdGvyU7YBcFBnj4UVmftvkGuVHsw00WyvDmkkz+hqVBb6siNyNrcd
         tQ78MfIqlUPLrVEwnadCCYR8o+vu0QtnzOfyTjf08JGeALpkEaJESdvb9VJta3tK6usC
         Q96ttN94jELRGsjEVdQEBuOZDleRgukGO0jbQz0afF2sWXhVLU/qeg9rYuWZT3Uovn7T
         hR9zmtuBimDWzzr7WtNmbBdE/lMaNgPlYfHN+tTgcxhFV/lhHZ1VOW08ZeT73FviqEJx
         RGVOs3xc+hL0LEHVoIAsRWTRAJR4XdCnvpCvntuvrdY8ihX2iAaiWlyW7//434Kjzg7U
         9R0w==
X-Forwarded-Encrypted: i=1; AJvYcCV7F4jsRSdadxhzc9HIIJu7Y87fwGqy5q/nl7ACqmceKLe1/39VkjhJ6t8oAkBxQGiqZsKPp5Z9LB9Dy5Oz@vger.kernel.org, AJvYcCVSbE81i4OMkPlAWmBod8n8ttX+GGclcMD9Bh2klapzJpgef2UPL0Vh6JxhQZ8DEpYasB9mbvoUyJO9@vger.kernel.org, AJvYcCVseVnVP+PFEwVLKLo8fMYnnR2+Gdhy26Js1TSxT7qCpd1G+L4gknWvdInu7KHBqzCLbJxWbVqYXtFBYbs=@vger.kernel.org, AJvYcCXywFmnvJ/2UcNa3i+fNce8OUE4lF/Z0xIBXZicD8/pxMKS4ssCKljxFEWVYZx++suJPGkZdgi0RqOSgehWd5RWHL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+sb2XhCy56+Ta2vNXXef4phcGrAsG5/LaTUI96gINsNhdoG2
	k/KGvFWVFNCwu+tXKWpIDYJLSZgZJad81l+KLH51Bzmv6rVsOt/d
X-Google-Smtp-Source: AGHT+IEsGrMIBnE5i9swqXq/Apvogdiy73ZTSN5iJnCeHN2vFAylF26K8eA1Sr+N3GDp+gdG1bTwQg==
X-Received: by 2002:a05:6358:52c1:b0:1ac:cdba:8c87 with SMTP id e5c5f4694b2df-1b5c3a4e88bmr144912155d.10.1724401972541;
        Fri, 23 Aug 2024 01:32:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ccdb:6951:7a5:be1b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acabbf3sm2265501a12.29.2024.08.23.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:32:52 -0700 (PDT)
Date: Fri, 23 Aug 2024 01:32:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] Input: samsung-keypad - use guard notation to
 acquire mutex
Message-ID: <ZshJMRCe4LvpYNmZ@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
 <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>
 <Zsd-aVM6504L_hqi@google.com>
 <0afadefb-ecb1-4ec8-a862-bfa06d171457@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afadefb-ecb1-4ec8-a862-bfa06d171457@kernel.org>

On Fri, Aug 23, 2024 at 08:06:17AM +0200, Krzysztof Kozlowski wrote:
> On 22/08/2024 20:07, Dmitry Torokhov wrote:
> > On Thu, Aug 22, 2024 at 05:48:33PM +0200, Krzysztof Kozlowski wrote:
> >> On Sun, Aug 18, 2024 at 09:58:03PM -0700, Dmitry Torokhov wrote:
> >>> Guard notation is more compact and ensures that the mutex will be
> >>> released when control leaves the function.
> >>>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>  drivers/input/keyboard/samsung-keypad.c | 8 ++------
> >>>  1 file changed, 2 insertions(+), 6 deletions(-)
> >>>
> >>
> >> You need to include cleanup.h (unless some other patch already did it
> >> and I missed it?)
> > 
> > Guard for mutexes defined in mutex.h which is pulled in indirectly, and
> 
> guard() is not in mutex.h and in general we are including headers for
> the things directly used in the unit.

Oh, but it is:

https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))

> 
> > cleanup.h is included there.
> > 
> > If we want to list all the headers that we need instead of relying on
> 
> Fixing existing code is another thing. I only propose to add new code
> with the header.
> 
> I don't have strong opinion anyway, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

-- 
Dmitry

