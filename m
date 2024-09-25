Return-Path: <linux-input+bounces-6721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F5986812
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 23:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62001F23ACF
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E101741F0;
	Wed, 25 Sep 2024 21:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eruObcYr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EC1714C6;
	Wed, 25 Sep 2024 21:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727298432; cv=none; b=HPh06YEDfKYWI+20iSXahQmmDXTEyVewVqmnh4mCI+wtoZu1OeoHu3iJYkvGQR+wERmWSuZUCX84ACKgh5OMNUR5Y3hewLLSIfV+5zLFIZb/7dDhh/gP6NaiHHdAlQq3jQUIHWUUNtRvhqhBc65Xbq54+NiKLnZWGvackkXkG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727298432; c=relaxed/simple;
	bh=vg0Qbh6dRJHvsnKUbYwHG6ZblNViGT9pGTEnf3e+Ox0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jE/EV1quxvWdGzxkq/eWcNwbk+ITwbequdAhtpFW4aFuR8r6FJWZ7Gy5w2Dy4/UpqaA+8UJx/QTNzeKxpbuefnsbgd7ldcraA2MeyJ52oA6dLeecaXVHkSqBT/fYcI8s+p0430mksUu1zMOTAb2iN1aNnvAg78xhni14I7VaEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eruObcYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D681C4CED0;
	Wed, 25 Sep 2024 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298432;
	bh=vg0Qbh6dRJHvsnKUbYwHG6ZblNViGT9pGTEnf3e+Ox0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eruObcYroKITrx3RC1p+AI1vJ5f/xVq1TubrwhrXfNMrBkwa+rrktt11XzjMEnPnW
	 +F4tqXo0DdVKyscXVakDYl+P/83OLSkV7Qv5D0wumGreWanrgv70TqvLBKyunxBXcY
	 IZSk4P7wxtVV3GyJp4Zg+HUyYhqnkxL8JoA3Ex4fdthgK1bHD79Y71/+jc9DasU20h
	 DJv5zWb88debvkTfRMi3zriSWkUYl8vJl+ZLHNc37v1ShbOGSkF2JQ7Sd/sv/LX++S
	 yir+tsjCKFa7Q4MpJ5b/d9ZujgBCPBpkLuvCQVl1/4UH58lc6Pf/dA/6ZdACrkTd7T
	 7GM2PSi2r3rkA==
Date: Wed, 25 Sep 2024 23:07:09 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Charles Wang <charles.goodix@gmail.com>, linux-input@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: input: Revert "dt-bindings: input:
 Goodix SPI HID Touchscreen"
In-Reply-To: <20240925194921.18933-2-krzysztof.kozlowski@linaro.org>
Message-ID: <nycvar.YFH.7.76.2409252306420.31206@cbobk.fhfr.pm>
References: <20240925194921.18933-1-krzysztof.kozlowski@linaro.org> <20240925194921.18933-2-krzysztof.kozlowski@linaro.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, Krzysztof Kozlowski wrote:

> This reverts commit 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID
> Touchscreen") because it duplicates existing binding leadings to errors:
> 
>   goodix,gt7986u.example.dtb:
>   touchscreen@0: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['goodix,gt7986u'] is too short
>         'goodix,gt7375p' was expected
> 
> This was reported on mailing list on 6th of September, but no reaction
> happened from contributor or maintainer to fix it.
> 
> Therefore let's drop binding which breaks and duplicates existing one.
> 
> Fixes: 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID Touchscreen")
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I've applied both patches now and will expedite them to Linus.

Thanks,

-- 
Jiri Kosina
SUSE Labs


