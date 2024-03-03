Return-Path: <linux-input+bounces-2158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71A86F778
	for <lists+linux-input@lfdr.de>; Sun,  3 Mar 2024 23:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB0A61C203B3
	for <lists+linux-input@lfdr.de>; Sun,  3 Mar 2024 22:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EAD79DB7;
	Sun,  3 Mar 2024 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIfBg2Ml"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009BB76910;
	Sun,  3 Mar 2024 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709505418; cv=none; b=oUXePecxo6DpoRv0gJ6LCkKUlbyP0bQu7/ssF13PWPa+d/S4JmiFH84ziJ2hP9SSbdtsy3rShLB5rbD0R+NQRb7y1XCjm3rOfnQUHbPJydZWS/WqBdKoK0z8SRd9lwkYVI382IUY01qhw0Q/lEvBZQz98J4ZPDyV6leHmwpcdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709505418; c=relaxed/simple;
	bh=PYS5qB0mlbb61cQOtSQwmX1wMFO/MrV8NxbMBy23M9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr97sLvi8l2oi7upLUM0E+HwaUTyzWCVTNFRPhIR9J+VeLN8lVjx0PD7QeVlfkyO315mjMc9c37AhAWZRKJ7MmgyUK1P2d88E4+HNAKDQNKj3VpY7IbsxYzA7UukRnRqCbcO5udPk7Fmt/iebY4d87Drh1s+y7X8Ct9VeLsaa2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIfBg2Ml; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e4a803c72aso2242348a34.3;
        Sun, 03 Mar 2024 14:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709505416; x=1710110216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6GUHqu0R39Lc7lbOWuUkoIyVbW7DjlCZHWYLj8Ms2o=;
        b=CIfBg2Ml4KnL8oiEAvIPYzan65qOQOMwZqbt5x+kYzVGQD0cCp1DAE2oWnDTXNIxcD
         rv/No3cD6qycTdBQdAXgHuxNWYgRpwrkP12YIZUxfAy+2zHkzNffruoMpDL5U8Z0Ueld
         2l3OdFkYsqqFk2bNVCzIzcEsPoDDPj7f24ACLWvGP7Cqs2/WyPtMPwFKn+GxqPvcAwhs
         ePhlc6GVOgy4D7R6Mru/XRhbG4FY8OSUHt7SbO9/mfV9PUPktintypNHw9Vgs0TaV3qj
         4pnOuIoDGsNPtG/DGJgaWCIXieOypSF7DnL/tXR4WwGIjHwtM72Q22VUu92ov1gUl93m
         G6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709505416; x=1710110216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6GUHqu0R39Lc7lbOWuUkoIyVbW7DjlCZHWYLj8Ms2o=;
        b=H1mOYsUtgXLKimniqsdXifMd1mtXStXKt42q5zLM+G7tHoIdr04lWwt7VrB7dT+jq6
         wywFnDlWEfR2zenMRgw4Kv41RxGgVW/EeRJl+HEALozkqRLxAFkuoqrKAVhy7Vb1pLGr
         vTkx5Q9bJrJu3lFajMrqYWWEUtbUwzEcfGNu56qBmMCvbG4GXQJslVcMLciyA9pKbzM/
         R17xVZVo3fphO2bDyMsAv9UypJLjrosCtFCIN+k8gBFyGMwtOnozoy0xJ60XfPRhqyBC
         j75zFJO3OZXEEwJ3NFHXvXQTUP31v55ZAFJA2Cu0MIQwDOxti0mYiKMAvbXlXBzwSEhi
         IcYA==
X-Forwarded-Encrypted: i=1; AJvYcCUpqkQIjXjGFBQrQEwnoABxwVF9Zn2QjzCS1FWuIdhG02OUp7aTzq+Bn84KckgH1UnYFV1cZbnlvxi0RRbdSoWbpQmO/peYgE1jVA==
X-Gm-Message-State: AOJu0YzkkaD2hEAqKPEeU9PcybmS3u3bsXbBd33EPTzccwm39EU4r8Ub
	Qp35vyIWCnc5ctu0OVXMC3k5kcH+sUtOUzpZkQhNi+oa+Bi2Wdd9MKtbqCxB
X-Google-Smtp-Source: AGHT+IGKt5ry0nZbQiq7EAKVh0Ki/2ZcKM8qmXFSiTHHv+AOMiQFtaeEvPDHjcr3ZaKzYNr3mX5h3A==
X-Received: by 2002:a9d:6d05:0:b0:6e4:dfc5:d13e with SMTP id o5-20020a9d6d05000000b006e4dfc5d13emr3080225otp.15.1709505415816;
        Sun, 03 Mar 2024 14:36:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:99d7:8333:f50c:d6a6])
        by smtp.gmail.com with ESMTPSA id l126-20020a632584000000b005dc8c301b9dsm6299223pgl.2.2024.03.03.14.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 14:36:55 -0800 (PST)
Date: Sun, 3 Mar 2024 14:36:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] Input: leds: Change config symbol dependency for audio
 mute trigger
Message-ID: <ZeT7hadF5w6_ErGK@google.com>
References: <6011ca63-187c-42dd-a5fd-7dd733d6257c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6011ca63-187c-42dd-a5fd-7dd733d6257c@gmail.com>

On Sat, Mar 02, 2024 at 04:24:28PM +0100, Heiner Kallweit wrote:
> In a follow-up patch implementation of the LED audio trigger will be
> moved to sound/core/snd_ctl_led, including removal of config symbol
> LEDS_AUDIO_TRIGGER. Also as of today the audio mute LED trigger
> is effectively a no-op w/o config symbol SND_CTL_LED being defined.
> Therefore switch the dependency to this config symbol.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied, thank you.

-- 
Dmitry

