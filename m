Return-Path: <linux-input+bounces-6276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8D96E950
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD4B284777
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE64C13698F;
	Fri,  6 Sep 2024 05:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fa13bYTW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF312EBE1;
	Fri,  6 Sep 2024 05:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600817; cv=none; b=HaYHyRp/3SbJHu80YIuL+NxHZYx+qt7oSCCJNqBc9L5h/mg1IRDOCL73cnUcrBAJaRae+zu2gkmfl4uKJjjDxOvUcE8d9e2jue4lpcjj3lwT3uetrY6+j3u1Wrt1rMzTecKjJplJTncbjVsWxSyfCDn4C5GytBZUr7nl1+9WW18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600817; c=relaxed/simple;
	bh=BxIUtDBgOguLykRmTesy6AvjukkLMJiyIyNIVCX9vdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKdWCRoOHDbylQX0l+cdgfD1hO2N2bfJp342GUDp0O7XKC4FKJ0KZgj/g60XtjmUENW7IFTND1IOkALvESaaS6NQLzYjjA3DU25DvXsUHnvnrhSrmOgVSVDvdb926hMKFkbp70CkMPHcxA7d7cbCLcLtUnaEzOe8MeVAJch7v8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fa13bYTW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7178df70f28so1396521b3a.2;
        Thu, 05 Sep 2024 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600816; x=1726205616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVf5MbX4Jq+kv5KYRwJwC+Tbjk/bz1ur6S/jB+k12wA=;
        b=fa13bYTWXqRxA1fossuq3c3Hsfj4Hx0HMLJGeVZvCDFkxKeBv7QhVxKjTkMEhNXOYz
         DLajEfl87ZV+cgYLxqA4ylh4R+99dT+whNT/XmTwlTJLJSq+JuC7c8CvgDPjwrIVPfv/
         5lFWDo22Q1kz9percSFrMSkMcK5duOPxZqoYJ5POLkWkyIRpEXR10o/zMYESXuQ0ir4q
         9PoQcH7xRySGG6A/U3CorARroDeqVU5gctZanu3DZ28+BX9+6JR/H+EDh28v4FDUrQOD
         4t4tavQcck97iRxSaNufgrvNM11I41VqeHdUJwk63tId1U3D4zQXdOCuDBlMYZd+596x
         w4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600816; x=1726205616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVf5MbX4Jq+kv5KYRwJwC+Tbjk/bz1ur6S/jB+k12wA=;
        b=aQbdslrDwWmm4qSWV5i5lqETywiILYwiJAT2cEyZ5/NhhtJ1HZG233mIKN2Ur3nEmF
         IRExA+xGigcL0Kua6NX1TIX+IQCILYVq68GKmya/WorN7+bEJ2yV4O8t8az6CQERu4Q3
         b4BIrCQAD5ENil1+I5r7cw/fhl03b5oAQ2u9lNPdXRk92j/Tm9pTwqY7TuyJap+0lrp6
         txb6mlyiIGz8igpCR6FYvC+nJvMQ15D2MQgduMPEwJiqFOu6ix83AqKae8uzUxCQ0W7/
         ggaLjD/e2Ncm+TDXBOGDN33fCL2hgbJff8Px+6cpj2YEZYo3bJD6FZEQrE8uQqznKwmh
         VzMA==
X-Forwarded-Encrypted: i=1; AJvYcCU3OGi1RfLsHGJ2iubfilS28zy6o+cXjrHxp6RhJ+XtjVbsneyf3YBRM/B+n+sla1JoA41JpC5vGjoG/1NU@vger.kernel.org, AJvYcCWeFKOMAa2QHnauqiPU/Ra2DVRfiSVM7uWmmj9a4B++NySoz8Y12agYJuNWnUS+2I0qJxdbebBauDXItQo=@vger.kernel.org, AJvYcCX+Q5Kot+fSVAkn8W3Jw+9bw8Von/U3bmjoF9zDg1f7Wyo/6FXg890XViPa/80XdyJQmtSJCjMoswoUCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAUADLrxdMDsvYzZV8aUdP/CK+sXP/5VPs8i2zqZZYSMSsSRe5
	8c3I3Du9qn+5Zwddr+8y7L1VyT6JXKvm659vLqkOHHthL1ojocK+
X-Google-Smtp-Source: AGHT+IF1jiMFFtVr7UJLhO/A+sCkv9QVKfdpxG3i0FPwdAy3SjVBUvpZbVod03wZVSIxvuirxJmtlQ==
X-Received: by 2002:a05:6a00:2193:b0:717:9154:b5b6 with SMTP id d2e1a72fcca58-718d5e1d12fmr1978627b3a.7.1725600815466;
        Thu, 05 Sep 2024 22:33:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718d6e78801sm498994b3a.133.2024.09.05.22.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:33:35 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:33:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
Message-ID: <ZtqULBqqDXydmnaL@google.com>
References: <20240731201407.1838385-6-robh@kernel.org>
 <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
 <Zs3yfc1pJDkAwhzc@google.com>
 <Zs4SovPgLmlrVOJr@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs4SovPgLmlrVOJr@google.com>

On Tue, Aug 27, 2024 at 10:53:38AM -0700, Dmitry Torokhov wrote:
> > 
> > Applied, thank you.
> 
> Oh, wait, can I get your SOB please?

Rob, I am still waiting on your SOB please.

-- 
Dmitry

