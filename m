Return-Path: <linux-input+bounces-15148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48271BA7F00
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 06:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6FC4189483F
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 04:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0FE217F31;
	Mon, 29 Sep 2025 04:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqsbDU7J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ADC20ADF8
	for <linux-input@vger.kernel.org>; Mon, 29 Sep 2025 04:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120187; cv=none; b=kEaIkVhjD8JTaVEugBatq9Y5MejXgecL+sB3hplNZUmezIlsH1keyFf2eg15fSV7oLzkM/9GCzRbZe7lMGFlnAbCy/hjAb4haZI71p8ilPMWGMcwTTQsTpCiHV3zYanDt8b8KQwm26MBO4J8Rokrc6HYSnU2On07qP1uaWaO6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120187; c=relaxed/simple;
	bh=kFFSC5GoahdKu3K5krXPBvbtnivbS0rpNq4dNHOhin0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl0IzwkNLixHVSSzZF+IoRAQ/XR8XS9/UcsRe0Ev1X0rTCijf3P831EEDX3F3Mny/Uk/6a7z89t422+bAWIHCZddu87Hgcmd1ycX4NEcQ2uA7BXIf0ZTJmNc2FvCmdeItAyqSKEZS4lo4qhXtZHLW+Od/MVRDcUO8nNbOGHdygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqsbDU7J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eceb38eb1so49640335ad.3
        for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 21:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759120185; x=1759724985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkxef2+AVsU71z+fKIaM1uDBUG0P/Nu5z5dA8sCM2tI=;
        b=DqsbDU7JR37QrAVxJA1dcv6dKaR8ldqfsx8tljSejWwZUQR447SFuzTJd4zsEK3wDt
         CNn8umjd9i8qXq6hzfl6Ztis5Sfm+rInnbLDWk67iPEXxYV4RULvWfEnQjq/eYjjgNZ2
         jX0AuLvILkawOhxZNl+ZDdhBeNMMrmKUQkk7tAonBBbbkTEhFkpXCdpUSi1yVZxl3nm2
         KXJ23THbvcgqukn2Yqq1apNcYElwiewfu+JZ3bwtfLXcF5QXSu/fz24gH/GdTbqRJvph
         mYtRX3SOBkU+GKiRZOvVRoxXeEuuigHuEbZWmnj/EFmbTIvJvuu04MO8Nt0cGzBg9JW5
         vfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759120185; x=1759724985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vkxef2+AVsU71z+fKIaM1uDBUG0P/Nu5z5dA8sCM2tI=;
        b=xJ8ySWs79QufYsvZxeTOis9Qio9bzByl5zzMVQl3/mr2jlfIJxCQTzroUXeuHi7VIf
         LZ54D3my8x1nNhcu3q9+UNk52DApuQxxPXUfJBsjv43JXvBvzheFzb30Lfr1S/vMHgqy
         GHqRZLQwSfrJA56Fvl/9bgDuOAMG+Q2d7k8la0hQB04q+xDsrhQJnCzQFjBvc4IRoemX
         h4b5OexWlQhUW+5sE7dmOsRZFpzPFV5J9alLTZymHJa4K9pKA7AF1vuehw1Nduik9shR
         5Xf0eeNN12s6y+irsahDMpeRf+TUKl9rq/9eN57RqoMN+w7AfQB3s812cR8ksrrnx3L2
         JeIQ==
X-Gm-Message-State: AOJu0YxcmBZvE5hFHw5BR/ztWWH4e2w9kwkdZ8n9sT8DJYSqniTdDcqf
	CdYfcjUj/ujdw36ZZdDUf8gT5AGMOYErYUeaBFtJutU8txyfWc84tX0U
X-Gm-Gg: ASbGncunw9lwdfaBamxuxvT0GE3B9QUdoYrtzKe5aSl3uY38T/GuiiLnnhlFCY19Ts0
	+S7ys60ATMkk3s2f/C/F3RsGxiwJZsJHbE8J6Tg/2X27pWmrZcZwnRxbW0FeLfbT7o/jUBcaD+w
	7urpzHIC7O+OfNKcLg6zxIozAGolia+yjdFCNmvwyZtd0GQ7+tviGomUVe2/ngyay8bwyDECorq
	Y1A/vG9Afc/+Z0lXWBubm7I5N5nl+IX8KV2/55X7W8QHMQmuyvRc3W3uuwNBlajiutV3kmjOCOG
	CYOpQ7z11eJwFT5WTk/xSwFZNayKyV6SGi26VwEWE5UEb+Ya1UrhFpnzfobu1anEACj/xInzuby
	lMyxFh6KfVFeDYSJQ4Wf5SC3CFeGwKE4LMv1kVKqXjb+6cFsoqXyAIgdpVS1UrIOeoVXrH18j0w
	==
X-Google-Smtp-Source: AGHT+IEydysVp4VmZ+QQonnsPxkjXJAGZ9EcfAUe93S/3LB6hQ9TXXcHbMyclV7XrLOtsJIv++TsVA==
X-Received: by 2002:a17:903:13c8:b0:283:c950:a76f with SMTP id d9443c01a7336-283c96f311cmr54378465ad.43.1759120185331;
        Sun, 28 Sep 2025 21:29:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:78a6:bdf8:e03d:d9ea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm118376105ad.20.2025.09.28.21.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 21:29:44 -0700 (PDT)
Date: Sun, 28 Sep 2025 21:29:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: uinput - zero-initialize uinput_ff_upload_compat
 to avoid info leak
Message-ID: <2s7j3pivdcouh3ug7yzzai53egxiakscuhgalcoodsw3xnvcre@vfhdvo7xnnng>
References: <20250928063737.74590-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928063737.74590-1-zhen.ni@easystack.cn>

On Sun, Sep 28, 2025 at 02:37:37PM +0800, Zhen Ni wrote:
> Struct ff_effect_compat is embedded twice inside
> uinput_ff_upload_compat, contains internal padding. In particular, there
> is a hole after struct ff_replay to satisfy alignment requirements for
> the following union member. Without clearing the structure,
> copy_to_user() may leak stack data to userspace.
> 
> Initialize ff_up_compat to zero before filling valid fields.

Nicely spotted, thank you, applied.

-- 
Dmitry

