Return-Path: <linux-input+bounces-7883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDA9BD5B8
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 20:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB431F23549
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 19:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D471E7C27;
	Tue,  5 Nov 2024 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ml9H62b6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80721487CD;
	Tue,  5 Nov 2024 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834203; cv=none; b=oAVITL5/3VqToJfojcPgGW3Pc1HzTzphQXt6eSvRhpdjYeeAtR0Yoni9lX0xculR4fzYbjeZSDGrxmet7BPqYfB/70VKofQnjARBszU87CzBhyE+I6PPHIwn3Mvf5pR1v1kBb1dQ0GSMynGb34ykjhoro5IEI4VJCOatdVpu9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834203; c=relaxed/simple;
	bh=bp72WN2NK6Nw91TteXnU8xM5psVR50kQZBi6Eu4OUlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hutCSRHS1SBOFfang/p4wVZGDsNuFPiqbqX5ECGQPbN0Bdx86wcHQAtiOcPZHKrtIKJRnoHHsXWvVEVMzvb7dNLbnf6xNpX9zJXsy2HGvSbar1Nf9S22CVvLSNwfLj1wJj6Z+m47LiEjnqUdLAhbulR8/37HVhdlV3TBL3sNoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ml9H62b6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-207115e3056so54925115ad.2;
        Tue, 05 Nov 2024 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730834201; x=1731439001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1foUF5fv2xw3zsSd0ahFRtImYfNB3vhJ91jFfTHDfPs=;
        b=Ml9H62b6nGzuOmS9myTlB8pJc59D+hWLN1HUoGGG+9yUlDkPHCYt8og7vn6Ye09xxR
         WXQgQaMUTT0KESOJFj9A2Ny/5hFa7xNiESDYiEd6dD0UoHoXLRJjgfmG1ERl0vwkZoY1
         obzeTyNXSboOW8AocpU4XykuMoDTvv7lTkq78XBTDZRgMQvEU//78nY7hvD8aC4D1vHy
         EkpiNyANbqzHBW+tmAlQKjrJO3Z1q6aedvQAilTpk7kZt9gA22QyElCX5gcfltVQ5Hjn
         ComGxIzdaX6np4y7TTbK17X5dJXNrY+Em7BC1KK7/7qlNfacUZYBLZQHch4KOciYXVpL
         sTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730834201; x=1731439001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1foUF5fv2xw3zsSd0ahFRtImYfNB3vhJ91jFfTHDfPs=;
        b=rk2VeuuxPHhq/axI32UBBviMraXUtf+n3kjPLeHVlKoZa7x6I++DxLRVsvHIMy8Phn
         1kLHduW5VPGeyCRL2nZfVz44G2d+cfui/aKe/6KrgYZfOjeB2hjMz2Yg2LgFaADwsHCy
         GBsl4tcqQi8a6glR+xdHIMeCIRDN4bUwO9uAtOg5ATJA7y58zNCpoQDiulwhdMCRhhil
         low+rKcjn28Q3ex8Ll56dCOeQMy+kxXKiz2f4NkHlIMHGCQtS/R8aNiIXN10h8YKqc+u
         IOycu9MiDNDpAG4sggYqFC67LdwDtoImSUlrwjfCDsvb4k0VlACHuML/EID2QMQsmyLJ
         c++g==
X-Forwarded-Encrypted: i=1; AJvYcCWJY3Dol4DaH5uGLcr5D69/OHiJpvnlpE2ZWf2QI52e7hHDK0HP/C8qVqag8z3rE1pvX/huhCggdG7ImpA=@vger.kernel.org, AJvYcCXerWrexkpIwreUqOP2mYNAbOqSzVRRN8NH+NYp9JaCstyJ6DG6vnabkzuAfzUE8raoTpFtZmPEtS8S@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo0hMRzafogA68gbCLXkEfGmXlWQ+sWQVkRKEcNtsevob2acWB
	Onjmfg5gX9ZqRqrSKFB6ButjvpXM0L6eyU+iPj+4DFzNsucF4T5T
X-Google-Smtp-Source: AGHT+IFPj+mNP+satzrGgiaz4xce0A3/dkm35dbKVZS88h3ciwvXRhLpjKL8aAOWaebfPuzbCJIL+Q==
X-Received: by 2002:a17:902:f684:b0:20c:bffe:e1e5 with SMTP id d9443c01a7336-210c6892b57mr521655965ad.19.1730834201150;
        Tue, 05 Nov 2024 11:16:41 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:65d0:e6fa:350:5727])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ee46fsm81936095ad.21.2024.11.05.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:16:40 -0800 (PST)
Date: Tue, 5 Nov 2024 11:16:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <ZypvFmWc3-_N4IZM@google.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-2-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-2-markus.burri@mt.com>

On Tue, Nov 05, 2024 at 02:03:16PM +0100, Markus Burri wrote:
> The delay is retrieved from a device-tree property, so the duration is
> variable. fsleep guesses the best delay function based on duration.

activate_col() may be called in atomic context, and if fsleep() turns
into usleep_range() or msleep() we are going to have a bad time.

We should either stop using request_any_context_irq() or figure out if
interrupt handler can sleep or not and adjust behavior properly.

> 
> Link: https://www.kernel.org/doc/html/latest/timers/timers-howto.html
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/input/keyboard/matrix_keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 3c38bae..9eb6808 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -69,7 +69,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
>  	__activate_col(keypad, col, on);
>  
>  	if (on && keypad->col_scan_delay_us)
> -		udelay(keypad->col_scan_delay_us);
> +		fsleep(keypad->col_scan_delay_us);
>  }
>  
>  static void activate_all_cols(struct matrix_keypad *keypad, bool on)
> -- 
> 2.39.5
> 

Thanks.

-- 
Dmitry

