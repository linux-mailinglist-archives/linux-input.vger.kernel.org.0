Return-Path: <linux-input+bounces-12681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2BACACEA
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 13:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7D8A7ACC83
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 11:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4944220F066;
	Mon,  2 Jun 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7bFXCtv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A441A0B08
	for <linux-input@vger.kernel.org>; Mon,  2 Jun 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862065; cv=none; b=ORJ846cG9+E7klyx3zNVuCwwwVgUabzN3SdKk37Abp/VYsJVPALpmzEaiCanBX2IKgoIvB2NQKRVxqrEVtKLLnsklKsf7twQreZ5AZHW5e7sq0GyHhPCN4NfZtAQZf0/Ik4OO4nFeAEtJv2DdD286VDmV4Z0Au/3OEmurOhJ+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862065; c=relaxed/simple;
	bh=hl/euo6Sdu63YjYGLOEeGJpt1NRGT7Z7ek+NVDBVv2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulpZm6kD1DWCKk/wJT1HNcQLXN5MKN0EHXFDJ+kV3K8O3RFjLCQxet1tLiYcEWK6Em3pvRD/w+pA3Seuct7mxDGAhLF2PFkXLLg/5WselG7nmUek6tSqG1QF40HbNXTnIhaTDyxxRXH2Re6v3ySgFIogfDnuMZXJKXMq0GqH0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7bFXCtv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so30392845e9.0
        for <linux-input@vger.kernel.org>; Mon, 02 Jun 2025 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748862059; x=1749466859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APwGN0/eqz9/45Et2ppeGaMN2T+hRqNScPGgnQKWid0=;
        b=n7bFXCtvmn1CN4dqe79OjmIvlzKvZ3QLTQVC8jAtiP2bzHSE1L1mwXIMNhbxQglMGo
         YPp9WJc3+H7M+kpGPvqv6qcH4+l0whhebiHH6B8COWqfkqbpLcb/3a9+j7sjEePc4sqq
         oUfL7IkvFv5ua2vgFqHXomBgP1VQ5KWWJPocJhVxVlX/KEVDaEAD0iTKuaokakmkM1S+
         KFsC/Jebpu9aPPvvrd/OIbtX6HqxdA8fJRzKYt/2Qa9V6OZqITpoH1fRWy+hD1eEiCYu
         Ps8VA+bK2LsjnLMP43qr1mFSUJs6PwB3mcovprJ8fVA9Os63qoE2xxjqNaXx47+V87DG
         f9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862059; x=1749466859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APwGN0/eqz9/45Et2ppeGaMN2T+hRqNScPGgnQKWid0=;
        b=gxS7b6SslsffnO+1F5+Yi2O9VloI1lgcXTdPPashlPfIamztjiD0SxMaspMqNUkP18
         uluShU8Kay7r45B6cM2rqB2zSjXcKmjok8OyWadnrAcQidqqfMbqNxqXQZoptaB6gyEx
         jlXunCvQbqbI4ZLQ5nNPLEkKdG6LsjnhzvFmB96CF4eWPYy4rNDfFBsN+0oKXkTF+pEL
         94gkvJyZZhRV7idXPhPhgv2wDyqm6yUWM2z6xIbaeaZBJDrwYObF6XWzMV9YJtAOtfxz
         fEjIxD4kAiXRqlf1GNfdIrYbRBI2B+GKpsXOXxa1Tas4AD2hFHCv4dn+ENd46oM1g/eb
         cDEw==
X-Forwarded-Encrypted: i=1; AJvYcCVAoq6ZyN3nqhGJ1M007sL0eQYkUcxPf+JOU4L5cody9ZPX/0jJWHhn3oHIeSBZEubcIalfKrRnnpzPtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BRRJRBwGELCzkldXpntbD7iiTYv/eZ8S/VHk3xtEC5+6nQvv
	EFkZv84pgMx7pxXgEWb0n7ABcK10rJzw3DsSUPGoTxoB+FTROaSqgKvMCnwnAEBrV20=
