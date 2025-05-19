Return-Path: <linux-input+bounces-12465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15572ABCA13
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 23:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A9B165A79
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9886A217679;
	Mon, 19 May 2025 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVTMzP7P"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8EC21FF20;
	Mon, 19 May 2025 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747690597; cv=none; b=nikO88A/JPqnbqJn01i30l7zIsqt4kB3+x46RmdywQn71JAljCS4ZYRt8I0ZjgVqP3pvBi3047fEgKMhxRmCM5iaCtQ9mHu5FhzV1QbBY7FzX7I8cHy//pJdckFrRDPeja7G3I8pz5+K5K7/VXapTcoO930jElLstZaibtdhKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747690597; c=relaxed/simple;
	bh=51w6uQtEdksHPPx6kuXh/IBNEl4ishQkaOPYYW7KX9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtuTDQf5+xiimwUcOuzPd2Ordsx1X/eoPq/tRQxc7M4uKilshl75xMNlZZr0DqkTD68ubHYdWWpWXbll0PqhzOOuxmBy9/W7S93dZVptWaASOQi88ztJHu2+X23dzS3WZfPAOG6r0zj8MoB1pOhrvbHAfzJYiCzT8iXuRhKbjQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVTMzP7P; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e9397802eso2450942a91.1;
        Mon, 19 May 2025 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747690595; x=1748295395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+xWbtZvz9WxQzQ8bs2cp2wokdterkmW+4mn44kz7j4=;
        b=RVTMzP7PDbJOaMSVMfHEvnqUU6pTK/CHa43r3dFLv8B4bofKmwJZQh59MnS08C4O9C
         WbeEAh/07KBPk5hUkbFn2nbsSnup28ANsRkuRjZ6kd8Ti2BYSrk9SO+zWxjPfAawfobU
         KeCQiSEd3Zmuqx6Gro4dfR/wNH5BfS45ZRf7WjR0UvhTQxc8Z4YkHGjOByZwydzubZTS
         Y/LERVQPP7pChDhoQPoNl4gLP1n1WZLHtFGcIOQcfTrjicRWbW51XFr6KNZKiEd4KMyw
         jwyFitt+NsUuap0DMvaKCYl6pf+qahAiSOlXcLSc98UkAeJc6FKIOP+67Cn4czU9vzyD
         dAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690595; x=1748295395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+xWbtZvz9WxQzQ8bs2cp2wokdterkmW+4mn44kz7j4=;
        b=RrWbS/YEw2Y0SAJuSrDWHdP97zDIspKSoM0Bq+qAqsYFw0m+Uv7cHm22y5vfsXH5qE
         c9JKog0yAa+D5zUVNtH/iMfpZZFVsIh8+NV3fdapFiujOCYttmw4WWhex7Y4ttUuUMOO
         4+tYR3D5GVKBdm3cqJzEjBnKH9iPbHxcunHGDPmX8tvPkjKIMuhNH3ZyZy/5RMmnhPLR
         QSxcKPulpuU2DSZ12fh8nxKTXA4lnUNOJU+HxqZAsbbgOIcKUzr2AINcEhSc9s9nhAll
         Yzf5GHYwSYykWBxBORuvo3Sbfre97+D2BFUCcv/93U7RZ5g5H8NeVYpIHaWJPqbSqmv+
         g6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoX9aWZi+R6d9Ab2efO5LNhT3CZFceJRaipZctQBmFfWnmcBZd+tuz0ZqZ+G1M7NEh9N3mPVrn/xRI2b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDY7Mwexl9paGEC9qjQT/kIiuuXRat8GfM3tF3phTiEEdG3Mb2
	NBrcJUL1Sh8h7F2hK9fU/5kz7x4AauHGHIaU2DZ+PEsebtshjBtmAbClVAvI6A==
X-Gm-Gg: ASbGncu502yzQvHVj/txYxA/bONfkPgLYmYWMWWVKoCnzDE5omuHACdcudNdv3A+TH8
	nykPgJIiUZJ58g207j53e3L+mn02Nboqupe5uir8VjkZ//kTxTuYEwUt+gcrkJ5bMQnpZ1wAq9F
	mFoIQCy6CBq3+PCdelEG1GoIz8YqoWFKHakoHGtfcTgs4hjBngcCsSAHq0/TC9DNwEImQeQXpPj
	M4lCV+LPDUjSXYYlT9HtWeuOAHBq/ps3sTcEWzCaLaH62Z01xkU3A9BOeazS+Mp4tn9bq+ngSDW
	EeN/OqFa4pH0EsXD3LPjp0/ez9Ajd/BRScsZQDlSLIcMiTClc+6/Ciz6Anxs
X-Google-Smtp-Source: AGHT+IHS5RQfA8eY3gSqw2MvaP8i0i/bYYFTHJwqx04OzmmmINg8FWgId8gJuN6AaA9kofqJfg3TsA==
X-Received: by 2002:a17:90b:570d:b0:309:fe2b:306f with SMTP id 98e67ed59e1d1-30e7d5a8b14mr18477153a91.26.1747690595169;
        Mon, 19 May 2025 14:36:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e134:a6aa:27:6156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d8fsm150326a91.7.2025.05.19.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:36:34 -0700 (PDT)
Date: Mon, 19 May 2025 14:36:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Apoorv Parle <apparle@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
Message-ID: <ogmv67n3rdia67ttj6whj4wnr2humhl2fjpo56phghqf67bpjx@bbdmdsmbp4kk>
References: <20250517105045.70998-1-apparle@gmail.com>
 <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
 <CAB7A79ysZ2-kxKPyiM1+5keSrsbVwNZti4FzXGUbjx4OONzrDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB7A79ysZ2-kxKPyiM1+5keSrsbVwNZti4FzXGUbjx4OONzrDw@mail.gmail.com>

On Mon, May 19, 2025 at 01:30:13PM -0700, Apoorv Parle wrote:
> The goal is to not blacklist the xpad driver completely, because I still
> need that driver for other controllers (older Xbox 360 controller or 3rd
> party controllers) when using multiple controllers (couch multiplayer) on
> the same machine.
> 
> Today I'm forced to blacklist xpad altogether to get xone up because they
> conflict on the device IDs, and then I can only use 1 controller, not both.
> Or I have to create a copy of xpad with Xbox-One device IDs stripped out
> (i.e. xpad-noone) to keep both drivers active side-by-side, so my new
> XboxOne can use xone and my old Xbox 360 can use the xpad driver.
> This patch is trying to make that seamless. And it'll have the added
> benefit of making distro packaging easier as xpad can just stay upstream
> with no separate builds needed, and xone driver can be a non-free opt-in
> installation with this module param enabled.

I understand. However you can unbind and bind individual devices to
individual drivers via sysfs by writing into
/sys/bus/usb/drivers/{xpad|xone}/{un}bind.

Thanks.

-- 
Dmitry

