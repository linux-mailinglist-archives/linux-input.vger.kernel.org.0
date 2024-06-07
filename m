Return-Path: <linux-input+bounces-4236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 820FE900C61
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 21:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E50E1C20A7F
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112D014EC4F;
	Fri,  7 Jun 2024 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLQ0LTbk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF06C1474D6;
	Fri,  7 Jun 2024 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787875; cv=none; b=Vz07yO1wRZu3BppeQBgpTf3w9DcBc+bl8zVxssWtEeytX2qXQDaIAvWXLzK3xgrhNCEOOczkKco0kr/EEWJGg9cnUMnsSoIiZoRAH2Es633hCYjko2BRqgI2NdQOqpp4GXhz92WHE2aXcZphdayhmtCwyQkfBqjmqQhrXpYOokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787875; c=relaxed/simple;
	bh=lE+hbzleT40pRbQC9hUhbSV33FyjJxrobady59a7HFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJUQqw6kHj+x3ixeBINTyIB2cdggtIsvQwTDCnino2q31Nx35SrOEEsYI87zxb3kDSWRUD3I2PHthGqbYtKMg6oaEgCq6p4nFOL25KcpslgKGuk98vU+U0ARc/7riEXlHFPzvEpuq/JL7XjR2GJVSC+Gb8Q5uHsGkcVN7Vwlkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLQ0LTbk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7041cda5dcfso417785b3a.2;
        Fri, 07 Jun 2024 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717787873; x=1718392673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TuFWZ4xdFKT1wd42DIq0bkyJqXHcrP0kLkzse0qhyyo=;
        b=kLQ0LTbko1G0YAxSQEtr5QGUGR7ExOns+pD38MSg/afJGq1A/GcWRSkLHxyDRq7jQO
         3qb51wgSmV7CSfF1GBfZPF8Jtst3rj/gMUL+LrFuVKUkriKydlP2+X9IkWazvKuJWMoN
         uo1RkNCF/M9p04XJbWDV2WA2/d329+w2rlrZcD6BCaxbLDF7H+2j4sS2Mq3PK3bfLow0
         d/06oP+ZUltgNMsbywbLr+B8tf6I17Sw3v6cA84jqo0e6d/TMRbQqFPF4RqVq7d5XXzE
         hoPKwdt4kqEl9jbFBOgNPQaLJYg5d2VI98aKELl8G90T7PxvlPPGeKeq0Dg5LuPRX6gi
         Lekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717787873; x=1718392673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuFWZ4xdFKT1wd42DIq0bkyJqXHcrP0kLkzse0qhyyo=;
        b=Lw1gTCHQIivGCfSZNJsFOV1lIs9KFVEtk6P8LbjQLDLlQ1xRcxWpqcVH+etpj+of2E
         u5xdaxSOwWZw7BuNd9nq/Z2P3cM26/6ho4WsmVKol0ku5zzRWIxvUa4EnPAS22kYUQRU
         +q5TnHh3VWfEWN0i9c0bCido3u7clV83zd4qyr69Tj4faPKJtYAA8g/+nqrkzqKUG2++
         vncNrp73ryHGSBq55BKNoVbBzJ1GiivabPRX2VEhonO+xY6+2SI4KqxHuUfDe/Vdr2rr
         Z46Lz3I+GmHthPv4H5K7DdEq1tVAhFEDLiFsOck1PgzXopTP3qmhHlY/c4tzMk2M0H3B
         qLNw==
X-Forwarded-Encrypted: i=1; AJvYcCXo84IZpWRJvo+oWWYkDKe9EcZLe6Ck4VLiFhezhxOzc1yYFno9DMirRy6TzBH0VX4XkOAj5Fnk33n5blOz4rem20Np2SkTsUsqABylJzo6HOmvz5ROJ7qIBJwaRSivhQ5L9z7oC4rlWPPjsG7A4/Z0s1JDBdjaBIxEeMUgGHN33xe6yGEcHS+EX5k=
X-Gm-Message-State: AOJu0Yw3SSWRHmRqpoRd/PHALcpDlIfMCY4JkUQrcZh6JVZDnWNK2St1
	/AS2pNN0HNukaxSIsUoHXf7YfGpFGLOk0L7VAK0fucjJ1PhqyFna
X-Google-Smtp-Source: AGHT+IGvnCd1ZhEC7tWgZoWLPhwhcjJXrVRrP0pRcwhh1RNUz6vR+7plk7CLlZ2BtQ7FGZukUyOjaQ==
X-Received: by 2002:a05:6a00:1791:b0:702:824a:2a33 with SMTP id d2e1a72fcca58-7040c619520mr4036005b3a.7.1717787872874;
        Fri, 07 Jun 2024 12:17:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd4dba2bsm2900679b3a.156.2024.06.07.12.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 12:17:52 -0700 (PDT)
Date: Fri, 7 Jun 2024 12:17:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: gameport - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <ZmNc3oBiVhl2m2XU@google.com>
References: <PAXPR02MB72483F512F863C74A4AECA2B8BFB2@PAXPR02MB7248.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB72483F512F863C74A4AECA2B8BFB2@PAXPR02MB7248.eurprd02.prod.outlook.com>

On Fri, Jun 07, 2024 at 07:17:55PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