X-Gm-Gg: ASbGncvX8wgCPzG6kAlw5iSoxHb9spGXpD7BafmWB0/XUFtfUkYqvkofFn6d41hnR27
	Ys3J5P6kYHKXwYKg0ni/GacQugyORrXE72hyU0x83IyrGyLNYMF+UVergiGMPB5w1DdRuMl8+hD
	46yeJdLiLNMHX3ZrWgd830MLvJUY2KdidayKGMH/dWIV1Kj7UHNRZarJ8JybpdG+mfbQKqjjX/r
	CYYEvcDPf6PmG3lXFu/JPIjqWxnUUmRJ1zy+7VALPDwIIaaFsGKacoh8vFRRbfdBz6dxfJW9s8v
	m/t+TMQl7A8FwWGio9GG31n0TZgja8aOgVqJViIbNb7DlIp+TuyHPa0=
X-Google-Smtp-Source: AGHT+IFvqSbq/mxIH2p1mh4XibQErn6t9isHaT2vMWAsPAcME6qqAGy+0iLzr3WNRcfVG5XZiGtRHw==
X-Received: by 2002:a05:600c:4e44:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-450d882b3c3mr109348255e9.2.1748862058518;
        Mon, 02 Jun 2025 04:00:58 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7facf9dsm115376275e9.17.2025.06.02.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 04:00:58 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <aD2EZRX8CVuvqjsN@stanley.mountain>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
 <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
 <202505281611.A024D45E@keescook>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505281611.A024D45E@keescook>

On Wed, May 28, 2025 at 04:26:18PM -0700, Kees Cook wrote:
> On Wed, May 28, 2025 at 11:22:24PM +0300, Dan Carpenter wrote:
> > The "len" variable comes from the firmware and we generally do
> > trust firmware, but it's always better to double check.  If the "len"
> > is too large it could result in memory corruption when we do
> > "memcpy(fragment->data, rec->data, len);"
> > 
> > Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Kees, this is a __counted_by() thing.  Would the checkers catch this?
> > We know the maximum valid length for "fragment" is and so it's maybe
> > possible to know that "fragment->len = len;" is too long?
> 
> I see:
> 
> pcu->cmd_buf as:
> 
>         u8 cmd_buf[IMS_PCU_BUF_SIZE];
> 
> and fragment is:
> 
> struct ims_pcu_flash_fmt {
>         __le32 addr;
>         u8 len;
>         u8 data[] __counted_by(len);
> };
> 
> I assume you're asking about this line:
> 
> 		fragment->len = len;
> 
> I'm not aware of any compiler instrumentation that would bounds check
> this -- it was designed to trust these sort of explicit assignments.
> 
> This is hardly the only place in the kernel doing this kind of
> deserialization into a flexible array structure, so maybe there should
> be some kind of helper to do the bounds checking and set the
> "counted_by" counter?
> 
> #define gimme(from, into, counter, len)				\
> 	({							\
> 		int __gimme_rc = -EINVAL			\
> 		size_t __gimme_size = __member_size(from);	\
> 		if (__gimme_size >= sizeof(*into) &&		\
> 		    __gimme_size - sizeof(*into) >= len) {	\
> 			into = (void *)from;			\
> 			into->counter = len;			\
> 			__gimme_rc = 0;				\
> 		}						\
> 		__gimme_rc;					\
> 	})
> 
> 	rc = gimme(&pcu->cmd_buf[1], fragment, len, len);
> 	if (rc) {
> 		dev_err(pcu->dev,
> 			"Invalid record length in firmware: %d\n", len);
> 		return rc;
> 	}

I don't think that really scales...  I don't know how KASAN works
internally.  I was thinking it might track the buffer size when we
assign "fragment = (void *)&pcu->cmd_buf[1];" so it could calculate
the valid values of ->len.  But that's actually quite complicated.

Smatch does track this:

drivers/input/misc/ims-pcu.c:856 ims_pcu_flash_firmware() buf size: 'fragment->data' 119 elements, 119 bytes

But:

1) Smatch doesn't know about __counted_by().  This is just a matter of
   writing the code in Sparse.
2) It's not treating fw->data[] as user controlled data because this
   driver loads the firmware asynchronously and Smatch gets confused by
   threads.

regards,
dan carpenter


