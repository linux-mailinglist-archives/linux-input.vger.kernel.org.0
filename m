Return-Path: <linux-input+bounces-4033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 133208D7ACB
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 06:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9304DB21809
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260CF12E5E;
	Mon,  3 Jun 2024 04:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjdyH52g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335217C;
	Mon,  3 Jun 2024 04:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717389526; cv=none; b=fmcEDsqQqDUDY1FxxFN3Bqm41UxsdIw0M5Mk741b2i2pZgF3hxLL9uR8fY0QxKh3P943o7/UpTJJqotX4kurDKx526BfNDLuqNUREfdVZ0or/zMBhlGBzwn7EeLCyG0eMbHnG0swSyVu7+UQpbHr4A1H0xn1fHG2ylgfUM1GrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717389526; c=relaxed/simple;
	bh=B/4OC2TXLls4NoANvnfEtjfSypBpELae+Ph2qt/PRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZiwErrdHWsGwwju0Q39bdd9QzarmteDIVFXdRX7c02rrT1OW4fE6xTVEnQr/6EgO0HYqf72El4h+PTpWES/zHAonm4+5c6m+d+wiRCVydpz5JGKaKKyPZxvm9XiLEsn6fqijsG8k1jy1oQq6xCoD3DFZLAAnb8O+FHHXmwFKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjdyH52g; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2782184a12.2;
        Sun, 02 Jun 2024 21:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717389524; x=1717994324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvuvtcETf9wf1Z8H7wWDONoJS84x1D9R4lXsvqsdFCE=;
        b=VjdyH52gSWls1ahY/R5oQs008m7ZlWD1JbqtpIWMKbj4vZsh/3qWdzxsJrlOHT+eWT
         EqGC1Prey7N6oSPJyuql+hXf90IYBX8/ieLWkuopcglpRxlR7OxQVGMWSh7vBP0AfJM7
         ho342MWpIozMyFueOzMl1lV4dpQA5hIa5BJPOPsaXSAPDI7qdQTboiG4U3hbr04/YTfe
         E/XJuyNsdy4k1qrXvdPCCc6KcWRxsr8BkkAIEx6e+K2hqEQt2+EeaWUEU6AmmSrzJXU0
         HXxPciMaktbL2wtXNBIuyzMYV3yv4+rs9FVdlB71w9zMJV8enwTwh5GC9iZcSPb445KA
         88hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717389524; x=1717994324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvuvtcETf9wf1Z8H7wWDONoJS84x1D9R4lXsvqsdFCE=;
        b=kHG8s+610bddyNr3CbP0/4tciiD3f2vANZjj4hb+zEPESaZiVf5UdTqGQqOXjjPf+O
         il+Ue05bk1xIspoQTMWc7YLet/qRlHInfebNb0ZPzKXhCtoDfP59KGUUPZNuPNVqbkyc
         BSMhzm2hWLa5IWVkf4qUMQl2XfgtvfBW6nnCzDd9new5iduZtVxYXIx+BI8RzkmBGtu8
         uZZhSh1ALwaUyJa9AGtKtoiiJeBNFwVnCvsPwZcrsiM6i1MD4BCRf4U+txCal16A4Y+J
         OwlE/++rc/bUulAG0XCxaQ4F6f+HOGo1IYSS5pD5ol7SjRorF9HVevFCsGUmSiFE5Lsi
         2tsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWrq9eeenME4YNNsgXtkniGvfjPIBCdo+6nHsqM0sPnC1TNH8B+Dzpu35Uh8KfCUcmCth1HmbFgQLjEEYK7Mr/oMJUsruj22JRzgt83ODJajyZU0qI/yf7vmLRgAg40UNmIsqDJxFvUIf/Uc1d4mvqy3ySCBEsR4z4apw8mQXAHScDIIvl+ICvA+g=
X-Gm-Message-State: AOJu0YztfOjqzmKsveJKlJeg7XYbsuTISELnWhuHk7mCmMF8FVcUZuf1
	xuGktKMIPTcGmuumGDSQsgLbr3vA1SzNAcvSWKFK7Ac9bwZLEcBS
X-Google-Smtp-Source: AGHT+IH/P7bMjY1voJ1Fzc6t1VkK8TfZ3mQaC5jxguHKH3lHgb9jV0qiPMIWPUq+ztkuKhLOP6y5fA==
X-Received: by 2002:a17:90a:f495:b0:2ae:6cc7:23d8 with SMTP id 98e67ed59e1d1-2c1dc5cd0e3mr6376226a91.41.1717389523920;
        Sun, 02 Jun 2024 21:38:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77bb500sm7408093a91.49.2024.06.02.21.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:38:42 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:38:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: keyboard - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <Zl1I0KVbTEDaIPv-@google.com>
References: <AS8PR02MB7237277464F23CA168BFB3B18BF52@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237277464F23CA168BFB3B18BF52@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Fri, May 24, 2024 at 07:33:08PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

