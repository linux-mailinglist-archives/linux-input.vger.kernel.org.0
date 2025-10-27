Return-Path: <linux-input+bounces-15744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD8C0F899
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 18:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7BD3B02C1
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71F9311C07;
	Mon, 27 Oct 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etsx/zfb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C72130BBA2;
	Mon, 27 Oct 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584727; cv=none; b=tNFfNN7ubcQi2KLl0KRwLo3G80aHU3OYsswNr/ub3qZR+Rmty4pbo4aTODD5+jx26vZr9rxZazfYNItSu27fppL7u3y7JMrybSbK42fdIEARKZdcHwrF4ooByt6cT2Q4Mt8krYz+1cPJNx5JTSCm5L9tET7oeVVrHqIY6Bop1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584727; c=relaxed/simple;
	bh=AO2mJ/+tjiSaEhQl/oIQeLy2Ernp7A4F4bsWfQ7Hwug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ujh9jCuQuHudbPFHYxj9zhRkCYZxv3fRkHKiFPjxX3G4RFXwk0v4A8jbT1f5vh5Gn3bjirndUeM6tnga3jIlT1CjMEgIrrwFmxJqSIzkFkOorBePFfGUtPdF4Nohsaov4mkhtbmIvnXRboOS42NalfymDXniArzxuqTTzqaTK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etsx/zfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E012C4CEF1;
	Mon, 27 Oct 2025 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761584726;
	bh=AO2mJ/+tjiSaEhQl/oIQeLy2Ernp7A4F4bsWfQ7Hwug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etsx/zfb1G5MuzgmsCQ8tvw7iX0SmmEOYLlF5Q1Cj8tSVGUaTUCsLWcH+la8PVO3j
	 Vd/vLwiZYi1+aILtGPrPzk9DHQNfDX5I0NCs2266vJVJZvtqBWnll6jbeVM/R2ZO9K
	 3717tNds0/vcV2stdN8tIptnmjPWjZdB6xvOe47VHn8wUrl7WG/dI1d64a/HLfnpQ9
	 pvTtyQcy5vJiuNU+lRXXVypm4AqI02JPGES/Jnmw1oNFk7BQTpOeXDLRSv+jZSWQPF
	 Atmwk7NCG09biz3B6AzBL0IufBpHDAEbzlJItvy9/GO5SGxI10bxSRnlC97pjYPeAi
	 9rXkdPyEdIaKg==
Date: Mon, 27 Oct 2025 12:08:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v7 1/3] Input: add ABS_SND_PROFILE
Message-ID: <vdnfmgtfclntb2xnvv7gdj65235aa2nufcsnssrkrsbdwr5wfc@ppkldnwzrtjy>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
 <20251014-op6-tri-state-v7-1-938a6367197b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-op6-tri-state-v7-1-938a6367197b@ixit.cz>

On Tue, Oct 14, 2025 at 11:20:33AM +0200, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Documentation/input/event-codes.rst    | 6 ++++++
>  drivers/hid/hid-debug.c                | 1 +
>  include/uapi/linux/input-event-codes.h | 9 +++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index 1ead9bb8d9c64..e4f065dd5a1da 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -241,6 +241,12 @@ A few EV_ABS codes have special meanings:
>      emitted only when the selected profile changes, indicating the newly
>      selected profile value.
>  
> +* ABS_SND_PROFILE:
> +
> +  - Used to describe the state of a multi-value sound profile switch.
> +    An event is emitted only when the selected profile changes,
> +    indicating the newly selected profile value.
> +
>  * ABS_MT_<name>:
>  
>    - Used to describe multitouch input events. Please see
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 7107071c7c516..c58500d8b94b5 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -3513,6 +3513,7 @@ static const char *absolutes[ABS_CNT] = {
>  	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
>  	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
>  	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
> +	[ABS_SND_PROFILE] = "SoundProfile",
>  	[ABS_MISC] = "Misc",
>  	[ABS_MT_SLOT] = "MTSlot",
>  	[ABS_MT_TOUCH_MAJOR] = "MTMajor",
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 4a9fbf42aa9fa..962168c661ccd 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -879,6 +879,7 @@
>  
>  #define ABS_VOLUME		0x20
>  #define ABS_PROFILE		0x21
> +#define ABS_SND_PROFILE		0x22
>  
>  #define ABS_MISC		0x28
>  
> @@ -988,4 +989,12 @@
>  #define SND_MAX			0x07
>  #define SND_CNT			(SND_MAX+1)
>  
> +/*
> + * ABS_SND_PROFILE values
> + */
> +
> +#define SND_PROFILE_SILENT	0x00
> +#define SND_PROFILE_VIBRATE	0x01
> +#define SND_PROFILE_RING	0x02
> +
>  #endif
> 
> -- 
> 2.51.0
> 
> 

