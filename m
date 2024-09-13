Return-Path: <linux-input+bounces-6498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372C97822C
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 16:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD2061F25BA2
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 14:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA481DC054;
	Fri, 13 Sep 2024 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJRJTIgR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A31DC04D;
	Fri, 13 Sep 2024 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236233; cv=none; b=dtyFRW30uzqzzBKo+Mxj2+muA8VbytMUZBCiNXDkQw2/oMymbNgWYM1jbYFd74UJw40c06haX6jJvE3MJ6yL1/58Suyt5OX5gWQHRCh/M0HI84xrmJsMrMS7FXzqQYCtsdStvntGP8s0jTmmDYj33fmbTBA8gM3X4jNer5Y2SY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236233; c=relaxed/simple;
	bh=wwF+X0mc2AN+PZKJgNZ320Blh/Ek4njmjetukD9wYgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ba+r1MGP0oAsOxTwhQJVeOcSD6WFISkcqDy/kD4pUbfl9cNB5Jt1avrMRqO1XD/yrEal5l/v9Or4oJiwq6fYLyckCu3HGal76szvPQxARaVvOC9oalYqmmNLnacOcF552ac1lb6SoP02kAeRasyPaZYL2doLlNIwqW8eElZz2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJRJTIgR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87488C4CEC0;
	Fri, 13 Sep 2024 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726236232;
	bh=wwF+X0mc2AN+PZKJgNZ320Blh/Ek4njmjetukD9wYgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJRJTIgRt45tU47FY8CnJUXmeOjZ2j2ugpdu7fYc5uwtkyLiyikYJDjXI6GcKmWDb
	 FkPbkv0IF5lC1/aCafSlvCXJpEwpFDgORD7nleB4t0xivBLcgo7Yhm+3GQLbusCI1J
	 5OKsWQ33+aCeWe+4+zo8A+T4/7Ka/LlYkkmo/8Km4ZLQJUSoP8ZeFyRzVuYLvboWfz
	 Z811dG6ZIVhAVSiuPwOvG1pvCBSPKNER2t9hg1D4yfi9yA0JISCgw+/Z/TvynyC8Pl
	 +slJN3g99T1ZxbHBDhUYEYre/db71TTYruIZRhBpfEnsKiwTDiz1rdRvJS0YahOPiu
	 5H+EF1kVPOuGg==
Date: Fri, 13 Sep 2024 16:03:48 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Wade Wang <wade.wang@hp.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
Message-ID: <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
References: <20240913060800.1325954-1-wade.wang@hp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913060800.1325954-1-wade.wang@hp.com>

On Sep 13 2024, Wade Wang wrote:
> telephony page of Plantronics headset is ignored currently, it caused
> micmute button no function, Now follow native HID key mapping for
> telephony page map, telephony micmute key is enabled by default

For which devices this patch is required? Is it related to the other
patch you sent today? If so please make a mention of the concerned
devices and make sure both patches are sent in a single v3 series.

Also, have you tested this change with other Plantronics headsets? Where
there any changes in behavior from them?

Cheers,
Benjamin

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-plantronics.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
> index 2a19f3646ecb..2d17534fce61 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>  		}
>  	}
>  	/* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
> -	/* 'basic telephony compliant' - allow default consumer page map */
> +	/* 'basic telephony compliant' - allow default consumer & telephony page map */
>  	else if ((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
>  		 (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
> -		if (PLT_ALLOW_CONSUMER)
> +		if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE) == HID_UP_TELEPHONY)
>  			goto defaulted;
>  	}
>  	/* not 'basic telephony' - apply legacy mapping */
> -- 
> 2.34.1
> 

