Return-Path: <linux-input+bounces-6274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A365396E942
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D4B1F247CB
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5861E40879;
	Fri,  6 Sep 2024 05:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEhvc+b3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC502A48;
	Fri,  6 Sep 2024 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600595; cv=none; b=Wt9GOMrIDK+m0rQL//+OdvNCyvF0krLWN6a87pQvpOfNx9lwMFUsCjU/YOL8hQGbXiv7VihKl7BTB7LjkQLEpjRwfVrD5gQ8urLJnvDhUQopmqD6lZlzZQ8cq7o8CXP9puYRzkZQeRP+cQV9Jq9B8wTAShTh+5fN3AB2sV8htyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600595; c=relaxed/simple;
	bh=c5rG8W+UpJgiXdoTi/jU3jDWygp9pIrM3OecNI7yB74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwXaO/IhQhdRQpaSmXsMNCUoB5Bb0sN8qbS/dnIimPPt64akR9yzZe7Qwftatw0nOLnuZoJBQNCXNsjS8VZw/wJwpCVtLyWeGiyWwvQ5oXBAaOYpEAYrJJDTwwPG89BW+PC8hM4i+aN8o+JcVlZucqv0KOQYlkEOzEXPGCdWkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEhvc+b3; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5dfa315ccf1so1018029eaf.3;
        Thu, 05 Sep 2024 22:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600593; x=1726205393; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCyrXdUT4Wks/m84wqW9nphU1jA9e88xa4OHLtyB4dE=;
        b=kEhvc+b30cwfwbGjShMgeHsKO/6txek//VO0phJpWZvtLMRo69iMGF11ChIEkVfHH6
         avQWUT12s1FwO7y2yi0y/CLZHTuzgJL/jVyXuCFqAQfFBJM5JoFQ2osx4SpBwzFEi65T
         upP8U2NKdRIzFQFZCIOkT/b1O+QNlYpZCw+SDGailwPEHoghMf/VpwJU/7EI9Ko4H2yW
         rEfnNf5bw3z9wlIJWIVsQ+EDdp3pzgxXBT2KSVATRkKlHW1G+zQm0o7GpicZiZhPB7RS
         hJuC4Eo2urVmStG+NpAzHwGYtGL9VCRcTA9n6AH5msir6VDr8bpkPBLcg1W+11undZXA
         bvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600593; x=1726205393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCyrXdUT4Wks/m84wqW9nphU1jA9e88xa4OHLtyB4dE=;
        b=rhoUKAZbbX3LF8DKj+Wab3txLLkN4ZlavoEPXZjMZR+DoB9Q9kwxRIsHQfkCU+ovgJ
         q3ck0TBLZ61Hdq7fJnYRJIq/AfoMiuksAXi0CFy2CV7poNfSH1yN2CR5UQKjwxP8gJ3V
         9/YIzMQJV89SPcl9xMmMr9OY1+98k+v1o7MrlVgDJHzgDTXjDN7/Bj8sspH/NY6dnsfP
         2VxA5OFwfCM5ulcZ2Fc3u8i+bNEKyxdM5TUbobUwFO/Wo3pk97HBIzw5bxA5ByXW9oH8
         d4r7aJWjPSf85LssLeqRxlXBazsD1WDgf0WBUm9nU0QR5lb1TBxhQHdjXuQ5Ageu1dnW
         F8gA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ33bhVaTP2XbubpBDq2Nii8ySDO+rtvFtoeRM4Sz5eATe4S+p4azI5GWcQytl7IOln5jnFJUNj5fMKVrE@vger.kernel.org, AJvYcCXO7Lpb7Kp5T2G8YLRY0ucp856z/4R+pGvf2cfhT+e4wQPfSXxQb2MLwuIWMFpI5CgPQeCYSaJVXbsjUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPihvi58jp+wjgOwAOP26pvlgVTe9qcHsHWz//tUuNsoSxbeLv
	4wfxs+IYe2rnLbTnuVN/J9+CFTHgsz3ygOLYo8pzJnE3JVUQ6gR8
X-Google-Smtp-Source: AGHT+IEIFBATCXcOsz9JD3+EPLtTHVM/0/bkvsqFStGZK3sxwyPyAnbV1+4aOVfihvhd2axqlF9BRA==
X-Received: by 2002:a05:6358:5245:b0:1b8:203b:db89 with SMTP id e5c5f4694b2df-1b8203bdca2mr897095455d.5.1725600592679;
        Thu, 05 Sep 2024 22:29:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177858988bsm4072916b3a.105.2024.09.05.22.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:29:52 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:29:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, neil.armstrong@linaro.org,
	jeff@labundy.com, krzk@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH] Input: goodix-berlin - Fix VDDIO regulator name
 according to dt-bindings
Message-ID: <ZtqTTZizT7nAaYzq@google.com>
References: <20240805155806.16203-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240805155806.16203-1-danila@jiaxyga.com>

Hi Danila,

On Mon, Aug 05, 2024 at 06:58:06PM +0300, Danila Tikhonov wrote:
> The dt-bindings specify the regulator as "vddio" instead of "iovdd".
> 
> This patch fixes the regulator name from "iovdd" to "vddio" in the
> driver code to align with the dt-bindings. Fixing the dt-bindings
> would break ABI, hence the fix is made in the driver instead.
> 
> There are no users of this regulator сurrently.

If there are no users (and the binding is pretty new) we should consider
all options. Do you know the name of the supply in the datasheet?

Thanks.

-- 
Dmitry

