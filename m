Return-Path: <linux-input+bounces-4792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D44891EB3A
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 00:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2971C20B52
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F077C086;
	Mon,  1 Jul 2024 22:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIZlON3I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4047F45
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874713; cv=none; b=ZIEyUaytnJ8wTe6I1vQk7F6be5kOF5WJ3ohmJR926M3+SA4oWhmp+W0ECoz3om1n27H8x6Xm5iQb7EHYITXt3KxAhOQlisEa8d9ZlVPFJmHbt6+qkSAQme9fIM/O3LpciC7866eG55hRMkDfKrqfKjk7IjyryUvrYLV3oaPZe28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874713; c=relaxed/simple;
	bh=vJmcG9rcqwNDrBaSl8vqetSMWzCSCkQJ5nQ3cIUHTfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiCE7mwy/ctCBBGB74LCF0+Bpsq1vC17AuF6lH46cIqBDXlkrNT9aA7oAszJ3RPOZNTPFyzJiDPqLacbQ85l9fBShHoAt8kSFpVqGxP/ewPQ5NqFTreL9evx1BWVnwBg8c2vAKEIR76EJtz3NpmMOQSGd3yAJ+CS9ZhuKoT1Kmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIZlON3I; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2067448a12.0
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2024 15:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719874711; x=1720479511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UExkviOUL4YWynSV/WHJt+sG8sQtYVtnkwIw+RfSiBo=;
        b=kIZlON3Ifl7cfChqbp5UanpE1Dh4XdPlgJgi1O099pR77vM4oywxDCQooQ1Re90/nm
         V2dawbcucoy+exvfZNWXI/QSuJyd7HEhwWAnI1S6qKjgEXvapBR/dZYcTfVAIPWUPGid
         vAQ25XA84c6/ovaeZ3SsgyhqL2g8s/yAfRlQwFxVvpbymLQdRgEtX3v8R/ogfYj5qMvn
         njF6qt2rFde5xlNm8+kYrvMBIJp3Rz+jIT6kERIfOi8wCvgNx15awp3ybEqPz8RrD6qa
         i9+gIDRDDSTvc2ZGrq4qShVaaFdFzmzIJ49t5HhQ4LDCsXS6u0Nom34DryfEzkwTSA9x
         z3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874711; x=1720479511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UExkviOUL4YWynSV/WHJt+sG8sQtYVtnkwIw+RfSiBo=;
        b=TQUp/LWGpa3hQ1W1mvyU+xkpFe5zm8yzMeCpYT0JCUbNUpMmqfdhMCB+JhJVf6UqGa
         5QnhXE1zBOw9CHnvGdc71fR81pJCNSRSEUqlPCjhVMSUHsqZZ/bxG/+pghqRNbC693nK
         6dFCmKojHhwWTqpuf9J1YuBhzPGWQ0CsGfi2bbgZjFJ9oWDZP1Z3HVJUHK/jkM0eUNgF
         jEDV8qKLB3GfaxSJjTpAczZj/Gc/lE4afpQfR3xpgi6bfl4HIyacgeYr0JtzJnsfpyoG
         bCj5szTGnDuzxfjtpf2Xdvqul+aYAztcv9jpuPA+dH2l4f4wxxsdENiS0bRxx0Crje4F
         iHTQ==
X-Gm-Message-State: AOJu0Yyg3AJlUcGBwxG6v8b5/NDjCLYUtEcThNCy9JujCJopZbJZCUPk
	L/Y18daya6p9R0sa17bAYapCTE3WLPx20GvvHoM00JQR0H/Q50Kn
X-Google-Smtp-Source: AGHT+IHjjcF7YkQPCfqUcnkGAuL+suN6aGsRIEx6HRINwJQynLXg6YDPnhQZY6tCclA6FYvl2BQqKg==
X-Received: by 2002:a05:6a20:ce45:b0:1bd:4bb8:6509 with SMTP id adf61e73a8af0-1bef6224c5amr6185895637.55.1719874710817;
        Mon, 01 Jul 2024 15:58:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:97a3:bdcc:1a3b:f207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246c8edsm7075818b3a.58.2024.07.01.15.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 15:58:30 -0700 (PDT)
Date: Mon, 1 Jul 2024 15:58:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input - Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZoM0lM4uLdNjO_d_@google.com>
References: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>
 <ZkKZ50fQGdr8Opv0@google.com>
 <ZoM0Ttysx91ZemKS@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoM0Ttysx91ZemKS@google.com>

[ resending to the right address ]

On Mon, Jul 01, 2024 at 03:57:18PM -0700, Dmitry Torokhov wrote:
> On Mon, May 13, 2024 at 03:53:27PM -0700, Dmitry Torokhov wrote:
> > On Thu, May 09, 2024 at 07:41:59PM +0200, Uwe Kleine-König wrote:
> > > These drivers don't use the driver_data member of struct i2c_device_id,
> > > so don't explicitly initialize this member.
> > > 
> > > This prepares putting driver_data in an anonymous union which requires
> > > either no initialization or named designators. But it's also a nice
> > > cleanup on its own.
> > > 
> > > While add it, also remove commas after the sentinel entries.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Applied, thank you.
> 
> Uwe, could you share the end goal here? It looks like there are couple
> of efforts to deal with driver matching data, for example I had this
> proposal (which I did not pursue further so far):
> 
> https://lore.kernel.org/all/20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com/
> 
> I think it would be good for all of use to be on the same page.
> 
> Thanks.
> 
> -- 
> Dmitry

-- 
Dmitry

