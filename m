Return-Path: <linux-input+bounces-2246-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4A872579
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 18:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2135D1F2504A
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E043DDDD;
	Tue,  5 Mar 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8Z0EnNg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87E12E7E
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658911; cv=none; b=jFYrmkg8s9wI6Ocia55kMU+SqPVvvQqc8SFnUH6EGYRN++6/MMCK23yVklzrU/eimFJ+GPk4CaxwlN/56he/2lvFgJ24JQLNIoUUpfUPUhxm5o/GyOyWLY5mN0tIGqgImPdVih0fxe5kFMEJWbRE+CqemnkneuH9zK3zAImg4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658911; c=relaxed/simple;
	bh=wDidt9pWp4AruJ99Vj/Mpiz333sDuhdVqauJ2jr5J1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW183xSxykZrmYNO8bu5mM1rdys4wrEl4qTuigOM4pnYArN57kZYPaIQXexoU/+tfqnfmLSqT8CvoxvKDK46A8K7j6eTWzByeQkUgnQyvYZBgIKF/MMJCgoOW6PkBmd36xZPgEZiGK4qcVmRTNctfWI5S8m7nVOEPnNQ1mdFJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8Z0EnNg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso4679741b3a.1
        for <linux-input@vger.kernel.org>; Tue, 05 Mar 2024 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658909; x=1710263709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T6JAcno47DSBsOQ1F39XAd2qP4Pr8MCJJfqtWc+W9IA=;
        b=e8Z0EnNgmi97tDm00EP93j6gL+e6XQWrzOMVmlSGUoZBz7uSwzFgZlOaHJ+P0M6l3f
         NivtKeZ3I5KjuMcPrPTNEcwt4+d9ftbLw47TEGt60en+ChOxOattioWtCUVPsBCcP6JL
         coidCmJ1p7J+raEpJ+V9zj0UiBVOGI0hEKb3wSKs13vVH4fugpi/0zvRDWohAtH4+E32
         Nl4tk9VnkjXibUk/2eQW8sZgERVINlBee4Yb2f9N6AUKATYgYPINHlxnDC9WM2e6htEt
         7CgYJ2Q11Tc/by8T98ivbi3l+Ifl8l04lEzT/S82Te16btAVTcCGg8HSk4hH1A2I5EdI
         aMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658909; x=1710263709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6JAcno47DSBsOQ1F39XAd2qP4Pr8MCJJfqtWc+W9IA=;
        b=aIFiVp7jlDbsS0AhTsWOUUOLyWtEQYFLZOlQ5rpwWuHWhuEDfw7OWALqebD+D1EWdA
         JdwUJLpn9suNcEWCYa5gpfPp3vFOfrzmESOJmnPBm311lb1Dc1aQM6DFfto9441ogfGA
         BRcQBOpEqJUb9VG4mS2HQQDxHyaq255+PXs+re0OHMrf9V7DiZZHWQDd0+CiUYEmMgMU
         yt4AadlAzeEH3HkbfW3JW+nHG55TeCzC7hNvYmX1nNWGwBwSOVFZcqzJN0F6Qm8JmNPJ
         nNAvT/BxJQ/TjRxpTRe406USmL80KcfRcwakkGl1DNwWU3cnZFoNNLBFK98BfbSONb2Y
         icAg==
X-Forwarded-Encrypted: i=1; AJvYcCVIOHXBuU4XVpd4qs7Ta/VKbe8A7Y5y8aOI2Mj5U2keGz0HF0dU/YdLH9IAkeOgjE/O/zzhrEfMLpr+PFWnWx+rfyLAbfmYi4Z84EA=
X-Gm-Message-State: AOJu0YybUkSgjXlfGKYLWg0QOE/zOi9QixtiS3JrDj7AkKmbiuD159ES
	O01e5cLSGNL1khIZGBTJwNq7E1fOd3IBT5ENicm0WMGwfktGctsR
X-Google-Smtp-Source: AGHT+IHC3QD2AdGgGVa55OyBsj7MzLGoH7vQkLao7aAUOUNcYb9OB9tcP/1Mrth6M9kjhXj7awk9pQ==
X-Received: by 2002:a05:6a00:1a8b:b0:6e3:fe0b:527 with SMTP id e11-20020a056a001a8b00b006e3fe0b0527mr15613392pfv.30.1709658909128;
        Tue, 05 Mar 2024 09:15:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id z2-20020a62d102000000b006e45d5f0645sm9640160pfg.101.2024.03.05.09.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:15:08 -0800 (PST)
Date: Tue, 5 Mar 2024 09:15:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error
 for gpio
Message-ID: <ZedTGsn2LAoBMECf@google.com>
References: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>

On Tue, Mar 05, 2024 at 11:10:42AM +0100, Uwe Kleine-König wrote:
> On a PC Engines APU our admins are faced with:
> 
> 	$ dmesg | grep -c "gpio-keys-polled gpio-keys-polled: unable to claim gpio 0, err=-517"
> 	261
> 
> Such a message always appears when e.g. a new USB device is plugged in.
> 
> Suppress this message which considerably clutters the kernel log for
> EPROBE_DEFER (i.e. -517).

I'll apply this, but that seems to be a misconfiguration somewhere - we
expect deferred probes to succeed eventually, here it looks like it
stays deferred forever and each time a new devices gets plugged in we
try to resolve deferred probe again and again.

Why doesn't gpio 0 become available?

Thanks.

-- 
Dmitry

