Return-Path: <linux-input+bounces-6432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1533975A2D
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 20:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19502836F2
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 18:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAE11AC89D;
	Wed, 11 Sep 2024 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEulQrOA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED141A3021;
	Wed, 11 Sep 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078689; cv=none; b=NKSPQr0BoElvs7RaH66/+uq9SI52K7ZWXXbyM6DPOxaB2wwlSBmcAr2I3g2wEAVFkuUY86yi77sLfVvbWotoNRqTzNxDk3bYEByO1J/KBNstuslPvP19aEFoQrISGJvMX/LJNtiQpiCKO3a9ss8xhb52g8iavem9/c1INIJkDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078689; c=relaxed/simple;
	bh=sr+073bT+QqO5a/ti2HDZMp5QMDPzH1NQOeZEGx1W/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0j7wd4F5H8ee2lwRWdiExhYy+agnpQ5jDTuqSVVpvbfwPJnk5wrewsFI7EAHifglo3MThofkXJWwubRF6FXtYByDbb6JwjnNLcqwtVt7XHURs1bZT2c4vvL/pvoY8GF7pMWkaFR2v39nt2tPJtQjSSb6qgpK9Yz9YOGcVj0i6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEulQrOA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so124325a12.3;
        Wed, 11 Sep 2024 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726078687; x=1726683487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKy/i6x7+heevXgOafJzaW6bi28fLZpUrbwYOPfsA5Q=;
        b=HEulQrOANezkAZm3bfrc/9BDJUH3KahHimifX67oSrd0dIZdnB9NBfwQiEgSQNLPLr
         gNU6A2tpazG/cPBaiylQjJqPpKbBUUszTlODOn5CjlwGxb8d1HXYahg0kqI4q55MThwk
         cidhFHJF0yEwu+GFz+qMHZj5ckqqzvXbfuoBO+LSjk8qzA/RjswitbYqRHuZWN9Luh4m
         P8J3R44Haq9SLueF8RG0ckRUQGkbqSvARLBxIGj7CSl6EN4mcyCoP99XjdeMkw4Tg7Ml
         cziIGohGFuVHahgkwV21aR/gIGL7N4miQXwipN6xYVABehS+hX21NyLt3UKOgIHXbqGs
         Fn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726078687; x=1726683487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKy/i6x7+heevXgOafJzaW6bi28fLZpUrbwYOPfsA5Q=;
        b=Ep8rrCqUHOmZle4R0JJregiT2rCTK3k9nbDM8IPZFiDlFo3o0AkUDqEa5/yaFP48cL
         kF+lMqfg/jAYw67dWbZBwhEJRpmGp9/gnKf6v+hAsIlXkCOEjql1xaAIzht1n/qkEyQA
         l/rjlqNd/jfAoyWRfuSCzuRPd+HaXqUZHp/FVt+oA99JauEdRJ8UCnQ9S5YMyVpRAzO6
         7EvI/Ze8OU5PD1+M+zQN/PSEsUOYEr6Z63FqszyIaCWLjfr2U91GQujgiXIAJkjUDAsO
         0M0d2T3fLfG7pnxnlBye+Y0L2/b5Q4nEzwQSwYt5XZqzvHS5xL9g3sK8YvagDrBumLS5
         gWEA==
X-Forwarded-Encrypted: i=1; AJvYcCUcSWyXsaYsIVWEl1GGBly6eEnE2pdMJPBVQMWWHkPhULBQ9osbBKvQWgUoOTI6jvYgloLQedxVWe1ZAcED@vger.kernel.org, AJvYcCVNU7G1Zesubrf9ePzOuZfVdWk0Zsy3/VmUbJCHdfwmxIQny7zO5a7EleEqqLxHmEQ8jdbhIyWQaE+5QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyafpsmf2Z/gZfT6FwhuUp2RbS8O8i+aGoCR62lR0JmmoT+aVHT
	ghi5jIXPZyzj3tgEHIdIJgU+psTPXosMpJeYdBolDFuY67gEYZuA
X-Google-Smtp-Source: AGHT+IGGXwf7kzAthcEQKLRI9EPkixqOk2Obu9nrrc2lowGwhipMG0F75MvM1wAsGIoTX3IumD+eYQ==
X-Received: by 2002:a05:6300:42:b0:1c4:f247:2046 with SMTP id adf61e73a8af0-1cf75ee4135mr202972637.11.1726078686566;
        Wed, 11 Sep 2024 11:18:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:74bb:362:cccc:8ae3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b0397sm3246623b3a.154.2024.09.11.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 11:18:06 -0700 (PDT)
Date: Wed, 11 Sep 2024 11:18:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: ". Benjamin Tissoires" <bentiss@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: ensure various commands do not interfere
 with each other
Message-ID: <ZuHe2zkSbwyr5syK@google.com>
References: <Zt9clAu04BinzIcd@google.com>
 <nycvar.YFH.7.76.2409111526450.31206@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2409111526450.31206@cbobk.fhfr.pm>

Hi Jiri,

On Wed, Sep 11, 2024 at 03:27:32PM +0200, Jiri Kosina wrote:
> On Mon, 9 Sep 2024, Dmitry Torokhov wrote:
> 
> > i2c-hid uses 2 shared buffers: command and "raw" input buffer for
> > sending requests to peripherals and read data from peripherals when
> > executing variety of commands. Such commands include reading of HID
> > registers, requesting particular power mode, getting and setting
> > reports and so on. Because all such requests use the same 2 buffers
> > they should not execute simultaneously.
> > 
> > Fix this by introducing "cmd_lock" mutex and acquire it whenever
> > we needs to access ihid->cmdbuf or idid->rawbuf.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thanks for the fix, Dmitry. Out of curiosity, did you find it by code 
> inspection, or have you actually seen it happening for real, making the 
> driver misbehave?

No, I have not observed this issue in the wild, that is why I di dnot
tag it explicitly for stable. It came about when I was reviewing Goodix
HID SPI driver, noticed that it was using a shared buffer, asked to and
locking, and realized that I2C HID needed the same. And just got around
to sending out the fix...

As far as I can see USB HID driver does not need it - it does not share
URBs but rather allocates new one for each request (via
usb_control_msg()).

Thanks.

-- 
Dmitry

