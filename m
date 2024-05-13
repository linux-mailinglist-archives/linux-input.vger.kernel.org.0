Return-Path: <linux-input+bounces-3699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851A8C49C4
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 00:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06025282C85
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 22:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACA084D3E;
	Mon, 13 May 2024 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw7d1Bdu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674E53E30
	for <linux-input@vger.kernel.org>; Mon, 13 May 2024 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715640813; cv=none; b=HTVawC0IkV+PlrJnOGVS2ugAeIcmg5LVhbrNGwAavNW8tk0uclfcHyVG9JDg+8sqB0Jp/EuUXXHwwqSNiYkbXOZ/LxrNXWg/77fabQ0dwPuCwgEdBAk5VwfbXUNJCTuk/rkBoNOi+chiw5jjxy1AHk3itVWYJvkbbsUmtatnYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715640813; c=relaxed/simple;
	bh=UaeIValdHfp6KCenFcrUUpTsYhya9Yyltm2YX2Lupxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doVCIAcIBrNaYGKJzOt+4RkYnWX94vpzput+iSa7sWC256bT7XeUeN2AOSo0DGbU16WqGnsnOMDcu8IXHyaVsmc/wq0FJ1725M6mfS481yZ9rzlDPXMruTuYtZc2iPgCAvjGzp2+MU9whl7pLx/LEjrbLO/S66JRiRhIxiy5X54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw7d1Bdu; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6114c9b4d83so43896947b3.3
        for <linux-input@vger.kernel.org>; Mon, 13 May 2024 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715640811; x=1716245611; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTD+56+GV1P4r64zY9H6r0MKrTADiblrUwZZQLL/jjU=;
        b=dw7d1BdutcKTfD70z+hxMs4DeD/7d+f5em/8JzsRN0u+TBpuc4eSSTGCPU77v7jrEi
         cd+kRUVznOVYi34wTzYoG0JlhHdlxYV6m75MQil8fWmpdN1Rg36uebvR72kla3PfjT/I
         i0BRVkMuJvtm+qUvOE3VkCzkw1VfarC/YRdjumQtxlq8br6nBbSu9ZYzrrCIjd0yvtP8
         7nSIe1MeH5p8yU4znVRG2D55rVSXV56hXKeh+gcc6olOQqQsjc6Uhxu+y9yIEO0e1Hcq
         AOSRMEOLEiQ1OtKo8cISC44EvBNuIAcGs3s6TorQfZF3QoudmjJh3lhDAfq7ewcBSHs+
         9eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715640811; x=1716245611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTD+56+GV1P4r64zY9H6r0MKrTADiblrUwZZQLL/jjU=;
        b=vAqYjekHJys+4HtZa36KBYim+8glhg9t9levxEynvD828mC34mO0rrO2dRLRQu0wRi
         k6Ho7AZMCGn/rhqiqCBJ++9aAPUc/tVMHajI8tqjEJsD8m4yvshCGdbu1uV/hOehWAvD
         o5tXgqUaL/94OsSxPTmIrJjjjcrcI6JIzkhAQhns8WcszGZaVJCsClj6AdwI0Mobjwvm
         iG/6Mk9HzaTAzQisDzC3fCBpVkER861Srg3Ym1pORVT89ar0qG2bL6iwcIeQIk3YVw9U
         PX8naRz8XtB53gn/sUcaRt+x36Bk2P3NMQj/056QXf7u3v+u/YyEK2nRtKAEi1b60S/m
         OBwQ==
X-Gm-Message-State: AOJu0Yy5ailB+OgU8A2FG90KUSjEtPYGOMkkFKHlBEx72PaDo6RF+++b
	QkniLJksS8L9VfJtw45a4rS32swFQZPsU0S2xpY3PSobyt+PXf+g
X-Google-Smtp-Source: AGHT+IFuAaOdPHENaX6sVpSlSfxkL/lxipjXeSvQxk6mMNejmS56eBg1zQT424pHegtvsrqiR/Y/Mg==
X-Received: by 2002:a81:ac23:0:b0:61b:3348:34c0 with SMTP id 00721157ae682-622b016d1a7mr94290047b3.50.1715640810691;
        Mon, 13 May 2024 15:53:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e2347d2sm23314077b3.12.2024.05.13.15.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 15:53:30 -0700 (PDT)
Date: Mon, 13 May 2024 15:53:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input - Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZkKZ50fQGdr8Opv0@google.com>
References: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509174158.2211071-2-u.kleine-koenig@pengutronix.de>

On Thu, May 09, 2024 at 07:41:59PM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> While add it, also remove commas after the sentinel entries.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry

