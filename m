Return-Path: <linux-input+bounces-3749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC358CA509
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 01:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C6DA1F2160C
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 23:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336344502D;
	Mon, 20 May 2024 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwBZHM8X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251D45BE7
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 23:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716247736; cv=none; b=sh4Q3I5dRmU5YH7R3ijoal1brLJOpJUMkwiPDYzuvU2FnVpldzMZa87YyaCQER01VF/QK73IcqlRHp/uxvahx/uZe6EhttAll1jNlM5mVt8yR74oOauKji8SAsNMd7itLJqUgFou8NiVS7llek1sz/yZzyXd4/RgQq9Z/DuhHkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716247736; c=relaxed/simple;
	bh=nc4KUOkweCN3rZi6EcPFTlryCO8zhpVVX6y5qMzc9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QekrVuzGS610MEERzoXG3fkXyKU2fvURMaqURFe8PnIETAVPcRCaUPHaKygZ9ZyTxqpYQR4xW3WrGqVhVl2wA+vKhNFjlbsFdxP24XtnJNteWMWrSoX6o1suCKzsnXpJLbi9SWuZ2KPe0g0n6//4542sFTCNmu73eq1eW/p65u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwBZHM8X; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e651a9f3ffso87605205ad.1
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 16:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716247734; x=1716852534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqZF2MDQxTIIOIlgXpQmAeUDthHVL7l5k/N2PWC//1c=;
        b=UwBZHM8XHon/wh9Ln2U94vSxtpvF49w8EqBvaHelY5h+ryCSZqJBSgEEByHIDbCmG6
         FBVw4DNKEaedO8peQ4Ai6CwSmZvm7+eax2DVCC/Qikg2Lruqo2hhi6w1LznuCo/YaAXv
         8mSHFXTReLGJf21xjdimNBSqclqLCS9H/nAjAkxMW/hks87btW91fMzf+XGuweHYU3F8
         xD9orrkKMYOvoOSxsi1o1kZdtL4JxXBbXKp8gZ7F8uV+nxLoUiMGmR+KZIGiMjjy99es
         5LkQj2qhlbB8yBM9DYHGKiXEgEiBiAkyf7hOQlwRCVnwdWpph+Qhsx0nqMr6TqBqG6CR
         FuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716247734; x=1716852534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqZF2MDQxTIIOIlgXpQmAeUDthHVL7l5k/N2PWC//1c=;
        b=Mboi+/J+8AdA14vMJw/gSTY+Yvil3pMgGYsdfZYCVIMjO+ZCNiKS9+qVefd7VjHhlr
         qG/yzJDpwnpLfQxIKd0y34JHPY17rDtnG+B3EVENBe7TaJqbaZGQG3X+IJhFusrt2j5n
         GzLLe77Hukq6aPoJMMwavLnZ3G3GMLon+fFoD4QUK+dAY7rQxM1irFqkFrJsYUGwEtGb
         20RktkytS4JMqiD+g6poKxW/nxMTFkwtc/Cc8BYHjA4fe7zDX6fFCKktltpRGY83qt7X
         yZhG4Bth7cCuPOAh2by1DWUulh/fCOfEXMbs9Vj/A7r71Ue3wn40nCMz/kcwOtZVlRZc
         mjpQ==
X-Gm-Message-State: AOJu0Yy/FKUMVOToqrUfOZJA792jtw3jOy2DKsRagot2NVbkC0oJU7ox
	3wMcKiRsXrI5z47VevPRSxpQcyztArfbXy8YOSylNCNmzWwBIQhlgjX2kg==
X-Google-Smtp-Source: AGHT+IFNlU56ZhOCTnuD7IBdtS9iDMaA8LFfbkW4xqeAqZKpmuxAQ3H+QBIfDAGoe9L0XLzL5Bbrbw==
X-Received: by 2002:a05:6a00:22c9:b0:6ea:ca90:3459 with SMTP id d2e1a72fcca58-6f4e0384f8bmr35643516b3a.32.1716247734300;
        Mon, 20 May 2024 16:28:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2e3e:3013:ba6f:ef71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a665a6sm19560378b3a.2.2024.05.20.16.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 16:28:53 -0700 (PDT)
Date: Mon, 20 May 2024 16:28:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ping Cheng <pinglinux@gmail.com>
Cc: linux-input@vger.kernel.org, Aaron Armstrong Skomra <skomra@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Joshua Dickens <joshua.dickens@wacom.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
Message-ID: <Zkvcs0yg1ltamZPY@google.com>
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
 <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>

Hi Ping,

On Mon, May 20, 2024 at 11:00:26AM -0700, Ping Cheng wrote:
> Hi Dmitry,
> 
> This fix is the same as [1]. Without checking the return value,
> Wolfram's patch [2] fails our downstream build script. I'm adding my
> r-b, if it makes any difference ;).

Could you please tell me how exactly it makes your build script to fail?

My concern is that the warnings are not actionable and therefore pretty
much worthless.

Thanks.

-- 
Dmitry

