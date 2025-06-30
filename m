Return-Path: <linux-input+bounces-13234-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF23AEE257
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 17:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446793BA27A
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DE628AAE3;
	Mon, 30 Jun 2025 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIEyza8q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230828DF06;
	Mon, 30 Jun 2025 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297106; cv=none; b=bzmwJdopz3BSnvcqh8odt+vQh2BgboNoJsYiUWM83uTs/4QZ2UfbuU4ts2wPXAjfYu78b9A5uh6CV7BDvqySzW22FPD0LuKdaRYQszrDGrD8z/5J4KGF9fbmOAbSS3XGOQ/EY9MURxEre7Eatg5O+XVhxW8iIGTVolz67zgxFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297106; c=relaxed/simple;
	bh=TCbNJNoCNlDEgh6pf2YWPfPCGxiDYYRd7XMyuy0im1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU1XVW0W5IJfJti+GPyDpv1uzF+H6qXwQDJ68P36li/RHto0vKbOe4F41y8Vk8SGcSg57ccedIzoGW6Wm133ZHTMoTfN/lhU26P8mIkbha436n7BwEhlZzMCKY4y/bB3SJFjrkLD84d1fYh4Bs3Nt9S9oIRH4bCW6HP+8p6cZ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIEyza8q; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b271f3ae786so4179766a12.3;
        Mon, 30 Jun 2025 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297104; x=1751901904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fFMt2MdBt4V+3jVyKnzW2CbyNPSCknGZaPAUm9S6KuY=;
        b=PIEyza8qREImeJ03yE6GuOBiLYmHJmDQ07f4HCJqe4Z2kVTIcGHTTsXrW7kIOFteME
         1akJJB5nR38ebZutiQ64szy6eELMfNvrnuUWClxnEysLk5Pu2asIWY7J/mb0TAW8ualK
         frQ87h0AbI1cfjPZWpLQKF46Qlnzswv53KeGsfzDc5cpTyD8eP8y0ycKUxhlyh1nq5ja
         hzLp7hOJTy5KXL2NkdEOhrL5LgmRCAXZR07xMp3wN/dyRGnAoj8Ds40R6eWXqD0wpC+k
         RNV+Q0BryFW5xLEnwCKP303mNI+5i2BsDxGPDgJSkmZPpsBs9IAoE5HgapPGzrUSEX3W
         SpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297104; x=1751901904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFMt2MdBt4V+3jVyKnzW2CbyNPSCknGZaPAUm9S6KuY=;
        b=vLOCAGQj4HfrUcMuZHm+LykUCroI0Jq+ECn7PMV1/IhjZ4P11IL+63F3CRGNVl0hkD
         atle1JnSaMxifGR91e/a6xwzYFN6q8S7y6FeESXqdyH34dLZy/gOfmr44Dn2AeE0XTy5
         SdOdODDgSw55wYkKFKs7V09+FD7Z7KKqNuhxZNPs/N/97ezMfSj2zgMZISjzbgdW9rxB
         A+kIK4xqC0Fp3J+n0L74x9wibmJJZsAtfGc1dqx1Me+QqFXLyJKnrMZAepAHyVFAqUm4
         pw063kqo+nWpK7C9wBZZUMj4ZAMlZaFAbR6svQnAXjbLbZDH4DYQw3e0+DojzYVWaida
         VFIw==
X-Forwarded-Encrypted: i=1; AJvYcCUwLtvKKAXhoweSr9FOsdJKeF4gw28/sC1AvcS+7iVPEC7Zlyui7uJcc1+Xv4h0ZzN/uZAbwy6Kl4rFSA==@vger.kernel.org, AJvYcCWVAVZ90onrwG/L2xn3zPHA3D07h9zFMaeTcB/ddaWPKJo5CWkgk6ZTy3XRSgkV7SXfAAmgMa5XOtWX3fdA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4sLtF6jQXtA1W/CH0TUMp6uG+65q++T+9deqcRG5sw0BH2Kh
	B2cTvtjAgpefOAxB7/ITc087LhVbkqXzhYkbBPxRw9XHf3Myc20c+baA
X-Gm-Gg: ASbGnctIc/EXwYe5yIbipUdEtuFZ8kYT5m716G8Zf4qNX4LE4CQ6cjl8GTczsHcCQ0n
	mBUPm/vvwZBgRgjRPn9FPyzI67nKWgkoJf8OsovHJccpui6XZrGQ5DdPekxIc1lclmwXQxsx1ia
	DVrfXcWgk26KBSgoI+rltIqzQd8H7m1YhZaya0bu80Hn50EWlgI+6rEoNLThbT5q/fL1lN6gOrl
	5F/pVCzhk0ZQQq6gQonRAP12U3SJ9prfEDIFZINWpnukRXaLEH4FOB7o2/M9oIWWgPG+PbHEeOx
	HKqPohVGlSUwKuGYgaeHuftFA/Iqkar2dMafwjeX3Sjvd1YQk3JqhvyvRNBkRA==
X-Google-Smtp-Source: AGHT+IGi/BV1hm+wNmwcS/bd33jUP4+OQR0MfEr1fQJGvAe2GucDnTzkLjVIBYkKRzDtwbp3LLJong==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr24227498637.31.1751297103625;
        Mon, 30 Jun 2025 08:25:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b350d81f0ecsm3185769a12.27.2025.06.30.08.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:25:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 08:25:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>

On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno wrote:
> Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:

[... snip ...]

> > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
> >   	const struct of_device_id *of_id =
> >   		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
> > +	if (!of_id)
> > +		return -EINVAL;
> 
> Please, change this to `return -ENODEV;`

No, this definitely should not be a "silent" error because it indicates
there is something wrong with the kernel.

Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
not a matching OF ID? Are there any other patches that are not upstream?

Thanks.

-- 
Dmitry

