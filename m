Return-Path: <linux-input+bounces-17080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FCD1CB3A
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 07:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA24430519FE
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 06:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C562036E473;
	Wed, 14 Jan 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6os1j/y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F982D5408
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768373030; cv=none; b=d0nm+6ZRLINwYTDg5BKGEvmfEY5Up7a+fsji/TxPIHADywffOAXcrP0sklo9Fyzxn2vmVUBtbzTbrxlNigehIPseJuU+Mrx4m8euggc+gUnd8DXmWYE7IE8ipOGDYeCxDl6vqmRCmZ4olMYGyKNjCuxK9cIFSrUNO9gkk+uXw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768373030; c=relaxed/simple;
	bh=vndXJLbbGMFQkn0txe/eRHcvG9DlmucyTiiHT9OGg08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N89X2c7lYXdB6ujsvMUzGs/CM3NisEyfFuWUQQCAqYfi6FtiqTFTSHGXDvoS8oZq9QFsSBFJk0quG+30hgeeJrzCvXtnKT/VQZLX8k6ok3rEWUxiqM9hfMdF6YXoix50S5qlxyjLqAsPmLH/8ArdMqoua4JcQIGMn2NsHLwuODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6os1j/y; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso11611078eec.0
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768373021; x=1768977821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTKVZRrKP/5R1qhOWvtsKYCXPC9CyKzTKhLAvCf5biI=;
        b=j6os1j/yLRz+4EgMjNRDNOM8J/RriQhAsH0OEuvWMuMhHs2Rte/xAr3aj4eT9WNR0E
         p94tBG4pomjXY4qjeVDmKKezt+pOtFvxZrbN+pGX+9s0OKDMo9qgP48BzUT141nYhzUP
         2hzwnoZOo6Vt5fZk7tjYpBi61oztMQ1SxitEacIdiXJaW2A6t0YlEpFIzEmj/WwFjoRa
         woTIDIGeGaJe+ckmYrYnERJSirY9PsomKalm6XZGa8xeAF00JB4gKmwjIPSY3emvh07j
         SkjDpo431h1aGD38wx7TIsd00oyUF85IdTQauLbUJ2epoyUkwRa+a8i9YT3g0c5iDC7c
         HsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768373021; x=1768977821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTKVZRrKP/5R1qhOWvtsKYCXPC9CyKzTKhLAvCf5biI=;
        b=qecDfjDSuAHBWC8BSE0p3+2JIclhv/dxuaZJJCedJk3ruCd/foX3oqo2fIXf/ntnbK
         Y3uWIeO0CVN1hATP/kpG72gfv5TgBMY4t1o6NhRx9bGHGjRsBfW3MWVfjXG0QhNYksQ1
         fpI1VfGrRRSxhqjRPChgrHA3mjIHxODfBBTOMSttmDaU1Jm2UsKJutEu4CTFob/XVcDS
         deZvnWaVE7Pj14ZGcErsrMUsT/BB28CVa9HSITGDlAevzUaoNL5NUZfMYMvzfcYB7oib
         P5NfQ/x34z8lWfPMq0Mo6R3hji1Td2ZgDmgRXfb9ytHz+x/ObcQ0+TuhFt+Lb1LmmAO2
         K41A==
X-Forwarded-Encrypted: i=1; AJvYcCXzgm9/ieAl1Rvbuqm7ON7HDX5qLLqcOZ5mG53D42zvQ/jjR9d9ZbuPP2DH+OupobI/ADuYn4MhdtyFGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrvKVudqihT22c0R26c5GV4PwZ4glpt5RRHGqYKqQ50qX7lp9
	qAG0tqvYE2H+nKnrQLxtufvJqPrM0gFegfjavc0jWsopLn05zvuCnA4e
X-Gm-Gg: AY/fxX7TPTfwAaf2XOs9PTP/ySekPMuZIft+tVxqO2TKw71FFnFLA6mmOGqsxvumEwa
	BATRdC3qu0qiVHT2VPJ7B7ZnPVu5dIBVWSiIbileKarO9+vQT/rVWA0gL+tZ+8pFuvRVm3UCuK0
	PjRBHspJa4y+nCxNISMIuK2E9FrsGoYyHou/rKa2t13pY8wXfz+DQ6aDVAa7rRhO+VYq8stXiRa
	9zj7lbFJ7BqcprQ2HqU1jw72DBtVC3EEyNeWf26mUqZguliAzHhBIPTWb3/hPgcWC916hySckPD
	5fSr99fNnHfX+j6Xd6wghHwkjpkQRDwlgHf7VZV76HauJdlvHd6CFCsgAOtOpPnSdFqrFAF1BZO
	lyq37RRcTX5lNi6MPYLE66/K7DISi3pNkI6AjVqomoJ9OuG3+Kc5Akc/ABVbqh0sy03jROH27dd
	SgpRTJ9qrM4TYrXUNr3xp0813b3Xfv1OeRCxPcX06xptkVCKaSDSgz
X-Received: by 2002:a05:7301:4441:b0:2b0:51a7:509a with SMTP id 5a478bee46e88-2b4871d122bmr1850644eec.33.1768373021126;
        Tue, 13 Jan 2026 22:43:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1c9d:bc41:b021:e89c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd78sm18825359eec.19.2026.01.13.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:43:40 -0800 (PST)
Date: Tue, 13 Jan 2026 22:43:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Signed-off-by : Lee Jones" <lee@kernel.org>, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: adp5589: remove a leftover header file
Message-ID: <lbivp6iaea7ulxftu2rhs3ok5bfghltfg7ypyj2lxvzlzvnflt@am3zdgljbcl7>
References: <20260113151140.3843753-1-vz@mleia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113151140.3843753-1-vz@mleia.com>

On Tue, Jan 13, 2026 at 05:11:40PM +0200, Vladimir Zapolskiy wrote:
> In commit 3bdbd0858df6 ("Input: adp5589: remove the driver") the last user
> of include/linux/input/adp5589.h was removed along with the whole driver,
> thus the header file can be also removed.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Applied, thank you.

-- 
Dmitry

