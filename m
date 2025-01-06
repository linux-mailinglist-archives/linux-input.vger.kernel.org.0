Return-Path: <linux-input+bounces-8946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00403A01F77
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83B533A3CEB
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 06:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63C95CB8;
	Mon,  6 Jan 2025 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPFno0c8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5C1EEF9;
	Mon,  6 Jan 2025 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146796; cv=none; b=f3fVQ69/efJ3bjV0NeWq51EwvvtnZSx4Yi3UPyvMsjmCbWmjK8FzcNafVNY74ukIJ/Sp8uQ229fnnAsMUynDtNsIZWNPB8fnPq/TPSgmQ4by7WlRyxHy9WJtFVsJjCOsDVafv/L9lbWVwr5N4YHKH0SeSeujHuQn4Nj5vIWSlBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146796; c=relaxed/simple;
	bh=kkeGXaP0kkOYJH16zpi2hb8RraUD1SeWhE9L6fAw4zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2GQwpFt6dGYLBHSnAH/wk0HwJagdEGn7AJ9qyzON2/u6xWDSgmPUQOX4BeSFzlbzXzcWi0PnzaBABMOU7oV66UY02Lfs98LssZp0X7TkC+ENg7NvfH18aSk6FzIyAXNaR4YwwWz7Ub77EeKM8x+lAnhuZPSz/5LjANfW4qdKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPFno0c8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2167141dfa1so196419885ad.1;
        Sun, 05 Jan 2025 22:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736146795; x=1736751595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8MiRNM1VRv1sw/Nixz0wxAlTu6PRnb6gCu3c1jTacQ=;
        b=aPFno0c8tbbZZz/A4Orn1hiCra9cg/2aPPfbImxkpb6Q490LE30QlKdzLskPl3uLfL
         0req1Cv1+GBKlEIpE3SFfbMbWfe3JkSpAr6BuOtQgHBeIJaAcPHkRzf5Wg4DPhoiaYli
         pBrMyikJ0hiAcymNuuxBXs/epV1HWDcdQgkNt143ONPilTIPW5EmVIJeX7DY/MCYWK62
         wrgDYcg4z4vjzyN42mJ7re/7oCpwuAGa6MOa/ZCBGpuPjoYmQOx0miiEE0mp481F0rd4
         wElf5xSZQ2+UQCA10NDWPRAP8E9+KPwXS8dHQP8LZbCVHw7zBGQ594dkydaxCPfMzQXc
         EQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736146795; x=1736751595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8MiRNM1VRv1sw/Nixz0wxAlTu6PRnb6gCu3c1jTacQ=;
        b=jPRjvEm7U8N+oX3O6DRMMzHmqz1dW8FGKR5JYJQBRiE81OnHeTF4DNT6HD68pzSHx8
         EslZIifFZ9zrUJMCMz55ZF7zazllAcksmAnciljeuQMYd/ClaPBISqX1XviglqLtZLN5
         jh9i7BMt0Bxr1c2N2uyCbuJ0Di/V/FhNzPu93bMOhOVS7V++ZsSCVnwK5/MfegXhGbIk
         5MLWW8+jzMQ3sZd5YlMOuOtj0o3ruCvvUVoVp2QOGrATh5B8wqPg7q5vQsubGkpyPKLj
         42OgK70E0BQS6ZEb2f317YjPQfArDSZ2EwRHwZH2ZOb+QBtsriyITwfCbS77BmWDg6Fr
         UjLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIpKWisErhkT9IEVWCxNTVp/RjBo4mR8DVSpo//gMT8NoyV8Zxv6Sp1RwyVMRKcJefpopCG7P/e38ypZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuUxCvb5RKb0ILExAd2dFtble11G1EVQ6pt9x+fBtFCMEwojW
	4WAXb1J64rXOy7Cu9RZIPzm98DgJflbUgzpwa7S3LHedUJzMgsbU
X-Gm-Gg: ASbGncswXlC02JFmW03N56W+ff14olpSyevlHNatUL2rpgzgrp+2L1jSmgUOFwWI4aX
	iOK0E/jnD8TuPCb4eOhJWX9F9sNaO9celTmkX5SVS8sYaEpbAp8Ljq/lct+Sr1P9XNZtlBjd1/s
	xUdkoi9TxdBws05OISNAxTnch8mojgKwrxc/tEwzfSRJXKhfbrJ2VdFzx6iIjTlW0PP0zNypM3o
	2PCxTOh/YkgG5Mn6IAj57rXxIOtO3wyCgJiwZvY5KzfmMFH9fcP9PvV3g==
X-Google-Smtp-Source: AGHT+IFyHCE3TbfNBaeqPDae2cQgjrlmeNU946qY+T7osj/HuMMmaXjZwDLiNQhZOEZQ2giUYsLIQA==
X-Received: by 2002:a17:903:98d:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-219e6ccdc98mr908841165ad.7.1736146794581;
        Sun, 05 Jan 2025 22:59:54 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca029ccsm284363755ad.260.2025.01.05.22.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 22:59:54 -0800 (PST)
Date: Sun, 5 Jan 2025 22:59:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Input: psmouse: add NULL check to
 psmouse_from_serio()
Message-ID: <Z3t_Z_ri48z99pmy@google.com>
References: <20241230111554.1440-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230111554.1440-1-tiwai@suse.de>

Hi Takashi,


On Mon, Dec 30, 2024 at 12:15:52PM +0100, Takashi Iwai wrote:
> The serio drvdata can be still NULL while the PS/2 interrupt is
> processed.  This leaded to crash with a NULL dereference Oops, as
> psmouse_from_serio() blindly assumes the non-NULL ps2dev object.
> 
> Add a NULL check and return NULL from psmouse_from_serio().  The
> returned NULL is handled properly in the caller side, skipping the
> rest gracefully.
> 
> The log in the bugzilla entry showed that the probe of synaptics
> driver succeeded after that point.  So this is a stop-gap solution.
> 
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> It was submitted in a few months ago
>   https://lore.kernel.org/20240405084448.15754-1-tiwai@suse.de
> but seems forgotten.  Simply resubmitted.
> 
> 
>  drivers/input/mouse/psmouse-base.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index a2c9f7144864..d428e9ac86f6 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -120,6 +120,8 @@ struct psmouse *psmouse_from_serio(struct serio *serio)
>  {
>  	struct ps2dev *ps2dev = serio_get_drvdata(serio);
>  
> +	if (!ps2dev)
> +		return NULL;

Thank you for resending and reminding me of this issue, however
psmouse_from_serio() should not return NULL as most callers do not
expect it. Synaptics driver needs to make sure the port is bound to
an instance of psmouse and do it in interrupt-safe way. I will make a
patch.


>  	return container_of(ps2dev, struct psmouse, ps2dev);
>  }
>  
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry

