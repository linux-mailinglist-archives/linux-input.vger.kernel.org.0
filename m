Return-Path: <linux-input+bounces-9939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A025FA309EE
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 12:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFE6163947
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 11:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B327F1D5AA0;
	Tue, 11 Feb 2025 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL6kM5OM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB21B2182;
	Tue, 11 Feb 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273438; cv=none; b=d4fKrxBSyEpuE+bLz87Fss6ACcNCLQg/9p3PhqH4I+uD0veRvfYOkTyWpGv20Bx39Dfgrke2Y8P8aWL0JogdTseBIUFYAVafxCdtq/eQYQdnhERAy6AD7C00jkL/2cpAhcJ6TJvaexjMaT0fxqYJZ0eiPT1lIM0FjQh8FvWlzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273438; c=relaxed/simple;
	bh=iKfpANTlvJkY19ncUKSz3kVMclcofo/ZcPJef61+WsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNrTEUeYoSibn9J4Ge3cxgxuHZdi4018OVLswoJhpBH5Kr3DwvzVOwuu73yqt+7FReikou/4hGZl9Y/8xT7jEtCBNagw4lj3+iIzIzEtEwKQlqoLTcJID6VUE2G5bOHn+vBCdphLlrXw+zZ83eARhxIeSfPjS5htw0Tlu58L/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL6kM5OM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439473da55aso12074575e9.2;
        Tue, 11 Feb 2025 03:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739273435; x=1739878235; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKfpANTlvJkY19ncUKSz3kVMclcofo/ZcPJef61+WsU=;
        b=HL6kM5OMmb5MUHYNd6u9bY6DLh8SjjzXcbdmnlFW8hIjSzUv9EAhut8BStehiFt8Z8
         Z2vXgrO7vgBOG2x5e6zQFns3AOr2NKrYRJ0p2zokK5RQL/R6gvGL1rA1zkKZ8fAnvViy
         4WKMExJDbrf0zsHBIp9om9vE7IYsZCPglJ+AvaBCB8CJ0MwNr6AUcszM+aXkWJdFQ3nN
         LLl6/tgGA1g0r3lNSxsF2G/1wtMM3v+e+Ze2urORYQgpWA023ir+KJiGsp3KY9pPvTGD
         x+cDjRy2TKZZubOonwnv4+gNV9FkYSXd0XH3mxcITzoYptfNkwym0Qlqf2oE+BbxH/pZ
         Xwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273435; x=1739878235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKfpANTlvJkY19ncUKSz3kVMclcofo/ZcPJef61+WsU=;
        b=gWTDdhZxZkdm+rALJSvvjhTO9+CtrsIjuAb2TUvvIvC/oZuau5ta5hf2zjHk1arEJR
         SPMCVA6HZRZHH3DFWntuKAHu3WzE28pCFvRJ8APbsX7/AJqMVgbT8B9ljhLlIXEOJTpb
         UzDxaoUeUwP0kVq3gy0Ev4Cp0NwEo12fklCFOp2en/vZ3AfZmm7qJ73iYZB+0CZTPIoN
         qcJnxGOLRUqCjSIenEAwz+AU9O0Yr0qRLLhq2XNeq1M168m3jNGlVH/nurHt72Ej2jhK
         J5ralqLceVdayy/0nzvEFErWq116BeC37oZccfCXj6J02vtZ8jVE14YeQcJuse/ASDsW
         Lkjg==
X-Forwarded-Encrypted: i=1; AJvYcCWKrhXZUMEGyY5IuxjQHx5oSz1gaCe8vAdquDkiA/JJtqULl7dZGpqRQ1ep63HNu90EUMMzMtVN0k9l6Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiz2Xj+7p7RtD4OaS1izkntCq2dW8JFghW+g9rQqsVgoiJi4CU
	lMcXnz8FNOCn5xJSNXMejXSTAirCdD1ckq93PXY/fCDrZVJ2XeAm03KisJDHiHhnCmqRD19VIE6
	aRZdHLIdkZsx1r5MXdHNTiB+uQXE9lGeyRuo=
X-Gm-Gg: ASbGncuIIOal6UBdAVUYSoUQcHfqL8zvBMWY1W+Iq7Fw0/56fJQk7cVYtI7nKGrgV7r
	UKGRJr0C05zCwwQHBHO43bfwdaHUaD4QDsKI9xYnVYF40oz0MO/CaU3Xr3vq3j7XTUf+uUx490Q
	==
X-Google-Smtp-Source: AGHT+IFMN8o2fD3e0ey5hbfOt+gqTilHczy+pwaBD3tOvRh6w6nMMRG2Ty9dA93dte9JQTqpmcNJ7TlbGQR4MWk1Gpw=
X-Received: by 2002:a05:600c:1911:b0:439:34d3:63c0 with SMTP id
 5b1f17b1804b1-43934d365ebmr121649065e9.16.1739273433549; Tue, 11 Feb 2025
 03:30:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
 <5cf187db-1eae-41a8-a33e-ef68a4f66db6@kernel.org> <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
 <CALTg27kaxGOzq2k-dAqbXZ0ez5e-WZRU47Z2eP5297VVHF81kA@mail.gmail.com>
 <0bc098bf-6c02-4d62-bcb1-939e1f0b9f95@kernel.org> <CALTg27meqwVyR_+doDzT6v-frx9hfy=fqkz-S2fTJpk8SMmThw@mail.gmail.com>
 <373c2d57-a513-4c2a-ae38-1aa01262c197@kernel.org> <CALTg27mhZ_O5=Q5QwmtAbFuz+phcmt7nVfJo7OAUcvCvDu9ggA@mail.gmail.com>
 <8b27c399-098c-48b7-b71d-a833594571af@kernel.org>
In-Reply-To: <8b27c399-098c-48b7-b71d-a833594571af@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 11 Feb 2025 11:30:22 +0000
X-Gm-Features: AWEUYZkehzXOIYi8Q6p4Byiu6cy9fW-P2y9QVa4GBmFSJ1YlIGv51-AAZC0JLfE
Message-ID: <CALTg27mzuJsvrQneDKD9ni=tYspaap7=NfLgsBak4hALu+1jzw@mail.gmail.com>
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And what about having one work for all three (reg, up, unreg) as I
> suggested. As I wrote, IMO, you would need no lock then. Only flags to
> see what to do there.

I wasn't super keen on that because it felt like forcing three otherwise
separate things into one, but it makes sense if I look at it as corsair_void's
work function.

Is there a guarantee that the same work item won't run twice at the same time?
Do I need to make a work queue for that? I'm also not sure how to pass
arguments to the work function. I'm sure all of that is answered by some
documentation somewhere, but I couldn't find it myself when I looked previously.

Thanks,
Stuart

