Return-Path: <linux-input+bounces-13318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13EAF02D4
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 20:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1FF54E2864
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 18:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CECD271442;
	Tue,  1 Jul 2025 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6GSAIVi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB225CC70;
	Tue,  1 Jul 2025 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394918; cv=none; b=se3J8yH+5rGq0rI+BKj+aALP18k4cyrIbW0leSczudxLAnRORuP3rrJdiKESugSkdXoUpdMgXulvAb3M39PZA19jqd6m5PCTKhKFz6Z9pzacoJf244G9ZLCK4OnewosuKDwNAuPL+RELJd46iGhMkbJhD2xhwKwUnjsso9r1WOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394918; c=relaxed/simple;
	bh=z1+Uc9srPvD1/R3lIeqlBunoBkXDL5bkXA03CQVpf50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBwwFFpqCRPMeyTlSsizT0U/1cR0koUk84j2cpxTJSFvlEf4xjlvJDqwLAClyLyWxO6gcQ/p6DI4YReg43K7ocxqH4LpIkde3ACyh+uKDZ4TvLz59zjs0acvcy6oU8hgiPpypVbV/xtyygYugSLkrFc1aMmeBZHH2Ibw5Qp9QnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6GSAIVi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7490702fc7cso4385165b3a.1;
        Tue, 01 Jul 2025 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751394916; x=1751999716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Da9hPRD/ytYbduZJlqkXBHQRUjaFlL1rFU3+1oIjeEY=;
        b=Y6GSAIVistF8UJ63Cbv0rU0NyiyimmMMg0F+DKp4Wtaqk4qfrIyBIYVK1V5f68+ZO+
         TxqktcaNZvaNgVw8Y6iXBweY9oglJUJOw0Y1bWn8nkHx+hpIZH1CtbMjY2J/r8gbvNuQ
         NcbMtqy5AIur6uu2eGrQH4cmfeMmFYiceR1hB21ZWZRD8vQHqaQmjUa1lxAj6o0o0Cft
         Nq5rd65BdbDgfEdUm9uZaEWHkVlqCncxEO1jZLoCah/mvWnVw5NUlg1FUPgfCHhsUL6Y
         cqwVQsEQYVTeUq13DK5aarn83Sw320jTLNsPUeAvBBGwAqbb6WEO+e1Lwkdl9S3CgFHz
         HQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394916; x=1751999716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da9hPRD/ytYbduZJlqkXBHQRUjaFlL1rFU3+1oIjeEY=;
        b=sqIrp8m0NrbUcxog+vQUhjEC2WS2WTIOgH6RSfvi8kZWmLe/egt+RKhGgcNmDIrI2K
         gMbq65BaPHETrrCioriTCb23ImUh9qxtV+KEgdaJfNDc2Xd6gPiOUgCYsykx/4cqF/3M
         oi0JR6e4P8+b1By3xmEsW6bZtyEe50E5FBI9SquzZtAIoCqiVXQ0B+L56rBQyXpR7YQi
         KamA8tWUBy4n+CTX9ND0Py3YuZmAEvJ6lNV97/32kEAnCbDc0tRIXUTZi04ys9uYwe7x
         vKtetm0kWw1uaDvwcQjgNFB9aK49EX3PxCJfoYoxCI9fLLIhFowVChkRJpxFTv1BHeCa
         NpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvgDych4fSxYO6xjI4QZcdXGg0PqPWB/BPCicZ0rPZfiQ9WbbYE9jFOFkmGXXu9G1BGWn7j4HrAJCLc9UL@vger.kernel.org, AJvYcCX6IPPasgPw1ngdLd6bZDpepTg9R9hDqyQooYUUApFqM3uxIB5TrDK1S1qtxLblcI2sjzZpv0kEU5k1ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7nGhOHDj1vtXQ0b0jXeBUUUuYGbkGiRnMBY7yImMmSH/8mngn
	dnwn86h/sEwaER7YIilHnqpvbEbJ8ijSHUbp/OlLigFA+7WUeKSFUFcU
X-Gm-Gg: ASbGncv0oqWoieuExxUin+3jjs/UF8GrIofeEoia4pczfqqPIxsH8YWuoebLkxAvWl+
	h6skyyF5+ID3Xa1kZ89Eat2Vxk6JA5h/7crQaBut2dlNzB9rHvFT4ij5cr06MJDEc1uVGxXA3zc
	KHH2xMfGICUeFGoKXCbL9iOkVQwQH2P05CuguG9G1GvZb05LEZfSP+riJHKEwgvhupppHbW7gnj
	Ur7u8vjHyrFRxdKnzRxr+23uePUY4IexeK9nb2N9UENoF7jh6E9VNYZXYaDAlzx5CB27ZhYwTzn
	z4aTH54V8gcApN4oqj9+5ZLMooOtCUiGbA2VokeYKReKY7XuU/nuT7/tOPw9pPY=
X-Google-Smtp-Source: AGHT+IEZpLnOqvqrhYyHtVT4XdqwOH/huTE5huFXU9wBMlO5za2DQi9dmFfn8rUkcfYVTx3d+XTmww==
X-Received: by 2002:a05:6a00:4fc7:b0:748:e38d:fecc with SMTP id d2e1a72fcca58-74af6fcd5e6mr24493660b3a.22.1751394916165;
        Tue, 01 Jul 2025 11:35:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c8437sm11909074b3a.115.2025.07.01.11.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:35:15 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:35:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jogletre@opensource.cirrus.com, fred.treven@cirrus.com, 
	ben.bright@cirrus.com, patches@opensource.cirrus.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cs40l50 - Remove redundant 'flush_workqueue()'
 calls
Message-ID: <zgj74w3pui3mybsa3vovspotsuz6hj732hy5g6ezosaxfpoard@ijq6h4kkw3md>
References: <20250312072940.1429931-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312072940.1429931-1-nichen@iscas.ac.cn>

On Wed, Mar 12, 2025 at 03:29:40PM +0800, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - flush_workqueue(E);
>   destroy_workqueue(E);
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Applied, thank you.

-- 
Dmitry

