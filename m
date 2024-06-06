Return-Path: <linux-input+bounces-4183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDDC8FF678
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 23:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B60701F22C7C
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29FF482E9;
	Thu,  6 Jun 2024 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUEiSEP4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9081BDEF
	for <linux-input@vger.kernel.org>; Thu,  6 Jun 2024 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717708160; cv=none; b=d0HxkhEu2B8EXOv8zJdGIDdM4POFPhbmFKyHH30YGg8x/s8mx00+krcUyTsC4XjZnpYeZ1Q+nWi09zfwwQyGP4js06d8CYTiVOfWSLTwGbhAB6BJPoa3Eik/6pGLfSZFE3St0erQ8wPsSPgW9uabB5tNvEfK+Jo77ZpPXd4wg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717708160; c=relaxed/simple;
	bh=q7OurDhR3WzapUB4OVGpkcS/Yfdyyg84JnyGuwL247A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2yxByv3k3FMgtpbztYs6RWf/u+nye6gEsqjaFDXBfdKCR5WzTIaua4UJizEnRUZcgT1OMBkHJZsWjoAOEotriaJLAfrZtk2mCHI8mEBGttmtsShBlPT4nKN67kdGSddAguFGwC2OmA/TaqjeQ9Jbd6Ifwi5XtldHmF+v+iRfzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUEiSEP4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f62217f806so14001445ad.2
        for <linux-input@vger.kernel.org>; Thu, 06 Jun 2024 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717708159; x=1718312959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dq7Fb2HtTu1lnE3Dt4talMegTd1Gt81ql5iXBPQasb0=;
        b=VUEiSEP4aEc9QcmP13lCJBDQz2uK8uvJWsox4jL+HuPhqRpB3q9j7Za40Ft5pqq8yQ
         sx79SF7XN0/JtifBIkK6rmt6A92ty+8JtBjHJfMBAlIBR6mWei6ec6HAuTCpzQTM6MFr
         OXt8sF3PrfffKEqAijFBQvNQUMT3BKbqUrYs67OLNWT1gbMM42UlI9/FGSrRWmB6uYyI
         N1NypSlxjknILkikKWccK1QhGqKp/sRrlVUOHvCmN8E2Xwt8zSxmosROtmzYmAs6BdZv
         vnWd3FFeLF8raGUUk+JOgQF57JoOkqrbv5I/D57gVJ5uYlmJJfYXaNwRepPidtLGcrMw
         W6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717708159; x=1718312959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq7Fb2HtTu1lnE3Dt4talMegTd1Gt81ql5iXBPQasb0=;
        b=T2JEmc43FdZwRaqywz1mnLtPHyvmjZnIi+3kHHdf4D/URae8qVui/JjLwhGIWjHVtq
         ZcsjHilRzxcoEez6nUMDuBUFRjFWyxJCaxCsL69FdKOZCr61uO1YDv13WJC0Gq/s6pHV
         y6MdfHVcZNKKNWhF2RT6HBQ8fE1SLZFjtgP6giv+Saoux4g6GjKoiDZ1qBud6YaLM+my
         fNGBT/idcd4Vryzozj4n7fPxLC8AVliLucLycK0QdRnwlz4hjJ1vVCEuds8cmnAlEn0Q
         xW4kTl4G64rOT81mTEpIcTKGC6U3kdY+h4T2S/gqizXo3Vzffb8dysaazsCo4ionjNKR
         vLrQ==
X-Gm-Message-State: AOJu0YyxS0cKXNaHGJwc6NTN5U08mAYLfSv9WkUGkcpydNbqYSmzPrXR
	k+pGLK/R7EfV010sZfzXOZ1UhGMc+neiUkBIZLqJJMc+D12FD56i
X-Google-Smtp-Source: AGHT+IEoszkc81Z2GY2AvbFQVKUbU39b+kx8TVaPfvvjiuG77DdOOC93wN6E+1XNE1vO4OMjrCxIfg==
X-Received: by 2002:a17:903:22cd:b0:1f2:f954:d68d with SMTP id d9443c01a7336-1f6d036c442mr9477365ad.55.1717708158421;
        Thu, 06 Jun 2024 14:09:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cdcb:6470:dec1:846c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7ccee0sm19864755ad.148.2024.06.06.14.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:09:17 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:09:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Gerecke, Jason" <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] Input: wacom_w8001: Correct device name generation
Message-ID: <ZmIle4ggnKcLav5f@google.com>
References: <ZlkQZsbDKTkzUfE2@google.com>
 <20240605164656.61623-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605164656.61623-1-jason.gerecke@wacom.com>

On Wed, Jun 05, 2024 at 09:46:56AM -0700, Gerecke, Jason wrote:
> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Fixes: 6c7cc1a29d1e ("Input: wacom_w8001 - simplify device name generation")
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, thank you.

-- 
Dmitry

