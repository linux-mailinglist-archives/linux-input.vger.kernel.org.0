Return-Path: <linux-input+bounces-15107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B1BA09CD
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 18:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2016562F10
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 16:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A582E6CA6;
	Thu, 25 Sep 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L79bGj+X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC114195FE8
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758817850; cv=none; b=tOTKFCSoSDbRu+7383tLvm71x0BF+Aqw6D/PeNdhbCop+HP5mUgmKT9nwVQZw82RMxKuFy0hx5MBxY7haRdi4airVMrdXjfltV0K0flwQw4Hzb9jmilNg70JqQn4ms0s4z+z/VhJxeHckkY+xN79SOj+EQ6LRqJZLuj4MfIE+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758817850; c=relaxed/simple;
	bh=mmBbQRhSrowNNgofbJRJowA2cWkVg/LcdRFgea4xmCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpakswrA9uCURot5mgaXrFVCUnjxaB0I3GBhnR8uvytMMfhDLkOjCnTAXuK8cMZnsOCmYZVrMpI8vtNo4Dp+0A7/CsAMqqszJ12EOXJtrZ2+SPy5hJzbCk27T3cOy18p8UxD8AmyFHBdE/ma0z5uwFZnxBuWLc3CZv8MLW1Wz8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L79bGj+X; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso1265183a91.0
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817848; x=1759422648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0PN6ICUXKIfVACARWgyW/Of0PgwLtWEh+IphdJWk4Wo=;
        b=L79bGj+XD6xetVWTFBQDRtuX2iun1qgBUjMt7GeDCleUZBalls79lr4letmGYDJxik
         ZBjuZ+0JDD4SYQsx77AfYRw1B7bdKlWDThAJmkH8q/r+rR36OJFOY5oDX+58IEjpo0UJ
         7td78L8d+gc2poYPqhq0x5JqrQ4KjdtmeCdZwwGDAiM8rQk6ab0AXzQmZy+fyfuZq8E8
         +kDjlN8IHCq3zX1+WdZzzhenVNerf4DUasXPrrnLIdTYc9dFKnIwBZrx6HoWzdkyH5F2
         k/G2GK6/olzC3AcMmwRIGukbj1LYOzEB/2vi0UK5qGw6j3dPF6OmnGvNJAmh7LHjyjEP
         EN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817848; x=1759422648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PN6ICUXKIfVACARWgyW/Of0PgwLtWEh+IphdJWk4Wo=;
        b=GFxhpEwWwQtmv47Xc/OwS36Idg1d5sT7FDutEFyTtWL2BBsC+KPNv3R89VFQyFXBEs
         reLMbMxlmYhgrHScVj7fWA2xi7AXHkpsGs+za7roNbijlACB3KJVIneD36N33YmvmRpC
         mjCXBP1sBswuSNNHVCPDd0TIvE+iHfuaUN3+NdVMGDrptZ7LvxeJKlV+GqgaSG/qD1TB
         NocwqIldH9NzyAljV+jp0kdF4uzabOTqhpHiweeziD5Y76SnoGxlAd2GBVkT0I9tB5vS
         bLsulNo83An47CL15YxT3sw2sG5Ew5G0vrV81lVQVFyV+r1ef0ZTgqSV5wl7aB8E+iXf
         KJgg==
X-Forwarded-Encrypted: i=1; AJvYcCWY50A4s9Zu8nZKXHGYqmVXptdFp/JaqVkU9T6cvffByx0+Upeyr4NSIlp23U/efI/BrqOWcg8LLTM8OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71zZlk85PVSWQQuaLf85eXETirdXRSewyPtdM0CO87YTzykFH
	WXvNh5Cau0/mV4/bcYMlL7otRVyFZZ6s4wUeB4DEmXfPq4x15jwx0p+I
X-Gm-Gg: ASbGncsvEjdYpPfOHz4xNsuo8ettpjNZ1ycfuR+zr7a+JIp73MRJsh+vih4aEtu4nhE
	HxAB5o1mC9TS2gDqrK2VvlzTxk7JS2wRphJegdarAYYTKzvvfY26Xp7bJ6KVBjGeK5GXr6tnr6q
	dhUk/IAzEduwIaRRKLJFsv1HhVMi/rwZGrilEafW7vFuArCMAeQsKt0g94Be3X0dzwEz6ScLJ45
	Kpf5jtokyAfPqNz467Kgyjal9bkaI+uBiXGxo9ZSq7ZBzyZ2JCsQjrdN8Gi0+CrqGASaSQF1LH4
	MFpeynL5MBbt61kUnsbXLc2lepfUr/Z4y6cvDtvA1/C4fPQubcaGMwrfxDBmz/5miFdiP+NTh0/
	c4mSIjAHLWDHh36pk6y+e8Nhv0rXCTOus
X-Google-Smtp-Source: AGHT+IEU5RoY11d9SqTfLbjzgFHL6Oy0TOlSWFxR+z/E3squ+5c+PTL718x89e6XI7MIr1SDPFt01A==
X-Received: by 2002:a17:90b:1e4b:b0:32e:2059:ee5a with SMTP id 98e67ed59e1d1-3342a216f68mr4495137a91.8.1758817847812;
        Thu, 25 Sep 2025 09:30:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be235c4sm6272005a91.23.2025.09.25.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:30:47 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:30:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] input: touchscreen: atmel_mxt_ts: add support for
 generic touchscreen configurations
Message-ID: <yxfb7ybiewm22onuw5x2usmhuy5mlijbkvmwhjuimfjn3i6mx2@nyjvqo2omqp5>
References: <20250909054903.11519-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909054903.11519-1-clamor95@gmail.com>

On Tue, Sep 09, 2025 at 08:49:01AM +0300, Svyatoslav Ryhel wrote:
> This provides support for generic touchscreen configuration options like
> swapped-x-y, min-x, min-y, size-x, size-y, etc.
> 
> ---
> Changes in v2:
> - added schema adjustment

Applied the lot, thank you.

-- 
Dmitry

