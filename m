Return-Path: <linux-input+bounces-12939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5BADDDBF
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 23:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AC287AC1B3
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 21:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A76E2E3AF8;
	Tue, 17 Jun 2025 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+RWcs+A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0D2EFD88;
	Tue, 17 Jun 2025 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194771; cv=none; b=eHSKidSDYvS1TRBf0yI1gCacg35n0rqRg9kM/wts639bZtkeriHJ7KeNPyE4hR2oM5eu3gWRz68ybhpvVQrfhH4Ap1rnkz4wAfrqNSdjzxXNZhxZdSj8UBPooWVSKN6ww3MvI1URBdzSSxSgR4+6gNkjJxA65x5fnVCi+6Kcls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194771; c=relaxed/simple;
	bh=/ZMU4IZCLKJZ5MCxD7SiFjBDb6ZcwMiAKf8DjG/r7ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm+6CZlnFwxhrv4FwOyrED7J8iCjHvGF6fLToGiAeirKH/x6MO1GNX1xR1q2fN6agKTYBQTjQ3jiY/iWIJg59HHrWwVK59s9vh5KtmLtw0RtPc+y86h0gHba2Eka5JIxm3s6tzbi8uLdUNKcr9jNbxQzgCUEqnMS/k+oDwAfeHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+RWcs+A; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1fd59851baso4077571a12.0;
        Tue, 17 Jun 2025 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750194769; x=1750799569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CvaQB65i1nAUIBN5pIaikJqPNlo97Mbg5ejhsX2HPKQ=;
        b=X+RWcs+AUFQJdg9yCfX7UeF8rN3Qnvoii7Ck907dF/6fcfbUQcMXKfcyRJ3uyV+8ze
         HJilYEVtDIXEdVtojif5fiRmojYFmCLjkL9TB8CziW+zDr6Fnmv/8QjlFSPZBWw/qkCu
         NbARTmL+4fIyj+cdIMKR0hKfhuO/pn88cObSF3hdF4hBxDrCT3Lou/G0WOWAHxPaC33x
         H5AtTeWa347VDaBFmQfdvdVkB7A2hpAiVbcWHUNL9fpJ/gBwzClbm9lrXf9kIBXGi5VY
         J5YIeY2hWAnsaWwrHF9Prm41MWzNc92hBnveh47i23yY07XWXDeesmygWRM2E4XZc8Vo
         QS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194769; x=1750799569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvaQB65i1nAUIBN5pIaikJqPNlo97Mbg5ejhsX2HPKQ=;
        b=tcPsL7xR8MJRPw33hCH3sYbVYAOotzsrXfBib4fXqD2LkCecNSre3GhS8A5W1KqJjo
         xRP/F6cXoahojSRBwG6Mczqz9jFeUGw/jqBRNt0iXfVCjFBydWt26XLHSDS8H6Vzjgsg
         OM4P0kJ9waD6zElNvL/B1u5KBSR0445q0oCGXqyHSS7NBxIdg0UWtAJ+1g8llCrG6CEz
         WI3N0Mu2SUMAzMFqHCvmIqTZa9iIQIqa5WT6gjcq9qf9YSC3toB0CD97v7DayUf/8HeB
         qszrl5a5dWvqHY+wlzdDF/oIZHHIBz2IkKGwmyhG0eIFmTvoej5s4mKc/jmR2RdmM2R1
         dANA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpWpo1NoSUDeiougZ8oIfLaZM15Ckn/63DyA5tiQeGT4vZydyql9CiWBNhgYoaCnEAycO1wOgY+agFw==@vger.kernel.org, AJvYcCWDGzyfthVDa0xdYQubLskR6n9Tpg4vyUCOe8I/Ymudkr/CmoEbOpOLAou/KdAZ1ImacTeGDq+LCPs3WWF/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsHg3DnI1CQ/0UGXVIjOYBrhHviHOvACecmjMu7qb5wy9fZL3
	0EHW3g1JtqcernyS4FQDLiuzN56M5hAD8Uug1uIzjJ9H/GBAelqC28Jo
X-Gm-Gg: ASbGnctxzRcAeZiVoQ6oXWR+Ho3OLz58V6gGbXPZCpm093XZhqAgGPv1SLxfupUwvPF
	LBUx5Fs5aDqjhuWF4aR+hStJxU+wzLGz9nGBEt919iIhdnx7Qs2HQelRX8ymCWN99HPeqSzaw12
	XLZ279N4IdDFju4izrjImEscsp/wlgjB+tOabkuX4CqDmYhxDi7qpynClCstlfUgkxTK5PPtGEf
	ZPJb3DILnlUlMMmy3bT0/YB47lNlsNfp5TGgRFNHzjQKvCSYSmVnokg4CtZCSFG4FX3WlCGEHB6
	66SX4qO+tAzs6RWOU4Ee/6RA3/u67T//EAZdL7Om1sxxIGF1c6FD5gL6B7THSLk=
X-Google-Smtp-Source: AGHT+IFzJR0bljyfS8j+i0qdsC1qELOq4eXRYLRLp58zlzJs8Zkne4rE3KlHYYhXHNawf4+Ic8+OZg==
X-Received: by 2002:a05:6a21:4a4a:b0:1f5:92ac:d6a1 with SMTP id adf61e73a8af0-21fbd4953fbmr21768368637.4.1750194769347;
        Tue, 17 Jun 2025 14:12:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4cd9:8b8e:24cd:5a36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900829d7sm9375336b3a.80.2025.06.17.14.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:12:48 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:12:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sangwon Jee <jeesw@melfas.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Fully open-code compatible for grepping
Message-ID: <xm5eta2774qnyu4cmah5xbo6n77z3ikt7ocadwkscbp24hotqv@kjtmanetsdff>
References: <20250613071653.46809-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613071653.46809-2-krzysztof.kozlowski@linaro.org>

On Fri, Jun 13, 2025 at 09:16:54AM +0200, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry

