Return-Path: <linux-input+bounces-3959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A588D4163
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60086B24BB1
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 22:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74CF169AC6;
	Wed, 29 May 2024 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eaJtAY+6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F115B0E6
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021799; cv=none; b=QCks/TCD2G1UwbVOKKXHRCitwd4BZL+JGT+ZqjF2kMAyHmBIrBNB3pt06xByKpemiXMBHA5aQYNJkhv4LG61hk30Gg1qAjPbqXrap4jtDL03Vq0m76eVuoQsgOOUq5rS159EMW4ZwvozofmbVzOtigKhltwSXF89anuhX2NvKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021799; c=relaxed/simple;
	bh=w6Aqz2bEHuk9R889ddyUfQ19wWGfWY4dTSA5GKs6/gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED3vpobvhw0WG8T8fKmqoGsKWpg8KARMLPsRaQjBjWoz/jL1Da7unc0keE1Ocx4TeICgVFCHsZmAP5dWwGeN9HbpArcqdZn16aGkGOA6JT7zedKXkY8FKk/xfXCKaSnbOYTALuoCsFAbZAnYeeluE0TkrPPa1jkiZfesGjRYpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eaJtAY+6; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b97539a4a5so115713eaf.2
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 15:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717021797; x=1717626597; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiRdkIgrD75nPeZiYp+93tMmZ6LpKtb0W5ngCgkg0JY=;
        b=eaJtAY+6uVSCUSCuO2DDmlNvXLHJRilqpnkBCcCWH9sZnH+ZMTijEP3+PrzjhBpSgy
         iKERreP8tlo6/cjvU/czF6fbhmc1i656qUOfx9Syam4JOkmvXIAHYjdWn74S4nGvBGL9
         yTKpCTPMPRsjKUInIXoWvv3eARES8YJ3/cfzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021797; x=1717626597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiRdkIgrD75nPeZiYp+93tMmZ6LpKtb0W5ngCgkg0JY=;
        b=Qlrj40QzvV3yrWD0oilIi1EesUykf8GxRuCHUftm0uNmRcwyyQ1ePmOhkSEEXYaf31
         9BS/wlaeDjDbCGZCmn7H3vNkd5bsSM5myaqebGo5m/Xw1uQMh0NNfRkLEf+m7eJBXuxA
         lK7Vwlo1zBL7sOqRmIygjJP+esiNVMSpUkzn89GjH9IJv+M8Vuv73U5hOXu1xG3OYCJ2
         IdTyWkpjqiMaIqhcZsq+0AOBXqHTxIj6cbgz/8PMG3qZi8P2GkhvyIRVtJiAVgwOMSQ/
         qYGpiowUXAUQFcOrgr0TH2m23ki2nwrRNPFyY91rOUNqDTWHkMByt7mtJ4T+vSvIW6iW
         mfmA==
X-Gm-Message-State: AOJu0YxGZLVEYvclDeDdWTvUr2iDHec2hmRKI/xxUUo6RoiU1oC1n2LQ
	RQIIJCfsPPFzOiGlk66zp0QvS1tO1FUbOknhsnNWDDf9H7QBimjuln+Ms4AkfA==
X-Google-Smtp-Source: AGHT+IEUxf3CsSZcimJ5ePWcyGA3q+IhAL2eFA/LzZ7Tdqqxj2u8d3DqO2331R/TPVJXce5hwm+lXg==
X-Received: by 2002:a05:6820:1b90:b0:5b2:565b:b6de with SMTP id 006d021491bc7-5b9ec5bcee2mr499926eaf.3.1717021796965;
        Wed, 29 May 2024 15:29:56 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b96c4d4043sm2890404eaf.22.2024.05.29.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:29:56 -0700 (PDT)
Date: Wed, 29 May 2024 17:29:54 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jon Moeller <jon@moeller.io>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Adding quirks for 2024 HP Spectre x360 touchpads
Message-ID: <ZlesYsrZ0_y7B1vS@google.com>
References: <20240429070950.247183-1-jon@moeller.io>
 <CABWf9sbtpJMCPrHRu1jtL7d_ozPmyXO11QedXuTww3nAyzP0vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABWf9sbtpJMCPrHRu1jtL7d_ozPmyXO11QedXuTww3nAyzP0vA@mail.gmail.com>

On Tue, May 28, 2024 at 11:21:10AM -0700, Jon Moeller wrote:
> Is there anything special I need to do to get this merged? I was
> hoping this would get worked into 6.10.

I think at a minimum, you need to include some description as to what
problem your patch is trying to solve as part of your commit.
Additionally, you probably want to find the relevant maintainers for the
files that you are modifying and add them to the "To:" field.  This
information can be found in the MAINTAINERS file, or you may use the
`get_maintainer.pl` script. It's possible that they may have missed it,
or perhaps are just busy.

https://docs.kernel.org/process/submitting-patches.html may also be of
some help navigating through the submission process.

--
Aseda Aboagye

> On Mon, Apr 29, 2024 at 12:09 AM Jon Moeller <jon@moeller.io> wrote:
> >
> > ---
> >  drivers/hid/hid-multitouch.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >

