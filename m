Return-Path: <linux-input+bounces-12671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52173AC97C2
	for <lists+linux-input@lfdr.de>; Sat, 31 May 2025 00:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8931C06695
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 22:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A9927FB29;
	Fri, 30 May 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxnwlAOz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7713A244;
	Fri, 30 May 2025 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644565; cv=none; b=CGSeOgvcgfj2u6AHMQbez/ixrSvGef7K2X1JtvdrCSebb87/5LpBMnIkb9w2XdpjKmycPPPsUZXDcUyQJMVpR471BrowMPFqv9llASK+uKiOU46KnYjghvLbEQ7gRrwDR6K2zYVaHKWG+duE8LlTbPjfK62mvi4kZ2mzI3p/hdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644565; c=relaxed/simple;
	bh=9iRrBbKhBcH104PdZNqqsZXGDeAsEnfcOvJpHS8KBng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFkkrIUiSfwITEc1w2CRR+wjTkhn1CUOG6P+6pTEkyJsjLAZJlZ3xLHh03o7idd9I0KlwxR3DsrMUuodY7mOTshDMuc1sXyP7O6Qb3pEyTJlzGThT1Fw7iHyVbDsshlkiWob4wePfXsa7GYxJX611s78gZ0v/9KkNQWcJb9ZAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxnwlAOz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so1528100a12.1;
        Fri, 30 May 2025 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748644563; x=1749249363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Au/WNJA8WqsNFHZ7XLmxt17fic0juTEPdSvf0qBYcM4=;
        b=TxnwlAOzolHeVHHTMwfflAO7lQwXuLffyZc9AfCFUi+TLYgF8BtGXv7IhT0JvKlzae
         olwSk1ejT4FDuS3qlAHeZMlJRq9vCwNrYcqOLSWnE9kdZmuTagL0N+6kfoPJrd3/77aV
         2Jx3zjEsgrPrUgYyjsZR6yanvDvkjeoazI5zgr3CZIJlbjrRnAQZed/xARHXYNnCjx3q
         Ee2Vmugbf5WWSoHnKAnoENQoByjD/WC+q+di+ybPR+w6uvY/MrWzKm5TCepgQYmK1zpg
         new7DrBDKC6JVNZMSNwVY4/RH3QaZY2XZMzZIUncvKcnsf3D4lqD0nREIzkp8chlVAvB
         wm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644563; x=1749249363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au/WNJA8WqsNFHZ7XLmxt17fic0juTEPdSvf0qBYcM4=;
        b=SCu/KtYKUt/b3R098TZVBr/apR4cEuk6lcpmrXevpZSUBO8SKmCU1CNyAyu02EIgJU
         V2HWKREt8QTFbmLAiOoD8A9G0D8KhuzIphsGcvQuXULYcYXFd02r3YXeFlnS3Na/Ql1s
         2CGtaqf5XoAiiB/s9GSyLbXvk1n/vNEpXSOGUlo8dne/PTI4eF7HvsGr0faXHVnUNC5p
         lz5DM1kVgij+5wqD4K/9yLVPzhVDaHiCg5ynKQKXbKWOLxZjujtHn0qLHDw9+Os3Pwwo
         rbOCxZlElqhJO3fXrGRYC4iI+obihl8p7CrFieWoa76b7ydZqEiZhIpgW++IL/CCvKis
         KzOA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+nDTzGXS8zSCgbRG1z5z2AT9HnWKYt3+meVOkA0nhpuovW8NRs2dg8nSrNBpTGJcw5FVrIbJLY+yy8CC@vger.kernel.org, AJvYcCVUzKxcQCJijMv0QSELtWsV/LR5r4ddffIGPxJLqzJASZeirodsR9nFfg2Qa9V9IPdC6dlSJsJGDzo7UQA=@vger.kernel.org, AJvYcCX0HImfws4Lw2OU0HljNMVeQGmmkmtau/d6kevdv6UsmpPqWBzXq5ibedqzUegYHuxaBdZ27GwGrEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+h9XdaXvFDSj2hx+DpU7vVXj8nttv77z+Q0647DJu6L+5T1y
	21ax+reMbIKnmMRMw+WX8N8oolhhD/YMATPv9kUn5NiT0UGdIg+ix3em
X-Gm-Gg: ASbGncs9V2eC1Cc8lkWYOR79sCHpY4plYcWR+jNQ55EiuuRSlbd/gVuUaggYqQvNJc1
	MR6QsCqs1cpoahs8aT67xmGELIkX/AInJGoQyJgWNbS/OMMgN5GPv0hEn2qQvceG6Y3GkZ3z6ZY
	xSYFLpNzO6QSuPPQSsKJpuCoGfngMJXN/8+EHmgTQjiNBBpnjN8Jq05RJ4m4pE8GaxdCLe9gA58
	TrOdSSBCAdEnJ6ScXSITYAXexAW2pIXQXfG76gBCgSsrLM9AULOU264mj0u7O3alfPZ99K5EMzH
	wGFNSNgbbaOW1Jxys9UBouywYurmY1NaWIN0745sKRGxfEjiN945
X-Google-Smtp-Source: AGHT+IEidlXG4wBqg4jen6ReNQ7Ewx8jMVQ+HaFeguKmpH1BzLDw3dNtYT4QqPsDuy+S7/U1sC1Ong==
X-Received: by 2002:a17:90b:2e4b:b0:312:1c83:58e9 with SMTP id 98e67ed59e1d1-3127c6a02bemr161026a91.5.1748644562759;
        Fri, 30 May 2025 15:36:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:24e0:5639:ebc6:8c16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2f9820sm1699452a91.22.2025.05.30.15.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:36:02 -0700 (PDT)
Date: Fri, 30 May 2025 15:35:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, bagasdotme@gmail.com, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 0/4] Multiple fixes to Amiga joystick documentation
Message-ID: <w3tcbri2zs5hbctlzrm6oulbjgubitzbv4obr7np3rwmxgrqe5@jriz35clhnre>
References: <20250526135957.180254-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-1-contact@gvernon.com>

On Mon, May 26, 2025 at 02:59:48PM +0100, George Anthony Vernon wrote:
> Hi, this patch series covers a few fixes & heading imps to the Amiga
> joystick documentation.
> 
> I've kept the section adornments changes amid ongoing discussion about
> it.

Applied the lot, thank you.

-- 
Dmitry

