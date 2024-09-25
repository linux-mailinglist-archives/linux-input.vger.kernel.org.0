Return-Path: <linux-input+bounces-6724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6979868CD
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 23:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361561C21198
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8619715699E;
	Wed, 25 Sep 2024 21:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep5aeaa6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B53A8F0;
	Wed, 25 Sep 2024 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301434; cv=none; b=Svqu59to5pOjTaszU4gv/39GjmlN+2VA66WK9HmHyTTP55oM3e1Y11gMBuBsMCRazeQrQyWrvHFSqnNjS/CoMk3JPxlBjcPBjnrhqzuUInE1FgTTeF5m9tEyYIvZePCvNVJA2DWXBAaLL6VEZitGUmKM2KrxBWonGdOikdClClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301434; c=relaxed/simple;
	bh=Rqc2X5SMPu63Cqa+DDX7JyDhlqatIp5x/uNwDdENIiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzJOQgjnbknOMsNwqplUWOEiud/c/l0bxVz//onFDyJHh7xctkmZXaRLojHX6SD6QzrMkoxsYVEmi6aOtpM1WjiuTYxZGt58K8vpwwg1TgoeTG85sWZfWzdQV/qnAhtcgro3dTvgdaki58Myjd+hePN3xWriMdao4a8L2VQlDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep5aeaa6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2068a7c9286so2638425ad.1;
        Wed, 25 Sep 2024 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727301432; x=1727906232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh8uyuzwH0iOnzLqnw2uzJ+CxTGFRCNbmwoBnNZzNgE=;
        b=Ep5aeaa6Sk85YbjGGJL8yTPZuRGjk54rog8tgR01+uuy+TjSWZbeWqkmsEh0vTh3hy
         OjZ6LDULKuxSMZhSC3WkMrQnhTQNkS7cT71WZZ+uDIZQtqbE7aM8xK6Hlz1IBBwTvDJQ
         D6Oq2RDv2o329/91FJqHNWHqJhZJWrUxCUsw/NTzK0c/3tkCSZkTF07JGQWzrKOCGjt0
         73XMxXZtkZzzCB250j4VMNDLp5r/BJfDjDY+1Uql4OF2xXGRBeaei3txOnjRQOy7mZBB
         cC8gAimLGStfWKQjXET7QcQklncl0X/JP1n+NcYSy3PzmTY8KTYejH66rA7YdRlvjAcY
         qr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727301432; x=1727906232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh8uyuzwH0iOnzLqnw2uzJ+CxTGFRCNbmwoBnNZzNgE=;
        b=Yyo0/SuElH4+gHOuzM0C5WARD1IRAT6BwMwF5no4g/YStKnL9qql1OHRSjK5WQFw/P
         DocNRR1oxU2J7UGtyuqyIV7LzBd/hLPvimohwmjdflfdLVyx4YGnXMxGUt9/BokRHFb9
         Z5rdUb4GOaVycnZ+zkTie5zItU81kTH2w2X1cRmiIDI/UraUsnJl3h83PeADkf9XRsvm
         YexnZ0WC9e3d3IruRvUABcam0XWYHWweKBwWjRu2b3yOoUeCSrFsxLs2Krqe05sYeBkg
         Uj0VBzN+1clzDp4MI3jHV8URj4uXckIDllrmIP8kcGJAOhUWNqgWzYWC98Eir6LxbO3D
         C7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc4rgGt1wUnDSHESURVlO6k6sc6qvjfHeS9/STPAmNYCxb/enhLZbHI6Hm5eqvZYsIT0LQDNKSn52W1Nc=@vger.kernel.org, AJvYcCWsoLAAACz74MsOV3G9TP4vc7pUQJdM7a7zQhU4H1IJL9SBpg/xwYNhL7yYY/SmYNA8AhHLFIu5vqKF@vger.kernel.org, AJvYcCXlgHx2XXlI3m/Q4hs04dJnpEQuTdj2NfnBlfELrlPnWkOhiDDXzS/mqneEzZlcbMhUVyLf/nPBNAzLLP+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxuCBVvhjCld6Q4ruy2+gZskeZDFV6tt23ychsfcnChRKvQbxjC
	TokYfnCiV4rii7XMioWmrQ1Lf0RWg6WebgZgwl/gL8dYbBbvxN/0
X-Google-Smtp-Source: AGHT+IH7P/xvl10Q1V+B6l7XzaGTGgPRRYGBLveGCGwyzJDP/1Re4PziTBm+SPob5q8/JdKGxQGdeA==
X-Received: by 2002:a17:903:41cd:b0:205:5582:d650 with SMTP id d9443c01a7336-20afc5e3a39mr63011295ad.52.1727301432257;
        Wed, 25 Sep 2024 14:57:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dda4:383f:ca3a:82bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17e01absm28424475ad.174.2024.09.25.14.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:57:11 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:57:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Charles Wang <charles.goodix@gmail.com>,
	dianders@chromium.org, dan.carpenter@linaro.org, conor@kernel.org,
	krzk+dt@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvSHNFPPC1NNq33J@google.com>
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com>
 <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
 <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
 <ZvSEkn66qNziJV0M@google.com>
 <nycvar.YFH.7.76.2409252347140.31206@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2409252347140.31206@cbobk.fhfr.pm>

On Wed, Sep 25, 2024 at 11:48:50PM +0200, Jiri Kosina wrote:
> On Wed, 25 Sep 2024, Dmitry Torokhov wrote:
> 
> > I see that Krzysztof sent a revert, but what a proper fix would be?
> > Apparently Goodix is using the same product ID gt7986u for both I2C and
> > SPI parts, and covering them in one binding is not really easy (well, I
> > guess it is possible with a big ugly "if"). Do we just slap "-spi"
> > suffix on the compatible, so it becomes "goodix,gt7986u-spi" and go on
> > on our merry way? 
> 
> I actually see this as a viable option, given the circumstances.
> 
> However, given the non-responsiveness of the original author, I am now 
> proceeding with the revert, and we can try to sort it out later.

Yeah, no objections there.

Thanks.

-- 
Dmitry

