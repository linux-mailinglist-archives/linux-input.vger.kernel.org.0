Return-Path: <linux-input+bounces-12048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3585A9F94F
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D9A1A81BC2
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F1829115B;
	Mon, 28 Apr 2025 19:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrhGKyt/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED01FECB4;
	Mon, 28 Apr 2025 19:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867960; cv=none; b=TQlAnd7+PAiJXR9VE4FjNcbt1ybqgneB8hkUsZGqJ7cl8qCdeXlkIYZlsuaP/ruzod0hBwne8akx71cwz+4L61lbNqaq3d+vrnLF0v87z+L3Z4FVO28/L4dY3Y+Yu91hTE6RUcARhtFR5EzJG8ftZpazLD/C47ZxHcaQtDIh3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867960; c=relaxed/simple;
	bh=BrUp0nJxKY420p1grOxNlEERiDw8TRzTT9xqyvtD2fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO4ihk1U4akqPnAVrXgw7g7XGDRtaDncctI+D89oaaqKLYUX74TjEq2zOvmJctTiNBb+CpVORZaGSjgR4G5cxz9waoL57r6oD7j3yRH3vU6NGV8r1It09cauVcTFYZJzPI/Sp2cMHjaQ+rDwyOS2k2jvV53IdQpUqsG5jjz9S/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrhGKyt/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3035858c687so4358278a91.2;
        Mon, 28 Apr 2025 12:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745867958; x=1746472758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgCtF609xcKndtg2owySEhQv7l/vQGYnhH9MvvsxaGk=;
        b=IrhGKyt/I+dzCrXRLTvOvN1CWb63qrIoRiIo24Gt7RcqJfm8czS0xjfNoycQD9ZteT
         pKXTV7KChLjcxWdwt/jz7V0Gq08oblOODWhcgfrJMxEu30ZdO0fe9e2jvWh3ZQk+HWl+
         83hti2vseXF/ryRA9+Lf9qZVcjvj/JBlgb4tMO/7uWz5XgUEnFfQXjepmBTUWqW1l8To
         Jok59D5MmxQE+JT0aeqrhemgOJB5SpOSaBUAFJWIRRRfLVBmwHY5uGxBYTgfm8iah0C0
         hPTBE4JpSjxxoUS5XuJcdWjHyVPJXllcomoHcOeDnPzB9UdED/UJAtOPamSidrxew5t0
         e0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867958; x=1746472758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgCtF609xcKndtg2owySEhQv7l/vQGYnhH9MvvsxaGk=;
        b=Typcl0tTF9J/buX2ILxHECZBD8ozikZ43w8BlZVJhXsM2FR7IYNI9eJh70bStD8YUK
         /6QteVYyf34Ibou1uscUob6I5CJg3sAhbCdY68BsbQlWKhQkDXYbb1YPohtimBAbI3VP
         s2WhGK6u0YcXiIIvbQARq8m5yjviY+m6TQNkb+PFcbIy6HZtDaHC+KOPda69fKQOMcIx
         Zc3WDi7raQEEv/FzpRivAJd0uwYfRAXgkr6E+Hk5Kpedno1jdmeHMf9m9lsb2DgVJzc8
         zJMozYQ/6ZkpY7lqRzeIzmbXxVYaglKcI6AzIwGo8OhaaSe4bPAlIQOF/QQ9vx9AjYWV
         tmCA==
X-Forwarded-Encrypted: i=1; AJvYcCXO5Cipxe+1qBnyxhDHK7hEuEhKvU/wvP4lt72iyQFnI+1eV8K/pe1JUGfHkl1jlI6XJyNlS7ek@vger.kernel.org, AJvYcCXZAHzVn/UBvowFWSrVDFI4xG9X4yBGWyERBcY1F3DLTwll7hNIiJQkTzR18J1PieVcFWJKCh9AJZXVOA==@vger.kernel.org, AJvYcCXsQdg9eQNIocxRZoOl0WAh13wVx5N7SpOtoeG+tVyProdQpUzP++RXRV5Almm64i4shgbuJMaHlFpfsbzY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzx8g98XAHpc4fOpEI2dDNG3uqTPJQALRt9EGH9i+Q5JrA46T+
	QATDQRRxwJJvvafxHWayKrR5q6+Hstzkssbdcnp9MzP+uIZiwGJo
X-Gm-Gg: ASbGncv72cIVuS4SLwSwsq9wRqM7Likgvrf+p2DtkkQmceVNvqGT3++sBFS3FsNTJY6
	Jr65z03vXLcVc5JbjtffvgX0LLzeUtHlRUojBXlQwSJqifWvREUk5B+fkUVuF6TlP7l95AktGqa
	gFFl71b1EjraFRbjLzs0TSrxDxoJUKsTGk0hA7qPEY2amu5hzr07f+h2D/qyhqeS7frtTgYZFWo
	liy1FsTJ0VkObOvfgP59RZkNRyOqKB/BXo3GWLZzRFXPHF/a5HGZD3j41DxKjrtAsKNSpVDWtuE
	IocOCnpotq81xAgMHyux8DB9T52YOwE3mbWKt2fJ
X-Google-Smtp-Source: AGHT+IGAjdKlZf7vr+mPAgNIF99JKmJUUGWr/DLExKdSgaX8/yizgBS5OVmBzIQD1SJYTXSWMF9CCg==
X-Received: by 2002:a17:90b:384f:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-30a215416b8mr1416965a91.3.1745867958254;
        Mon, 28 Apr 2025 12:19:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9424189a91.9.2025.04.28.12.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:19:17 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:19:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Maximilian Weigand <mweigand@mweigand.net>, Alistair Francis <alistair@alistair23.me>, 
	Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>, stable@vger.kernel.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: cyttsp5 - fix power control issue on wakeup
Message-ID: <4yohupeiamzt7sw3qvuj427xsulpk7jcwyixtljhmbih3mzos3@nwyuv6hbxvzz>
References: <20250423135243.1261460-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423135243.1261460-1-hugo@hugovil.com>

On Wed, Apr 23, 2025 at 09:52:43AM -0400, Hugo Villeneuve wrote:
> From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> 
> The power control function ignores the "on" argument when setting the
> report ID, and thus is always sending HID_POWER_SLEEP. This causes a
> problem when trying to wakeup.
> 
> Fix by sending the state variable, which contains the proper HID_POWER_ON or
> HID_POWER_SLEEP based on the "on" argument.
> 
> Fixes: 3c98b8dbdced ("Input: cyttsp5 - implement proper sleep and wakeup procedures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>

Applied, thank you.

-- 
Dmitry

