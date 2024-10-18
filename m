Return-Path: <linux-input+bounces-7547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D79A48FC
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 23:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687D8284085
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 21:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5213D18E34E;
	Fri, 18 Oct 2024 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxCmifz0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8274A18D640;
	Fri, 18 Oct 2024 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287415; cv=none; b=ty0aFusZQgN5TGNhrcR+qs848ilBzi56E7/MVYlEQ6qLjG9MYLSSaHZTLCYcFhButBoFnxnPLySSmlprbqKk85bN73jyYLSPqrn5IxOYkU8sURd58WLErjt1JgIOHI2MYQX5RvOuRuqBS1Gu0zURU7uxNK5sYArfLAvwQck4q+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287415; c=relaxed/simple;
	bh=BXY6/Xz1K3rp0n0eKABUQYXOORIIxF8Clqu4g0UtK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8bZbvh70ZpbgIC0hoTZcng3IZVFb7otrJ7lHhtp0ZzcjIdL2L/ZNqChhwcbMXNB3ahhpmlTo4BPJNEGJleeVP1vqeqkk0zA6cB2IcIHdIq4JocQBxnXTG5PXUMkG+g/8yxMaZsN8AxAHvZKG5FzqT24zoYpcLmY+kACc1qIa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxCmifz0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so1878432a12.1;
        Fri, 18 Oct 2024 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729287413; x=1729892213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/QiucVYfZ/doIk8MZgKrtYDj/bCE5621BtmHaL2dZ8=;
        b=lxCmifz0NVX53R4xo/vdJp52lTzFBVvcmc9N8JdXN69FQSwjwc8UlsRCitSIIxO/TP
         QBGm5QaKlkV09+/AceicPcu+41EsGXiMv1ff0ShMARY2b9pPhJAmY1A9NPnoEC5RDjHE
         ZD5vuHIm3ClBcfnzZ6MKkAnsuFwi1rO3m8Jqr5LdnwmwMCKFGLBuNIkzz/sIPGs84lZp
         6vdyaT9i9xqQFezL/jTzNqvf7NazEiCvrNowX1Yw+CvlS9HSpwVaVXfUF1dSoyf6iFo1
         tDW5VAYA9pez/iILXwY0mTEw7oxXULimtc6BP8wSOEKBi9+1RKKRe73pvaqtv2qvsXuT
         XLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729287413; x=1729892213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/QiucVYfZ/doIk8MZgKrtYDj/bCE5621BtmHaL2dZ8=;
        b=FCEUp0XuTFWQSjEZ+4S3KZLPdPar39oy/O003gyTkwrtSLqS2MyvOMtNXK7GCE0L/m
         BntlNV7vkBUsWTp26Fx6td+6JC33xqH9FqJYgkQwvD6C/WSDqw+R5noLiGNELRfle4p+
         gqDsTW+HUhnNCQLS8YLFuZupguCId5tEZ2VpbcaPqT70DLcAr2MihaOwTOhR9c7h97dD
         ePJiGXUfQeX9+gbe2MvsRm5Qy5YzYxDdnE6lvB1Sj+M1cjadeYQ9YS94wQdC+yRFEHXZ
         mPfwjeDd3IVkdM7NglzKxQ/TxD6+5r3POM9OACrExmdUSoUHSKF/mv7x508HBRnjwC0v
         KZDw==
X-Forwarded-Encrypted: i=1; AJvYcCX5yTJ1bxQWpywBtitedHlrzplXY/C0rb0Sfv6z3fb/U21UhvTJ4nU+Wz41xXR1icMmTsuIVtCDahRcZg==@vger.kernel.org, AJvYcCXZm7oLQz8AQ/OCwchylPHyWMHGW0N7eso/ImteNqfJaV/6biGcAQuSgpr+pQheCQrd4vRsICzjjkGoa+4x@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeVMTtxc5krDtQHuZbCWm5QQOa/n26P/6gEpve04jh8N/PaJ6
	FLXnWlLncQDTWjT3YbF7NAzesW2jJww8xuvfQ/VKrKC4XlcGoERBQxOFkA==
X-Google-Smtp-Source: AGHT+IHrtOaf+fPd+6pBLoNPFsKouy2wsOKN3El5ykUhADfQ8GBLI9eqm1HlB2ZQtyB6WIocGkebWA==
X-Received: by 2002:a17:90a:7147:b0:2e5:5e95:b389 with SMTP id 98e67ed59e1d1-2e5619021f0mr4028850a91.35.1729287412686;
        Fri, 18 Oct 2024 14:36:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7970f4sm2696125a91.5.2024.10.18.14.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:36:52 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:36:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christopher Snowhill <kode54@gmail.com>
Cc: John Edwards <uejji@uejji.net>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Input: xpad - add support for MSI Claw A1M
Message-ID: <ZxLU8s44Ffzf6nOC@google.com>
References: <20241010232020.3292284-2-uejji@uejji.net>
 <20241010232020.3292284-4-uejji@uejji.net>
 <D4SZUDRTK0LN.2I9S7T660S7IM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4SZUDRTK0LN.2I9S7T660S7IM@gmail.com>

Hi Christopher,

On Fri, Oct 11, 2024 at 05:59:42AM -0700, Christopher Snowhill wrote:
> On Thu Oct 10, 2024 at 4:09 PM PDT, John Edwards wrote:
> > Add MSI Claw A1M controller to xpad_device match table when in xinput mode.
> > Add MSI VID as XPAD_XBOX360_VENDOR.
> >
> > Signed-off-by: John Edwards <uejji@uejji.net>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> 
> Um, I may have erred with my contribution of a R-b? Do I have to test
> the patch on the device in question to review it? If so, I'll just Ack
> the patch as looking properly drafted, and applying cleanly. Sorry for
> the noise.

No, you do not need to test the patch to review it. We have a separate
"Tested-by" tag to signal when a person did test the patch with their
setup.

Thanks.

-- 
Dmitry

