Return-Path: <linux-input+bounces-12483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10748ABE265
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 20:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B501BA69AD
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 18:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710F625B1D7;
	Tue, 20 May 2025 18:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzK2WITH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67A2580F7;
	Tue, 20 May 2025 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747764952; cv=none; b=KsUeO7Dsg34U3lmBZfM1GqDBtkGZs8kqs4ov6fd9QFD8Rg5gRdAh+0ZBskME0Z8LuMrMIXstpVf/9Eq5P4C4vT5kaOe1CE0V95xppX7XcfBY35d2SEeoq4RA/m7Q0SH3RT0Veki3INQfCdS4EunbhACWZnWPaq+NYtZ1E+uVQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747764952; c=relaxed/simple;
	bh=gWW1its+pRU+jVBwnp6+Nlt1XMULMdHybdSfF6WhcUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyFMlaBNesGtylCfJKK9n9NP282kHZ4qwp4hmr9jcHrVjLbpekIznIl9Ka4bc2glj1eA4qL3FHMxauctgMivlD02lsNiO9RaJF7Jy6YhCDAAYGU+IO4iLCHzuT328TZhRU7iyRNZ/LmNcwdp0XJtDxidB+0QPt5CLfW/C5A40NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzK2WITH; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30ea8b7c5c2so3316998a91.3;
        Tue, 20 May 2025 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747764950; x=1748369750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwBEe20YzRFDk3bXuCFMe51to/DINvILfedoZiBzDAw=;
        b=YzK2WITHFVkoYg4EvxeAEj48pWDqFjMCkxcLMnFDhKozynS9txzboDS/7Re3MkjXXE
         h1t7yR0rAPbALFfKfzjIq2K//cQuEw3zb7VsoVh7O4vW8D2TQccF6Uy8QXg4Ex1bKbsm
         3ArfzqhSFs0KRnJ4Jl5jfNHrrwpo6kkafxOQI9zOPZ2Och8c8XeefJliYmWJl9Ust0dB
         IwI97BOX+3q7J9i02n9KiTeyjffprh+7Kz150rQWHekiqnJrUqIdkgnhCKHoRUrJSLrJ
         JEf28rh4Y0t3dOJ4Z0E92K6O7u5mvzyq1JZDrgWL+UH3DpjMQ3Gi9CdOucGF9XHg56LB
         6nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747764950; x=1748369750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwBEe20YzRFDk3bXuCFMe51to/DINvILfedoZiBzDAw=;
        b=f7e8VPMGgBCDf9upVOO1pVNoIgdY2uulC1VaFS6yjOLfK6ZPf36QqELB0r8O03qjHW
         8w8RRyUJKvXgSs6FsrI5v9WDkkoF/S6dWlp8anvLNsfzlvQ+3sjV99E2X7B3Jez5c342
         mG/bQanvWTuAhqKOcpo6GJWFnBe+RJRJUQtlJVUr/oW3DUdYrmU2QF12LM6axn3hcFMQ
         oCHYxvdRGsEDrsQaxwLo+2SKuXW6/IYzWBoEAvduKzzo4uEsW3tiPG4uF2wubF20Yz8W
         kDmuNxUJloA3qDPJqirkf8D9ePTCP0H6NGYqZ8vxiTOp/S2iwkbrL2b7h9H0ZtxqAGNd
         h/5A==
X-Forwarded-Encrypted: i=1; AJvYcCXGRSNzkBD4GZ+S7PPqeHjOgCyxRpjN1WsZrCsC9BzDchGdi486Ko/UrbE+o3jspqkfuDmqi0rFBeffakk=@vger.kernel.org, AJvYcCXJcBA1XAM+Tj5KPR7VH6/Tr03gWRdGyOgB4YWvPdOlu2C5Xtsz/rvXvdoruGjyL2q94eXH038+pCxj65iX@vger.kernel.org, AJvYcCXP4gXyxOtrP8/kzABMWUP/CcrSWEDD9I0x7CELG8arte8oHrR7Imaa5/pHqCWq1rPqWBWNttlWG6Zu@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCmjXUmXwVET8Ah1KKujKpqXAbvBwo6J53WJXduvjv9wFDm1s
	qXtxSwgcjpoLTEncAJ/DzkhzxVsftDvsYJ1x05hbHJd3eC5/1YD31W1N
X-Gm-Gg: ASbGncvqLh87vQ9SMAngxcQ12mg+0w70rIyfggEoV/ONHcA9Nlq6kNQK7YC5m6iPZlm
	C5Y5Vt1Mmt5HyrOGZUATMOJTUFeCMfbokFdmWAsYXBYNAis0ImkWcm5Td2JhtmK56E+qT0G/pEl
	iT+rx2j4BuFHQxIJfIuTkT8WmrFQS0xjODgovU1guZ8upwr/60Ux9lkmt69iahmzrHqF+1GI8W4
	NuSw87JlbeNq+YsYM4rDnnPNGNAQxueT5ziUQmP2GxhRUyC225nDxPsiCacLvl0xSA3Hgu7YZP8
	BUU9u89fMnUmYPnK6yVtZiLn6nXVSBMkF976mVPoq4/84KAHQZJ0Tl16Ih30VtJ6FCAY6IxUtg=
	=
X-Google-Smtp-Source: AGHT+IGbB0vnb+DJNpPWratWV67dA65t5rpBhUYFtWkcTxWG0FnGyJ8c9DxzOQniu2kRWZQGmFTqhw==
X-Received: by 2002:a17:90b:6c8:b0:30e:8f60:b4c with SMTP id 98e67ed59e1d1-30e8f600d77mr28777833a91.16.1747764949997;
        Tue, 20 May 2025 11:15:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:533f:75df:b89f:cab5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d460fsm2011421a91.23.2025.05.20.11.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 11:15:49 -0700 (PDT)
Date: Tue, 20 May 2025 11:15:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Job Sava <jsava@criticallink.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, jcormier@criticallink.com
Subject: Re: [PATCH 2/3] mfd: tps6594-pwrbutton: Add powerbutton functionality
Message-ID: <sfan2cfuxqvfjlwltjmtuknfm3egxahou3pmlcgovvplwdhls5@3vgrlhtztisq>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-2-0cc5c6e0415c@criticallink.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-2-0cc5c6e0415c@criticallink.com>

On Tue, May 20, 2025 at 01:43:37PM -0400, Job Sava wrote:
> TPS6594 defines two interrupts for the powerbutton one for push and
> one for release.
> 
> This driver is very simple in that it maps the push interrupt to a key
> input and the release interrupt to a key release.
> 
> Signed-off-by: Job Sava <jsava@criticallink.com>

For the input part:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

