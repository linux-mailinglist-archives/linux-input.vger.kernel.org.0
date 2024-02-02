Return-Path: <linux-input+bounces-1629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD2084672A
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 05:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE601F27A66
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 04:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECADF513;
	Fri,  2 Feb 2024 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjE4gFtP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61941F9C6;
	Fri,  2 Feb 2024 04:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706849737; cv=none; b=kfkBN/lpIBf4Mk/KMNAYFnmMQCTevLc4NkuATRcw0SlZuQsuq6m9EzJc933X7kzFXXiaDan9sYEsnwKDiaIlcYd44k60xmtRJxjTTwl7kQBCgyWn1kegfkEEVeypWGyXltrcL0S5j+0RsNTZ8i3dzM+sTPDwTZMzvWsFqsHac/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706849737; c=relaxed/simple;
	bh=2kYlvhPgJrOA5JXv0UROVLU7nz5GY8Jsi12RfI9OR8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHxtFIPvFior87ptAYGbqXxf1TDbwDF0pG/5asV2RnDONQipmLUfFI/vs6MZb7Spyq4xPwjzhKSsQgLF9easdfNIKNTti3V+t77MvtMzSvH6YePAVAmr/BQzsL8/yPYRx5E8x10ganuQDLyNul2xGTAsLLlNlOm7wptp2u+CSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjE4gFtP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d9607f2b3aso2853735ad.0;
        Thu, 01 Feb 2024 20:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706849735; x=1707454535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4F54oWj9ECEcH1NBGn7lQh9aozrsidT6aq0Ua0NYqg=;
        b=MjE4gFtPEe9RcZQ0WZJlN0nmOGPA4ksGHYIb/zjZaWSLiI2Yidki+pnXYyEaOuxQNi
         JnKKqD2TJJ7bkzFDZOyP2fC3/v9+YtCL4yI/P6xTWZ7fC6IUzjOr7CRP38oUD5KSEBHI
         LkRPuqAFiPv+An6e+i6Cx4jpzGXTVmxu60aX6TlU5m7aWF7kwQmOTEpHdHGqcutFoo1k
         0t3gLM0iQUPhnPPNuHBxaKQlkmEqqemGb+2Lc1Gp6G9EKef+g6TJXTnEsgr0CIBSSHET
         in7QL8tkvt0U2YeKz/txhACSt/TEzSrC1jTSBm+MCvHQuhdO7eN7Jyet7X5OcudLnr1j
         Qo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849735; x=1707454535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4F54oWj9ECEcH1NBGn7lQh9aozrsidT6aq0Ua0NYqg=;
        b=Qh5KuBM11sXkABnzqxDrRIF+bXEOMt9FTYdyLyGVJs35k9s0W54/CGE8NCzq4hXdXm
         vpNbJaFU4Lz+UgCon7jHWY44SgbYS4gwS2JX7bPaWRVMeeppDAaMMieimjkeF3sMskwt
         ekvEvLds/ERsthXmkjN2/BPp4qR0HC66SFECxjCQR3+Ui3zGDQAYOKzm1i75XnHoxB3m
         DKzxgfXeiVxa0AnnD67hZ7GmozZdVWrw+YRsRlPI/FSgtX0R7enWcC1n0w6ZZNfSdZSZ
         cRfzjr1h0Z4w+ac0pVP+hWe4+KFeCBbBb2R61vh8RVwiqa1KRCNRNG9Y9ray31Rsyi3o
         sd9A==
X-Gm-Message-State: AOJu0YyW5/dVue2wgylH253DKrp42Ad+4RDJdS2/SJ9JALmz21FhoSgh
	L/wEk2peJM1XLjqPeRoWBfOPslbEEphkrOuw1bXLEsfNj6c1LXkA
X-Google-Smtp-Source: AGHT+IFxTKQC2MJ/rQeUs8h6zf1wW5trleLfX/5jZSaf9XUEEDCY6HJ4yvvPM+IKBzY2imgzqKCTEA==
X-Received: by 2002:a17:902:f9cb:b0:1d5:8cbc:863c with SMTP id kz11-20020a170902f9cb00b001d58cbc863cmr1435468plb.27.1706849735443;
        Thu, 01 Feb 2024 20:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuzGWXEriJLeKQmmTDmUTB7aZmUbOXiU2mC2rYxMsQ1toxMQW42aabv+jnoeuV3WboTI06ja14Lf5LXWKL2MP/qUlFg6NSF3VNQcbJVQ6SFX5/XQix/EDMWmmmKPkPFxN8YNsCU6chrqSUyQXyEJE/gHDUBO8n3hpqvN32qbMmK510/cx1nSbQX6EnBHbiT7Smi1Dk7lctprqdtQ==
Received: from google.com ([2620:15c:9d:2:c30c:2f35:dc97:44fc])
        by smtp.gmail.com with ESMTPSA id i133-20020a636d8b000000b005d0796e779bsm652708pgc.12.2024.02.01.20.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:55:35 -0800 (PST)
Date: Thu, 1 Feb 2024 20:55:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH regression fix 0/2] Input: atkbd - Fix Dell XPS 13 line
 suspend/resume regression
Message-ID: <Zbx1xA5FK_c8EEmm@google.com>
References: <20240126160724.13278-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126160724.13278-1-hdegoede@redhat.com>

On Fri, Jan 26, 2024 at 05:07:22PM +0100, Hans de Goede wrote:
> Hi Dmitry,
> 
> There have been multiple reports that the keyboard on
> Dell XPS 13 9350 / 9360 / 9370 models has stopped working after
> a suspend/resume after the merging of commit 936e4d49ecbc ("Input:
> atkbd - skip ATKBD_CMD_GETID in translated mode").
> 
> See the 4 closes tags in the first patch for 4 reports of this.
> 
> I have been working with the first reporter on resolving this
> and testing on his Dell XPS 13 9360 confirms that these patches
> fix things.
> 
> Unfortunately the commit causing the issue has also been picked
> up by multiple stable kernel series now. Can you please send
> these fixes to Linus ASAP, so that they can also be backported
> to the stable series ASAP ?
> 
> Alternatively we could revert the commit causing this, but that
> commit is know to fix issues on a whole bunch of other laptops
> so I would rather not revert it.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   Input: atkbd - Skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
>   Input: atkbd - Do not skip atkbd_deactivate() when skipping
>     ATKBD_CMD_GETID

Applied the lot to 'for-linus' branch, I will get it into the next push.

Thanks.

-- 
Dmitry

