Return-Path: <linux-input+bounces-4185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892D8FF6DC
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 23:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC10B1F26067
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BCB1990A5;
	Thu,  6 Jun 2024 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLU3BSoC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709A1990C7;
	Thu,  6 Jun 2024 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709154; cv=none; b=KEq4MKWES/eyZjrmYOuSvnMR7BoNx+/gbuFM0N2GyVaAFoGXtkZM1fAf/wFdBEqu44ECKo7b/7o6K4XZZHIyTuPER69lGkQs4wD8MJAAM0jO4ghHrm9dv5Hcm5UUS8q00UNKPWKT5UluEUz8fwHzBHqoccO/ZG1M8cDx+M3MvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709154; c=relaxed/simple;
	bh=AQEw0n1PQ3PPKZS1xuirjyLBBasxdOf3dR1uHUVQqWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUywphvbgDbvN9dJ13a7JvC/fz3CkAQtPUkKAZZpaDU1cfD6PYPNZZ31/s8dJHPy/cJwyext+b7Lz4/u9/Eb4Jl9TRSKjHsmU8RcE9sm5l0ZeRq7cA4CPyFPMbmgpSErJVm1h31xoKwkr44OwmpFO/HUIyfWeJi0YGT480MUZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLU3BSoC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6819b3c92bbso1125127a12.2;
        Thu, 06 Jun 2024 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709153; x=1718313953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rykr/nAgX2VtLUgEisWKL8Oq+TWzbcUl8duCUE8HtDo=;
        b=LLU3BSoC2S3Ue8ybDoXtQF6D0TvzSu3JXSN8GYxblq1M/0Cn+Hij38ZeGVKse8gQq9
         WoblPinqcYRsSu1VI7RPVs1WAPMnbtBmf4rKGty3Cz/Hu9oS1aXK01mHNwpMQYcIh9gd
         6hQGGogN+CTnIs24FH6Ugmv/waIxpjBLEjvNTASmlGRxqJB3SnVC0PSuO5vkSbvmLohV
         1Y0UE3Fd3Sl/Y4yoBNA2ADrVolnqCKBjN1IA+RPqyx2h+A6fphfTc48wC5oO/vMN26dG
         YJN+3jPgaO9Q2auyfigxklJ4/CSmR8IUKna2cKDZh77XMz1HKDl8TWDgxZruPjarwHHJ
         U6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709153; x=1718313953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rykr/nAgX2VtLUgEisWKL8Oq+TWzbcUl8duCUE8HtDo=;
        b=cu40VNAFLH2wZ+VM4oav7iZ046H3lJ4rdnLqRYi1dWCEi3oTqvnNd9Pgn1CGYF+/lr
         BfVMU9GY6vKRYI671S5uGsU1EdT3CXZKfGCQhV+TpxxMJ1d6Tsx6Y5RFC6EnE/CfGuhP
         ieTQJgWYB4LBi7rb0+6navdSutmJ8wATzdZ0XobSdisiD7cUVu9O3CeP4b1zDpDQLUzd
         VbTCKUr0RPiDCE/vSSosSzOe2UDh9Rvz76BKDxLAZA6rQJKr0FVqsYV8QQIxqGsneD/y
         DFEX9L1HQ8+AaGbSdYrOEgH3MEr7W8p7e/zCVvtJOEV/PYcUErZaYy4cZxcHH+QFCITw
         LSbg==
X-Forwarded-Encrypted: i=1; AJvYcCXggl6/wGAKWx8k+OckIIk/RUSto0hzXp/PDg2BJfiBM9SL9k2uhXxswCFgUnu5KJhvQfUlxfKW1JPTxtIy7Tv0n4VSv4osCEZ+hfI7
X-Gm-Message-State: AOJu0YyTNmY+atQQh5zuXAP8bFOBKyZVD+3j+OQ2Rfh/syIEi4rnmO03
	7OqMSWKyWDEzjE5XNvx8kMsO/BqC8P9ArjojTsz0Hu2Dioe3BZuetj6V4w==
X-Google-Smtp-Source: AGHT+IGOij6+OvNu6o8fnnMu6rwTNTHfv7BWRp1r/apNhWCHx9fw6BB4JTSk6fESjOOZ9VKO4ryRKQ==
X-Received: by 2002:a17:90a:c250:b0:2bd:69a4:b886 with SMTP id 98e67ed59e1d1-2c2bcaf9703mr858997a91.26.1717709152752;
        Thu, 06 Jun 2024 14:25:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cdcb:6470:dec1:846c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c280639a1bsm4125938a91.5.2024.06.06.14.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:25:52 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:25:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	alistair23@gmail.com
Subject: Re: [PATCH v2] Input: wacom_i2c - Clean up the query device fields
Message-ID: <ZmIpXkh-yhMu_pyh@google.com>
References: <20211118123545.102872-1-alistair@alistair23.me>
 <ZmIozAu-R1nbRYHF@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmIozAu-R1nbRYHF@google.com>

On Thu, Jun 06, 2024 at 02:23:24PM -0700, Dmitry Torokhov wrote:
> Hi Alistair,
> 
> On Thu, Nov 18, 2021 at 10:35:45PM +1000, Alistair Francis wrote:
> > Improve the query device fields to be more verbose.
> > 
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> 
> Could you please list what has changed since v1?

Ugh, sorry, I did not realize that this is an older patch that I already
applied...

Thanks.

-- 
Dmitry

