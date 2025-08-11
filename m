Return-Path: <linux-input+bounces-13927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD939B218CA
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 00:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BC18422802
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 22:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A09199FAC;
	Mon, 11 Aug 2025 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHicsXSq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD979228C99
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953006; cv=none; b=oVVJXc3penLByBYqtJOaS4X+o/NQFcy1kJIBpOXZOCa7oUR2LtnvIsuymCW7JXGddXGfKumOdt3Rgo95kPfnenvuFKVe0zMKtqNqca8JaWXl1JwaZy+ZvVvd8aHJNIokzNH4I3MPK1LeAWrXmayVbwqZ2eakah0Dk/s0fK2YG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953006; c=relaxed/simple;
	bh=MO3RqXeAtwYhdsmzySbaCMfzix8Xdj3GPU+NaASOt3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qICOcJFNdrqxrGUx06uirvwE4/49JQHh0IuMi4Nz8XVVjQ52G+MaTI1Nncn07cst58vfJkyhliw0eCjhKRmjpLlplvqKRJoTSG8ZMC2q3mO3qjm8IQyz5XjPmaFWk6+EFQU+qi5ulQ+hQvs1yyIEfTQyjsyYDlnyx3AqLUI5nDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHicsXSq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76858e9e48aso4282349b3a.2
        for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 15:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754953004; x=1755557804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5RU5rRyUUF2BWfxD7VsX7pxhfy8I/pWn70nP4PBhvl0=;
        b=JHicsXSqBJY5DelHSz9HGqrJfAWneaMM7GjBMlYwsN10PNh1GsJmzSRJher3GWBTlo
         W9jzH53QfpZVRUiR7cj63HAc7XNK8JvqaZmGsoM+YgdyRjKLQKRHMKp1vyv6lhSoL6xI
         0mVd8lerely+cmgW6rWin3V1wdjxS0Jhh2szqgtOjThY4NrSpgKlCvCgJaoQMRJpS0WN
         rMu0gmsASNXXoViQnqJbIj78DF8sW9OMqGmhTTKhCen/l31yHHQNrFJQ6qMKaQb3U0Wv
         FtihFr1pq2rWdyHRfddP2kebFOJIj61DoPpfdWk2AO7RDWWGGMJk/MtHYJ0lIIwlkbI9
         4uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754953004; x=1755557804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RU5rRyUUF2BWfxD7VsX7pxhfy8I/pWn70nP4PBhvl0=;
        b=HIEV03jX5EagrUFNUBHLpDUPy0G4ohhbbJkax7ALJSn/dnuAxoOq2F5mHibCUvrh/x
         4oGO4degdHzcMBR8hXJnphnaieZ4x6vuCp56Ep12dOYLveNHwFLo1Npc9EPsX1J9IuR6
         vsDsPIFBoCm0y+jbVViAkvBkh+qVqnH8Nn5epR22qKem6Xcg7hFR1d9Ncl7pa0ZzxeyX
         rkgg6aTFzUrcpBdRP5hUNCo3wJNQ4XmaI0HwgrprTcTa7SiDUT6iFkXo8aT+1zbIqIns
         gU7IPJ4q59DWNdF3TlkuaMps7rp08RCDVCiK/gefmhdiISwCcOeTrCURu0as6tHvmdF9
         xdJA==
X-Forwarded-Encrypted: i=1; AJvYcCVIeeqqS7nZExisHmVuGIFEalrioIBdNqRrF9OD7cEmAZajyrPkICrbBWFbqyEZl68LKgoopEYiTACvWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfVkTZZYZpKwQdf6VwDfkSdyCOvRMPD1Bj4SSlx4BcCjXMv4g
	oTp0EP+1vucaadiei/7a++7/cnGAelCxzfNS/UHmrGKb/+LOqlBEG3Oi
