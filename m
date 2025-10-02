Return-Path: <linux-input+bounces-15234-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002EBB596F
	for <lists+linux-input@lfdr.de>; Fri, 03 Oct 2025 01:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDD593BE1C1
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 23:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BCB2848B1;
	Thu,  2 Oct 2025 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAjWXLWs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA826B2AD
	for <linux-input@vger.kernel.org>; Thu,  2 Oct 2025 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446907; cv=none; b=MyGn6PT53BRtjRSRlF6vqPOqDAe1AgIj+2jhkgsU6AXnfhaYZe4AkFw+wmGvGp/6BT6/Hwpr4JGVGTQ214k653MUTRlYWj0Kxv6YuavCgOk6eTSBfFPuRQjoQjBlAaNO5HgrdKC4gFyD/x90Z6J05+H9VkQRj3thv/7P/8W97YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446907; c=relaxed/simple;
	bh=d4WQPrfeSLu0uhtyde+0xGCoGCB0zctmAYImzxhWNAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwl1eZccxvmYdR25qvJtzny7R0EjppwcINybzu1taGpM88xlFosybOrN5+N667WE79fzbgDSWb+J1uZ7tP0DBfhofAZk7pS6kmHmrlPZEfCctDE8oR9ZOc4caiUb7siJRr8CCc9/7/gTFWM05X2xt/mmm/1wCd6ow5qgs3oGrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAjWXLWs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f0308469a4so831548f8f.0
        for <linux-input@vger.kernel.org>; Thu, 02 Oct 2025 16:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446903; x=1760051703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d4WQPrfeSLu0uhtyde+0xGCoGCB0zctmAYImzxhWNAU=;
        b=bAjWXLWsqVucSuV3aEtxLExe5YCA6PuclqYncEs1NMiv9OMVd4cP/nxG8s3FeZaDnx
         YGRVSxf58Y6ntMxYXZpZgyjS2Ih/AkAgYg2zqU4g52Z80/AzqyTxHWVi6/cEGKfW0qAv
         LyEZoEdrgaEU7m98uoJO9ls+aWnrzxonk7jD4+CU3TARUOVT/3FkEffVaDAy+YNASV54
         A3ILMnIMk1B5qzvwYIPJA+X3kHE4Z0pijhd9u31sWc1M+eQqYIdASOszAN2BDA/azo6V
         2BzG1Vwu4YXW7N/CFLpaAZkaA+izTQ9EtJil0dKbvVNzUHi4gjSqwp715N5DwP+z+jyf
         RfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446903; x=1760051703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4WQPrfeSLu0uhtyde+0xGCoGCB0zctmAYImzxhWNAU=;
        b=wFWPVqy5439TtPXK9VAC1aIm8MX4qT/3qo4s45ZwPFP23avfvcBIf9zpWGOtLSPbON
         uo4qTspiRHZEuo23zmuWotS3iIQZKyz6TrAzNm3xjt8T+dXrNxztDM/OSYVUdX3ZgRwh
         HAKJLjTqUDxeseW6wP3/VNbFZrrZHt0WsAvqfWOkLepLbLeukQObF2AI4S+GCyPEPVuJ
         8FK3KLgMSCynqwImaDl8gPJjtuoXGlvjUutrq+Z0OQNvMG2e26ZeOQBDfn9YBVkop5mF
         IZ3II4vwAZuDLBDJeM/Wdx/JtBk936o+QMMDzXQcOFoxlxhskRPrGS9O1mvRoxbqTUo3
         JSMA==
X-Forwarded-Encrypted: i=1; AJvYcCUear0nIfh/wqRbCxTzeYlW7Pv9l/6V2mTyvAqf+ZVB+PkysNpwqXQ7QEErclnXQHBI7x4NBuq7CvY0Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzowcD4FbSYLkXH0keZhv+dSqR1S8su0nuYXmKlK10PoXSbTF48
	xcrdERvB7e4w6WpDKKKsfBeroxbSibWf00puF/hw9oE2ewzt9GNbqWZhnL9ltH3SUgmOwOlL3dD
	PpUZCdlPP8Rvf/lRAZlOc84m6HtOR8v0=
X-Gm-Gg: ASbGnct56RwZacwYGDTdR+n4tiY64imz/DijUlhu+I9fC40FDudF7DJeVpd+By7rkcr
	Myxt0huvTDKIvcD1HwEveZuk1wU/nkf+LlLPafa4HfLwl6EL470X4eqWKIDXwpz1VdU3BzVOHNj
	jIqkUZ6TwrC/o9oae+d7F+n5MVIjG8/q839d9+WvtT3o/vMDVy5+dG+GHapP703hPJtrGBy2Rsg
	pHWc+CB5UC9wnkElNmjv5AiY3Injavo
X-Google-Smtp-Source: AGHT+IHsPYk5oXJUmxQxAVc4iM1IpLGIf6/lIyzlGkQMxIgANoUpSyzqch2ET/4x2udxlabrPb+SwCvoDeGDErj2Xfk=
X-Received: by 2002:a05:6000:3cd:b0:3ee:154e:4f9 with SMTP id
 ffacd0b85a97d-4256716d839mr551024f8f.20.1759446902779; Thu, 02 Oct 2025
 16:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002192324.1991349-1-mavchatz@protonmail.com>
In-Reply-To: <20251002192324.1991349-1-mavchatz@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 3 Oct 2025 00:14:51 +0100
X-Gm-Features: AS18NWB1TfOBK23kmrH55bF2IsHa7HCn51hXHNboTDbAGX-QSahAziRfAAK7rnk
Message-ID: <CALTg27m8cWvJhL1y8QqNyQ6qnGKj+5u1gk1H8BQN_pyFTuDn4g@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Silence protocol errors on newer
 lightspeed receivers
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, bentiss@kernel.org, 
	hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

Tested on 6.17.0 with a handful of other patches:
 - https://lore.kernel.org/all/20250927234834.2635483-1-mavchatz@protonmail.com/
 - https://lore.kernel.org/all/20251002193025.2066319-1-mavchatz@protonmail.com/

Gets rid of that annoying warning on my Logitech G915 TKL keyboard
No regressions on my Logitech G502 Lightspeed Wireless mouse

Tested-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks,
Stuart

