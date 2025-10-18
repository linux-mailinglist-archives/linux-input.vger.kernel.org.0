Return-Path: <linux-input+bounces-15583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F63BEC34D
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 03:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C893E4F30B0
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 01:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09FF1B425C;
	Sat, 18 Oct 2025 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8XmRHQo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461F189906
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 01:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760749744; cv=none; b=PPnKtiso2mjRydLPTRzUgP1UaKiqIZkh17UMsYzJZ8KoDcpFkPkNnQx1W8PsNYOhHbqScd78a3XUm3F91/rBJq0p7HNYCRGGXRempIAUIPmf3B4055G7DldNqcgmvrvkkuPR657BhYFXXYGfnACgABc23mvRhvqf3qulqTeSKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760749744; c=relaxed/simple;
	bh=e3j0tM594BEHtaLmHhl6ldltnFaSOezHubsVppH21NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZAmWJtVu0Q6zNrkYw+nJNOVMqabL8EczD8T7M1f2/khho43kptqwnox8s/vh6LFbUyjqKazdlP6LYkZ0TcYiobJ9pIzvVZ37PymG9ZGbVcoSzsaGBpHwKj44PGHHx8YYtVQCaveNChiyccFfXEee0mVLvg7lOyM7HGO5Quejr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8XmRHQo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-782e93932ffso2304482b3a.3
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 18:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760749741; x=1761354541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvZsZ7oS0CM+3Jpc3uOT/QYGpqH5xVAqjmhfBxS7UXc=;
        b=f8XmRHQoialr6hHO75SR9y6KXIDBpZrz5wiTFqXhooWvtNBYO9XDc7YxLHqwGJb8cf
         zEQifro+pgRp1+5J4KRZNL0dFK7Hzvu1JXFL1g8qlP7+2UAnuQwcTXtnimZAXngUJQU3
         NELLzLTgbhxbunMav54TgFuNoVFYKinpQoS8xkw5YKxhT3bJGlR4dY8/AoHpXTD4+CYU
         IXUSEiVJGUO45zP2WmUUTNLE6lKHQgw0mRQYm2GWl26xrH65si3fYJH0vnIPVVitsW1I
         X4RPaKWQpWtrt0BMOiaG7yOG5xFqz1ZilpmclLMhd503Ro34sJv9b9eab/YEOFWA8SXl
         /F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760749741; x=1761354541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvZsZ7oS0CM+3Jpc3uOT/QYGpqH5xVAqjmhfBxS7UXc=;
        b=RhjKIz7bV4ZaRV6Xh3RZe7mMcB74jtXbbVQKMa8S3ROez1Kh7JgV5WToAPPdx6R3zo
         HW3Ikz9PWTq3mNyjFcEfattTwJKExoGLILIKJWAPzdY1FmpCQFSE0EajYyNj8j+JR6N+
         HVX4zIKTH4f+W+P6ZxUO11M1Vx2HA73ShDKKb/pk3aOYKYpzdJdA+7Eq6a5xVh4iuk3O
         i1S4ehjnsHrI6cCAfrqWxb2bVJO/IfA/qZmGiQlHABP763fLKEK5OCnsxKRiTekDLVg7
         XA5AD5CuXWNCVTnKqOQOJmHRSJHZRdUWaVc5sLWoiIT74KC20DysVSxka40ygzZfT0vC
         ER1g==
X-Forwarded-Encrypted: i=1; AJvYcCWjwTtxT0+Z0uGC6edr1s1V0SeBDc6/vrp65TwZJsLIiv6aDO8Hb0hIKshEn6yrQ+BKXv5mjN2cm+K31w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEt51OnxwmC57Qn88zYnl0j6PppWgnnQst0Hly+D9bQIZ0jvH2
	+bWGDgNjOTBAJ5Jd37X+xDyAQnG0GpqUjStsCiHlW5A9u39aEltppr0f
X-Gm-Gg: ASbGncu9EWvqyGYKpMfEvm566FVou7IqNEnQidv/pKuBaYVaGLsmFpe8K+QMDMqqpyn
	jomDB6z9GcWuzOjjpmxV0SrQWeLjqX0u5puRxaEyeR7wMmHsVoYnXj1sQ2imJw74vFGRefie+nk
	Qmm81ainjTUSqxSM1mbyoLTlck5j7NlkEu2j2nbLDxbookmV/SuXf9Feu8J3cUUyHUU7tn6vVpg
	/znX4BkrI415syZND72nbhfJvFWtC66DiBudlhpbfOPIhtqVip7NcTOt04vmWjiMBJ8gYQu7jka
	7sx+zBs9TX6wDvlOoP0OSXB2Pqwit8hXZaGSEUcUa8VycfID3yRfsRJNF7kso5AYtjFvvoEC8Yu
	ItIH7YYs4XeHk9GTqhx2Cp+7w8jVy3PsPnh+LUuOmn0UgljohhtEXmANgkphvJEMZ3IUUtBDPln
	IAG3FewguHYWAI9Az6u7D4x2JrOoxC44BGdTB7QArAIzmEmCjZA30=
X-Google-Smtp-Source: AGHT+IHiiFYtC9umsD49rAB9MiYKz9Jivl0/Pq/GslEpRRno7xqWZQr46WIide/BgT2Kw79Lw4OfOA==
X-Received: by 2002:a05:6a20:6a1a:b0:334:87c2:445 with SMTP id adf61e73a8af0-334a8610a11mr8025098637.36.1760749741445;
        Fri, 17 Oct 2025 18:09:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de30555sm756087a91.12.2025.10.17.18.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 18:09:01 -0700 (PDT)
Date: Fri, 17 Oct 2025 18:08:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: pip-izony <eeodqql09@gmail.com>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access
 vulnerability in pegasus_parse_packet() function of the pegasus driver
Message-ID: <ekkelgdcm3ovrix3ktmzhlmc2bgchui4g7ogunut5k3dafhwri@y7fyt3uycxgr>
References: <20251007214131.3737115-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007214131.3737115-2-eeodqql09@gmail.com>

Hi,

On Tue, Oct 07, 2025 at 05:41:32PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> In the pegasus_notetaker driver, the pegasus_probe() function allocates
> the URB transfer buffer using the wMaxPacketSize value from
> the endpoint descriptor. An attacker can use a malicious USB descriptor
> to force the allocation of a very small buffer.
> 
> Subsequently, if the device sends an interrupt packet with a specific
> pattern (e.g., where the first byte is 0x80 or 0x42),
> the pegasus_parse_packet() function parses the packet without checking
> the allocated buffer size. This leads to an out-of-bounds memory access,
> which could result in a system panic.
> 
> Fixes: 948bf18 ("Input: remove third argument of usb_maxpacket()")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  drivers/input/tablet/pegasus_notetaker.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
> index 8d6b71d59793..6c4199712a4e 100644
> --- a/drivers/input/tablet/pegasus_notetaker.c
> +++ b/drivers/input/tablet/pegasus_notetaker.c
> @@ -311,6 +311,11 @@ static int pegasus_probe(struct usb_interface *intf,
>  	}
>  
>  	pegasus->data_len = usb_maxpacket(dev, pipe);
> +    if (pegasus->data_len < 5) {

The packet size is actually 6 (status + color + 2-byte X coordinate +
2-byte Y coordinate) so there's still off-by-one error.

I fixed it up and applied.

Thanks.

-- 
Dmitry