X-Gm-Gg: ASbGnctPJG7NbGkV5p1RB8KdhdVlGMiqHeZATIMVGKw2PsXZohKFuK3Vfvf5x4GIH6j
	mcqX2EmrGIPFX7t1duCsZAvpZrCTXDtrC7AiXozYDiDyC+FZv4glzq5w3sdJWxkZjU1kT4VG/lb
	KHmzC/39FBJPaoMTJDBvHzUxq6p+P07Yo57OapZfFq5cbt3rOuPJnmKOrjVqEJeUyHdZuMZnUEE
	E7QykEczrheScFdpgt6YuQD/cfA1CVkldzHiFJsKEDmHd8R9JBP/qR6QkP/tlYqFfHW5IYB2ZN3
	uTHR9an3bA9guc+ys2C94vTonNs45ibNzRM7ZQKtZoBlBOzUyIZ1xbosZqx7TWVOABnsQt3A8tg
	V21rk3Rd04AwGwxlYPu6NMhGkT9V6nYH6AA==
X-Google-Smtp-Source: AGHT+IE8JuMtTvMmAN9VtH3QpmTI/bTZs0Ac9g8neyssOmaXCEvApXnryAA2uV2eK0YZeKLO5djUuA==
X-Received: by 2002:a05:6a00:ac3:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e0df57a02mr1909413b3a.24.1754953004054;
        Mon, 11 Aug 2025 15:56:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcd00sm27929579b3a.60.2025.08.11.15.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:56:43 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:56:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/6] Input: Add ABS_CLUTCH, HANDBRAKE, and SHIFTER
Message-ID: <vh75qh4qit5dgq6jfwgdtpuwrjy6znifzmtwt5r6yuu5r5wxqn@5bwy7ygwvybe>
References: <20250808043017.1953101-1-vi@endrift.com>
 <20250808043017.1953101-4-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808043017.1953101-4-vi@endrift.com>

On Thu, Aug 07, 2025 at 09:30:10PM -0700, Vicki Pfau wrote:
> Add new absolute axes for racing game controllers
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-debug.c                | 16 +++++++++-------
>  include/uapi/linux/input-event-codes.h |  3 +++
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 264eefaed08fb..534df8e4082da 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -3505,13 +3505,15 @@ static const char *absolutes[ABS_CNT] = {
>  	[ABS_RY] = "Ry",		[ABS_RZ] = "Rz",
>  	[ABS_THROTTLE] = "Throttle",	[ABS_RUDDER] = "Rudder",
>  	[ABS_WHEEL] = "Wheel",		[ABS_GAS] = "Gas",
> -	[ABS_BRAKE] = "Brake",		[ABS_HAT0X] = "Hat0X",
> -	[ABS_HAT0Y] = "Hat0Y",		[ABS_HAT1X] = "Hat1X",
> -	[ABS_HAT1Y] = "Hat1Y",		[ABS_HAT2X] = "Hat2X",
> -	[ABS_HAT2Y] = "Hat2Y",		[ABS_HAT3X] = "Hat3X",
> -	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
> -	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
> -	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
> +	[ABS_BRAKE] = "Brake",		[ABS_CLUTCH] = "Clutch",
> +	[ABS_HANDBRAKE] = "Handbrake",	[ABS_SHIFTER] = "Shifter",
> +	[ABS_HAT0X] = "Hat0X",		[ABS_HAT0Y] = "Hat0Y",
> +	[ABS_HAT1X] = "Hat1X",		[ABS_HAT1Y] = "Hat1Y",
> +	[ABS_HAT2X] = "Hat2X",		[ABS_HAT2Y] = "Hat2Y",
> +	[ABS_HAT3X] = "Hat3X",		[ABS_HAT3Y] = "Hat3Y",
> +	[ABS_PRESSURE] = "Pressure",	[ABS_DISTANCE] = "Distance",
> +	[ABS_TILT_X] = "XTilt",		[ABS_TILT_Y] = "YTilt",
> +	[ABS_TOOL_WIDTH] = "ToolWidth",
>  	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
>  	[ABS_MISC] = "Misc",
>  	[ABS_MT_SLOT] = "MTSlot",
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 08cb157ab5936..195139e895ffb 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -859,6 +859,9 @@
>  #define ABS_WHEEL		0x08
>  #define ABS_GAS			0x09
>  #define ABS_BRAKE		0x0a
> +#define ABS_CLUTCH		0x0b
> +#define ABS_HANDBRAKE		0x0c
> +#define ABS_SHIFTER		0x0d

We have BTN_GEAR_UP and BTN_GEAR_DOWN, can they be used?

Thanks.

-- 
Dmitry

