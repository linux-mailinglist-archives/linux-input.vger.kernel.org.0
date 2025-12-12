Return-Path: <linux-input+bounces-16543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F9CB7DE9
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 05:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD5483027A4F
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 04:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814492EA752;
	Fri, 12 Dec 2025 04:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVDQ2cDX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD682749D2
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 04:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514201; cv=none; b=p4rgn950aSa95J1eyAp37UiNYyfJvn8MY4ZaNoQwL9n+9JAvYicfIVZ72Cr6tr73xO3b9GZod1e5wZC+CsqypG9kfP/C0ggNQoq7a4qPxM+UyyHCZMf/F3JAgsNR/HYhIBW+DfMCsk2qew7zssnvqzkN359VpMqjWTp0jez94EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514201; c=relaxed/simple;
	bh=izvC/VTG5SdRufO3rbQ2eu6UnJHz/zUHVfUxXCNHN20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH16IIKNT7wsMQhfPNvVv4bcP4gbYk74Jtp3TClCFpu8uTT8446BhOFTnWdvYFVSMvqqqYG9UPsPUXxyJ6bEyuhIultq409gaE1PEm3uVKzWBtVDt2oXWt1Q+hyMwItSVXO6Y7UY68QA61JeG0QHTBH1dIgMkJgNJ7EU5ID5fF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVDQ2cDX; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-11b6bc976d6so1070521c88.0
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 20:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765514199; x=1766118999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s50kvV7cRV3FVuazE9IrYPdEtv6Y/mgFFfoCIbS5VTQ=;
        b=OVDQ2cDXuLx7VPGYqKo2s/cbqDSqpYTMSwJ8s/SpkukRIrUBI/s8IDzrau0vknFA+G
         iGbb82aiUYzdHf/HOW+1ZN4j9GfafVxTBcumow/oepWtfxmHeiX9Mi7MOOHd5qvL1YTK
         7lz6s/UTJ/rwAXpFHXb5ICvAQa+JjXmUTdHh/fxyKDD1j4vXB34zjzJyZkcudPPeDhg3
         eWW39fvs5SQqtvQdVa/0cdjVJQnwxG9XbwtL2UPv+iHphxXjApfwxqCvVZVJfiOqZoJD
         emK2KP9p/dZ9FAKhAVtGl+tziKcK4I5ZOkv127lo8rAofw8taZD7AejIdi9lPKTiJfBJ
         BIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765514199; x=1766118999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s50kvV7cRV3FVuazE9IrYPdEtv6Y/mgFFfoCIbS5VTQ=;
        b=GkDqODzMpMnsc67ILeFaMSOn03Hemy4lZS9npVEsnVoCqC2m+Uo7z6y4BnOfVJ219R
         cHCoj/0l8+Sp/ezx8zbE4xeQ9NGfh5P9NYp4XubEyZ971ZHQwzYsIfzP6BG3RNZKAaH7
         1EQqnm/NYrjn4ngepp44Kp241kE2LbWSq84f7CD85AQjZNHzsXpuop869mVL/00c0ATp
         g9e/WOmP6m/84LcnUBbwxAqFf2806XMqRa+Am6xmJP1zPcnD4xYUhnTd7CXI+9Teokan
         bqvMZgibVe98sggeRxajff4M7xbthAlXcAoK7qmNtfRpesonvNaNslg8ivILFCTB+lSi
         7M+Q==
X-Gm-Message-State: AOJu0YyP+eBI0fsREuprOecuuvEinvxSG+NwCZeXkWFZKnphc1+0C81c
	3Q7oa2DBxUYcJFcnKQCfTA1EfuHkNDx0L9IVQJy+2KbYeo7+L9pYH53Z
X-Gm-Gg: AY/fxX7hVWrYJXZ4zLd1Dyvg8rvNj3EH5rOXV6S6yHkbxqMfAEWb1Ue0NGM9R53f/FJ
	JKvOYz4P4M9Gz2fM8mM5YY/jq6ZCLEjbcaZaFnzUt82eo37IyCjmqFXZgIeSSH+OVJGrj9Bl5HH
	sCp04lX/stTwSlKPnM5cT7tDxAfESwD98sZUPs23wsIn1NtWIzmnzCO94nvIMJZAGy8/rlBZ7N+
	B5w04T6Rfiv1IvvHgpeoz9F7ckh2o7TzXPtfgQlCMqmnY9U85t3KMYj1kekUnK/cVku7r52dpyB
	VqmLSIXzc1/3Sw5LGbKvn6j78duqv7qiEypFQ5X5ALJY55j1kfLLIBArPkUqddj3Wvj+aKK9wrp
	0FEsqKb2N86JNowhHknRdpwCpB7FUbvFddTmHY54RRNPpBZTc7IVgjcxPNUywyjpXL+uQe8br0t
	vGgAXtAocNUxr9lchbqv3T8aUviJzc2uDB4oFP5Q8Hcy5EbhybxkY=
X-Google-Smtp-Source: AGHT+IF2xrXTlmdxAYv++ETrOonH3/AQfDDcb9WmTvM1rKqUqIo4CwgeJp/PTyBASgfy/LaNMOPfPQ==
X-Received: by 2002:a05:7022:201:b0:119:e569:f85b with SMTP id a92af1059eb24-11f2ededce9mr3774417c88.18.1765514198735;
        Thu, 11 Dec 2025 20:36:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:fafd:f9bf:2a4:2a0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30491dsm14246263c88.16.2025.12.11.20.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 20:36:38 -0800 (PST)
Date: Thu, 11 Dec 2025 20:36:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Minseong Kim <ii4gsp@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] input: lkkbd: cancel pending work before freeing device
Message-ID: <bycvmdyibmuw6dzmjmdonof4fqli6xv2igqnwpw7pxq5uqfvis@oon4iri3wjro>
References: <20251211031131.27141-1-ii4gsp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211031131.27141-1-ii4gsp@gmail.com>

Hi Minseong,

On Thu, Dec 11, 2025 at 12:11:31PM +0900, Minseong Kim wrote:
> lkkbd_interrupt() schedules lk->tq with schedule_work(), and the work
> handler lkkbd_reinit() dereferences the lkkbd structure and its
> serio/input_dev fields.
> 
> lkkbd_disconnect() frees the lkkbd structure without cancelling this
> work, so the work can run after the structure has been freed, leading
> to a potential use-after-free.
> 
> Cancel the pending work in lkkbd_disconnect() before unregistering and
> freeing the device, following the same pattern as sunkbd.

Thank you for spotting this.

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Minseong Kim <ii4gsp@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
> ---
>  drivers/input/keyboard/lkkbd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
> index c035216dd27c..72c477aab1fc 100644
> --- a/drivers/input/keyboard/lkkbd.c
> +++ b/drivers/input/keyboard/lkkbd.c
> @@ -684,6 +684,8 @@ static void lkkbd_disconnect(struct serio *serio)
>  {
>  	struct lkkbd *lk = serio_get_drvdata(serio);
>  
> +	cancel_work_sync(&lk->tq);


We should use disable_work_sync() here because even if we cancel the
work there is a chance it will be queued again (up until the moment
serio_close() returns).

We also need to call disable_work_sync() in lkkbd_connect() in error
paths once serio_open() has been called.

Thanks.

-- 
Dmitry

