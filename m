Return-Path: <linux-input+bounces-15737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8227C0E99F
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 15:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B547F19C1AF0
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B059A30B512;
	Mon, 27 Oct 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbBxtZHl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CF296BB6;
	Mon, 27 Oct 2025 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576554; cv=none; b=C/ns/iT4f9/YtTMWKflcnihNondq9D4WxBtVQ7HSevJL/0Glo7bqQ0ECANDRQFi8dAm5rhqBu7Q4yYKE2asXTWX2I5sUGlNeo6XCw//ImakflGLtbwwQgTN5zzgx+U+w47Y0LqZZFQx2LFY0Q51Y+eggN0O3GoGV8zZHJyw0j4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576554; c=relaxed/simple;
	bh=LKPXVhbMLyJFUAhnFO5LZpjuc3Rzz6MeJrFVEJFp7mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbXmIkaG/6vWqgCg4rrgjeTPRZoQZv3/3Zdtew7yB8gEU92MXQVDTALKCbAJEs+A38km2cJhrl1kIOPzZR0oxOVAAorc0q5K+f1G15GIs6p9G304F1Wb0oMpUNZdW7XuLuY7tgEccgv0khb7wNcsswbwLxHQFtKYUhLCJE6PUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbBxtZHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3858C4CEFF;
	Mon, 27 Oct 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761576553;
	bh=LKPXVhbMLyJFUAhnFO5LZpjuc3Rzz6MeJrFVEJFp7mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbBxtZHlvX/bylN0gO7RmgmI1dJ6TVW/yV6mzrZWNpynfqPhTZR7w1rQHJeKICXh/
	 UGBdvZI6obJHTrEqqiFRO3IgxxPU9bt2jPQBVWLxaQGxMgJY1OFkigiE94tqhx2sqp
	 rmDp8Y1v3g6y2x6ajwN2A76WojDYI/ck1l3t12c+yJrKa65Jg4SARDjvtviAVCy5tA
	 9MJp4a3/SXseyXzwUS860jqERdID2eSU2zt6OjEuCuhXZqYlqMfA5cUez7k+3SX5GF
	 opGzvvC4/hkZMWW0PEeCwVTzrXX3aMiZomZlqivHX54FGqm5HIUbAuFay5h4+vfcYp
	 90cLX1ygDjgrA==
Date: Mon, 27 Oct 2025 09:52:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v6 1/2] Input: add ABS_SND_PROFILE
Message-ID: <rdryhql5vrjckh2yvcgbdcnlu2f4aiq6hbokgfzvrtdu33lp5u@fctqxdftabsy>
References: <20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz>
 <20250731-op6-tri-state-v6-1-569c25cbc8c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-op6-tri-state-v6-1-569c25cbc8c2@ixit.cz>

On Thu, Jul 31, 2025 at 11:17:01PM +0200, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/input/event-codes.rst    | 6 ++++++
>  drivers/hid/hid-debug.c                | 1 +
>  include/uapi/linux/input-event-codes.h | 9 +++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..d43336e64d6aa4fe8a41b7e9947f4f214df6e1ab 100644
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
> index 7107071c7c516af48c0c5fc1206c1e01bae3889f..c58500d8b94b581e41ae098d6ce99db7783986b7 100644
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
> index 08cb157ab59364a41ac425fc9a4ea8eb2fae0e86..f443f61f9bb8e3c212da522d9b99a386a13c4475 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -875,6 +875,7 @@
>  
>  #define ABS_VOLUME		0x20
>  #define ABS_PROFILE		0x21
> +#define ABS_SND_PROFILE		0x22
>  
>  #define ABS_MISC		0x28
>  
> @@ -984,4 +985,12 @@
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
> 2.50.1
> 
> 

