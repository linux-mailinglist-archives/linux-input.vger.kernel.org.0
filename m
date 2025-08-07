Return-Path: <linux-input+bounces-13850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B0B1D177
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 06:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105241AA166B
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 04:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61701E1DFC;
	Thu,  7 Aug 2025 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0DJwjlL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456218F6E;
	Thu,  7 Aug 2025 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754540959; cv=none; b=Ny1r9HS5nB193ztwGUmfqaN2xGntMMYnf0nenYAkqmhQQoJ2JRWYo3ysyLgcUE6kCUAfgQter5OCKnLMKPuBOcC7M29RoJonxaL+UdlHQr7YcWi6gc8/KosGI1D3LvKLaTr6KNZsUXFiCBHYCiFiNWe9SmkXu8TAaBPG9qXchpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754540959; c=relaxed/simple;
	bh=Rqs7qqQtk1AFIV8i5FvyH/sbeMnqewCvwMdL0VhH/Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvGxYaMXpKVIU37fQihbT7wc0WLcytmiHbThk9jEzeGKGgoOvYdFra3Ww5/pd+MotTiAqQtQt0Zd5M7L9XAOkknUbo0itk+IVQCxOc0vmqxj+D53KiicCtNMCV3SyY7U+UXijU6eQbgXNxWZOG6ALy/pDa4NI8IXdBolu1fTFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0DJwjlL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2407235722bso5529485ad.1;
        Wed, 06 Aug 2025 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754540957; x=1755145757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLjoW/JR7SYyN82M64yJPv3/KhQEznxNWUu4jcinAK4=;
        b=T0DJwjlL0FhR0Jkb5i5uY63i5XL9Fdv7K4xSeTxePdjgWdSW9xQPj6SHLesMnnx1A7
         +ebeJA8GGCbCmXIEIXpygKdFN7fz1TBUV58APF63zjQOOlvexYxuOhYMD15N5Ex9iAbY
         1SlwBx+oW/soCDY4cZSix7i9B5ALwd1gr04O/vRUdGLoYG1EECu3vluHOGAyRSANCLTT
         as00y3Z62IqhW5jVtkLKj9Jq3GiOk6PcyTkKrt+n6+hZn1nr27oaFnClo3ZqE3pK38CU
         YUc+O6STXtBSAGceE/E2quOURXpuEODLI7D/Z4OS2OScJCRMKcOytcSiOU98Xfjp/6Y7
         IslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754540957; x=1755145757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLjoW/JR7SYyN82M64yJPv3/KhQEznxNWUu4jcinAK4=;
        b=dfnNRfeKxpnJ9pJBPdxg+A0lgffWjyG4uKJPYpHwTaS0OSprhI0J8kypacGd46neIC
         Qn8puJ61FcTwmPA6CgKbyezn+Tf3+VbSbKHD6XFqZVA8orvzbRY+5BR0bmuCcuuJkmtn
         OvsCpOuZZmBES1g8paXQuiCqkRgkGrnXzbjpnvORvE70u4wwQQQjxM6HdGu+t3zB3Hqb
         PC53IZeQD3Ymi6lWWZl8kyZkElwp4tnjecwE6n1BMxJeB3brkj4wghwDQEvJtDdtN2vS
         k7+x1U1QwTaoF2dllg7yfbq6+lIB8bu1RpnD0yfz3He81EvQm2vXDTvAEZrhYwshgaee
         K7ug==
