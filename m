Return-Path: <linux-input+bounces-4790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C489F91EB36
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 00:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38BDFB21881
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E3916FF41;
	Mon,  1 Jul 2024 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/cOvxaL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7386131
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874643; cv=none; b=mZkHLVJcqunLb1xvcd7Ph4qUVmHA+QQowv4+om+S2gJJzJaqwA4nojP7YTxAkZS8LNPqVCMj3MGCsFbch6aOBqx2LwCoHl0QZm6XvG1MVSIBODEiywd42Sx+cv8tuXL2FxauVjXtiVANW6T2g11NTWdF3GgfLo2q/15MGkZSmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874643; c=relaxed/simple;
	bh=4c40P24mCw5N20d3gV2sgcyVrf672RYBDZcW3sU6M7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdIfKoMyBm2A5nDKkd+C+bLa1Kf6dRUDeSMUFJK1kKHwXfLF6L5krZLGLPI7feMtfzuQRmyuOqDnoqoiKRgRPHI8JdgHfAFFwVqyLMv1OE1Io0OqfyD0+rJnn+5LQGx7NThfi23xHk6PASHCdHToZYwG4jc/OgjwyBqewUJcpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/cOvxaL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fa3bdd91c1so27200875ad.2
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2024 15:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719874641; x=1720479441; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=08Vd8wnH1E3CRq8a3QFzqTJWw9ScTVlcwF8N/hDI/hs=;
        b=d/cOvxaLMu0bjW9SP++nl13SNw2xp5Qns3VpVfqei8F9ZIL2ySSgCcnXyEmD+s14cu
         ktNjbRAhWNfWehUStYTftIsWFiB2a/U5EZS8aOTJ1IYwYOhwcTvxurCdQVwgZ4MJSzBd
         hHWv1d6wB8g3xSyxNH0qBvAbXE3qvHFcBBJgoDfdUGI/fULFw6/7pMVc3LjU/7IBMMga
         h5CYYYL/UVQYCGDkISiX1LBVRJg49LxOqclNAlRh5Dz0WFiGMUUZYlt10mdeR2k0OIcp
         OMlX20hzXcW9xSC6BnH3dxC97O8jXgIxuBCmZD/jyb7XpBKKOA1mFI3WwhFCxYd4R4Oc
         0r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874641; x=1720479441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08Vd8wnH1E3CRq8a3QFzqTJWw9ScTVlcwF8N/hDI/hs=;
        b=S2kQZAJ9601bb1mm0OQ1DJFaY0O/HvFTCCF4TJz21Cp8y1NOU/+pnm0g+2ypZLXVtV
         cj86SSPkvf0legiPffnSYa27o+qJfLaK8V7+BCIUzw0WZ8ooDmMNNIIT3VhIl+bEdYpJ
         C7M2IwZUurdQoF3UM3svjYc402Vap+1E+yyKOmeGj4RAeb4EPHc+GMYjsP1bEJcQF47e
         j3ZiDxNO6idcHGTvSYxdRWUxZzvBHv/lriaG7d/3eNT3m6w90kS0Ylx99YNoARJn6Hwq
         1INILlhZrbTs4Gmi030pq5EzTz8YCgYS699Vz7uxzmf2wR7jzdTOlD8vD5RucUTDrjIo
         eZMg==
X-Gm-Message-State: AOJu0YzuckLFX10OSkLVkLN9gLG9q/M0JC1OTmuRX723nEvu/iF+WlcV
	iOnMxAqXuwum/5q/prKOIlv0lURWLj6zFYHNqdrad2jAb7Cf3/F0HR0xqw==
X-Google-Smtp-Source: AGHT+IH8FlelJcE3japC85uwJlkPjLkQL1ijwFLIEJxRP38Cy1Q7rRBq+1R1QOO3fyNj9bhRROpI6Q==
X-Received: by 2002:a17:903:186:b0:1f9:d10d:1804 with SMTP id d9443c01a7336-1fadbce69ebmr54376105ad.46.1719874641307;
        Mon, 01 Jul 2024 15:57:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:97a3:bdcc:1a3b:f207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15966b1sm70411395ad.262.2024.07.01.15.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 15:57:20 -0700 (PDT)
Date: Mon, 1 Jul 2024 15:57:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input - Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZoM0Ttysx91ZemKS@google.com>
References: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>
 <ZkKZ50fQGdr8Opv0@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkKZ50fQGdr8Opv0@google.com>

On Mon, May 13, 2024 at 03:53:27PM -0700, Dmitry Torokhov wrote:
> On Thu, May 09, 2024 at 07:41:59PM +0200, Uwe Kleine-König wrote:
> > These drivers don't use the driver_data member of struct i2c_device_id,
> > so don't explicitly initialize this member.
> > 
> > This prepares putting driver_data in an anonymous union which requires
> > either no initialization or named designators. But it's also a nice
> > cleanup on its own.
> > 
> > While add it, also remove commas after the sentinel entries.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Applied, thank you.

Uwe, could you share the end goal here? It looks like there are couple
of efforts to deal with driver matching data, for example I had this
proposal (which I did not pursue further so far):

https://lore.kernel.org/all/20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com/

I think it would be good for all of use to be on the same page.

Thanks.

-- 
Dmitry

