Return-Path: <linux-input+bounces-5101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B29937D93
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 23:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A4AB21875
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 21:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6920F14883F;
	Fri, 19 Jul 2024 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs7iQ4yl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45A1B86EC;
	Fri, 19 Jul 2024 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721426348; cv=none; b=DOJWRgkH/nzIEfhGYbV0iirKI5UAM4+InGptavKxPmVhBXaWAJJKZwJa1iOtE52e59Sh6kyPnzGIbiyrBfL6/Fo+b8/lPQSyD+bBYKxbWFnzv6Wx7fpvv842NC6Rl2cQT6sPdPXENSCiy3/F4m3d/GbUTVQOAkQoANi3INLadMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721426348; c=relaxed/simple;
	bh=/WHzPOaaovTaX85T5W4WWT4l61p0Ty2DqwCsEF54c2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at9yyCtrPMdkqwW4tZamHNdAkAE9+WbJuqon5jqaCGt/NI5wXlqCKUFBwsUyOQuqQRUnX7CyyqAYTZUoR0ggxW5nFoqTq24WhH5/zOBIPTv7YT0YbLphySluhoNvOu6/0Kewnwwwh8k/5rgzRlWrKbaB+/HPnEVwDyEYM5fJSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs7iQ4yl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70af8128081so1067024b3a.1;
        Fri, 19 Jul 2024 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721426346; x=1722031146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kPJA3uRyNHyrdo+Q1tKD6lFBlABVMZs22F/w6hDs+0=;
        b=gs7iQ4ylJSTzCco0YCPIEj1LmmUI0F/qv33z1YTqcpjoluio1HlmhAfPnoE0MGnZUD
         6e3lB7v8KY8F2QzdjeVGd4kDPfn+G2dbDQlyVYQsTxMAkf10LXQRIPYFVVh+WsOlQcq9
         wQ/ocKFwaHFcLFB+X5i1b0gwq8NiAYGTcA+ed1aPOF8LwKV5j302/XvmMvsw9RUJJdkg
         +Vn7OkvCQEZI0XqcDIFE+ywyCGO0j3Gn1jIlNSCC40T8FWTACphzIriPLoPJBOcSQYsX
         EjTgEGwuhv+E1BBTAjvrIwHwtwKxXTAxtNsl1KYqyJ0sWNqBiAS/epidw1LMkp001gBd
         dmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721426346; x=1722031146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kPJA3uRyNHyrdo+Q1tKD6lFBlABVMZs22F/w6hDs+0=;
        b=R4nyyB5tPp2nnmCKLTgdY83BT6dnaGOpVCcXfOYlvKEAE0+24PXRgk8qV4f17fNmTI
         F/eTEqxIiSrxVBycfIRrYriDQlnTYGUEtnLRnZFFw/STBswL3NqCG7JV15xoNWOWGKfD
         pKHLfn06N1AMqx4Ye63ns5CLaOhJLOMnTvab7vO2cc2MYLoQeF0gB05bQWbOBjqC4Ccw
         WPr+zJcB51E3xKTJdDlb484U5CoCUtrjUFIQlQwbnTaflJUPZ9Sb8ZsfkZErgl2x/Hxo
         IcGZHMos+vUyPP5mRNwk5ymV5/x32Wk3wGzSjg8JmKsRix2hGsr2iRdLlcwiGmlcw6NA
         U0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV1Gsph2wHt1kaBpCrviYiA6PPOM5DNPexBA8hHUVsvHx17jLZFo+xEEFhsHBRx0eok3J1Gwk2xn4lRoDJiLBhSTBLPJgDFUm4rp9ntHjrw2CtwCPA/M11IuN0ab5Hi2xOSMrmFlgoOQqY=
X-Gm-Message-State: AOJu0YwTFEXt3t11tSLBMnZqySCHIfwiuxjsox+hemZOLdQiQ0z7P5v3
	uP7IpI/Mo3KAwl3BZ2jUVgibMfKdK9PC0j/BpD7KfhhkByQGVrf8
X-Google-Smtp-Source: AGHT+IFAuR+C6J59V2vktcmPBXtFg4cNpa0nnCaWhUdEt6r+l9sPuQIg0lJchnbJBWEgMgukqCXu/w==
X-Received: by 2002:a05:6a00:3d16:b0:708:11f:d153 with SMTP id d2e1a72fcca58-70ce4d82eaemr12140962b3a.0.1721426346089;
        Fri, 19 Jul 2024 14:59:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1cb1:21f9:91f1:d0ad])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0e5bd580sm707204a12.64.2024.07.19.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 14:59:05 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:59:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, neil.armstrong@linaro.org,
	hughsient@gmail.com, broonie@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: goodix-berlin - Add sysfs interface for
 reading and writing touch IC registers
Message-ID: <ZprhpkN0gBTrwyOt@google.com>
References: <20240514115135.21410-1-charles.goodix@gmail.com>
 <ZlkRZ7VKNVZSFi0X@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlkRZ7VKNVZSFi0X@google.com>

On Thu, May 30, 2024 at 04:53:11PM -0700, Dmitry Torokhov wrote:
> Hi Charles,
> 
> On Tue, May 14, 2024 at 07:44:43PM +0800, Charles Wang wrote:
> > +static ssize_t registers_read(struct file *filp, struct kobject *kobj,
> > +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> > +{
> > +	struct regmap *regmap;
> > +	int error;
> > +
> > +	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
> 
> We already have goodix_berlin_core->regmap, going through drvdata should
> be cheaper than scanning devres resources for the regmap data, so I'll
> change this.
> 
> > +	error = regmap_raw_read(regmap, (unsigned int)off,
> > +				buf, count);
> > +
> > +	return error ? error : count;
> > +}
> > +
> > +static ssize_t registers_write(struct file *filp, struct kobject *kobj,
> > +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> > +{
> > +	struct regmap *regmap;
> > +	int error;
> > +
> > +	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
> > +	error = regmap_raw_write(regmap, (unsigned int)off,
> > +				 buf, count);
> > +
> > +	return error ? error : count;
> > +}
> > +
> > +BIN_ATTR_RW(registers, 0);
> 
> I do not think it is a good idea to allow the world read all registers.
> Any objection to make it BIN_ATTR_ADMIN_RW()?

OK, since I have not heard anything I made the changes and applied the
patch.

Thanks.

-- 
Dmitry

