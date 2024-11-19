Return-Path: <linux-input+bounces-8143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFA9D1EDB
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 04:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE9D282356
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294ED14265F;
	Tue, 19 Nov 2024 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/or/w+F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28BE2CAB;
	Tue, 19 Nov 2024 03:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731987337; cv=none; b=BiZMhZBr4ITG1/tMrrN6sDIzeMs39vvb3c2nK6UYN8yU3bUmuFLQWcHhBV5QKCFSQhzWJJhlgWmBm1L2etWOIn0rrWAawcbZ/nw6YUAYBwoIe/sZ2FBFwZcYp+3FUpJ3uqo8v9nIgLUyq4CiFLVSEjgF5RxTT6J66rybUgI1K9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731987337; c=relaxed/simple;
	bh=yMdgjpWa/uNZ3ldUiUE8ibXpM6RRA1oPWRCdLCYab9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRexobmFsV0613EBY8UhBzg0P1+TjsGeM20w9LwAttE5n0JPf8vCsb0OyvxPRVxatVG452mz26mIwJractzk9wpoUlbieXKjNIF3bMbTPunOyUUr/rFwToxPx7G5HI0MmC+iZSFHU/L9GUNZE12CxhhNDFzaNyC7vI11MeTk+Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/or/w+F; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cdbe608b3so48603155ad.1;
        Mon, 18 Nov 2024 19:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731987335; x=1732592135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRdspri6WC09Szb6BqPAf0mcwTL7p9PzdKttkU4B4pQ=;
        b=h/or/w+FkNctBbtYRF5KYD/nJ6CKFPwfc31lgMx6DhW4UOZK7qgcdobHM5HmwxHANx
         QN5LzOH6VZXnHEB+4z+nNAi8F7fX7lt5xVNT/kmm8hr6DLGiOU+RZacwhVngVUSfktCn
         pw7MH+R7rQKrSRZdzunUy3BWzn1WVpxsOXsz21SKGyzG/HvvXzdI10q1UWG2dDxYrlDK
         fXhXgABsd9De5vUwJGReIKCES/9acXdnhek2Xvml+az72x/+pNhQdcGhDS6EKfy5nv1q
         RLOHbrBG8uU8UqpbgpnbCAjFVcbE473qCy0Idxr+pAjFLTscl6xUruRYOmSaFxZQz4rI
         3d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731987335; x=1732592135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRdspri6WC09Szb6BqPAf0mcwTL7p9PzdKttkU4B4pQ=;
        b=sT1/MSo3seAJhkxl0jtVemLTn2XILt4cudcq78m0SKbXDtDItviAPo8Kux3Y08QYpy
         nxHPrVjbhqL/UJ/QsHnQ7sObGqhRC8ZHFg6Jn6FEj71cZrxYUp0TVZd8cFf5CTr42kw+
         PJYWs4CW+PmYlgQ51H5I+umrICXmO62VRO9/ggjkV+UFaxdwWeICMAwCMRNO8EB+lcGL
         39V27Mtx1VJQMm3hoYKY+jndhBKWuzI9zHDz7Y6oVn1z9B+vrHXlh0lQk49IgsLUdlTa
         sEpl5uaDKTUwnZq+ovrNPoa5ov/tuQn/1fprxrOcsAmi5fQaU62azCh2tRDq/KWVwTDN
         rZqw==
X-Forwarded-Encrypted: i=1; AJvYcCVHksOWdFFwgS/qh+Wszcbby3l0iWB25GZs97sH3Ut0HMTGcQhLMq9Cr9cwsLJMcecvm0+zpaSgPbVexsk=@vger.kernel.org, AJvYcCVruL0GOuodFb4xRAv6LJptW3hZm1aI/VPfi5no/ZYbbk3ZgDclxy+glaq9/qAFxK8LOr+DmsSmQm70fTpA@vger.kernel.org, AJvYcCWoaJnQCntwExI0QKxT4eUVl+sXEFSwCdG9jzLj0Rvl/lMrFi412fNkokvJXWgvu0fafrVnNXJIKLn+CxHdBlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziytu4paCNt0/gTtI4Sc557ielSvddDWt2/IFG9I5jvs+liEWH
	DzOE5GbbIkxKaMBXR141PNx3Ip4kGusaz4gacvwlwBxstvJ5BHcI
X-Google-Smtp-Source: AGHT+IHLNfB8EgtJ05UOIBcVDWvknvO4vYdOOsW5Y7Gj4yEdEjOSf9b/6uebLnSewf2oqalNRmLVVQ==
X-Received: by 2002:a17:903:2d2:b0:212:13e5:3ba1 with SMTP id d9443c01a7336-21213e54277mr112969095ad.36.1731987334807;
        Mon, 18 Nov 2024 19:35:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:38b7:c100:6f21:312d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212027071bdsm37934415ad.283.2024.11.18.19.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:35:34 -0800 (PST)
Date: Mon, 18 Nov 2024 19:35:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cypress-sf - Constify struct i2c_device_id
Message-ID: <ZzwHg2nCqUsxMwqg@google.com>
References: <4bc3e3b4d10223d9df850fe4ba48f1cefd197082.1731689418.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bc3e3b4d10223d9df850fe4ba48f1cefd197082.1731689418.git.christophe.jaillet@wanadoo.fr>

On Fri, Nov 15, 2024 at 05:50:37PM +0100, Christophe JAILLET wrote:
> 'struct i2c_device_id' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    6438	    618	      0	   7056	   1b90	drivers/input/keyboard/cypress-sf.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    6502	    554	      0	   7056	   1b90	drivers/input/keyboard/cypress-sf.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry

