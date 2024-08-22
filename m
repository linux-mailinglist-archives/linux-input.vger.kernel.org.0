Return-Path: <linux-input+bounces-5750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD395BDFE
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 20:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACBD31C22D6A
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 18:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001251CFECF;
	Thu, 22 Aug 2024 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrDeP3FJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263C1CFEAC;
	Thu, 22 Aug 2024 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350062; cv=none; b=ACErRbXOIIri3VAF/8J/YwBYz3QdrXrKP0NkawQkP310/WS0RW4MLS98dTtfLkLZPmq4KOwLoKD6nhuzBrT6ZO0Mn8l+bofFzxOC81FZebBuGQF5kunf3r216mYCHrFWCN5eppA5Gtt+E/SjYjO86NK5RUDtgJiy74tn7DrjQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350062; c=relaxed/simple;
	bh=pcBIeK4mcDPFBDjl4/lQsKOvSfla45+WspiEGxXvkn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0Z2uUFBlm/9KbOoANn9veR5tMhcTSOstcSkET5ukg1CAS20/WUWm8QWIhq+G86Rm+7eVgOEAWtGGJi6x3n0sa3oa1Na5mtB7AkWGSErVVa3RTgF4WBW7uIyxglwfsXUZNxcYol4j7i860rlDc5IozB+6+q+j4A+zyooxI8kL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrDeP3FJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3c99033d6so893438a91.0;
        Thu, 22 Aug 2024 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724350061; x=1724954861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQybDFmkYIn6xZ+90bRuYKiZGiAETXvH8v85EQgpozk=;
        b=hrDeP3FJB5ia7ym+qbUApZIpZWIly2Ruo/9VsY/pZQF/HPILKywYGmeSYLYrZOYvpX
         Y4MqjYP5RCAN9Dt1tSK/gSwe+cfoqGh7hxfaf1H1HuhbVcwgX393V1V1kFpFbYPJIrS9
         vjDEN1miASJN+Oqh7GDqW8/18XavQDx3gMuAu/OPAfjgrToRUzKLbCxNSfujsyiqw6Q6
         gmX1au0/pcYKp3jr0F+MPM2GvrHnyj6MINhCZLRz4RbNmq9ddsZmp6EkY1lhiEdMGe2C
         OSW253zZjmEAch7Acjlp7E3XUZVJM/abHLP/8oN5yv2mVtspS3Ba8Jt6VWQ3h6IOIU2j
         sppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724350061; x=1724954861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQybDFmkYIn6xZ+90bRuYKiZGiAETXvH8v85EQgpozk=;
        b=MbJvY2amcakA+wA1049hpOHkeQ0f6ehqg0+GuxKBAsuDTFWBfrNqaxZzsDBIvzb8AE
         fwXWvyoc5jrCCwc/u/qlxzyCKZB8K4DCViQ8mTD/ffpjhqSsrrMqIMWZhIJDVGKpd4is
         qx2VYkQNYqmSi+JbwqYEHvMN3xCFOPhNnSKxtJ+fIcCA6ioqv6oohxodLtB1LX7PHBQR
         uACgYC67KSu5wvzAa/l1qhpmngkOl6zYDTYWqQn9UCnk/kXvoFi4bSsLT/1Fmh4nKgsi
         3NwZN0VtMDE0rMZC7h8BpTRTP9GN7wnE+bvqaqCm+b6ZdBRPDUfee5EQLJjmW9S1MEy1
         8DpA==
X-Forwarded-Encrypted: i=1; AJvYcCU3KjUUxLE1NEC1CM4+G6CRvjaAcdMJUhWo8w7d65PzALd3jmqbdyKURj8dv3ThoFTrKpxNV+Jz2daQDQ/qLjpI8OI=@vger.kernel.org, AJvYcCUOVSVzNZiNssMcNauaNKDCTXCERv9GPBCQDn80GHoKLTTJlP60kGkn74YxDd0b5xRjWi1OlhThXqIIKWBl@vger.kernel.org, AJvYcCWjPgFHu4WimnLCIGNC5kvQMh30ri51NrIRopX/SR84mioJq628S2ofL/Pg02QNlAy1IoD2GSkNAL40@vger.kernel.org, AJvYcCXAw8r0SZ693VwCmBr8fpPfv0dzLuugnpYDF64SrKtR3IquEUeRTDeSaTrPkg8jUxv6Nd3TT9wls04PBTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziE7t895Nb2aUcIy9Vq9iKTikjgvGAZC/F6om9O6MBFpfvgOqu
	9PR0eIvlJ6Uh5XUIeRQ95b84omune3ZgR/sWLvHy2pPmWLBkAW/s
X-Google-Smtp-Source: AGHT+IHBi4GxWgUXMcq98eVE29iY0upag5vzbbKCImIrJyIAQdIDDT41hS5m+8Vv4xn3Pcuv4QSJjA==
X-Received: by 2002:a17:90b:1d8d:b0:2cd:40ef:4764 with SMTP id 98e67ed59e1d1-2d5e99ebb94mr7480722a91.17.1724350060624;
        Thu, 22 Aug 2024 11:07:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ccdb:6951:7a5:be1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb8d235esm4544510a91.6.2024.08.22.11.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:07:40 -0700 (PDT)
Date: Thu, 22 Aug 2024 11:07:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] Input: samsung-keypad - use guard notation to
 acquire mutex
Message-ID: <Zsd-aVM6504L_hqi@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
 <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>

On Thu, Aug 22, 2024 at 05:48:33PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 18, 2024 at 09:58:03PM -0700, Dmitry Torokhov wrote:
> > Guard notation is more compact and ensures that the mutex will be
> > released when control leaves the function.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/keyboard/samsung-keypad.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> 
> You need to include cleanup.h (unless some other patch already did it
> and I missed it?)

Guard for mutexes defined in mutex.h which is pulled in indirectly, and
cleanup.h is included there.

If we want to list all the headers that we need instead of relying on
indirect inclusions I think we need a separate patch. But even then I
wonder if things like cleanup.h should be included by drivers
directly...

Thanks.

-- 
Dmitry

