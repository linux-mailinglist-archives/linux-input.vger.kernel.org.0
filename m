Return-Path: <linux-input+bounces-3777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A58CC5AD
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6573828421F
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591091422DA;
	Wed, 22 May 2024 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHiHT3c+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030591422D5;
	Wed, 22 May 2024 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399425; cv=none; b=uTGhlGDlDnFqOAnvgjhlQ1HIoTG9uvvAalAjkOnXSV2AQX6JDT8w4AMh+3kNGRE1FXs3/bmo2zNsuF/d6wwTS87VsMNAWPwRvxEcEVAdoXseEGVxFdV6iMpFfDF2WaEKucVlPymzYWdteUUMSXK+GbgJPjyRGnfiz+TxEdeWcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399425; c=relaxed/simple;
	bh=lxps6EOqtmqLxhyLvO6bl4wRTWlUifffUqz+wiVTR50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhCs2RGWssoQvuyfuHQDS/YaCikGVvFJ06JCHxy79ACTsAKFJwVZCONi+SOWxlV8u5ftBVi9CFbcqUfg6jnlhKvYxQMWEVRbybdBf3bcpRKVtF7+h7qzyR78DQbvZE+EDS15cYq6G1K1vhAHPOpCSd3UltTLLzKZdVd3qUBb9Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHiHT3c+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso1202423a12.3;
        Wed, 22 May 2024 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716399423; x=1717004223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfpLarFNkJpt7DyCLsHl65AIFQQ1PVnsoQ9uc7Gm7vE=;
        b=JHiHT3c+NOSuOjC/1OGrVK5eEKJo4roojSV9Wxzt5wkaVssolFDmemgM0oh+3i4ZaW
         nIGeiHIeu66Za+aJYIUtC7ID19P80z9CsVW0usQbD6ihxH6Y8mkwn6J2FA2uy59SZ3QQ
         7fn94F5sVDWOO8GyyuOhG3aiStv9Gm4qdAE9jok7M5l+AgMqhSzhW4EIeDI7rfIqXPk3
         LQIMrcSSw16JcjeS8H4+6CRoxM33hc1svu7SgrV2UWXASy7WcG7+iaR7SBw6juY9OsQZ
         HZHf3Y+VIWcL1MQETiufim8X0KO8bo15pjrgLlR75R+Y0dOVmR56VHu8H2D6oUB2xvjV
         eJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399423; x=1717004223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfpLarFNkJpt7DyCLsHl65AIFQQ1PVnsoQ9uc7Gm7vE=;
        b=l+Db29QrxshS3l2zEgZgW7yiLS5MlcaN6yyqyQK/ePqQUn/E7N6k6I++RURPKj6PgT
         mdYxkxfQFOHLNMdE36cqoz9Mck8qffnqVksGEvijzOLfcAP1nqNmTPuZFq8Il6dDBaEP
         oRpyV7nwjfPhLlVEi7v4v0xtPRoZUSG0D164D2HjpGvObSOewBsADu6pXwUgSXol6auy
         IQSa6GStgXpIcmYVhzCITpu95DkTQTmfJ+/67kmD/2/9O3UVh3NhHr3rqJO6uOUImGgX
         YE/WjmTCXH853DNuMJF+CiWyNCE9stAzGie76TQSm/JSqq2Lskkkj6y52fcnYdTidYOd
         tWug==
X-Forwarded-Encrypted: i=1; AJvYcCXUsfme1JvL8exZ2ZZAWNqGBCT5y/nv4Rs4WaStRi/6RNyCQRMyO2IiwUQF9l0CGzPFuDZicT8KFFSITBxHYzTlR5H3CfxfTrnlzPcKBV1subXU5hnWwQJFn3aBxNaLJsAlfWyby4ymn2iLdkINDeHCcqegQHGKGx1U7yhmfGzJAQTw0m//
X-Gm-Message-State: AOJu0YzRD2GKStptNgunWIxmFiFaiaUhef55cwCpQGDz456tKJ5uS3QG
	dnDM2bPQHLS30zPTqafahNR7bmGg2KPPj0TZkZolej3oTzixRR6Z
X-Google-Smtp-Source: AGHT+IF3dNlxbIuavfKQFMMnfNC5JTiwKGkgMBT60ooMozLsvbMqmQSzhg1yXQrO0GMfPPg6izZdLA==
X-Received: by 2002:a17:90b:4acd:b0:2bd:6715:4f5c with SMTP id 98e67ed59e1d1-2bd9f5cc293mr2485803a91.44.1716399423117;
        Wed, 22 May 2024 10:37:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ee23dfsm35518a91.6.2024.05.22.10.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:37:02 -0700 (PDT)
Date: Wed, 22 May 2024 10:37:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: joelselvaraj.oss@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for FocalTech FT5452
 and FT8719
Message-ID: <Zk4tPAKHW8Q9F84_@google.com>
References: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
 <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-2-2a648ac7176b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-2-2a648ac7176b@gmail.com>

On Tue, May 21, 2024 at 09:02:58AM -0500, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> The driver is compatible with FocalTech FT5452 and FT8719 touchscreens
> too. FT5452 supports up to 5 touch points. FT8719 supports up to 10 touch
> points. Add compatible data for both of them.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Applied, thank you.

-- 
Dmitry

