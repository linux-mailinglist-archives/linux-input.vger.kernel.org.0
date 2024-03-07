Return-Path: <linux-input+bounces-2277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4828755DD
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 19:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B642850D3
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 18:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99317130E3B;
	Thu,  7 Mar 2024 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eh2cmdif"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8121EB41
	for <linux-input@vger.kernel.org>; Thu,  7 Mar 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709835166; cv=none; b=sOKBMyFGqHax3+vfyKXlNN2/SW5KL25gjm+Yhxgib5XX1P2MP8avAwELl5+u3R/v0dWIi5lgIM1KtNF80CVKbsTslGP5JxkZORVqCpCfdI9J+G+cITQ2obZzIMTDBtrWr6zZqxEb+2N7eAeALDcrI2RSiJfIFQfehDdKP5iiUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709835166; c=relaxed/simple;
	bh=bryTofVlOSRbddTG0ZDw9AixzFG7kTc2vxIZuxanF+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blnx8jhwnjZ7vslOQuSyWZszALb4vjXoLeYyWAqVswf7Xt9Qil4lI/wOwXdRhOejKRE9dOoyFLcyGTmkgkt2k5B2RzvDBL5b72x8wM0XpQDYzmSTYGZz2Gx8oJ1TiP1fKvtOq645piyjoC7xhiGsdrOdRDH5P1cJ8/QY4/cFZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eh2cmdif; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd1d9daf02so7839445ad.1
        for <linux-input@vger.kernel.org>; Thu, 07 Mar 2024 10:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709835164; x=1710439964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sfbk86DJZs6rbIUb9E8woRSsQHvOD+wUIaEhO8cbGTo=;
        b=Eh2cmdifkTnpZ3Qmk5h+/2h20iiwSKt67j5PaZFKoLUfUjE2zWTGjOd7K26WAmhtiy
         AM4yIUwtzZztbjoWqEk8Jqd6ni0kQL+KknzTpsdMw5NhVDwkIihc9zcDZcPApPe6HdgR
         2cwDZWib5v1Gaq/knWvmWKy4TuLSkXBR9R4C8StEZwcLBO8UMr3o/3bLoe1vZETSMSGQ
         VnrTzAVSIzDtoXCKBhQQvmljgnPlPeyKxJTRz7nAyEO6g/thJpuc7eRzqQBE+Q+nqSTV
         RCCdg8STQne85yrIivxKX2NVkr64Kk0CBeFMwg1OKb07X8JU8W/wal7ZRayQlQLv7gh1
         pEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709835164; x=1710439964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sfbk86DJZs6rbIUb9E8woRSsQHvOD+wUIaEhO8cbGTo=;
        b=H8HjlTj/SZgYOHIvFyCeyfFOdUVImK6Tsrg8tPt57D3t6PKI+Lj7rL4sUTON7qxX9D
         HEGGWAIv33+ifyBm+b0RL+QZ2NxORp7o2fb9BXoTtOzAmV65ZxXZSf+ZsJa6A6X/CBXy
         2NjiPnjz4VXiomDmWaI45Q0VLVbDdTTbGM7qTsStS88jZYug1Ams7AIx04NNYWr9PUEn
         HuETwswpThV5sccCBY4D+a1agvspzny78bRn1/ZRP5pNj30rnG4woe5jJYrpiH4Eqg09
         kxjwPMVzTiqwATFejkDxVYtS1k6vQKCioGuIsc/keWTappctGvrHnoxo/BU+Zjkg8369
         neNg==
X-Gm-Message-State: AOJu0YxNdsYikW1hoUbm0F3nYn9WxSyotZzulJU9D+MYfePLJmwa5sf8
	hxj5GrqQiLZ64xmQyJ1IhaJbkNP5XoZT+HXamiIl2714UmLRbmiU
X-Google-Smtp-Source: AGHT+IHSrvqMwSGLlbxbft2rRrKnn76xNKcqmSSbLxAKeU3Dqd5IU1b4HkAVqxgbAAWsolXJgoWibg==
X-Received: by 2002:a17:903:290:b0:1dd:5ba0:e0ee with SMTP id j16-20020a170903029000b001dd5ba0e0eemr2076799plr.9.1709835164281;
        Thu, 07 Mar 2024 10:12:44 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:7cdb:7132:a03e:7749])
        by smtp.gmail.com with ESMTPSA id mj16-20020a1709032b9000b001db519cb710sm14945923plb.246.2024.03.07.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:12:43 -0800 (PST)
Date: Thu, 7 Mar 2024 10:12:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [RESEND] Input: iqs7222 - add support for IQS7222D v1.1 and v1.2
Message-ID: <ZeoDmdhMINvAZ2hF@google.com>
References: <ZelTRYX3fenMQuhF@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZelTRYX3fenMQuhF@nixie71>

On Wed, Mar 06, 2024 at 11:40:21PM -0600, Jeff LaBundy wrote:
> The vendor has introduced two new revisions with slightly different
> memory maps; update the driver to support them.
> 
> Fixes: dd24e202ac72 ("Input: iqs7222 - add support for Azoteq IQS7222D")

I am not totally convinced that this "fixes" tag is appropriate here,
but I kept it and applied the patch.

Thanks.

-- 
Dmitry

