Return-Path: <linux-input+bounces-6277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394596E955
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EF93B22319
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BEA7E0E4;
	Fri,  6 Sep 2024 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4FI8qbo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71139433C5;
	Fri,  6 Sep 2024 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600885; cv=none; b=B5aTIGH7vyJr0zc0oFwwmNU9naFhWhQIosxZib0n6yu88Jcp8f0dtgszQ8F8pcgoMyKNuTgDYx1Tpp9OIeaq3bcoxYyR90jJ5/cymS7CayDsmpu8sFy18ZT3hflqldL6AoE5q6Zax5Mv5MWwEzmRz8i7NLtFimyk5BPOOXa0LZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600885; c=relaxed/simple;
	bh=rcVFKsVaLF4MTLAbAUcOtjc0KGj518f0jHSqFOv2/4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVsG3bxQpSTyXkM2v7YHO/CEIPbxycDplckcD34fAcL5HCEc7by2zBY8AIwi1Gi3+g74Xhej78AfaSxadW+NCZHB6+sEt5EhZsWO4qhhoXAKtfBe8JOwg5jh8Oh8aiQReeIUFMpljYh7wHUyEaCPnRzuGycwnhpiA820lcVFl/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4FI8qbo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718816be6cbso622632b3a.1;
        Thu, 05 Sep 2024 22:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600884; x=1726205684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gp3aoj9D0kmnG89u7DsPXF/6xsL1VDpPlQOavI3NYQ=;
        b=D4FI8qboKlTlbP1v0dWzfz5u+I+tL2ZXrWRzvEx5AwGeZ0k1oEpqjCEFPNgztV9kbE
         ND/QE97uOmgMOhvIPbauBGQA3+zLzjJ73YlW8cDaVOB2uP8n7R0o1B9tAab3pmbIX0jU
         5BrLMBguSdCmtZcqALmgiVKaC0lj5erPUOTx26pg4l3GxgbXVUaodxfjZrdnaTSUOG9o
         71sf1Y4OODm6O4i1mc/gjIknsQhXI/l6FXW5NBYpXBKgd0InRH4KrX1TfOnVoaRWKMXo
         1VhiOJ4J0qJAdNcy6YiGL4zWTGV4O7Y1Bm0oa+f3KCnvsfLfuA9VZ/4Dca4h2rSfdNpy
         +6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600884; x=1726205684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gp3aoj9D0kmnG89u7DsPXF/6xsL1VDpPlQOavI3NYQ=;
        b=Nx86eSuJKGh5v5nZa8BDKODPnsm0H1/zlXA0Gsq9Eb/h9AkvVlp7oQfwstjpVWk+Hz
         0y/VQT9yqgaPm0h3t8VayrV9ssqDpBahVTdgRjXJwNq1lzCVhyiKi8c3F5zSniiqWC/f
         3wuQvh3lF0CIIZb6kLmivVNcYHGQaYswbAz6CX0U6HEK9pzJqSlTsC5uEXwAZIwR0Mw8
         mycWHh2kPPt4PvDRLoL2HJw9DQdHDjbek1sHQvEs/fkrE2tUaf4vjynDyS14vsQUOPdQ
         qqTZ11BKmAOo8Sq5maytU6ceumUWFSEwo1eEBg6+LVWXu0x4dXikfC72koNHa3mTs31r
         RL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXFEs3S5uWAnl/gg0i/v4xJjiS5uZ/jezanvcHW8PNWfq341WMA6/TW4URw6Liot6KChrEaL2YT3dtPmU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA66K+UPIjr4S71AZlh5hkdrmC1uV143T0iMCXO3fkBwg8/ehd
	e5jTO3hOukgUo0odPKSKRepg+NTgUSzkxqL+E2Ycr6SWfw2jxQA+5+vV1w==
X-Google-Smtp-Source: AGHT+IEIfGwSiKcshHtyH//uHCTZ++uI+SHlBLU4uA+QR9W0cMRA+lx7omCXOKv4phJoTCsF9P2Z0A==
X-Received: by 2002:a05:6a21:398c:b0:1ce:dea5:d42d with SMTP id adf61e73a8af0-1cedea5d54dmr19411844637.15.1725600883299;
        Thu, 05 Sep 2024 22:34:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea53327sm36528675ad.185.2024.09.05.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:34:42 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:34:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042
 quirk table
Message-ID: <ZtqUcDOSdJM3JcDj@google.com>
References: <20240905164851.771578-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905164851.771578-1-wse@tuxedocomputers.com>

On Thu, Sep 05, 2024 at 06:48:51PM +0200, Werner Sembach wrote:
> Some TongFang barebones have touchpad and/or keyboard issues after
> suspend, fixable with nomux + reset + noloop + nopnp. Luckily, none of
> them have an external PS/2 port so this can safely be set for all of
> them.
> 
> I'm not entirely sure if every device listed really needs all four quirks,
> but after testing and production use, no negative effects could be
> observed when setting all four.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry

