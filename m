Return-Path: <linux-input+bounces-6253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BAC96DC9D
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 16:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBE71C21075
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 14:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118C413BAE4;
	Thu,  5 Sep 2024 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUDElVvp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF3212D744;
	Thu,  5 Sep 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547913; cv=none; b=Spap22hqMn/iOnlgqhU15AenEdBeYG9XdfqEepfY68bYo4kw0+JcKQcw2dxsqRraJ6iiZTgne/XilyvExbaR/WdQNY+QMBIeyoIHGIIK0gYvZGehlR4R/FC9G55Dl40t90OFRD73xRXDm0n62Wq4R4tRVdCchu1upe1i9gEcoAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547913; c=relaxed/simple;
	bh=N0d2mJRWgRXzrbGvKWjRFhDjBODQMq/WvMS8CuDFjWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL94WDVtXkQ5mMs1WKoUc9uoF/5yxWv6obvemAmBzzAvUdZr8Ho7ncCe7mWqgLJ0wlcoYxMffnLXJGsSWK0sOwE4lrt/5/bLFEQJSt8kSDiTqUZP4YxdKq/GRw1QmJrYrnnHVxJWZaF0l/muoGMguqdcZ9WIoOkHkzT86yhv5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUDElVvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA5EC4CEC5;
	Thu,  5 Sep 2024 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725547912;
	bh=N0d2mJRWgRXzrbGvKWjRFhDjBODQMq/WvMS8CuDFjWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUDElVvp7iijifLplsp06Oeubx7jv5yvltau1NqV2JpvuKV+eu9iQNQlR2zYe5XkP
	 HBsYTJL0VvMHyXCo/gnsD2WXkp4Xi6KkWIQPMBsGWKH0rpA06fynXmjS1X08DXDQ98
	 5eRayCTUDSkT943AojkS2PmvM3QyYISmu0aKRj+Zn4rXe/u5a/OL+whFEA/3Df6Igy
	 8lHr4EBXX0a09+6/vOPeG0mfkLzFrat1uhToKdMRTWfothIhaBdRZKNkgQp1IAuFmD
	 9zrpsyY6F/93j0lYDmw+HAFv23L2zX5o/ut0fWaHeO+IzLebC5ku7yN+ZuPUUE5aoQ
	 BoFpyLebP63cg==
Date: Thu, 5 Sep 2024 16:51:48 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/14] HID: lg: constify fixed up report descriptor
Message-ID: <66uyx73trgi4m5iybuee5ka4vbulh433o4jpqc4uu4teaflaex@av7xsfwjypy5>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
 <20240828-hid-const-fixup-2-v1-13-663b9210eb69@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828-hid-const-fixup-2-v1-13-663b9210eb69@weissschuh.net>

As you can see in the b4 reply, I've now applied all of the patches but
this one. Please see below.

