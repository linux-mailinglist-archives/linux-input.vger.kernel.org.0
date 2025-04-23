Return-Path: <linux-input+bounces-11951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC649A9945E
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 18:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41656923A19
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 15:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943B27FD42;
	Wed, 23 Apr 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0f0eh/2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A092135D0;
	Wed, 23 Apr 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423145; cv=none; b=Ke8c0kmO+axNV5w/OC5U4kMOlItiqvriTFToYQHLmn3mQj01DRipfUE/FswH4ya9HxQJJzt4q5wHn6gcQz59Ez43c+H1mdyh2YKRKgIM6J7sQbVYs72Z4zawsWZ9XlIgXZMDbBneV8hpQzJRi+YMTtXK3ojqzTk+deBJPjvOCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423145; c=relaxed/simple;
	bh=uXGY1VAD0ezdy/ybNS4JN/GqOzUTWI23//dv6QmQUdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCwtNAtPOrg2q3f61In6tpOOGPWSJfb/8NkpJiMq2tW2B8xC+Q60L4zusnFTDF0O1Izj6gETnuu74d/9lHnZLKniuB4dnPxtIuDHZPCb5NC6vPXUcWsVusuUWAcKvIBswoDZzjxJOVRps3Ec2tgQ2+4dtzZFHG4rZLZkVSECzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0f0eh/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3897C4CEE2;
	Wed, 23 Apr 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745423144;
	bh=uXGY1VAD0ezdy/ybNS4JN/GqOzUTWI23//dv6QmQUdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0f0eh/2LvsfL4iutKlrnN7chSnjyw9pMqdFl73WtrDzgT2ZydtvcA8ApMRrfVIYy
	 0CZgrRPJS++EmO8LsVSliQHDPcJ4RjdLHd80VCSoQOqGK2G/sxQPoZ0XojLkat0gbl
	 X9euuD1yjltFR9FrI4sj7wt/r4snbcmpPCPgsfGpPE6QkuX0XI/6o5kEQETPqu2/NC
	 34NzBeNuKsBs5HwcJNh7E93sOIpOuLw5h5wZ4lGRL6HeCBSSF4EK6B1Vxc96zgxjOV
	 XwqUIMgq4hiEEAgxXOvGPFodHikCT0z4VCIUYX0Ma0thcWjIropdyYMZw+iZRxy4cb
	 R0dclULDW9zZA==
Date: Wed, 23 Apr 2025 10:45:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <174542314188.576994.12974029497689302557.robh@kernel.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>


On Mon, 21 Apr 2025 18:12:39 +0800, Chen-Yu Tsai wrote:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


