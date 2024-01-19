Return-Path: <linux-input+bounces-1337-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800608325C2
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 09:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5431C2037B
	for <lists+linux-input@lfdr.de>; Fri, 19 Jan 2024 08:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA520B10;
	Fri, 19 Jan 2024 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJtR50lU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CC20B04
	for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652999; cv=none; b=NlsdAVyWydb2wf4BujOCCkja72xQaVo0lbQF9zDx2pNSyHsIdu0Khpo04Fu2UIQkIhW/5RUlJAPwtDZxuMiktbknaXmDeJ5ed04F+GdHBABed+HT3odlmMLbwnGsNld1Ypr8YfpEjglmozmr67QsvdKeZvQ0T9PJbWxNjnNyC1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652999; c=relaxed/simple;
	bh=TUvMR1IDByEwIyKWddFAynkG32WHqpvL8Pstdtk4syI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qac1GJbhZTWhc7JjUum2SIXbCokFPV+UcsaGNm1jQ3BbuaI6wU0Dijq1INEP98pPUiCxSr2xSNfBwm3yAgQRTcjDij2h9UVYKDUlBXdEK9OIGFYcehWYaktQJRr/VO8K5q70qLLGpN02h2OJGbC2/OqylW7LqZ1TA9SElTKqglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJtR50lU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9cb95ddd1so396057b3a.1
        for <linux-input@vger.kernel.org>; Fri, 19 Jan 2024 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705652998; x=1706257798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HeyPu2bkqOOYDyrIKE1z1uGc5gft5g/fnfY6LPpHZuM=;
        b=OJtR50lUKbNJlqFaYnmXtCu52ZASYeJ2kRJF4X9Z6Hl7s3hcmTDsjRZ8MCghkg7OmQ
         bVY3l0np/wb2VSAB4GTU8UcVjerfd0N1/W3o0NNaE/qthbPzFiH8FWW5o4ptDvEGN1mA
         uR0Z7p76FwKIr4fGb6hxsJLHihhrNTmMYL+LW7TwlMAzpgjaP2M9ocJ7w6tWcA8hWqbO
         OiDYpBBy3sgnpT7eK20u0OPGMa0+v20LLgMwKUt5ZkodwyI1BT3iYgqo/Sq4qbByE98C
         LR2Or5WkhchLkqCeykbx2eBw+AP2zLQ6YX/59Rido9Rn5iBzgKkbMSPdkd/ngmmvbIBe
         1PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652998; x=1706257798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeyPu2bkqOOYDyrIKE1z1uGc5gft5g/fnfY6LPpHZuM=;
        b=thcrwqW0o1g0BfDmupplxFQDk7foTjYJ2PK//HWUN+y3ttx2QFZZtD5VNQLeyMYe1a
         NquQJCriYYyuBoJYsCzxeDV5v1Y5gJqlH8Bb7Lo4SvVZCGi5vlU6pGvl3g2LaDolCRdg
         pwmAMP1VHiREtk+8nZDEdMRacDv19fy5oo7A7p+5mEXHcTlDbyNm6zFaSYwCT2P657mz
         PTLBc54lJuwu6/3v/4qV8tXf4FR00UrUjYMb3V5VJqpaSRLEmAR30bDhJsRu/BMGTcqU
         BL4zQXbgSw8nYk5YndSX30fyg6Vt2wb9gx+AyO6Vsq5u6LOdefHGaCZXTUEzjT5dt4Ds
         yfDQ==
X-Gm-Message-State: AOJu0YzeJ0WWYnIo7GM9/BkN3Ars2hqhbbw2iaz3j47RGBEeDovMkrDM
	rysI3vNVGTgii3r2rKtEVNCQ1ZMIPY6TQo4aLZ/JiS/YhfQaLQSs
X-Google-Smtp-Source: AGHT+IHZBsSpTtTzxxUYQejjS4ZKgOIVfdCQJcOxm3JMt/u8WO4zdbd3Q7grWjCGxap3DGZf2c+EUQ==
X-Received: by 2002:a17:90a:62c8:b0:28c:f48c:c875 with SMTP id k8-20020a17090a62c800b0028cf48cc875mr1821154pjs.45.1705652997748;
        Fri, 19 Jan 2024 00:29:57 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f04f:73f4:b79:a70c])
        by smtp.gmail.com with ESMTPSA id sy14-20020a17090b2d0e00b0028c89122f8asm3312432pjb.6.2024.01.19.00.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:29:57 -0800 (PST)
Date: Fri, 19 Jan 2024 00:29:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, contact@artur-rojek.eu,
	hdegoede@redhat.com, paul@crapouillou.net, peter.hutterer@who-t.net,
	svv@google.com, biswarupp@google.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3] Input: adc-joystick: Handle inverted axes
Message-ID: <ZaozAsSblybdoeEK@google.com>
References: <20240115192752.266367-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115192752.266367-1-macroalpha82@gmail.com>

Hi Chris,

On Mon, Jan 15, 2024 at 01:27:52PM -0600, Chris Morgan wrote:
>  
> +static int adc_joystick_invert(struct input_dev *dev,
> +			       unsigned int axis, int val)
> +{
> +	int min = dev->absinfo[axis].minimum;
> +	int max = dev->absinfo[axis].maximum;

I changed this to input_abs_get_[min|max](dev, axis) to avoid peeking
into absinfo and applied.

Thanks.

-- 
Dmitry