On Aug 28 2024, Thomas Weiﬂschuh wrote:
> Now that the HID core can handle const report descriptors,
> constify them where possible.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/hid/hid-lg.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
> index a9be918e2b5c..c1feeb1dd077 100644
> --- a/drivers/hid/hid-lg.c
> +++ b/drivers/hid/hid-lg.c
> @@ -58,7 +58,7 @@
>   * These descriptors remove the combined Y axis and instead report
>   * separate throttle (Y) and brake (RZ).
>   */
> -static __u8 df_rdesc_fixed[] = {
> +static const __u8 df_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),                   */
>  0x09, 0x04,         /*  Usage (Joystick),                       */
>  0xA1, 0x01,         /*  Collection (Application),               */
> @@ -124,7 +124,7 @@ static __u8 df_rdesc_fixed[] = {
>  0xC0                /*  End Collection                          */
>  };
>  
> -static __u8 dfp_rdesc_fixed[] = {
> +static const __u8 dfp_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),                   */
>  0x09, 0x04,         /*  Usage (Joystick),                       */
>  0xA1, 0x01,         /*  Collection (Application),               */
> @@ -172,7 +172,7 @@ static __u8 dfp_rdesc_fixed[] = {
>  0xC0                /*  End Collection                          */
>  };
>  
> -static __u8 fv_rdesc_fixed[] = {
> +static const __u8 fv_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),                   */
>  0x09, 0x04,         /*  Usage (Joystick),                       */
>  0xA1, 0x01,         /*  Collection (Application),               */
> @@ -239,7 +239,7 @@ static __u8 fv_rdesc_fixed[] = {
>  0xC0                /*  End Collection                          */
>  };
>  
> -static __u8 momo_rdesc_fixed[] = {
> +static const __u8 momo_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),               */
>  0x09, 0x04,         /*  Usage (Joystick),                   */
>  0xA1, 0x01,         /*  Collection (Application),           */
> @@ -285,7 +285,7 @@ static __u8 momo_rdesc_fixed[] = {
>  0xC0                /*  End Collection                      */
>  };
>  
> -static __u8 momo2_rdesc_fixed[] = {
> +static const __u8 momo2_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),               */
>  0x09, 0x04,         /*  Usage (Joystick),                   */
>  0xA1, 0x01,         /*  Collection (Application),           */
> @@ -333,7 +333,7 @@ static __u8 momo2_rdesc_fixed[] = {
>  0xC0                /*  End Collection                      */
>  };
>  
> -static __u8 ffg_rdesc_fixed[] = {
> +static const __u8 ffg_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),               */
>  0x09, 0x04,         /*  Usage (Joystik),                    */
>  0xA1, 0x01,         /*  Collection (Application),           */
> @@ -379,7 +379,7 @@ static __u8 ffg_rdesc_fixed[] = {
>  0xC0                /*  End Collection                      */
>  };
>  
> -static __u8 fg_rdesc_fixed[] = {
> +static const __u8 fg_rdesc_fixed[] = {
>  0x05, 0x01,         /*  Usage Page (Desktop),               */
>  0x09, 0x04,         /*  Usage (Joystik),                    */
>  0xA1, 0x01,         /*  Collection (Application),           */
> @@ -431,6 +431,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		unsigned int *rsize)
>  {
>  	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
> +	const __u8 *ret = NULL;

Not really happy about this, usually "ret" is an int, and this makes
things slightly harder to read.

>  
>  	if ((drv_data->quirks & LG_RDESC) && *rsize >= 91 && rdesc[83] == 0x26 &&
>  			rdesc[84] == 0x8c && rdesc[85] == 0x02) {
> @@ -453,7 +454,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == FG_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Wingman Formula GP report descriptor\n");
> -			rdesc = fg_rdesc_fixed;
> +			ret = fg_rdesc_fixed;

can't you just return fg_rdesc_fixed after setting *rsize, like you did
in the other patches?

(same for all of the other branches)

>  			*rsize = sizeof(fg_rdesc_fixed);
>  		} else {
>  			hid_info(hdev,
> @@ -466,7 +467,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == FFG_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Wingman Formula Force GP report descriptor\n");
> -			rdesc = ffg_rdesc_fixed;
> +			ret = ffg_rdesc_fixed;
>  			*rsize = sizeof(ffg_rdesc_fixed);
>  		}
>  		break;
> @@ -476,7 +477,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == DF_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Driving Force report descriptor\n");
> -			rdesc = df_rdesc_fixed;
> +			ret = df_rdesc_fixed;
>  			*rsize = sizeof(df_rdesc_fixed);
>  		}
>  		break;
> @@ -485,7 +486,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == MOMO_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Momo Force (Red) report descriptor\n");
> -			rdesc = momo_rdesc_fixed;
> +			ret = momo_rdesc_fixed;
>  			*rsize = sizeof(momo_rdesc_fixed);
>  		}
>  		break;
> @@ -494,7 +495,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == MOMO2_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Momo Racing Force (Black) report descriptor\n");
> -			rdesc = momo2_rdesc_fixed;
> +			ret = momo2_rdesc_fixed;
>  			*rsize = sizeof(momo2_rdesc_fixed);
>  		}
>  		break;
> @@ -503,7 +504,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == FV_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Formula Vibration report descriptor\n");
> -			rdesc = fv_rdesc_fixed;
> +			ret = fv_rdesc_fixed;
>  			*rsize = sizeof(fv_rdesc_fixed);
>  		}
>  		break;
> @@ -512,7 +513,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		if (*rsize == DFP_RDESC_ORIG_SIZE) {
>  			hid_info(hdev,
>  				"fixing up Logitech Driving Force Pro report descriptor\n");
> -			rdesc = dfp_rdesc_fixed;
> +			ret = dfp_rdesc_fixed;
>  			*rsize = sizeof(dfp_rdesc_fixed);
>  		}
>  		break;
> @@ -529,6 +530,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		break;
>  	}
>  
> +	if (ret)
> +		return ret;
>  	return rdesc;
>  }
>  
> 
> -- 
> 2.46.0
> 

Cheers,
Benjamin

