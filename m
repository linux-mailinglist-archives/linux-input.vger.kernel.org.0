Return-Path: <linux-input+bounces-3253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5A8B15FC
	for <lists+linux-input@lfdr.de>; Thu, 25 Apr 2024 00:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D781F2248F
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 22:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CC615687F;
	Wed, 24 Apr 2024 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIBMG8Zm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364C15FD15
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996943; cv=none; b=kKt5fIrzkiAbM7Uv6pQKGMG1KR0YMNn60M3kgf8PFdyWwP7mmMLE8dMmQWsF4zajk3sWillybzA3TaFZB2wzG5OKg4xbiAAbWSXKPnDR6b7uT7KvoA8QbTgkqmw6740a9v/pBrIh4eaIwj3K4/YPqyofYXU34bUFQI7qznRbhu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996943; c=relaxed/simple;
	bh=s1Xnvmps2n88KcqzrtfmWNJKd/90xykDr5/kejitvx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1zgYbSyicEfks4ggMWNejwWPJAWpetJ8XMOftOjrWkjTJQe++tG5cT17D6ykdyiKtf1tayZwqSFg2kOCD1zUKcA5tpMes5Fq0kbFOGdlbthSTqB0dY0Uk5Vb5MHtt804RB04R7a45f53cYSjU0fD/dx0rq/9NpDL98JiJUAT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIBMG8Zm; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so281850b6e.2
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 15:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713996941; x=1714601741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/sk7lVJEkazFenmwm54a7K3Z77SahqFf7UXfEtkRfD0=;
        b=RIBMG8ZmzWd67oZj1VjaSWjfAhtF1TACOnPtYpSXQWLKfU2yh3X9FpdP2kG8I1RWL6
         PcjiYtYLKXUtGW0cHoJsE/BQwlqVP566aTTBm+I2mIy+cLZ9/y5GEDmuet8dOK86YYTk
         hJbThDKf9crhpuc39sOqDRASI9K3wqw5oYGkWfsTUUYeGc1039/dWqZ2Aj3qquLIKfiE
         1kFAu12RLPSTM7XbkZnEpyO5IRb6f/3IIOS7WGavdTGKb+5UsIz9ytFdP5rk5n3yaZPW
         HlsNd5P9nQxc31l8U5+cTGRaIFIlslhpe606HFrgOOvJZb64eq9NLwaO6M5OTgN9yuuV
         YXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713996941; x=1714601741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sk7lVJEkazFenmwm54a7K3Z77SahqFf7UXfEtkRfD0=;
        b=QXW7tkTBUSKjNBqVzzrzaOHrG9lRzgRzlYN/Cz0PbDgcTvOXMtqKRJbqt0jcalBZRO
         838NNKaEHqRivqXyjJpSJOCcqxyBYL++jE5zk54FcomYeHYQz+kExY6JWddFJJ3EHo4A
         1SvVVtsYOtpEIBSPZ1O3PoepABgS80VLAJ7ci3wrwg6UUGA/s/KHyqFegEAmgWn6gjK3
         Ab87u2jHfu2UjD4quWmTriJkaj3VmLr8ZikvuklvUvlIwBWQP/Nn5mvHYcN6/SA4yllK
         xCvbN2mQxFAxZwotUQ6NZMK02ZuFgCsbJtEU7Ocwz/7wT0/wyi9UgWbc4qgvOKCSq4wa
         pJeA==
X-Gm-Message-State: AOJu0YzFsHKHWMoPNt+IAU2UStjJJAfp/vnrmZ779XuNoBIIj5FoA0CF
	kRUtN7r4Yw4Oh28vDOV19NgWFF7pb/w03aw+z3rSXuadNWcUIlkI
X-Google-Smtp-Source: AGHT+IGByXMDt+JKrA2oS9ZqcLFZVKv1fSMjUcHf9yAcdlNu5jKANtZd/D1xjGv6m4P4Xm8e44P4vw==
X-Received: by 2002:a05:6870:1653:b0:21f:aba0:772d with SMTP id c19-20020a056870165300b0021faba0772dmr4447928oae.39.1713996941008;
        Wed, 24 Apr 2024 15:15:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb56:1f71:e1fb:62e4])
        by smtp.gmail.com with ESMTPSA id g4-20020aa79f04000000b006e7324d32bbsm11893793pfr.122.2024.04.24.15.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 15:15:40 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:15:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for ASUS ROG RAIKIRI
Message-ID: <ZimEiuV6-OWb7Tp8@google.com>
References: <20240404035345.159643-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404035345.159643-1-vi@endrift.com>

On Wed, Apr 03, 2024 at 08:53:45PM -0700, Vicki Pfau wrote:
> Add the VID/PID for ASUS ROG RAIKIRI to xpad_device and the VID to xpad_table
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

