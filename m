Return-Path: <linux-input+bounces-9480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FEA1989D
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 19:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A153AA924
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 18:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983FD2153D9;
	Wed, 22 Jan 2025 18:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrabTX/H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8B215057;
	Wed, 22 Jan 2025 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571210; cv=none; b=iBIlMNBvYcjABC6OeTHIVMIyjjGWtXOsS8XmmCWNQXXgyfkQv8VT+iKdhauaVOdjgg+EMAxTVy1vPQ6BlEsl0SwhZqpxZwV0fWOvufxOMwM/eRx6cry/QRZ4M+baeRxwlxhR5QKd6VyLygXodbZ/r7+GEecP20165kyHWHE5z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571210; c=relaxed/simple;
	bh=EdP5MyqSnue8Y7gkFO5kjO8PzMPx0LvnKSb6aRGwOLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQgzBD0al1DSOgzDtoWnqtx4wedMTz43xoo6xlyiJMxBPFFP7rBXeBpiO2eYL9g4mKBGoLqhr5BEGnHEbq5V5Ckx7z3Do7TEhDG2XNaOUjU+I7cmsxXUDOEuqIENNsE2v5/kIuP2MWHZkji++e8B29MfNqm9uefQqwf9+l6C4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrabTX/H; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21619108a6bso126135655ad.3;
        Wed, 22 Jan 2025 10:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737571208; x=1738176008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJlk9bKlf10YSkxm0ZF8ckhs2t2L8W4LNjwwz4yCQkM=;
        b=NrabTX/HgYGllcj3CbGrN+tt/Q1NX2YHNsqokkt0lfOHLOWaHtAKYUVC9PWdx8zQgB
         AvWzGrq42us4gJ7KbnPNZRcpImcxsVXdZADIZckcjZnvCmyzmG/rCsXQB6R5QDPo41bl
         MDMM5kxem3LCtDIdOEi5VPmAZ1bO2AQnSbe6OG8wlJYLbYVctb8kgBDD5YOyn1o/txZB
         Bcy+mBrlSBtjuiycF9rYQrVf5uNkz9K+BvA2YOPY/2LHxRfJNBovrrrlPHb7hnPTuMnM
         oP3wmTzKAbkKwVFbxWqm5YTvCthu97BrPoVeJBQkyjA9Ispbe8fnOmy+Ph5ND5WFnKfI
         vSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571208; x=1738176008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJlk9bKlf10YSkxm0ZF8ckhs2t2L8W4LNjwwz4yCQkM=;
        b=KLbb+bm0uu9kF6n27b9cOx+k6Q5O0pl1PEJuOmD4j/1QhLEFbhInS6xPzy03oOynIA
         lOkwas2cMIrx6w1frIgBmqnvKJoPTcjWokwpdU4axr/Pp1y34RHEXfqz1FBC0og/xVlA
         7ksTcAJMDAeMQ2Fgd5ExaSBRRGau7d2EOpip4XXKc/6MjeJ4bPoLtCnWaPH0zLyZr7/z
         oVV3yqXckzgSStYJGJ14liUB6owgyjXVB8aoRm9/lWnjO5tyxRxROZTCm7yJyZxJNDnD
         yFWPuXT98WgRW0RN7DUyTa2Gqo5dS+2DzxUGKyXzFZ6IItmxcUthItY+7yxCONbgJsTQ
         nA0w==
X-Forwarded-Encrypted: i=1; AJvYcCVS1cXEQRusy+rt/vbW+YvQo5L4oU8vPvwwU06CVPNNaUmRg1CKy6ZJVA0E54Xnint86OV0St5EanIStx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3mMRcZY4F4yWZXxxNAAvm5lk8Kg5730Bq3U0Y4WQdPMolyf7
	a7SWRWSrI/OrK0BJMOqLIsEFg/n4RJawtQ6BfJX1ghO5MQOadNDv
X-Gm-Gg: ASbGncsMakOcuvJ5b0k0Qnhp14eggqiPIbT5VlgEpmHYkwkBCekibVSWeLMGQPA9twO
	Q2i8RzePmHfPxL5bl3oVYDcJ2D3BNLbkE1274Rqu9hbNKCC1BpJGxRCxFrE/8NltqbTX5kKA7gg
	qvu77pH2OkFUVdZb639jQmXxNGbdeBVCFMMxT1zt70X5/Q5r9ZPaI8Sg77hlhQMruaYv07v7iah
	cW2+8HJyEyGGIXSPJdndRhmr/sCgyM0HpivtvPvBPEd1xvvnTE6f4Jl0cUjFgPESadV0w==
X-Google-Smtp-Source: AGHT+IFxoGmTj+OPGxv8NHQb1AE4DmNK+GLHuRbRx8maoTY2QhQtW+TSF/dFv+V+LOv3Nl1EZHXTTQ==
X-Received: by 2002:a17:902:ce8a:b0:216:6855:15f with SMTP id d9443c01a7336-21c3562198emr327337305ad.51.1737571208246;
        Wed, 22 Jan 2025 10:40:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:824e:c27f:8742:e4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a883asm98312855ad.151.2025.01.22.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:40:07 -0800 (PST)
Date: Wed, 22 Jan 2025 10:40:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, visitorckw@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Input: wdt87xx_i2c - fix compiler warning
Message-ID: <Z5E7hcmnkXUhyy9t@google.com>
References: <20250119084312.1851486-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119084312.1851486-1-eleanor15x@gmail.com>

On Sun, Jan 19, 2025 at 04:43:12PM +0800, Yu-Chun Lin wrote:
> As reported by the kernel test robot, the following warning occur:
> 
> >> drivers/input/touchscreen/wdt87xx_i2c.c:1166:36: warning: 'wdt87xx_acpi_id' defined but not used [-Wunused-const-variable=]
>     1166 | static const struct acpi_device_id wdt87xx_acpi_id[] = {
>          |                                    ^~~~~~~~~~~~~~~
> 
> The 'wdt87xx_acpi_id' array is only used when CONFIG_ACPI is enabled.
> Wrapping its definition and 'MODULE_DEVICE_TABLE' in '#ifdef CONFIG_ACPI'
> prevents a compiler warning when ACPI is disabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501181549.uzdlBwuN-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Applied, thank you.

-- 
Dmitry