X-Forwarded-Encrypted: i=1; AJvYcCW0n5qnNEWF7Eog1WxY2QbsgIv0v2Jkmfbso4Djgzjaa/YOqwLja5gBOMuhRCkTaUftTZV+Un5Kulo4BWU=@vger.kernel.org, AJvYcCWPb6UmkJ6ubzKqzDLjN3+lLaSOPqM9kXnpERVjpcV33waoCXTBTpDPkLHM2iWq+uiRostVsvJ1QKvW@vger.kernel.org, AJvYcCWXInNj2BS9NnxUe8KdkgciT/Za+UOTvzC4SOwuZE7eV2WBwYhotzC2aK7w/FmH5tQkTwjY45r/V5zsmK5L@vger.kernel.org, AJvYcCXXKrxtvlUQcflBHojyns4jeEmICzq24lMtOzDLk/k5HgOXdjWLdeh4CUj7t5ed4+h+jkvxa2br6uRMRYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNovoiL2TjtK0+h0n9DgJCmG9JjBvj1WZbfHwxyFchyI+K2Ciw
	yGdpdJ4inik8+wRczwG9jiW8hXWRxVI046+2iGLSzIc2h7WUGzCfPViN
X-Gm-Gg: ASbGncuA06lNrWDmQ1bErR52/CzCij01Qat5/T499SW6C+XYSdqU7SD0L1u7qhukDtH
	Cy/FjJHFlT55FjsWd5DDr5Tvc0i5PlItTFzggIJGnJRTj1lDYdFhbCgxxBt+JUbBbz70A2BIRHt
	YtRU880pyi/aio3GMH2e+IcD2Vj+iFF10xbQ4Z87TfjqxoiH3Om7W9D8HShzxbTjg4q7jqurdPC
	wzbcB9va5qO9zheYP4GhaGM872Ww+fpt5vcLsoUJge/R4K2r88namNvm/xrW1oxchkGJmP2+a16
	N1TNVhuEtGhX4h/n7VNWWDqTOHd7fORs3RH6PkGIT3GPCA5Lv6I+92YmcEVBj/KWOWjKorI9iSI
	qcrxLoGbXfjgg/zs3hFCiAYM=
X-Google-Smtp-Source: AGHT+IH7Ykgv5OaxQo1cMX7bcE1ucqXXe+QxvHYtt8i6uHT6Rug4kEWpU6ysRLV/oIs0MlSvGS3Yag==
X-Received: by 2002:a17:902:ec92:b0:238:120:134a with SMTP id d9443c01a7336-2429f4380d2mr84511455ad.22.1754540957372;
        Wed, 06 Aug 2025 21:29:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1dc7:76a8:a227:b1c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaaf05sm173046435ad.162.2025.08.06.21.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 21:29:16 -0700 (PDT)
Date: Wed, 6 Aug 2025 21:29:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Casey Connolly <casey.connolly@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 0/7] Input: synaptics-rmi4 - add quirks for
 third party touchscreen controllers
Message-ID: <aggtzmlxvj4so6t7trlo5ianjcbq2jrsodv6hlkhtrvgl2qpqj@gflvqocxjckb>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>

Hi David,

On Thu, Jul 31, 2025 at 11:06:50PM +0200, David Heidelberg via B4 Relay wrote:
> With the growing popularity of running upstream Linux on mobile devices,
> we're beginning to run into more and more edgecases. The OnePlus 6 is a
> fairly well supported 2018 era smartphone, selling over a million units
> in it's first 22 days. With this level of popularity, it's almost
> inevitable that we get third party replacement displays, and as a
> result, replacement touchscreen controllers.
> 
> The OnePlus 6 shipped with an extremely usecase specific touchscreen
> driver, it implemented only the bare minimum parts of the highly generic
> rmi4 protocol, instead hardcoding most of the register addresses.
> 
> As a result, the third party touchscreen controllers that are often
> found in replacement screens, implement only the registers that the
> downstream driver reads from. They additionally have other restrictions
> such as heavy penalties on unaligned reads.
> 
> This series attempts to implement the necessary workaround to support
> some of these chips with the rmi4 driver. Although it's worth noting
> that at the time of writing there are other unofficial controllers in
> the wild that don't work even with these patches.
> 
> We have been shipping these patches in postmarketOS for the last several
> years, and they are known to not cause any regressions on the OnePlus
> 6/6T (with the official Synaptics controller), however I don't own any
> other rmi4 hardware to further validate this.

Sorry for not handling the patches in the last few submissions. I am
planning on addressing them once merge window opens.

Thanks.

-- 
Dmitry

