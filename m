Return-Path: <linux-input+bounces-7415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39799F5EE
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEE74B21DEA
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 18:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FC32036E5;
	Tue, 15 Oct 2024 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+jkGFwZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDAD2036E2
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017847; cv=none; b=jjljDgzxod06SOd3sdcnnPRE3tOd1ik6vBiGAnt8nWavQBEmJV/UtefXdVTEvRajlfMSHuootuu9Rk30gj/LgszzTJVbABYQLBk1md/Ut/GFgSf6PIW8KkV4YrJ8Y2fcJWkP5JF8GeVfQvDCa5DTbbKXO0pP1f+bs7HlVDBpMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017847; c=relaxed/simple;
	bh=hPP5D42Z+DiB1ib2/YkmEaVmLipJ3kJNibrjZgUTdg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6we7+8IsHGesKvNkdd/5ctEg2bu4qQoEJdGWrgHBssxFnOMnT2SzbMbul+hQhwGZgPO52gpMfhf+ozys/jSGHhD3SwhmmCCeRg/ax9KFp0nMwFIzi4+yVcP7EG9QC3fjXqC612MqLIcydYgBw5CJeYHleMoSIjF3S7Cuqnrgkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+jkGFwZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea8d7341e6so1645042a12.3
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729017845; x=1729622645; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLaqqsuBVp7JKfpRt4/UYAN3c9BH8mfWsfXx0tSAXhk=;
        b=m+jkGFwZk0O7FDirvI49ckGylxfn+ziXh3fd/vp3vfLq/uVozxwW+WekneaUqc28wJ
         vBfqFSxnAgM3n1dAfmEL7wx18WbpJMN/rtKbOtnjbm0dUI1fvpxkm8FctKKjQQ7onG3e
         olxbXyWol9ka1RF75eROpV9VCgGEQ4ypCZ2HhDDoa8Wl8sUtQt9I/x7dV3yKzvRaMkBK
         CAVh8h16ZMQxPCT38a/wEMTIFlpGkr+qFJBBKr0YNh0zrxc4Y8zklzWHuUZV6KxCWIFv
         dBFSlTpD5AbcJ11GxK05M4TaSkkRyxb509b2rKk01ed5XvJDGof4kojyH2VrwYD9YGSG
         9WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017845; x=1729622645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLaqqsuBVp7JKfpRt4/UYAN3c9BH8mfWsfXx0tSAXhk=;
        b=p0c4Fz+ANu647odo1jxMJ/BuirlK9EZkR3JLn+ksmwnqzqkQ1B3wSfYn+y7aNBYuSA
         h9ito+fQwGl3OJO7PxEDJxlEAuG5qGXN2eUh012d/k1fFpz27jOuWh0NZQW9+/w6bPsc
         X/UkE10zXgfx7i+L2KAPRHtFc/uUogYxMcgLxYHoKiGOlUlWdNI80HYir8x7Fni7Fy6z
         dQ8FIZ+Q34o6XtLtE17GJ5Iw8VF6dfcgWgciBFVoIh4k8IpLMxeLsVIRw+Ta8XQxYgJ2
         Cwf1NmyTLH0qPYe3H1vM4bp0MB2ho7NnuPbxE3Tqx4/vLkU1cUyMSHk3bjYtJ5tSTOxF
         7Rcg==
X-Gm-Message-State: AOJu0Yz9GV82PGPqII94B1y59evvjhxNe2uy6YUCMRVgHYFoQBjBqpii
	zLXmOBJZnQ5YC9V4H3lVLpHc3/af7Oxp5sQtb0beRrlSJpXRcCDM
X-Google-Smtp-Source: AGHT+IF/ycYrPtkqjEqLmAbr9e5OsTBCIwA/bxVArdJ5lUO04qTt9icQEii/Op+GogoQpOLfTzha3g==
X-Received: by 2002:a05:6a20:6f05:b0:1d6:fb1b:d07a with SMTP id adf61e73a8af0-1d905f4fb0fmr1606268637.31.1729017845313;
        Tue, 15 Oct 2024 11:44:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4bfb:6b8:82e3:75b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774cf2b6sm1596451b3a.169.2024.10.15.11.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:44:05 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:44:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input - Switch back to struct platform_driver::remove()
Message-ID: <Zw638jnLeFJQpKWv@google.com>
References: <20241008090009.462836-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008090009.462836-2-u.kleine-koenig@baylibre.com>

On Tue, Oct 08, 2024 at 11:00:10AM +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/input/ to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> While touching these files, make indention of the struct initializer
> consistent in a few drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied, thank you.

-- 
Dmitry

