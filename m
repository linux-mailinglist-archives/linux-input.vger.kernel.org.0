Return-Path: <linux-input+bounces-15139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5002BA6787
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 06:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3521B189BF85
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 04:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E923283695;
	Sun, 28 Sep 2025 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abQhTIdn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC628314D
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 04:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759032629; cv=none; b=KD9aNVH0PDYDOfA0MFzJzvX/nvlbn0B3ireAjq1g8mme7UGyZZ+foss+Bu4S+ss6hV7J8f4XbZCiZbbBK4SuLMT7+dC4vJl0UhH7LKig1X6i3fvQZR2kMzSlGSJRPX9XvMO4VUO/ka4Sz/a467Qm5AhRhr9JIFx/0LSy2u3xbkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759032629; c=relaxed/simple;
	bh=MT9tKkwXIZXiyVLaQ6s0/YQ4jUj80adYH+HGV903H5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6sv2PaGkUh73jSqUG9pP6iVc8msALgok520n7nXprTC1+psxDLLB4DKfxzAXF3GCSz7a38RPoxhgAISrNJLC6LT2hJTe1TaYK+IufKA75l4Gll2gENfIZQxOvEDSo85z+IRlAdvW8yzHOjnHZg0ZNkmAxl/MmG7K1pfXnC+grs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abQhTIdn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so348522b3a.1
        for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 21:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759032627; x=1759637427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzG/7kOHEfeLkUdxagU+uDSqBvkgOfJrlSWLn2MJmZc=;
        b=abQhTIdnMMhglJwaoBcyTozeCd7g4/u7soWp+Vgqfclv246AlRjtdSOUndyO7ns2Ds
         2htXqQyRgMneAZcrLZQKKznYd0UThV4TEkanp0taQHvBoPlyrGOA3J3+GbLxXo7tFgsL
         qQE+K+wfCiXkeRxKx8IAhaE8F9FlIoTI2QdoAZXwunWmVh4XUTyZV1Bz1TCgKZcvOoFI
         dpJ9QTmjWMl02Ec6bl7j2ooyHsIVZvYcZ4TtjTHNIXtNqnW4qfU5uExmzKYhPFkbAa/8
         GnLwuA4q6L/5PDH45A/ecpc3RugmCrczGtbY1tzW+7nwvg8wZfU1iM38I9IXdBsm47aQ
         DsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759032627; x=1759637427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzG/7kOHEfeLkUdxagU+uDSqBvkgOfJrlSWLn2MJmZc=;
        b=BoIgWCT5RFwRkdMLm1FB2GZLxbWLGIppD9yCnvgBGHxVQIgZSrdnxYDFSOblQC7bu9
         gZz405bLCb8+OqxrNwuukBq3mBtsaALCPVrtJI4ZVkTsUftznNP8PzYas4vBLcKhzguB
         pqhRgeVrkHpoGF6MNo4cdtSHLDc14+UMCKFTxDgiK47IVb32pMLvY5tU8yWTzKAgoHR0
         Xr30T2mDTI8yqr56UqhCxJY7pw7H0EyL9HTU2ca+LMF6/VRSftOv4TscOhcMJbAY+Ess
         hPSz1nmA/a/QDH8xgIg70UXD61b8NYV8Dj6sSlZmzrZwwUyxuYd/q2Xcyx/v+zaeAggM
         ReqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe5WgpZXSbQWivTVLzQF8kcA/QAyC3L0GYf3Lo7XLh8gFbpSrbLYx6XM55V+13JPdU2FOs6Yjs3tBZfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNmXaHfR46hFaZOi4YZFr/EKBQiuEOKwA1t9X1tBaYQtqW0dX
	cxuL421rjsFysN7U3olLISX1qindrOZAH0B17lSZUnj4Z2viM8mgqhc3
X-Gm-Gg: ASbGnctjQuk5w4ThBOdbRGrIlDnxWWapIRedG3cVzxIfSJLo53fxXMDtIj8O58UM6Bw
	SjTWgT2y2PLHrzY0iogeEal+2gxKGzvd7ddqskGEACo+TvS0kJ8QuJTsg+wSr5QLrnp6+WEv1QL
	Y7tfrp9+Ng9zMlEbNbdb0Ngv+9a6pIctCZMj/D5MaJucl3K97NtoJcn9zqB2aangtwD1fgA6vNT
	HdvE9a82+u4nbPGMBocPC9g0GzPViadH2HwL2Lg16dXyiefSLN9BsauDCCx+BxOUbW27aPPKFhp
	SLgedCfJhJ6rNEsUTaaYp7Su4LC2QGHuqryJL2wOKpaxB9DMPhhA8fLI/VNRjMvIQI1EGSlKDp7
	pMG7Z8Jz848gbORIc99q045qF6aOxrU9W41BWqxsoTqcV4h+9Cop0GnNTeQUQYFg=
X-Google-Smtp-Source: AGHT+IEttJNR6dQcxc0S02k/NqvdYM08QJTyqxD8QfDYHrUp+FQRyRQQhuVbqr8Tkf1c0f19Ut/XAQ==
X-Received: by 2002:a05:6a00:3e27:b0:781:2538:bfb4 with SMTP id d2e1a72fcca58-7812538c21fmr4706553b3a.10.1759032626571;
        Sat, 27 Sep 2025 21:10:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:22dc:7b49:8c5d:38f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7844ef5d62csm154187b3a.26.2025.09.27.21.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 21:10:25 -0700 (PDT)
Date: Sat, 27 Sep 2025 21:10:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/3] Input: aw86927 - add driver for Awinic
 AW86927
Message-ID: <kzp2aodslil2urxszk7jjd2mhtx7amssn53g5msskwpw4fkvjw@iwqcwy2rk7ny>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
 <81822df8-1978-4f22-93e7-87b79e1fc9f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81822df8-1978-4f22-93e7-87b79e1fc9f3@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 02:15:42PM +0200, Konrad Dybcio wrote:
> On 9/25/25 12:07 PM, Griffin Kroah-Hartman wrote:
> > +static int aw86927_wait_enter_standby(struct aw86927_data *haptics)
> > +{
> > +	unsigned int reg_val;
> > +	int err;
> 
> "ret" is more common (for "return value")

I requested this, "error" or "err" is my preference for temporaries that
hold either a negative error code or 0.

Thanks.

-- 
Dmitry

