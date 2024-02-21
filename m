Return-Path: <linux-input+bounces-1993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3885D10B
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 08:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3198284722
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 07:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4C3A8E6;
	Wed, 21 Feb 2024 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/IR4sne"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246753A29C
	for <linux-input@vger.kernel.org>; Wed, 21 Feb 2024 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499727; cv=none; b=jn/mHAHOiY+MNzXnxOsjkb3yj5TKiKGZ6KjySyYqyNk8m0Ds79fso7ggb1zxyWWL48duW0bdYg2MKR1DgDLQn/ILlwRAbMWPEPN2ab0JsO2hSek2W4xFekQ03n7ps5SO1EXoVHGHUbfEpJbHixNxEiS/WwPoBfd912eBng8IAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499727; c=relaxed/simple;
	bh=CR57nxKevFV1Pkcw4gPEHlKyDmQSwEscZlaoW8jHA9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBQtkMR+wUu9eHtiu0S8MqDP9YykcotZ83jJ7MlVldfMs3e0yXMmGY8Z0sRpcmreZ+t3kRxAeyhRfXmduaHLd3O2ozTZiyzo3uw8kXcBZFqT7BKSvBQT/ySeevHx9mGCSJPdCEKpng2zViNQO8APPoCDVdpNoyTAr5lC9D9aBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/IR4sne; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so307972166b.1
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 23:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499724; x=1709104524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1w19D2KRTBhE9sNv9CvxGY/wxWs4ln5YBmorr83nBw=;
        b=F/IR4sneTOy4FOkCah367nm3sgJhT/oxo0Y738EBjuYwUAnzCd/Ne/lFOIhvSTLCey
         qZ80tRVImKmNvbHcN4Vt3H14hC96yzfBVC48H5Y8Vqn3VZVtdxuiIMG3DYRqUSvuLhQF
         eYPPipxnfFxLu/rS9QlkRm27ew/4PsLl6sCe+r7imMztOQWF02/CvUec5/c6GHj8Ei6S
         Bv5gT4e0ochNZn8dgmSyu+0szqHJaMdPhfrGC0hpfzDyy73fYGwF1qJCoOWtlXZSfdUp
         hDRyq32jFZOnPR6Y5lF+WBdim9Vh0fkhOXJxUJ8atdxHkSNjb9QWdZ2CeZ3U3aKTWz1a
         KHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499724; x=1709104524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1w19D2KRTBhE9sNv9CvxGY/wxWs4ln5YBmorr83nBw=;
        b=wO1i/p5IcOV6Ny/tMTvTFefaJ/mUx4qGACAMYKj/5GxG+tEiJuCDV/lRVzyt80ga0n
         i1w8pDUwoNXRFVGg7sixT1mEOSBg0F+fo9hDvT8JkcnbynJhAsLxHDwlHXOLVNZQrmku
         0naWcltd//8N+fMVzjxIhmEb5PVDYxfSd9q+8COiAHTvyfSDWvQv1SO+esxmRFjclZoV
         H3IghUkzHFh6YqEUEvN+4x+L7pFedRmDyM2DwCtvWvqBkQ8qlxXtn22SxC8y4YMyB0QR
         TM6uJl9dC59XIuRb0tgVOW6OIkBErEgmE162Tmp0k1uTsjXbFjGdH1JrhDvgBxKh1Srs
         dZjw==
X-Forwarded-Encrypted: i=1; AJvYcCXp2Z3P9CO4Qj849HHDLQBbLtnoOCV9v3CikuFx5MGvausHzeazBV6LuaHkuTWK+j+BANSIJDsa2jtfH3akAlKQ4PS3nl0G8piovYQ=
X-Gm-Message-State: AOJu0YwInzg/m7HJLvkRejsv9AdWx1NtuwudzcSY8fBuo/8AWOM9mZ6I
	mTu0OS0FY2M7JEBeT+SMBjIgy26Si8Z+DkfpKzx3kib4mvzrNGk6n9W5bGZK5QM=
X-Google-Smtp-Source: AGHT+IFxOuGvM2mN0+Z6gTStijhueU2T27gHDiyeaPhhlIfiRWULsmmKEPnXm+XHg0oxehONQo0R6w==
X-Received: by 2002:a17:907:1182:b0:a3f:29c:c8fa with SMTP id uz2-20020a170907118200b00a3f029cc8famr2761637ejb.66.1708499724531;
        Tue, 20 Feb 2024 23:15:24 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b00a3e59410a75sm3641387ejc.170.2024.02.20.23.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:15:24 -0800 (PST)
Date: Wed, 21 Feb 2024 10:15:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
	Brad Spengler <spender@grsecurity.net>
Subject: Re: v6.8-rc4: Crash in rmi_unregister_function still present
Message-ID: <3401abdc-32c5-4b88-8edf-75d4683d4be0@moroto.mountain>
References: <1932038e-2776-04ac-5fcd-b15bb3cd088d@secunet.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1932038e-2776-04ac-5fcd-b15bb3cd088d@secunet.com>

On Wed, Feb 21, 2024 at 07:55:40AM +0100, Torsten Hilbrich wrote:
> Hello,
> 
> updating our codebase to v6.8-rc4 which contains:
> 
> eb988e46da2e Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()
> 
> I noticed that the previously noticed crash in the rmi4 was present again.
> 
> Previously, we were using a fix from the grsecurity codebase which changed the function in the following way:
> 
> void rmi_unregister_function(struct rmi_function *fn)
> {
> 	int i;
> 
> 	rmi_dbg(RMI_DEBUG_CORE, &fn->dev, "Unregistering F%02X.\n",
> 			fn->fd.function_number);
> 
> 	for (i = 0; i < fn->num_of_irqs; i++)
> 		irq_dispose_mapping(fn->irq[i]);
> 
> 	device_del(&fn->dev);
> 	of_node_put(fn->dev.of_node);
> 	put_device(&fn->dev);
> }
> 
> With this version of the fix the crash didn't happen. Please note, that the crash happens in device_del which is before the irq_dispose_mapping call in eb988e46da2e.
> 
> Attached is a kernel log from the crash with a kernel based on v6.8-rc4.

Hi Torsten,

Thanks for the bug report.  The truth is that I don't really understand
how IRQ mappings work.  It would be simple enough to apply the same
fix that grsecurity does.  The only question how to assign authorship
credit.  Dmitry, how do you want to handle this?

regards,
dan carpenter

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 1b45b1d3077d..02acc81b9d3e 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -275,12 +275,11 @@ void rmi_unregister_function(struct rmi_function *fn)
 	rmi_dbg(RMI_DEBUG_CORE, &fn->dev, "Unregistering F%02X.\n",
 			fn->fd.function_number);
 
-	device_del(&fn->dev);
-	of_node_put(fn->dev.of_node);
-
 	for (i = 0; i < fn->num_of_irqs; i++)
 		irq_dispose_mapping(fn->irq[i]);
 
+	device_del(&fn->dev);
+	of_node_put(fn->dev.of_node);
 	put_device(&fn->dev);
 }
 

