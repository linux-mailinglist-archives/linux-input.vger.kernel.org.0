Return-Path: <linux-input+bounces-3841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683C8CF289
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 06:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED4628142B
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 04:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1A71A2C16;
	Sun, 26 May 2024 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5u/wh7N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558C652;
	Sun, 26 May 2024 04:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716697218; cv=none; b=NNbJ9jpzgkRbw0OVSWeswu5XujwXljj3wCw97zLVYLJ4W4lJrtfV5WQTqXdPfrlujfi6ESlgnpG8h9sr71/YHM+dfjPEbINGhs4rfs6obBN9fizSfXnANAEEvjvOEhpfXMlxw7mKE4LzlF4Bx4A/GAtMQZkbcHveOCTRwY7P/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716697218; c=relaxed/simple;
	bh=MZvMaZK7PvIiVCaMUxYaOz/9w1fsjF+b/vVVjmlwF4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpj5hdCdXFWluPF73SOWNTzsfOGHkurdaS1fTXfietn8cdnuOc9oJ+5vk7ZrZholOOkpRLZlbF7GaCrkHgNNfQT6fJOhaGxJ0FNIXuMgQ7T3hM7ocSPihft1ztX0HGCXVDq5MczKR//qAhqYs2BJpioFSF6Nbx38c+KNJtsnGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5u/wh7N; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-24ca2f48031so771680fac.0;
        Sat, 25 May 2024 21:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716697215; x=1717302015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKIabnbVCatFIyai4srbyY7pY2nDOqg4QYB2z5fksHA=;
        b=Q5u/wh7N4tFoYGyu394ncjI9eubukoCeOct6JhBQmTAuG5fl7rYMLHRQNhgV4s0GC9
         v2f7ITuBjk9XzTu4FFEBTWcd8CchoMJAU4osNwplrlmuhZ3Ddphb851LPSreHMO4oPhs
         dSwjU4G6O8/H2mVL40JImVm6vm1+DIrJVzfpSM8sRkuRsQmxpPcgsL0w9reqyUE9dyqv
         nDPvzaBLe5Z+mfJX9LMKf2wiD3zV/bi6/h0SnH/RMpBAbJgF0F/d2/gRl+6AgmlBgJri
         GaTCYLOdN/XlPnCkf7GK6YSdCDc6HtVwdvVKdkENUAOQfDFfzFzRYva1+N4nZycd3F+/
         NU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716697215; x=1717302015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKIabnbVCatFIyai4srbyY7pY2nDOqg4QYB2z5fksHA=;
        b=Qzn1AkGFCk+SN5wieiuaCurTBxatYwHZ7B22naohmJKSn4ycoQSmYHICvo+bGMksV3
         pH2WY+EBm1yhReccCf9uc0Jnm7HCAfZK4hmv1SNKhtu1kj/7bwKACh0BNIoIAyoVhatD
         8tcpLBrZdYUPbRrdztShFiWCCw3FEzbBwcXRqtaYo5/10Bz6RGgVBamK3XInOnfhBYP3
         K5ZfH/UzI5omwKv4tFoydJTVjHMJWc4Ax6Efh5Z4C+Jrn64zm63Nuy7MRiEYc2DtYU3w
         oq+izshdy6SK5CcXNN98e/rHdF+3gvIRy9iMU3MBqceZQYrpFmeKjbw0VLYLiuf6hcuj
         I5+g==
X-Forwarded-Encrypted: i=1; AJvYcCV9TsYbCE8MgEoYd+/6lYaW2BJScx8BSOi2Vi9M8wjl9APpFNurDXEvUnUtzmdonm11Rv0m7Z3KvozaURqipFu3Lwcx/Xw2JVZC25Ffj9sU9C9ZNsXnsf70YabxpjqSjfWkMXn43sfgSfjCTw35UR7B
X-Gm-Message-State: AOJu0YwcSD49Qi+5S9SgdFnzldHFjmJAVWALhAvb4tuTYepSnQqXg0v9
	U3ukuYBFHbrpGWHDYgjN1OL/6UmYTz/8kJOLJN+uS17562uEvoSdSLcKhg==
X-Google-Smtp-Source: AGHT+IG2PvhUw1vQZ8BFWwqldoUwcmoOz/LM3lOAZkbxgBc4JkKvjPxhHFPokyIVIajn0pYc1cHJQw==
X-Received: by 2002:a05:6870:7f08:b0:24f:ee90:4556 with SMTP id 586e51a60fabf-24fee904913mr419953fac.0.1716697215539;
        Sat, 25 May 2024 21:20:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea6b:814c:973a:32f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-68218501df4sm3069246a12.0.2024.05.25.21.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 21:20:15 -0700 (PDT)
Date: Sat, 25 May 2024 21:20:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: silead - Always support 10 fingers
Message-ID: <ZlK4fMIxrPbo2Y61@google.com>
References: <20240525193854.39130-1-hdegoede@redhat.com>
 <20240525193854.39130-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525193854.39130-2-hdegoede@redhat.com>

On Sat, May 25, 2024 at 09:38:53PM +0200, Hans de Goede wrote:
> When support for Silead touchscreens was orginal added some touchscreens
> with older firmware versions only supported 5 fingers and this was made
> the default requiring the setting of a "silead,max-fingers=10" uint32
> device-property for all touchscreen models which do support 10 fingers.
> 
> There are very few models with the old 5 finger fw, so in practice the
> setting of the "silead,max-fingers=10" is boilerplate which needs to
> be copy and pasted to every touchscreen config.
> 
> Reporting that 10 fingers are supported on devices which only support
> 5 fingers doesn't cause any problems for userspace in practice, since
> at max 4 finger gestures are supported anyways. Drop the max_fingers
> configuration and simply always assume 10 fingers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

