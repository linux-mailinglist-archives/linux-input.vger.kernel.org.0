Return-Path: <linux-input+bounces-7516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 711809A31AA
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 02:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6450A1C21EE8
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 00:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E17F2BD04;
	Fri, 18 Oct 2024 00:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaO1SkEJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C0920E309;
	Fri, 18 Oct 2024 00:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729211523; cv=none; b=Vt1HHu0a3GSjKk88ISxw8tUNioLyWCM+iVOwooNU+Jz2t/dn8FEU+pCRrowcyzcboyT3Ml5sf/qbGIiAw4QtYPY3RFkqmpp59F4GMH73zuX6Cnz0rExQ+/lZAoGDny1tFTlw8+q3vdPpYwrALglusiSSWa3IWLr26XFCCssckps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729211523; c=relaxed/simple;
	bh=Z2CHYFX90bPOgNfDMKo6F3dhYoZWbpNldEFmCWByjzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4A+koC0uWX1Q5NMH+JglkWkL1rAs0lmQH2ZBSqSQkqDpRJvae5sgxK3+D+4QFye88qNggzZ/v0Dx3oy6ddqglUER2/umk0zAFagsIFmwgedZKkTGj7VwwPgZT5JsKwYIiLlaqEC6P66z9TEK9/iMj3iBadDsCeh7mgvZ47R/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaO1SkEJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71ea2643545so275837b3a.3;
        Thu, 17 Oct 2024 17:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729211521; x=1729816321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9TaQ9jLKsHthLkNEyMhi5newVAYD+QTVeRFDRUl6h8=;
        b=VaO1SkEJXo56nNoHnn8/q/xZ0vLjQNUru7WBnOVaIg6KP5M/SOpCSyLhHhwhpC9vR4
         bzEj53Bzd1Lsd8HkCTFFuELwBfXEjaZJwr6oHk20Uq/66TP2EVJ7CnIUAgJwXBQm/WIA
         1AwGKv/wRqSX6YDATydMJzCrQcWQKGk9jg6F5APrZbNF+gT5G4vwGeJHqniGiSbPnAmc
         pwyPHpHHGJckAO5+9wx6P/naE35nJMx75jUeQAMW671qFTBk69DmqYCheOfMV/x2EpdQ
         ocPFRZw2jmAoywNOGhdV6HvpIId88rgiYLmI0/V+cMPfwIaVrCvf9UbRC0fDaglAYPlr
         6ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729211521; x=1729816321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9TaQ9jLKsHthLkNEyMhi5newVAYD+QTVeRFDRUl6h8=;
        b=u+Wfl/vYZtkOJmaEIV+Vt/Pga71WnCEgNs691893qz3OgMkPIvUyUU3z3wAVO1xcja
         78zfqbfs4UTX+a84pKPsCn8/DdPh2J0faNvBVTLu9n/XILt6QMn+N4uu9kMVldeXjzhy
         UA8Z8/THW/y5ipvhdIUiS7muMlk8gqQU3iXYJtx8YOePxf8kl+RI9NGsxviFP6ZMQRD/
         mLd+Pbu1e4xHPP0a9CQtl9FYNYeJbdX2cnvvpaPhKz/PdXZkx411cS/3nlOJyDEkfBSG
         ctl6MVDGNaImHRQyOZAQjqGzUEodfJ6lNU12cKYmD3litLL8b6iqUGZvaSMdbgK8WZwD
         Rg3w==
X-Forwarded-Encrypted: i=1; AJvYcCV/OnapHRYAMn0QkLYTefCRRUCut/07s/dKdQDcOrzO+sdqA1/BBdUu+QS29kZVKKySQwBfdwykFly/pl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aBQcUaPpGN88DVndIf+d9BVv4mNWbJ+eTntGGTsxF2pvBL4Z
	hC0XEtZ7BMq1hhHyY4i0YeziUpXCpBZmN1+mz1rl+4X7Rb/ovWC8
X-Google-Smtp-Source: AGHT+IGbcGq1bF9rYC90X4JCirz1BO+pZbDtvk5/pyTvyfQ3p4K0FuzsuclvjFtaOoKEPcir8tIJZg==
X-Received: by 2002:a05:6a00:2302:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-71ea31d2c22mr1343853b3a.17.1729211521085;
        Thu, 17 Oct 2024 17:32:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:136e:2635:ea46:fe25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc29bacbsm201445a12.82.2024.10.17.17.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 17:32:00 -0700 (PDT)
Date: Thu, 17 Oct 2024 17:31:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: itewqq <shipeiqu@sjtu.edu.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v2] Input/mouse: cyapa - fix potential buffer overflow in
 cyapa_gen3.c
Message-ID: <ZxGsfjTpw8KkbXtt@google.com>
References: <20241012100801.1774302-1-shipeiqu@sjtu.edu.cn>
 <20241017080104.1817636-1-shipeiqu@sjtu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017080104.1817636-1-shipeiqu@sjtu.edu.cn>

Hi,

On Thu, Oct 17, 2024 at 04:01:04PM +0800, itewqq wrote:
> The i2c_smbus_read_block_data function receives up to I2C_SMBUS_BLOCK_MAX
> bytes, which is defined as 32. This exceeds the size of the struct
> cyapa_reg_data, which will be provided to cyapa_read_block as an input
> buffer and finally reach i2c_smbus_read_block_data. When the cyapa module
> is enabled (CONFIG_MOUSE_CYAPA=m), this bug could result in potential
> denial-of-service for invalid or malicious I2C data. Pad the size of the
> cyapa_reg_data structure from 27 to I2C_SMBUS_BLOCK_MAX=32 bytes to
> address this issue.

No, I don't think padding all buffers is a good idea. We need to change
i2c_smbus_read_block_data() to accept the buffer size so that it does
not copy more than it should.

I sent a patch to i2c list and CCed you.

Thanks.

-- 
Dmitry

