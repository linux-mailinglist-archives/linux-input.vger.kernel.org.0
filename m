Return-Path: <linux-input+bounces-3844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 531148CF4CB
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 17:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4011F211DB
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 15:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A564F179AB;
	Sun, 26 May 2024 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOKenyha"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992F1803A;
	Sun, 26 May 2024 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716738535; cv=none; b=tubGB8DdD9tMfrYo1qUC9D75TzkDQzSuawFiEDLTAqNAsDbalLN3mraJJALHxFRv2b1/KgL2BYBo64ZxGg2Xpi/14h1Mu3mAzB9aoEIpvSc7QRnF4K4vIshFFzARguuRXrLx2FiKM+Ra9GuqM/EbSFaGHKmETGliob9X8bWt7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716738535; c=relaxed/simple;
	bh=vX8Soimw+0P8TQSw2dZ1kVgK27f8UCPdL9tr4CQShz0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id; b=a7pLcHX4P6dRPGvY8PlFyD7hx5STht6AGbcJLqg+304YkB0fp0Ygm6b+9fq/KZ1GGBsfOGlH92bbh+wJTu8wFUpzN5HWaz5MP1iirjKJ1bPSqV67GT/1uqSNoB6lR5JtQ91CQBO56qFXDdlv226B32QVBNFi9ATlzz55mL6V/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOKenyha; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6269ad7db2so283820566b.2;
        Sun, 26 May 2024 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716738532; x=1717343332; darn=vger.kernel.org;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dZCRHP3lD4Nrttw3etgWRodRKmfLXV1xJdjRxR6e4U=;
        b=DOKenyha+hAoUaHLSmZer8lT2y/VMdAXv3YbxEeAXlDlBc5NWnGJ9vVty7imSIWyzl
         dKRAgPPAd2/D2p0E9X8wHG4ukZ3UHUA7ljNa2I5kcfsoH9E3uB/rfxLoFKz4XvbTiywg
         PdHOtxDJbILsp8gHjVufoKLoQ5qb8CqAhiaj6IWNB8qwwfcqj/d3VdjIQVdDoq7CDTYs
         R8KPvrX0lIQU9gP4aFYdVvuWjjHqtyr8WxODIqEBQwdQHzIUmPfzzuiGSF1keAG251qD
         9OTAHXfIQfPO4GBVERzDCch2HETCvW30kFnP8HrcE+0ZV+YW9F01+Yr0ebGr62Mzu0hr
         fe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716738532; x=1717343332;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dZCRHP3lD4Nrttw3etgWRodRKmfLXV1xJdjRxR6e4U=;
        b=fBOTThxCXHGIg/dAvIAXpFVOGIEHhZ8glJxT8us/dQGX/0uPFlr736LBxjTaSWzNlQ
         lI4S5gazk6TBuoA1dZna2hJQGQYxCptH8Aemjc3oN+XA3b9KtoujQdqSWwjviAGvzZkD
         8N4SJYlNztnsCMplz9tSeGMb+gbK8pv64MUs6OSElNDCWj8AfQ+yuOkc1Z01kkBhooUZ
         DjypqpPfVNQEtnkpqavcNO/dom3jZar3t6+8j47dSWfCou6JeEeSPQbNz3CXtkx+YNNq
         M4bkV80tmtWJfI4Xt+GYOoGyZpyxnAamlxMHXD+mv77wMeqku2PbsIfa/WD24jEEiIGG
         95/g==
X-Forwarded-Encrypted: i=1; AJvYcCXDP1/unqBM3+OIMy577jTSHa04iAvPRShXFTcKQBTN7F5eHhE6VoDwS4axyqyjl4dja0HAYLdE/I//nh7Bjc43l+biX1On++HwFwSSxbbOfZspZf84rkgygwU4mLhxIMW0HI5WMooGkmnfC6s2AHCpmfX9tvDq5WQOqBaN/0hWwPrLqtyBnv2Cjis=
X-Gm-Message-State: AOJu0YzlHqdqaLKhpOxTALTYozZL1jjJrssEpfrzRH8qY6+jZ3eLhxvc
	4fpZaJL/i+XHP1c8dXOPIOrGgOc84cw99lxBDD8CA8hwqHk3FUbl
X-Google-Smtp-Source: AGHT+IGtjapIJoW7FFG5Jd2WyRu8B7pkFVo/HAEQ5T3d4nRUjhtgfUtCBj+AXz6lIh1kM9SK48cbvg==
X-Received: by 2002:a17:906:170f:b0:a59:d063:f5f3 with SMTP id a640c23a62f3a-a626501c25cmr433471566b.63.1716738532214;
        Sun, 26 May 2024 08:48:52 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc4fd41sm397612866b.137.2024.05.26.08.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 08:48:51 -0700 (PDT)
Date: Sun, 26 May 2024 17:48:51 +0200
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Martino Fontana <tinozzo123@gmail.com>, Ryan McClelland <rymcclel@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: Fix an error handling path in nintendo_hid_probe()
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <9e599978852f9a2f30f9523edfd220dd1e25aa63.1716735907.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <9e599978852f9a2f30f9523edfd220dd1e25aa63.1716735907.git.christophe.jaillet@wanadoo.fr>
Message-Id: <31TNA0FQDFO0L.21EUCKC20GDGV@homearch.localdomain>
User-Agent: mblaze/1.2-30-ga027417 (2024-05-20)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> joycon_leds_create() has a ida_alloc() call. So if an error occurs after
> it, a corresponding ida_free() call is needed, as already done in the
> .remove function.
> 
> This is not 100% perfect, because if ida_alloc() fails, then
> 'ctlr->player_id' will forced to be U32_MAX, and an error will be logged
> when ida_free() is called.
> 
> Considering that this can't happen in real life, no special handling is
> done to handle it.
> 
> Fixes: 5307de63d71d ("HID: nintendo: use ida for LED player id")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-nintendo.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

LGTM!

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>

