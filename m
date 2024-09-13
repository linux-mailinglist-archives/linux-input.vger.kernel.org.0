Return-Path: <linux-input+bounces-6493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4D977B1A
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 10:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33DAB1C24B2D
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 08:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858C61D5CC4;
	Fri, 13 Sep 2024 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhx/fTcJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7A1BD510;
	Fri, 13 Sep 2024 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216368; cv=none; b=GB4Z6Ja+NmWQG1gQi6BwOnJuJJ07Q/bBCha60r2WMom1HcrXzXg7QHfOi2dJahpK6tQv8z4IqYnJVoDNRKwNyBeDHIp8JnYPXMe+aIpwDBmv6Yhu5DSieO9EqSeZbqeceCLlYjO8TZneZ2zJN9OMGa3hH5rHMh64dhSzIDOjG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216368; c=relaxed/simple;
	bh=DmD/oFS9ztHwN6LHCihrKLQc89zTH//9v3d7Pudf0gE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=ExR9PH9Cx3NzViorSwBLe9VVppdJWLLsAavJ8abUytViDxbY5D8f3gUr1irXBN5vLR5TZLGcDs/YpnUi+F/vyjz0HxlUSWzp1qcyo1Sjvd4K4HQbK4qJgY+hl5qW8SDVf+xGJK2OcoLdc/NcuhNamr8KwR7gDrGR/BrlVvTDZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhx/fTcJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso8398455e9.1;
        Fri, 13 Sep 2024 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726216364; x=1726821164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp9Y737ViR4EfOInl3nplGoJAcdlB+yuFRrQ0BSzktk=;
        b=Jhx/fTcJPNndRUuB9lLIkr6H2oVl3Y3IgpPLrXQ+E1a0nBioMhXnID93eZbuFyCWts
         mG7zgAbtomkavBn8aZdut71HWvmuL0jnSka1+IgbriASbZudnlAihbnT7Ee10MBQhr0Z
         fRCKmBjgb+G0rmPAnt7Cs0mXneVLBEyyumOOLwsYDOWS14TWfcQBoTK+MrSGbHKTdpF2
         1xrXWzDvsn7t3SdZovQQVffRdpTFRoJsmyWqc7JS3svST+2mGmIdJUU6iP1fK+E7FEks
         Q2ytItjS5b7uf5IYPjjdKMwtO/ltg8YmuXiqyEOoTI5+R7uDRewheb9X4LQuraJi8ogO
         q9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726216364; x=1726821164;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp9Y737ViR4EfOInl3nplGoJAcdlB+yuFRrQ0BSzktk=;
        b=CC2kPq0NMpoQlyvwwQGJ5vEUO0TSKAQH1rh87lfmxyC95t99ic+JyaUzFove18EiD+
         ZUyzw1cHZlmVFGc7x6gbOmzgPTvDP/EnhsnvP+DNeg3Xn+xyKYj+Ro8j1nkgK3EU0rVp
         C4SDNyGL8cQBThaF115qzW7tr8DHYBlwhrCrnAIf9qsCOj0zvnrTq9jklqmXSD3cfBfK
         BaQLmiwTbppqxkyALFKkBp86519C7zGjephYCDFMSUc1C03UMhUnPVSVtnbulhY6DcqP
         9S3X1PNxNmeclJ9WZv88hOhncNnkITcT+XTlV1x5JM46e0hwrgilXFOQ00UKpC/7+0PA
         jkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIlyw8Iqifmi6QO3W27gpL5Yps4Umbel6VfeHenqDICDkRCf4GOEb5uZgUTuXPvp+AdepMo5MD8tdKs01X@vger.kernel.org, AJvYcCVZhtCsE7fBQBoh9sEfBVptj41j3+fAbDhSJe69+D2YXrCjgfEVEgROnTtaxZyDNBxarIHYQ4f+7LQZ@vger.kernel.org, AJvYcCVgwjQVBFTp3C5NMyVk9yyRFMN8JuC3KojXOZIvdBAxBWLGLDQNGbcRHi3Fjtwb47nMOEXeHi16dQul@vger.kernel.org, AJvYcCWZm4I9Psi60SeNFjWZ7cFwDORxH+zRMM849RkJ8171oHYqXKjV7ZSjQ6wSq5YhvKr4SNlbtOdOLc+cYk9ARQ==@vger.kernel.org, AJvYcCWwEPwpvI3d+Q/A5RLV9L0UySQGRUzvaMqHrlJ0ym9jM6Ep1BoL81xWty5bwfnyezFEOd6CYJW9Fp5Y@vger.kernel.org, AJvYcCXAtFR1aRpti65x7wjtc1ykiku5SrqYe8c1YRRpzkbgBxjqBHUipS9Y+EHuE2LCcneUSH5O4X5pKln/IJs=@vger.kernel.org, AJvYcCXQ9Zm3YR3Wdqj/qTd4FAKG4E3bCHA0bxcdZfdJXQP/IXADUeyzUvVnJVBsWXLy7IjpiHW3p/rMzMXDHgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoXlD9a7RE+14evReJdk7rJUMOEwqyQ5v3PaDxvLSfJe+SEOkd
	Z3TnVu8LxefjBRrXOnnvBAyqaMlT9ZIRmNXhcySWedeVszspEWFq
X-Google-Smtp-Source: AGHT+IE2Ku5Yqa7DnoqdH5xDY5dD9ozv14FV0pNO09UH2LmGbvbqmw1nTSHM8AvIojolJCXpaHwH8w==
X-Received: by 2002:a5d:5150:0:b0:374:bd48:fae8 with SMTP id ffacd0b85a97d-378d61f090fmr1570895f8f.25.1726216363746;
        Fri, 13 Sep 2024 01:32:43 -0700 (PDT)
Received: from foxbook (bio60.neoplus.adsl.tpnet.pl. [83.28.130.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf03ccsm846921566b.183.2024.09.13.01.32.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 13 Sep 2024 01:32:43 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:32:37 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: quic_wcheng@quicinc.com, mathias.nyman@linux.intel.com
Cc: Thinh.Nguyen@synopsys.com, alsa-devel@alsa-project.org,
 bgoswami@quicinc.com, broonie@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240913103237.2f5dc796@foxbook>
In-Reply-To: <20240912193935.1916426-2-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
> xhci_queue_stop_endpoint().  This is useful for client drivers that are
> using the secondary interrupters, and need to stop/clean up the current
> session.  The stop endpoint command handler will also take care of
> cleaning up the ring.

I'm not entirely sure what you meant by "cleaning up the ring" (maybe a
comment would be in order?), but I see nothing being done here after the
command completes and FYI xhci-ring.c will not run the default handler if
the command is queued with a completion, like here.

At least that's the case for certain command types and there is probably
a story behind each of them. I know that xhci_stop_device() queues a
Stop EP with completion (and also a few without(?)). Maybe it's a bug...

Regards,
Michal

