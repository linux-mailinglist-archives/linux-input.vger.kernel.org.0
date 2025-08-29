Return-Path: <linux-input+bounces-14378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EAB3B9F1
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 13:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE655606A7
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 11:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9293A3128AD;
	Fri, 29 Aug 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/6hDUTZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25092BE653
	for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466944; cv=none; b=OP9Kc9sxN+Ohyt5Pwotv0RoYgcdayyuLVX1TlGeon6WNg5qv4ORfJz3YVSEylwu4gwjtUlLJU2O9BBud7fiBHlQbJGxEe7sTo8rh0K6gX9SP/ZoJ0R/fiExnGcLUY1QCTc7KG87JJ1jubhLHE1MlziuqZzGm/WWDHQl+2FrcQD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466944; c=relaxed/simple;
	bh=i+imFVcKQoTRvA94JW8BwscPfzjUHIJPFezkYRwAAUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHjvjb1ZiO8Bvu9ph1Mtx2jeUTdRjpd4oMjVM3aAdQQ/K2xFHVe73ZfM2O3dkBSU8OCMahCpaxaoIzk6Y1GbGJC/oUCY6hXCBoj1yE5uS8lLh2yIXDkG6cSuKKWzw2KVLHtjPFNobIUukEhrXYYEVzduHeHWfcDiZURy3UbA7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/6hDUTZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so11582185e9.2
        for <linux-input@vger.kernel.org>; Fri, 29 Aug 2025 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756466941; x=1757071741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IECroD+5xRBd7kOVpD/heIMCG2GWKaw/GtnaUMuAQGg=;
        b=J/6hDUTZgYUSWl5RUgx57pzYQY92LcgXzjjsfw+Y232ZXc60gBjcM56NKKHg+fLvDy
         r44ZR1MotXyeQSauj0WDAFULEQfsT/yYAtfjTwOLibJsZ/+V2zCzF+FPBKcIGHhc1hOQ
         PePNfzKdKSAa73f377jW9nRoaZffJObNnnmhst8h1hdEJ6xA5naGfXhIQimRvZUnuXwB
         hvqtTdlvEf3evELoN7dhDj/6db4WnMgHNnCpjEpylTiWo8IOKc95RG6/7VTNzSRBJfJz
         Zv5wevlkluGGE9vDR+QucySQqFGL+2egka6bbVHPFYNekcQFUWVo+/hWy776/i7YmUde
         qPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756466941; x=1757071741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECroD+5xRBd7kOVpD/heIMCG2GWKaw/GtnaUMuAQGg=;
        b=Vch6E/wSS/PZ0kqI/crMnpkfR+A8Ku1WiKXIXv3gaaM6qIqXg7fFvIZwXAqp7GL3Sw
         DHDqFYd/1RPBWYCty+l4WdJ3ZR45Bz66Ba9O9scG22jwZBYF4awHgbH7POre3g5ZNfAl
         KeU8lHOftctYUetX3QZRSXWPLhiLnTHGN/hRnbu4Ez0+4aeYkWEPpUg8/NvTR0hQztZi
         PO0xnjvDjidARO/m/wKSGnkiQcNoHe0nmTQrfC60F+BTs/Aynmt51WaXFDBS0WVzd6nE
         11OWblCtndxbWGX71gSbyRKU4O9EFWjRhP0li05W1axC7eS1UCg+8zzR9cnj20UZdQXb
         EWiA==
X-Forwarded-Encrypted: i=1; AJvYcCVp/+Xsv1xYe/xusJPeQ46yyyQate4Cir3QBk5TV5mLaZLO4Ev61juVbX/BkoUlLJ4AMIYnueVFXYy/vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6my2sfESlHGJfs67sCJkscNLZuiHq9qOLnCA8+58N8dASHH5
	B9753BfgSl1f4MIy8RWY4Z+kEVGUOTaKHaanINeGutPsRseSaEERsGfe
X-Gm-Gg: ASbGncsv6RyaAICj5A1awFixEmsiXhyGu0Kyl5kYNsyX3UO8o51sLMDcNlKOuGSO6fi
	gcN7wTVIjdsCzGOJyI96fNlJSTC0rEGz0POU2bXv6bIkumxasxRr03EiHohNlitReOJ3Uf15gD2
	Hg/xJQbPCNeXzOOQO8T4l5y6NbmFrzpx0JRz8G3m4Q19B1C9/n3qlNNTnt+vYW7kF8bSfglgQeL
	8xqxhpYzzprAQdArLPEtrvCSYEMLSrArmzNyyzMVbQzf6Cs9aK0tBnVtDLOUT2E706mkzpT3v7R
	cmyBjjwuvuZBur0V5S4hUWPfo/eDUMOEWf+EdxoZhuncLUAVH3+CIpTMiHoVm3MjE/qowtmKPVT
	6p81qyQcSIrsXVAqKUL/GBsVGPalWna9h3V5yNA0lMIpoCDlbbuFgzt2N
X-Google-Smtp-Source: AGHT+IH7WrEizvpVr5WdiWE4chzzJhxdmZ89DQpCDiCqgUKg5HgaNojfO1SAIwyFEC6teL6gWWKCdQ==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr259667095e9.30.1756466940997;
        Fri, 29 Aug 2025 04:29:00 -0700 (PDT)
Received: from google.com (brn-rj-tbond06.sa.cz. [185.94.55.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm3098209f8f.27.2025.08.29.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:29:00 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:28:55 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
References: <20250828083601.856083-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828083601.856083-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> probed at the same time.
> 
> Example:
> 
> + -----------------------------------------------------------------+
> | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> + -----------------------------------------------------------------+
> | Probe cros-ec-keyb.            |                                 |
> | - Decide to defer[1].          |                                 |
> |                                | A device bound to a driver[2].  |
> | Probe cros_ec_lpc.             |                                 |
> | - Init the struct[3].          |                                 |
> |                                | Retry cros-ec-keyb from the     |
> |                                | deferred list[4].               |
> |                                | - Won't defer again as [3].     |
> |                                | - Access uninitialized data in  |
> |                                |   the struct.                   |
> | - Register the device.         |                                 |
> + -----------------------------------------------------------------+
> 
> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> 
> Note that the device link[5] can't help as in the observed environment,
> the devices are already added via device_add()[6].
> 
> [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> 
> The series fixes the issue by ensuring the struct is ready for accessing
> before continuing to probe cros-ec-keyb.

Why is the keyboard platform device instantiated before the transport
(cros_ec_lpc) is done initializing? I think this is the root of the
issue...

Thanks.

-- 
Dmitry

