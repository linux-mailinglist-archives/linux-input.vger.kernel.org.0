Return-Path: <linux-input+bounces-6974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7298C0AF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 16:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B06D1F22E16
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7461C9B7E;
	Tue,  1 Oct 2024 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaTcZLOI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0301C8FD3;
	Tue,  1 Oct 2024 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794223; cv=none; b=MlC9gyPRQmavHrePItDMQoPZlbseRDSBswSoOYEeGiv0qI2xTuvxCJu6vdnMay/I0zyI2ZA4cumxi9cbF/Q9V00oINjLzHIHGUkuH+7cDxRWp1mvuwlvCI7Zzi87T1ya5TQ3s4+jjJXsvd7Y8vGBfmijKlgk9GzN33PxsR2w5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794223; c=relaxed/simple;
	bh=zVTHKxty+ePixTPDEjFbsB1IZ/NkklbyNqw5ktvGDSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuWqk+KW0JsqnJOhkAKeOnJ+6PxUts8utPZSYYN9UdSs8J/lOiRM8thkMSK/x3m4O4deETHv9fvdIRYZMWRvFErIHUGvPlsFgp5Rff/WtCiWEIAmCGZ7B4nyzng+YqRcvyCRE+bj6Cvl7BKVVSX9X46iYdQmQ98t9PBvDy57vMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaTcZLOI; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e5a0519ef3so2590324eaf.0;
        Tue, 01 Oct 2024 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727794221; x=1728399021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9jSzc3UTDdiqSVBvHuXOMtgxYwSssHDIucavwxj1kY=;
        b=JaTcZLOIZwRJeM/+7tz3EBXwkvV/9Fr1rpEhyYC8GOJlODTxbdD8wx6IfuxujM+AB0
         oU9bwwRrSQMS9T54jlUQGqIJSrZcJ3ytWrgFR1s0nM4jhBosfMETZAHlt/aI1nCQY6n7
         IFQxz9ljocBvv7DwfQvhft9/qJjnJXnYV1aHHEXzuq9+AfAFoG5+4O1Za2VByDosGc4r
         7dbGsbEU3Pes8Ig+FA/HbfKihjXZOwua8ZlXgVskkNJkjG4Dh7csDK0GoHWM0G06+WMg
         GQ4p1xwM/eOmSbxU3lpMvsKWeK529S8npgWfrDDl8f8Okn9wTc/OKS3YOhB5USPBKE0i
         MaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794221; x=1728399021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9jSzc3UTDdiqSVBvHuXOMtgxYwSssHDIucavwxj1kY=;
        b=cYgRyH7N+XidtheCwV/9sBEbskkX1YBHQfd07IHseSqYIQaatZPL7A9LCji/7pg8Ul
         yJ58LelXgFKNeym+I1O9OVlzdi3LRfkXs+tXOrB8nXfWXu8hTfEJFOH6gndhkBuBLrO/
         SHLzMqbMky/O6ZZHgSq5PGGVOKNauPL2D54K3ZEXlQ8rNQQgpn8SXieDEm+NncTJcrEp
         pM920RLPX+cdSHWlHjl66q19cvDnkZXTFJPZ+syWw40Uvu9s1xUGypVnTzNcZqu4VSJ/
         tGO9BSagw1L8xxNm21SQhIF4oUWU1L5BukEA4Qn9TCBUpw6s7ZxOjNkaBE4G1Wpd5bnW
         WWWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4hc4IRY94V5eWdoyVuuJC5SyNzwYVroUEvJJ36FXBNDdxJ0eVRfkxIuFBH/NlfkwnkakIaFpVY2HGMV0=@vger.kernel.org, AJvYcCXzccyDxunHkHjYNn5Al66q/nZPkomDGB9Efw8Fjk9f9KMxEH4TrT63JRA9r9iMBTotQUX8tnAn/tUU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRIW/ddKPvKbSJblZ3TdQwC24fDT5zvSqVMuv7Q4MSxThpQRlk
	9LtwvGDwvYaJmaQcO5dbK+IgfPaHGJgdc98iIB9RxYrbf6Kas15S
X-Google-Smtp-Source: AGHT+IHtHBK/tDV6ZMFdUjjhhqnIJAogG0COCuiD4ERdFv7vTptQnlYISTmgqi1TBj0Rj8ikTFTthA==
X-Received: by 2002:a05:6871:3319:b0:27d:10f5:347 with SMTP id 586e51a60fabf-28710a6984cmr9338948fac.15.1727794221312;
        Tue, 01 Oct 2024 07:50:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db615d52sm8352555a12.90.2024.10.01.07.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:50:21 -0700 (PDT)
Date: Tue, 1 Oct 2024 07:50:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 02/13] Input: adp5589-keys: fix adp5589_gpio_get_value()
Message-ID: <ZvwMKrQ9IXuozQtj@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-2-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-2-fca0149dfc47@analog.com>

On Tue, Oct 01, 2024 at 03:41:33PM +0200, Nuno Sa wrote:
> The adp5589 seems to have the same behavior as similar devices as
> explained in
> 
> commit 910a9f5636f5 ("Input: adp5588-keys - get value from data out when
> dir is out").
> 
> Basically, when the gpio is set as output we need to get the value from
> ADP5589_GPO_DATA_OUT_A register instead of ADP5589_GPI_STATUS_A.
> 
> Fixes: 9d2e173644bb ("Input: ADP5589 - new driver for I2C Keypad Decoder and I/O Expander")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied and tagged for stable.

Thanks.

-- 
Dmitry

