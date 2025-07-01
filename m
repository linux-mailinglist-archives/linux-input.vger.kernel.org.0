Return-Path: <linux-input+bounces-13320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A2AF0304
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 20:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47147483619
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 18:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ED01DE3D6;
	Tue,  1 Jul 2025 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDEXL8+y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E874244667;
	Tue,  1 Jul 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395516; cv=none; b=f1K98z2QLHWBuBjmhwQ3iO+EgHEGfuDmIwkZZOIqi9VkPkhQiFhKYhJhx4//soZGtZOJD8X9pDRROPANmqApLy1IFRBq9PFq8JOm4q6hTIx4FnyqkJ5iCB12qiwScvz9TyvzRDBw0e8eIUvkJpEnyQG+cbYC4iAh1EkqlmR+EZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395516; c=relaxed/simple;
	bh=yotvt+VubhlQzqgAXZ/7b4/jA+phf336AoyYvG5yUCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miJlg/OdpSo06gcefx+6JnVLddqF9X8awpl//Opay9SI7R29TeRG6WkbBSneYxFjlwohD+ZcPdxuXQD2tb+KvzKfxOUJuOGrCHffRjDSdgo1sa6RUgT62Vt9e+97xFOz2mjOf4heChs2FOGkyNAl423PT8iRN38xDfFpV/a0z+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDEXL8+y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74264d1832eso4496079b3a.0;
        Tue, 01 Jul 2025 11:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751395515; x=1752000315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnia59gg+T70FOFbTyMycg8nemN4LO0JGdZNZ7zRv+c=;
        b=SDEXL8+yqPVFmEoGpcHnrPGD1fpWc9Skv+nChmsKW8/hHkgI4JvZRYXjC8Vm95QGyx
         iwxItvIXroiiGztKjOexYoJgj6t5m/fofWfk6IDRV7nhauxXvf1fMT3krbJMSmii7Wvc
         8sLbmWzWxjMl8uy8NqAhXM0736aPRFWBgbJoUmFznb7GZAyzncXIJW6L8vI2UYYGQwZE
         +EH0KBJUI2gO77j68Z/HE2UMGuVLou6Rzrvf00eQtDREEhXpJWdiAuDxaiQBiKsLwDfo
         t8aCvoS3ooQr/ONWPqRjisOSlcvllID44ocqy2l7P/zK7WFTHgD+S2jPbiED/NTz1o7h
         6uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751395515; x=1752000315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tnia59gg+T70FOFbTyMycg8nemN4LO0JGdZNZ7zRv+c=;
        b=D7eAfXu5q6Z1Xt2xrrKTtSSrgFwrlOnDeKJ/24v3vgqOwCZUpDKHpTIta3S4jSWJfT
         neWzaZgCI7IDWnZdUxzn7L+6Rsr21Tw/z0Vml3F56ZqcY86sbhsW4SPErHVvXsCgzIO/
         ndx0D8tAgiW3wvCq8KPlPQ1uEBaoTrghx/a25c8tUXCE+bNjVx+tXKUjOR5sRbdIXSXQ
         hKjw6JCQKFylOVh7pda1B+iGD4SRkQQWvh6ktJv0EHIGeu0LamSTo4bLJt6R4O85pBzL
         rNbOiv7B1tDwvz2QswHAj4bZNiAtXyvA3l0feZvmEKlA1IhQ6QqchyKVaYc/WvQF89ab
         4EPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3nXe2gKvaOFpug/FKBLvN1CrQsZ6hv0I5UeJx5tHY0EuXtfIK2G/hPvw53ZxtuA5KhAtp4iNCfBQq2VN@vger.kernel.org, AJvYcCVXJE+EwqCASgNEj/ra/hyaW+qoWw8rCTMchxsAz9t6JTzTxaIjVWMhXr6SmZsyhiyVUnydCJHJDveaoKA=@vger.kernel.org, AJvYcCX2xn96WbSZex4KxPlm0iNPZ4wdeHo1IYThr2CJXDyQjmy4jwQnbuBkDgiHudj+FWggfNqi6WJNtOm7@vger.kernel.org, AJvYcCXj/z+93g6W0jFwjGhfY8yZsvcyslBWMJPDTxuqHFLGyuzFo6tl8IGbgxHRLh6jTCF1HFxlNSAAwgzGXJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/c5UQ5yl09ZiVB3ets6YVsrEbYRpESKQrAL4JO8Wt992fhp76
	uByWNieCZKvQcneUlOVduvu2amW7iA/JMUyIsN2bG8oy/oGiL9iIo63U
X-Gm-Gg: ASbGncsuJ+1m/aRWvSQSCkzxEmTz/M9GZXK9UDbSgjzvnYqBfDtQAoRPGLF4OlPynM6
	LBPrWKE8wqKMfdaeQk87b6wgz2qjnUHaClE2f1rBjKQ6h4o4EsdVsqBKzfnyMEiaVsTDkttIuX7
	zodDX7ohznZshdU1AAr/Rut6RkGYKmt6SXdb1NuBNbs9y2DhUoY78e92NLZJXF2qeXBzrAATllR
	Xq+2i/7EsfKaC70veygO2ybxcRJBWiYcnAvvDZv21HQrJIGXpVv3VK33w1fryR/zrW79ZaR9qwh
	45kDspBo/XEZZV6N5LWjSBRsdNf6lNBUQZxFTosn/MMpQ2aCTzMot4f6lzI2Qi8=
X-Google-Smtp-Source: AGHT+IGKUG44G2rksdxfziQ+CeEH+a5tb04A0pht0E6IWn/xT8NXyFNARVMhyyLdtFiys43l33hw2w==
X-Received: by 2002:a05:6a00:929f:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-74af6f26d05mr26751724b3a.14.1751395514656;
        Tue, 01 Jul 2025 11:45:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541cc81sm12258320b3a.58.2025.07.01.11.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:45:14 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:45:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Felix Kaechele <felix@kaechele.ca>, Andreas Kemnade <andreas@kemnade.info>, 
	Fabio Estevam <festevam@denx.de>, Al Viro <viro@zeniv.linux.org.uk>, 
	Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/2] Add FT8716 support
Message-ID: <ymxplfejkkyups4w6wgrjwwju57sx3psbulvs444jghpvtvim7@nnf7ir2iwd4w>
References: <20250313202017.19621-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313202017.19621-1-adrian@mainlining.org>

On Thu, Mar 13, 2025 at 09:20:15PM +0100, Jens Reidel wrote:
> This series adds support for the FocalTech FT8716 touchscreen to the
> edt-ft5x06 driver. It was tested on the BQ Aquaris X (bq-bardock) and BQ
> Aquaris X Pro (bq-bardockpro).
> 
> Jens Reidel (2):
>   dt-bindings: input: touchscreen: edt-ft5x06: Document FT8716 support
>   Input: edt-ft5x06 - add support for FocalTech FT8716
> 
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml   | 1 +
>  drivers/input/touchscreen/edt-ft5x06.c                      | 6 ++++++
>  2 files changed, 7 insertions(+)

Applied the lot, thank you.

-- 
Dmitry

