Return-Path: <linux-input+bounces-8138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D849D1E58
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FAE1F22704
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 02:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686FE1386C9;
	Tue, 19 Nov 2024 02:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2tnqRCq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0B7A13A
	for <linux-input@vger.kernel.org>; Tue, 19 Nov 2024 02:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983798; cv=none; b=qqYWfdMuTYy9tNGL392o2cXVfDi+1mc5r4Aka9yTbVMOSM7hn0HFLgoV5YO+gtfFTU+1ItQZOjeKJejgfZPOCXDsadhtkf/I65Dy+F9qtg2z5werrZQlMGR/lE3ZJ62r7qHS+gGG+2Y2TzFbwmCjGXIt+npfQpSTOVyYVj63bCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983798; c=relaxed/simple;
	bh=It4nY43bFba/PBfhBQP+yVJc9c89783VhVYmkI998Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSrRYdaII8KwG3IViPJZbV3ol801FJEYn/fH/tZp+gnw9Gp6dz1nUMV/sW5G9hqM0RWbWv82IgiwFwIiZYN12TZVHB9KMZAF9Dbcn3SKB46iUjp4UX8VFi7hDLHWkLcvX73abIgzY5FO/fD2MYcmWS2/vYajQR+mvQflqvCbvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2tnqRCq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c6f492d2dso27382705ad.0
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2024 18:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731983796; x=1732588596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf4MlNylgOpj7GowCDhuazbIXcf18Xkl2uiHNSY0nMA=;
        b=I2tnqRCqN/jfjvCVFh3z4NgW51Z2q1er3YMJYV5qs8D+hsspOhb/fo7YUau9OV5R7z
         dLZmjFqGxMnWJ1IdmDFe5AMjv5Dhide3QuTiI/njZGj/Brdd/5Apa8mFvx/86lA7bsAg
         W0cc++t3nk7wkhfcHMWuY6xDRq/i+f56HuEh+UCBKmFWI94viaSSMR0ggV4hHsxnWaie
         fGbMbt0FzFbJSpknKjWpvrRjqde6/qDv92QiJ4UW4MRgfyctxaqiQZohsiM0WjiwlD5S
         H/rxw2aGpnEIFd5VpCY+8ic4FGRexVGLrtZgbUlqYFXIRyoqgg9GNWw+rZDdzV9oKupX
         21Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731983796; x=1732588596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf4MlNylgOpj7GowCDhuazbIXcf18Xkl2uiHNSY0nMA=;
        b=JbmUD/NQPg5wzWIkAfo3h4QcI+r97o/nfHGz1tatDBusjnfD2uN3bhRUS4ZELKrR3k
         K8/IbNVKkU7xXjnUsA420IOuqQe/iThM/zQ/QkFW+Z9+MHjgoSHB/MqIfDLfmqvOaeFm
         6gfteSDm3C8U1AB/MCrjNWQ/wHCnMkxvUlc3JsrX8lrIY0f/gss7RvdtSwHdGi9FMz5s
         JK9yr/UyvEoJzLaCI1+HNLkLf16roRKQ5MCRgEGoFu8Y7toeYk1B2IlKYnJ46xztJHT4
         jp4f7t123xAjhX0Ht55zHDZv8yT8vUxLFzAAsa0xuZWMB6SrRXdDHP8kCu6Ulh6xryDB
         r9+w==
X-Forwarded-Encrypted: i=1; AJvYcCWW10V0RY4gI1bPw3xKGlNgcCvSRCCrp5wd3MZF2wys0E8hlKcEkKzt2jnAZC7wZx3RUC744c+ToT3flQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzasEiQ6y+5bdhp2PMk5GRbajBOyakcIxvh9+X+DTKTEM4LEpPn
	l+cPv166MONmSj7AoGLuvqhss8yrzgcuwv/L9EkR2JrCK4mTBJKz
X-Google-Smtp-Source: AGHT+IEhWDw4RAeL5FMPfl5t0oRQ2R68OTp1K9y37qJkM6/XojdAm7nLaPrZuWI3f+OQHots6AZvvA==
X-Received: by 2002:a17:903:2282:b0:20c:9a6c:ee7b with SMTP id d9443c01a7336-211d0ef6e9cmr213871575ad.46.1731983796064;
        Mon, 18 Nov 2024 18:36:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:38b7:c100:6f21:312d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2120e1bd347sm32408245ad.281.2024.11.18.18.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 18:36:35 -0800 (PST)
Date: Mon, 18 Nov 2024 18:36:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@gmail.com>,
	linux-input@vger.kernel.org, Mark Pearson <mpearson@squebb.ca>
Subject: Re: [RFC PATCH] input: Add "AI Assistant" key
Message-ID: <Zzv5sRu7lgEEP7aZ@google.com>
References: <20241118231014.GA2011625@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118231014.GA2011625@quokka>

Hi Peter,

On Tue, Nov 19, 2024 at 09:10:14AM +1000, Peter Hutterer wrote:
> Not to be confused with KEY_ASSISTANT which is for Siri/Cortana/...,
> this one is the Copilot key.

So my understanding is that Copilot is a successor of Cortrana. Why do
we need another assistant key? Do we expect to have multiple
assistants being available on device, each with its own key?

> 
> Unfortunately Microsoft requires that the Copilot key sends
> Win+Shift+F23 so this is merely a placeholder for now. Eventually we
> may see hardware that actually sends a custom key code for this.
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> ---
> Note: this is really just an RFC, happy to change the name (which is not
> great given we have KEY_ASSISTANT already), the value, anything. The
> purpose of this patch is simply to scope if this is something worth
> pursuing.
> 
> As above, because of the MS specs I don't see any (MS-compatible) HW
> sending that particular key in the immediate future. But since userspace
> is expected to implement the functionality via the Win+Shift+F23 we'll
> need a new keysym for this in XKB anyway.
> 
> If the kernel plans to add a keysym for this we can happily re-use that,
> otherwise we'll need to define our own but that means some manual
> attention if we do get a kernel keycode later.

There's nothing in the HID spec yet, is there?

Thanks.

-- 
Dmitry

