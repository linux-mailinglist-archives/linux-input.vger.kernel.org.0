Return-Path: <linux-input+bounces-1630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335B84672C
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 05:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED9361F248F9
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 04:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87CD521;
	Fri,  2 Feb 2024 04:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPaAqmta"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C313F9C6;
	Fri,  2 Feb 2024 04:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706849809; cv=none; b=fMwr18j8wobIjK1Zlp9HsKx/peqMd29NB4Y2HP4rUWwiu3JV1yi4ilIxT/mUQeJnqVbMBheAWvSL/WIKU4znj/Zw3Y62YR7nv4RusQQXnx77eM8X3hy/W7DTWrkGTkF/fVcEyjhoG+/eUhs2v5FECpDF5Sc8izyjLabRsuKXT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706849809; c=relaxed/simple;
	bh=VwBoSb/V7TcqEYO+IMJjfTn/Zoe4yK102sNVcscuwF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLE2DW0nZ/kU4tHRufWf6M+lzrA1t4v25+kMF6VUZck8v2m4xwk5g50mn9LLXbUxuzbzP+alsiwEM8ta2E7wmWw1kphG6Z/0PO1bEGH5qssW7orel5wmWek38/J84a8HD721YgSigKlcb8cca2kAKjPooKO3rv1mOm1WzmWKvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPaAqmta; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d8df2edd29so1377731a12.2;
        Thu, 01 Feb 2024 20:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706849805; x=1707454605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ffwccEJwM3X88Nsb0fh+JyW5l/872KQTV4sk735VzA=;
        b=CPaAqmtaJnglgducvwWVfwANyvGH/lwVaplImUTZ9lxi8rrVBYprKenhaqLO5xAxcU
         5QVaz6hfjWZpOkcEbYiqKsQTK2i/7Y9sTdFajDqaPXJDxPdX1NK4fKBhZEbKqAASOBXb
         2mpmECKQrDpqsRvFVK4pF2vyjLmkBgmSJmcTjD0vHaFidvnSxxo1VoWXnm2VqtEpp6Fx
         GzWGGM4n+q7JeOngBTiQMPQLw2A9pDD8IiynQ6+VAin3ME9K3wOTxBSjVaNNasI/5ueO
         Womgva20ckAwaG8kl8BgY9Nj/n5M8Kb7+DtFcSkfcw4MMBjzy2yAOVEgBFyw/CvHa2uG
         yqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849805; x=1707454605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ffwccEJwM3X88Nsb0fh+JyW5l/872KQTV4sk735VzA=;
        b=kTHJQh/+IjoMcfhId8kHj+ciCDRSINlzjsg81gAtKto7bDjMhpghUc8ujXRwAFx4uo
         Xam4UkCiuHnn9RW1aP+Tm9FJwF3c08V/s5pf7HHI45QUlSIsr4OT46mHg2/t2oUVGIJC
         OEeqPgzdIAxEcc/LHHBUVmVp3KyaWyficjmTCn/lHje4ZCRhHg50EFFr8IUqtavafzbI
         3G0iBTJhi09BBfgACvoQLja7LESZp2YX5O01UzdTBe0SMEdE6JYZR/2OrhR/Ylix8E7N
         Az1u3L/itwEvfjLK3loHC1MMcuFsNaOa7NyHxy6HzrvBwYROQY8L/7AsaYRL7CFPCpGy
         h72Q==
X-Gm-Message-State: AOJu0YwGn+UkgJOHhUsc/+YFXzZ1XOn44in2Dsk56+PxFPe1AsU9Z+sZ
	Xmfs/QeQBQEQrQVJESz2UF09Nfw1jueQMXKUmPT8wTkBVrSjETKydD4MBzhU
X-Google-Smtp-Source: AGHT+IGgLVZbww0XpQ9vw73ddoiQRtdj4pdLxOncNNvPGlP2aDoWBqeNbSQFRrZPgbmREiJMyJnESQ==
X-Received: by 2002:a05:6a20:3d06:b0:19c:6a60:b433 with SMTP id y6-20020a056a203d0600b0019c6a60b433mr4888775pzi.3.1706849805521;
        Thu, 01 Feb 2024 20:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9TM6nv40KZJfTQb9AvCFB3ucZY0S1zNsQ5Do4wcmczMxBH+qPYM0uScT2hlSMnjwbKcS7YqN8Zg44kywAGpaPb3wEjn3X7USpSikl6hUC1Up12n0DXCd/1uirVEW53J1qHEn8gMABPLtym5kc9D6ezjCOJHmU1T8vU1vVstj2TtfwLZrzvV/MEdsoa5Vc229Mls4ODj0P8+xDUg==
Received: from google.com ([2620:15c:9d:2:c30c:2f35:dc97:44fc])
        by smtp.gmail.com with ESMTPSA id mn16-20020a1709030a5000b001d9033b9d8csm681585plb.59.2024.02.01.20.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:56:45 -0800 (PST)
Date: Thu, 1 Feb 2024 20:56:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH regression fix 2/2] Input: atkbd - Do not skip
 atkbd_deactivate() when skipping ATKBD_CMD_GETID
Message-ID: <Zbx2Cuhfy-rpcvCE@google.com>
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <20240126160724.13278-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126160724.13278-3-hdegoede@redhat.com>

On Fri, Jan 26, 2024 at 05:07:24PM +0100, Hans de Goede wrote:
> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
> translated mode") not only the getid command is skipped, but also
> the de-activating of the keyboard at the end of atkbd_probe(), potentially
> re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
> fix multi-byte scancode handling on reconnect").
> 
> Make sure multi-byte scancode handling on reconnect is still handled
> correctly by not skipping the atkbd_deactivate() call.
> 
> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/keyboard/atkbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index c229bd6b3f7f..7f67f9f2946b 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -826,7 +826,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>  
>  	if (atkbd_skip_getid(atkbd)) {
>  		atkbd->id = 0xab83;
> -		return 0;
> +		goto deactivate_kbd;
>  	}
>  
>  /*
> @@ -863,6 +863,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>  		return -1;
>  	}
>  
> +deactivate_kbd:
>  /*
>   * Make sure nothing is coming from the keyboard and disturbs our
>   * internal state.

I wonder if we need to do the same for the case when we go into SET LEDS
branch... This can be done in a separate patch though.

Thanks.

-- 
Dmitry

