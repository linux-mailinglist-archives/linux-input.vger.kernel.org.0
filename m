Return-Path: <linux-input+bounces-4789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456B91EB28
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 00:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7DDC283455
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C74516EBE9;
	Mon,  1 Jul 2024 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5kMK079"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6E823DE;
	Mon,  1 Jul 2024 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874308; cv=none; b=CO8hst35xz4Z1e8pvZNPfjFAUaJi1mjcf9myiRy91+oSwLWi/GKzizvlN4jIFme52D6wu5z+VPg6unMP1yhwBavMxfQH/k1abemw5X8faQPGVawDps4htDYY1+78XB3TmzzP3Eh94jRr8j7FA2T7br2J9ZhhaeZpiAkTD2KvWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874308; c=relaxed/simple;
	bh=YkKR7UEsCLK+xQ7GWcTJ8lLq8r10Cek9EjhNWKOmLkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMgYtimWn67uDtJTc0ldKLVK+w/aPpGf04AvIDO2fqT/sDdp+xeKB/2MyrX1d6KuoybQCI1LLHkMWlXD4egb03E/Kv5J4o9MQPtZTfSgUS5xE2hYkVE10mkeBokdaepTt7brv19J05cZsQl+FgUNr2K1uD5NMqRfHe0gFqNhr3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5kMK079; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fab03d2f23so26749325ad.0;
        Mon, 01 Jul 2024 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719874306; x=1720479106; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7+cY2cLXbP1SprNSHEMTG9lFh0AWylYTn/DasTU9Zc=;
        b=X5kMK079vgImC3s3b/GfJr9gc20aYTM/3F3sK16DSlCbrIK2v0ASe8PRfuypuz5usF
         OU954hh0GXDBa47vK4fk0Ot+b9avkMEePzcznLgpsNcM/ISsMXkwD9SqR7H8Kv+6jSTL
         Sstm3w7+8nRaeI/tI/YjxvYXgPr8Is2BoS0AK9pWOaHkmKE+K8IW1a15Eob6hVcg7DRi
         MrUgsxDWn8UWR0hdhaxP9utONoJXhzfva+JgW9j0PG7mzZRhBufYLu7iKPZe27RmO4f7
         mXxZuJflskLIT0xLusW2DRAscD27Wd8Ju6EXnSEdtKa74nIJZFTO1zcgVmokhiRYr6Nx
         07uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874306; x=1720479106;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7+cY2cLXbP1SprNSHEMTG9lFh0AWylYTn/DasTU9Zc=;
        b=xEFP10dg1YsOmWE/D9OeBBtRfknCgKiHd9AYrGCJG1wdEXr4e5ULGHr4L89cXIaoKR
         0fwFixlQYge5QA444Ls0AltPZUThdtIgSuwRC1JZyDPabxjxqajiHI0+KW4awG+NTx+U
         TVrZGrzSPTjwkqpszMxmjLIbN5iW4unyx5M0lGJUzw3WoeE1ltli7slJrBj92MitGgpx
         gGIM/ZeTurIZiZrsOs6ZKxPtJSmHcDrU700wDhVMvY80tkIUO6EIOjmJn6oECV60Z8Ei
         4agfyWQTwigXWID4OI39LuCE4KlqrurMIYNyceEwA7AehlynCuSoy0mcRG8AK9qiEYNX
         +JWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwOtCJTMU8T72i3RRlwtgjcGcOxJdNpAsOW0n7fQh1n4JbA3Ihlo5TjRcWfsswsGycymGFN5p+hBK+6X3O1kXR0m9TtEmW6Z29L3mVklTVB3Ohpq1IKdknXKJgtBaSt416cH+fdtRNAIo=
X-Gm-Message-State: AOJu0YykOb9HMeLLCM5GJpZZjxAt92+rOlqCkV+Q81+NgAlc7m9kMGOA
	MvRBjV9QDmyB5rv4irsmO6kd6BI2FFfqHGYmQxxHn7DZ+YVbMgpe
X-Google-Smtp-Source: AGHT+IFx09tdMTQ857MQ1bKtgK6tbZzK69MhBwUY2KbXSMsgx1todcGMSPQ1+cjCQsAI7c4kZd726A==
X-Received: by 2002:a17:902:ced2:b0:1f7:1b42:431d with SMTP id d9443c01a7336-1fadbc96959mr46552895ad.30.1719874306281;
        Mon, 01 Jul 2024 15:51:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:97a3:bdcc:1a3b:f207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1b56sm70262535ad.41.2024.07.01.15.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 15:51:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 15:51:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iInput: adp5588-keys - use guard notation when acquiring
 mutexes
Message-ID: <ZoMy_8lcdS-NN76w@google.com>
References: <ZoLt_qBCQS-tG8Ar@google.com>
 <pdnij2qolnmbcwtvlsdvkvtua7s7yjw4ms4bc7zyk3tpdr5pou@sga4mhcztfiz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pdnij2qolnmbcwtvlsdvkvtua7s7yjw4ms4bc7zyk3tpdr5pou@sga4mhcztfiz>

On Mon, Jul 01, 2024 at 10:28:09PM +0200, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> $Subject ~= s/iI/I/

Oops, vim strikes again ;)

> >  
> >  static int adp5588_gpio_direction_output(struct gpio_chip *chip,
> > @@ -310,9 +296,9 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
> >  	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
> >  	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
> >  	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
> > -	int ret;
> > +	int error;
> 
> If you keep ret it's consistent with the other functions in this driver
> (at least the one you touched above).

This is part of my quest to have variables that hold error codes (i.e.
when we do not return them in case of success) to be called "error".
"ret" or "retval" is to be used when it is returned in both error and
success cases; before the guard notation we needed to use the same
variable in both success and failure.

> 
> Otherwise looks fine to me,

Thanks for the review!

-- 
Dmitry

