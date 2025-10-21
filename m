Return-Path: <linux-input+bounces-15637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E3BF8002
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 19:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B0E64ED9F1
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 17:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF2B34E757;
	Tue, 21 Oct 2025 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0wtJmlO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9467D34E747
	for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069521; cv=none; b=WAvOmCT1HBI5+at7xHw3N7H0uDrHuj1tFdHr2HKr0yM6FHty7ez8PME8YpAYeBJNfZVPF+Pfo5VN2hCTa6dkKi9oTRwohrW0l6dz1M1Y2gddFjZ6g/BZoJfODyhs0BHvQZLWYhDJnT6evx2GgL0Kt3ESE2ny5o51+DDtdGuN+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069521; c=relaxed/simple;
	bh=oVng6fWpL6+zAcowBglyuHt/XIthmz+mN+6mXhWfgns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFc9tOdxMhDmDnmdm6r8UhuiE4Dw9eOP4/6m3W28T5xFUDnRQbwBpCqqxCRGYdo/zn/nRQPYdSgBSOxmBEnlwBazNz5arcJ4pgatW0Dv0KGKlNrNB7feKWr1i3fJlttOedJEBlRY2qo/SYeYlBJ8APouCdXuvnl6yngZi5EBrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0wtJmlO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781251eec51so4678515b3a.3
        for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069519; x=1761674319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrSVEkanyR2raSWr6Z5enbATkDaqZXlpz9bzA6mqOvo=;
        b=W0wtJmlOUkEuSXcABm36IicjC1uVQ23JTFm/RJUGDAd+cr2T21rMwbOkNdmrWPz02r
         nnEL/iN3hvdehB9QTvdP5C6MgYlIn5iyR9qB2MYoZVz40T9UxT/zEeSMFwRYWQaQUZU5
         +7mskIfCrigsGeYVJeuyAOqBweWRfGtvXtQ94jemhPt65DY/AErpNYX+HN7Ad72pZwRD
         /YhJXdtuekO6vUIGkJdBI+kMW0gkS0But1ZEEnCv2+rYwah7jTIGksSAD49KBw1W5dzI
         l+nMowBhFQkw78pYzicRvC6gODSU1/UCN+G5Jh3hNSqUzlffTLEyuK5KRwrQmfLm26Gg
         TZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069519; x=1761674319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrSVEkanyR2raSWr6Z5enbATkDaqZXlpz9bzA6mqOvo=;
        b=GWkY9zXL9XZLNM4+gvj41AczPN3W/Yja5q3Ikv7fJjCTW7vQaRuIhOg3s+X9d9Jx/5
         yyj9n+axukaW4xLWjMFw2TYqVr5QBJGNhBB5kJqY/XXHFaZKQ1LNJB+iY/A/riqC1N/c
         Ps2gPhWP+oN3+K2DofCEJIUsVaLx7Tr7egnvCYr1hP8Ln4Uhb9gzZJCKJARTUGfPqkdi
         6nvuqTvNOHLKPlkjE/gAM8yr7wRmzhakGGCqnLEfIBsYjAorgAFVODv0fSq2IzjOBtZq
         rx5ZAzr3oLM51xldvaVaJbxZaDe9ovgnD1c/7CDJigsBt+VefhAIS07/3Go8WidMb0Rf
         ALhg==
X-Forwarded-Encrypted: i=1; AJvYcCVDlQF5RJh7pfd4BdD+/E5O9THVkMvj3ToVG/tdS7SX4N+TZXv42cCUeFsK3kYYpQJu4+xV+6XQ5jE1iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9OnXWNCytkxWaw/OEoH4UwvhyxIS2Q0mbiS9MBIYUM5YLDto+
	UHXjpwsITTftwEvX1wKiXWN+0Gdd872WC7TtPhXJgdTrKe+60rWVqXNl
X-Gm-Gg: ASbGncv1O1VMfiMP1jTlzAFawbKOq5v8fxrtPlsM/SH7TplTF2Y4sykMerIil1M4mqS
	T8lkzjXDTcNDZz8OWG6pKnWEBk1+0JFKG5N6itfLJeSqF+9dPrP8DL50TooTmMILByHxP4PcXY9
	95sFh6k/XJHoe57uauCBYgROwYcwccO6vQKn3PlB7r6OPBmSu3GmtHWoW5+Y3YINN0o8wfghUHQ
	UYY8HembpFaEF18sEL1wVlrkQYKP4Nf3G677a14PRtazQENWjqkmFVmrlJylhu7F1icJPknsN7s
	88WkXlNtXzhLNQsijbLHj5znO7aqsP6Jl1LwAPZCWCDhUhu0ccUVRQur9uHGZxsqieGsqRSzCGH
	6HrGcegjOyTuPOPm81J+H0zv/nvaWYn9KoJ9eLAJhNZCxCVR78iQjG2v4fXoWnxSHmmoytAKWaV
	Ch+WxXNVEtVepjZi7wo/s3Uvmf6QbIs0Y+NPClNHMM
X-Google-Smtp-Source: AGHT+IG1/8RQi0Z/qvWdJQ+g6q3+RnnFcN/xD+n+8yNjkNb6lOorDEZJv4LXW+vDN+NpEpk2xHxl0Q==
X-Received: by 2002:a05:6a20:9392:b0:334:942a:daa8 with SMTP id adf61e73a8af0-334a8622b2emr21456240637.50.1761069518621;
        Tue, 21 Oct 2025 10:58:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf44:8af2:4f63:3654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010df2asm11941146b3a.64.2025.10.21.10.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 10:58:38 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:58:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: add TWL603x power button
Message-ID: <aalnnbzeajxgnq33go5b2gi72yjzeeun5f2pkbdulu2hwuz663@b65xssnkse7l>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
 <20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>

On Mon, Oct 20, 2025 at 02:31:59PM +0200, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so add
> a driver for it.

Could it be integrated into twl4030-pwrbutton.c? I think the differences
can be accounted for via a "chip" structure attached to a compatible...

Thanks.

-- 
Dmitry

