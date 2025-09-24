Return-Path: <linux-input+bounces-15023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72170B982B8
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 06:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A8618997FD
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 04:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E08E13DDAE;
	Wed, 24 Sep 2025 04:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+FwMZtf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111841F4625
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 04:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687008; cv=none; b=q0GEzxFJruH9VPX9dyqHUfKmjZAkkHFfkfxWdE1hMSvv3uZToSWboMDVyuxTOvE+4f38XurturJaoJyCYeMSiDGpFNMQWS3kljeZib9Td1v/wzSyU9EA+t4obyme7PHQLwnfBBWHFAZtnPQSaCJcwlOMJ75yK5o0SpBNeJFJN2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687008; c=relaxed/simple;
	bh=3cI83+kMvCnvPKEAmgUH8Iw4iz9w4uzn9IGXgv7zKWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6uDW2IL6Uf51D+gKesFbN8TWFwaQndHljkKwuEhpCl3XVcL6uMKXHhzCmo5GRVqxf1FpCV+6vkXifqFpq4KqqFqdXb9JTU35rZh2WaLmUJa4GlOJtcHeMQ/5CDfWHv56UVKuzRURk6Ww0HTJdyW1A/MmrrzFEeM0BlRtDMM9D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+FwMZtf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f7da24397so180708b3a.2
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 21:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758687006; x=1759291806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=upnQzhj0lASnjo/ISsvGDWKyy8Ak/c4h5JmJhqwTbLY=;
        b=R+FwMZtf9G2+cvOWY76Pk7Nf2plieKy+SO7KrI2VOqcwF8auZ8+F5lXk+dARd8ir3H
         vIVdWnjwdNc8DTeKO0bqsKDQSkiJYYTJwfqfkw92zbVHxADUvPe9azuxR1jk8cKHkjXf
         +8f4iICl3/RUqkjHwl/wvXjbAi/4k/dR4cmS/xissZmrArP7CZN3CKo9JSZHGKfyrY76
         GujOulMlZdyr5zcRpRMBmpOC51Bgslnrc672pA5gIrYoOytL2nUToNgcqsr2LaQxFZhL
         aMNwStQaYARGnzqFOyiAi4rcGeSH9aBS40Z42kPix87oimzUpdf2gpQ13DK1U6cMXubM
         iZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758687006; x=1759291806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upnQzhj0lASnjo/ISsvGDWKyy8Ak/c4h5JmJhqwTbLY=;
        b=XQYsTqUoEbK8M2aAgs2Q5aukbvrjsgRRn/uqZ8LNFIM1JpVgjgK4pauembIPZ7PG1G
         S84rO9ySr/JpVXlIkzz2uMFEc8r4j4ZEzKoXXQbazCihKnB8AiKWHtoR1ucm/5LrRRu9
         4aCUgWFAbAiYAnJMQyTjUPrZGnNNkopa9jZIrZecl/QmZVLb6W76CXQiz9Dr651Dw7eV
         DPWIlZQdcQWzzTcG38Psx84bJ1z08k/EI/0flKd9ZIWPQG+apvD7KkkfiMMT9QkwxTJH
         EIEyRaa0H2qp5Cab+wJmOhZNX6U3b+VrzesgfMdClRmaQZ8jRXU0dodIr3kqMvO7YDWe
         RqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMIL72p6gVUIv7GHGvXMSPIhQwIILIwH3C1NUzYF9SyEnrOqcYzqpsAJj5z0QDVm7Zfga/xZ4sV0rIXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+pOj/TI2SApqU9BlpwxV8kJ3e8nR+obVdzHZxzorNHV3dJrd
	BDe4s67R+G4dcyxPhy8qu5W+rUY13zDUn3RmvpmbH0vb+bhnrrRqYzOF
X-Gm-Gg: ASbGncvtb/L7WgVYKO80RmX56cb+fMQpM7sfu88Ojp6pI81wjvjaXZDLQr6WNQ/kYj/
	gTtMHr+Ddf7RwCEd5hFs+x2tKNCDnKoebU19tYXPAGWYhQe83ftPE9hIgMGBJwbtcqDdeN652SV
	/U3+duFmORZTfj5ItaUvchX9afkFPCGFShSZVVHjOYUk7D3G/Ar4aLTjdOSRANfW2tFRWs+YRbc
	n+xIm6sretDUVo+s0ec96iGPav6e2TbjArw5OHaEN2u5ZlKDhmDAemrJNh1Sbcf6utCmDipdOPb
	3pauygOrXfzrxGq2tikyvNUzu6GhP9S3ogoZM2rhwpQRQaqn33zdaMu3aBa2x9Z0sdGkV8RV8M+
	2rl/bBrnbceo1aCs0D/mW/lhIC+0KNEE=
X-Google-Smtp-Source: AGHT+IFKx9ZNpDWUckunWS3L3Xe/z9wMW+hxpJY2tt8sPMBwy0PfYxAWN4p6TwNVD/MuXmdW/7jLKQ==
X-Received: by 2002:a05:6a20:7f95:b0:244:aefe:71fa with SMTP id adf61e73a8af0-2cff367ed2cmr7084776637.37.1758687006169;
        Tue, 23 Sep 2025 21:10:06 -0700 (PDT)
Received: from embed-PC ([2401:4900:60e0:7677:7e66:bbb0:5e83:be39])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551905bb4csm13048369a12.29.2025.09.23.21.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 21:10:05 -0700 (PDT)
Date: Wed, 24 Sep 2025 09:39:55 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: "Xu, Even" <even.xu@intel.com>
Cc: xinpeng.sun@intel.com, jikos@kernel.org, bentiss@kernel.org,
	mpearson-lenovo@squebb.ca, srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device
 Id's
Message-ID: <aNNvE9Bx7M6iMzTX@embed-PC>
References: <20250923040254.7547-1-abhishektamboli9@gmail.com>
 <IA1PR11MB609835ED0230AC6D60C54906F41CA@IA1PR11MB6098.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB609835ED0230AC6D60C54906F41CA@IA1PR11MB6098.namprd11.prod.outlook.com>

On Wed, Sep 24, 2025 at 03:31:33AM +0000, Xu, Even wrote:
> 
> 
> > -----Original Message-----
> > From: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > Sent: Tuesday, September 23, 2025 12:03 PM
> > To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> > jikos@kernel.org; bentiss@kernel.org
> > Cc: mpearson-lenovo@squebb.ca; srinivas.pandruvada@linux.intel.com; linux-
> > input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device Id's
> > 
> > Add the missing PCI ID for the quickspi device used on the Lenovo Yoga Pro 9i
> > 16IAH10.
> > 
> > Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=220567
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 6 ++++++
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > index 84314989dc53..49c8458f0118 100644
> > --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> > @@ -33,6 +33,10 @@ struct quickspi_driver_data ptl = {
> >  	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,  };
> > 
> > +struct quickspi_driver_data arl = {
> > +	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL, };
> > +
> 
> As I know the THC IP in ARL is the same with in MTL, can you change this max_packet_size_value to align with MAX_PACKET_SIZE_VALUE_MTL?
Sure, I will do it.
Thanks, for the review.

