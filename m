Return-Path: <linux-input+bounces-6723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF49868A0
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 23:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5181C20F62
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3E3155733;
	Wed, 25 Sep 2024 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFrOOYO3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A41534FB;
	Wed, 25 Sep 2024 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300934; cv=none; b=Q0LCbOujOIxH6+ZXUUq7Es2XDB9eTlIv+/jxr8OynmBUhwRITRStZnswC5u2nXBX3mNKB3K/6Jlz2V8zAbfw1Zb391oaYLOjzD4HnQo3WrWmtmTcQFuUGpYsVmwvPqmq1UMx8XheKDsu/lZFlxNuVQQur6nzdKkJ/hpQsDFTQv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300934; c=relaxed/simple;
	bh=M5Q7dXBfnlosIgJW0H/IJ7hXVe9PaRFmnYzrF4ELW/U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o8Vf/bP39VakmLEeV/ZAyDXa0GF/yrM5Fv5KK0gOShMGVsJf7DC9VpS6S1CiK0H6g4JmKVsnzZU3BSaW9o+BUj+j/t5VEtl6fClzftQ/ghkZJhC14B8IO69QKXm7RJohypfu/fbdFktSrGYfDnh3LoF8KW6JFtyPpEqmPgLGuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFrOOYO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57846C4CEC3;
	Wed, 25 Sep 2024 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727300933;
	bh=M5Q7dXBfnlosIgJW0H/IJ7hXVe9PaRFmnYzrF4ELW/U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oFrOOYO3qKhqwd9KvZ59LbIydd/AdfWNMlOMfw+eDUk6mOaIaez+y6u+m2K0SEc0c
	 o/eZtkdJIuXbOY8HtVH0ZuE/JIEQbQnA+oy1ARNsjYwmpFArXtrmFTpuV+TQxrZHl4
	 FA11fu6hZwZfmByGg7tHaEInaFNT/MajwzTyRytiWMIAHqXVAgN4Kn+zyzr9LHeWDJ
	 DQ+eHvxvoqyIPP8ZqixKNW394aT5Xov+W/jY5MiiyxELZ4BuJvXZNT3UmWSLbV2/Nu
	 iUgqXTr7b1FNDOh4lCNRVeLWWyTE9v/BOA5upALAanbOLpAA8NI7crD8i1BeeQoXgQ
	 zcrPZEBNPKRhw==
Date: Wed, 25 Sep 2024 23:48:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Rob Herring <robh@kernel.org>, Charles Wang <charles.goodix@gmail.com>, 
    dianders@chromium.org, dan.carpenter@linaro.org, conor@kernel.org, 
    krzk+dt@kernel.org, bentiss@kernel.org, hbarnor@chromium.org, 
    linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
In-Reply-To: <ZvSEkn66qNziJV0M@google.com>
Message-ID: <nycvar.YFH.7.76.2409252347140.31206@cbobk.fhfr.pm>
References: <20240814024513.164199-1-charles.goodix@gmail.com> <20240814024513.164199-3-charles.goodix@gmail.com> <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com> <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com> <ZvSEkn66qNziJV0M@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, Dmitry Torokhov wrote:

> I see that Krzysztof sent a revert, but what a proper fix would be?
> Apparently Goodix is using the same product ID gt7986u for both I2C and
> SPI parts, and covering them in one binding is not really easy (well, I
> guess it is possible with a big ugly "if"). Do we just slap "-spi"
> suffix on the compatible, so it becomes "goodix,gt7986u-spi" and go on
> on our merry way? 

I actually see this as a viable option, given the circumstances.

However, given the non-responsiveness of the original author, I am now 
proceeding with the revert, and we can try to sort it out later.

> Is there a better option for such products that support multiple 
> interfaces/transports?

I unfortunately currently don't see one.

-- 
Jiri Kosina
SUSE Labs


