Return-Path: <linux-input+bounces-10319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D574CA43529
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77A807A8806
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD97E257438;
	Tue, 25 Feb 2025 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWWElMs9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390A256C8B;
	Tue, 25 Feb 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464593; cv=none; b=PjY9H/5CUXZQFHpOh4PXODjvazJ3//pK8k2cULJdYLXxNNzfkAQxIc48LMgxb2v+F8G2ZEyTE3amjgMAGIzlpb5b2w9T0qzJa9JPzNQkJ/UFj1pJGFO7cr7NWzi9Bt6GxxqKF2JkQVDT0LCc2g51PQL1mqzcE5ox6F9WkQoHi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464593; c=relaxed/simple;
	bh=YVeIwzDTtCyqXNkuVoCKtquXcD4I+MNGiP1f6BEIbhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/3OwuGQxR9cTJqjtnMRU3F213ZDEJY3Q4C4LzK9JVxFGN8Mg0AlzPlvovt9xYh4bt9+ObeL4bzbivhgMGWrWdoUfLUkohlubWJCSHUPmENiZCMy8tm4LkuD6x7xMV4W8lU6Q9R66DLGeK+nRdIIEu01pC3bWpYy+THuxBgmNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWWElMs9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2211acda7f6so116134275ad.3;
        Mon, 24 Feb 2025 22:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464591; x=1741069391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QzF0DMqKSo2WVEUbrWBzNJQGDM2P+lB3ezMHc1NlR8=;
        b=IWWElMs9EpPwNPJgBoKGKOQK4B164CKI0AmxYp1GCuPk9iaPO4ZGxUdC9ufOYND71/
         bWCv9H0nZVwHu/56HVz53VqXaooUF/KRLv/fS/wqul5IeauLihObQyB/NB9kXwzhXb13
         PqAjKPu6pXXiytFE2NbLLMoL+nQdANF7TPWUJ01m6zPfNHeb41lILXtL985qxjph2i91
         69jC/GIFCf0GZ+IoE2OjCTyKZ05Fi5gD7j1jm28zKI8nT75P3lRpNtMcwDV+cYh9I4tk
         LepKr19rzk5mIY2oDEliYSTxNJJtFP609MAy8KuFYvM1ziMrqb5hAR3D7noOMI3HSObN
         y4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464591; x=1741069391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QzF0DMqKSo2WVEUbrWBzNJQGDM2P+lB3ezMHc1NlR8=;
        b=Hy44+0QSV8J1o1OQO964xo3qUnoBIe96Ix22ety3uH1pdD6oZSsAIgt2OXPc1VrQ9a
         V/jUTRnwx6n2kxnFLKz0ReCBR8rzLBe9lWgtGTb53bllcrStPUqOQLH1hBA9FXaJ4C8j
         qT9i8kmrN0D1Cw2qIKv6BSgxucF0viGzOQbx5uMZzbS1nvxg9KoBCMYw6lRLoYHrfZYv
         v6Y5AZFzblc2msfAIUJdVcClfRkHeEwJ/UADh+/fT+tI8Izr7ZxwUFJk6i+dNu0RlIDd
         lzMY64gFNHH4FtqOsZcB3z3GASdEcSgx8RNGl3GEn/aMhgQk84DqyYDG3iPlXsiuYSCt
         R34g==
X-Forwarded-Encrypted: i=1; AJvYcCXM1OYrmG96iaKLNdeq+tShgh+QEaEL5eMX1xe/TzWxwW1ytdgzBj6rHvSbQhawc+F81TNyrmLRNqKPCzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdrvw2LFTodKBZP0amnDHAUFPWoOweFsSZx75qca0ezuDXniMc
	lDE7kkugzpHXps+oSf6non5STvUpqHPSsiM5jjas88IE+YZ8SZNh
X-Gm-Gg: ASbGncun0TM06BFpjENl0KgaejlGrNleuS645bSzOKSd2s9yTZGJOsjWXKBLJP1A32A
	6qrm3EwADkZKyF4ZKZ6qZvx1wZJVV928cov+8jpREW5POuDsgt4Yeu0qYliZVOOPHXgw3tPPACg
	e+tYprR6JN31IMPwiObaWhal02Qn3L9o9ZD53kuAA1lvqbo8rS7K4W6h5hFdfpKMJh1j0JvD8yg
	RUg/Oqb1gXo1x3MxwOmAMsk/Xbid1TMcamYYLyP64AUmJYEIBiB2jy8ju3FITG4cJW4kuMssV3C
	G6Gevz99aXPgbAfEuOvy0viNzHI=
X-Google-Smtp-Source: AGHT+IFclVUW/0xPsdueGkrCc6Oh1M4ZdZ85h8Qc6YgsOtm5BGCUA5ar4j71aNoLGYVp/VC4u73agQ==
X-Received: by 2002:a05:6a00:4f8f:b0:730:9242:e68 with SMTP id d2e1a72fcca58-73426d96062mr25025869b3a.23.1740464591344;
        Mon, 24 Feb 2025 22:23:11 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ef2esm707815b3a.145.2025.02.24.22.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:23:10 -0800 (PST)
Date: Mon, 24 Feb 2025 22:23:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yunli Liu <ylliu3788@163.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH input] input: add BUS_I3C definition to input.h
Message-ID: <Z71hzP-LYpnx-hyH@google.com>
References: <20250215142035.1745664-1-ylliu3788@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215142035.1745664-1-ylliu3788@163.com>

Hi Yunli,

On Sat, Feb 15, 2025 at 10:20:35PM +0800, Yunli Liu wrote:
> Add BUS_I3C (0x21) bus type definition to the input subsystem header.
> This value is reserved for devices utilizing the I3C bus, which is
> increasingly adopted in modern embedded systems due to its enhanced
> capabilities over I2C/SPI.

I would like to see a user of this #define before adding it to the
kernel.

> 
> Signed-off-by: Yunli Liu <ylliu3788@163.com>
> ---
>  include/uapi/linux/input.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> index 2557eb7b0561..c6fbcbad5b7c 100644
> --- a/include/uapi/linux/input.h
> +++ b/include/uapi/linux/input.h
> @@ -275,6 +275,7 @@ struct input_mask {
>  #define BUS_CEC			0x1E
>  #define BUS_INTEL_ISHTP		0x1F
>  #define BUS_AMD_SFH		0x20
> +#define BUS_I3C			0x21
>  
>  /*
>   * MT_TOOL types
> -- 
> 2.34.1
> 

Thanks.

-- 
Dmitry

