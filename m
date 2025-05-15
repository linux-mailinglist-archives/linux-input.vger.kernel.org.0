Return-Path: <linux-input+bounces-12382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5F4AB8F86
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 20:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25786500ED3
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 18:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A8328B41E;
	Thu, 15 May 2025 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8dRLSFb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5328540F;
	Thu, 15 May 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335483; cv=none; b=dGYKbq4b9Uet5Qj1ljkk+3zpocHwSHFEQjcXOC0aYkZs9n0bC0Uf1HNZCsu/ah10zqlcHk/XuG79AzH7tUv0Zcj5EC75Fxaw/VOTU2UWA97g3sIXRVAnTlieyLxINVhti2uNbdBd4PILB06GyymSZqUJFd72IijqdnJoyvGiLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335483; c=relaxed/simple;
	bh=558xP4g9pXqmLej/gQCalGaNa6pvPIbpvQ9uxVsh7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWFWYIceBAxaZRYiVjg1esf2ScqVN0cYpfsnwdcJvvLQs9uUeJ4mjSPmmiskHvhgDKgEVU64l0JhzwwJDq+lki5Wj/yDu7dlCdFMJeNVRIQO4ah7V6szvUV/UVTQm2+JD5owX8N3dJf8E8iHjnxAvUaFAM75Gmd7+ewnY+Yqto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8dRLSFb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74267c68c11so1376407b3a.0;
        Thu, 15 May 2025 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335482; x=1747940282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDN2wlRjPyxYrHXZaZwhbasSn4JXBsTkANhY1lWf6EQ=;
        b=O8dRLSFbOP9HGJqKdXGayWPFGzXE1qNRfeYGN3jzQB0bm+6gc+QjTlsLL6ahm+Rfyd
         cbtEima+YXUeyWEAidAYFbm9jem1f3npgYkCpqTmVUQiQkbh197gQBNxiuhoY45maX/E
         rLvXYB2ENVBZvXx/2XtthX0yl65o8tjN2fDwHHJInSx3rAjvtAExBcKp8CaEtRtncRwT
         Qx2K/0UAICupwYaqVfDutzzIE5+yYV1/pHPUuvQ0lLuBrjvahZM+yVrasdfLyO3I/ipu
         dxhIN8OFzvHymGF23CBXP3vljisTI+bstlNj68f0vQHfYHJaTJwYzDxexSFsj3OFY5nS
         abVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335482; x=1747940282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDN2wlRjPyxYrHXZaZwhbasSn4JXBsTkANhY1lWf6EQ=;
        b=Ib23y33VxG2YMCFR9l56Grh2/OBSHsckg45Xysf7A/TZZ4wA5XLg0/XAg4hNFjsVaE
         eFKqhuOfP3OLQKD/UxISznq9zujRimQ1Tc/dEwSeN5YgP23hxopht0HQUdcYdczBHStC
         KTAdJZvdb/VLNG2WHXxByKySF3aDjTZRATwuSAvlk/3uzIxV4Zsb29ISDblusyN9ao44
         qSgG8uRAZNYwr6mjXJztNzEk3V5KavEBBSuQQ2fYpez7QqQ/DhidBDtP1P648cXjUjLH
         xVFNYXP3lhZtl1iltXuUWux79KXajXY3y9v6bCXE2hAyck1wlx0dmlry8m5MiBxE8xDV
         zszQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvzlGqiyVuEEbAHhrTQyc3rm/c20BPWJnk1yhGoy0vIjenCgQI9Xza+J59tixxXJeiKYNo8P/BWJn1Lw==@vger.kernel.org, AJvYcCW54ViEZTv6+xtO4ORXeLJ9fEHqWbUeVjpnGexvj/LSwVoOexrbqAPkdn32P2ICfuPslwK4h8j8qK4ypLcp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9lDf0f9O7frLiEXzPr+nXsRbXjbLLUqCFJYZocgaFe+Kpdm2
	u5GSqiJeDFvcFR4uszOLhANdQHqHKQAfiM4lqWfgPqf+NIXkp8hR4e7r
X-Gm-Gg: ASbGncsQQv241uoKscpd7mTZ+jU910xnGWeOp2diy2rgJpA9qMOImstJalTybOddx7P
	zzUluZLC2OElBdEUujLqAHxjITc87XdVT8gZjoYpmyiELzGrZIoSXAQ0lXcSy4sCNwQDQy1vT30
	zAyb9Bp4P22tfKBJcbdOImorFA10QfG6zkQ6c3QnihCZqLCVWxpr2ezmJlDSnj/IlxOSxUss3uu
	HMsaMbb5hToC0nw0F8vcPFJLYNKCThzSNSdcXlfJ1pWoQ44yhKsc8f/xSk7ZuklS5/V0lwShxZt
	4P+wZLfyDS5f3nnOiBskYBGv73mIIPhcrlBPwd1FBt60ZkJL2F8=
X-Google-Smtp-Source: AGHT+IEdonouJ3HWWVNx2T+7l3WuFC+ev1xScAzwBT9M6+mWX4A9pt1Lo8ASxTDzzrXNmrt6ARFFtw==
X-Received: by 2002:aa7:9ddd:0:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-742a978714fmr510846b3a.1.1747335481583;
        Thu, 15 May 2025 11:58:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4a64:9a04:f793:540])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739a12sm149552b3a.77.2025.05.15.11.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:58:01 -0700 (PDT)
Date: Thu, 15 May 2025 11:57:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lihua - <lihua@huaqin.corp-partner.google.com>, hdegoede@redhat.com, 
	javier.carrasco.cruz@gmail.com, zack.rusin@broadcom.com, namcao@linutronix.de, 
	tglx@linutronix.de, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Message-ID: <44fclxle3b7hfo44ec3vlwlth3uamceaqght3ecu3lmz4eltfz@e57uk7jw3hky>
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
 <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
 <aCG2Rx_99mP6JFi-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCG2Rx_99mP6JFi-@smile.fi.intel.com>

On Mon, May 12, 2025 at 11:50:15AM +0300, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 03:57:17PM +0800, lihua - wrote:
> 
> First of all, do not top-post!
> 
> > Hello, All linux team members:
> >       Could you please review this modification as soon as possible?
> 
> You even haven't waited for a full week...
> 
> If it's an (important) fix, made it look so (Fixes: tag, Cc: stable@, etc).

I can see that missing input_sync() might hurt, but the patch
description makes no sense. The driver does not really differentiate
between long and sort press.

Please provide a better explanation how missing sync interferes with
your use case.

Thanks.

-- 
Dmitry

