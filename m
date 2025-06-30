Return-Path: <linux-input+bounces-13191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D51EAED8F1
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CB73B563B
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 09:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7B123F28B;
	Mon, 30 Jun 2025 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eiivsxpj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="neBSrsjj"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982723B63D;
	Mon, 30 Jun 2025 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276652; cv=none; b=o86YCzeF40Ob7iMCgcYG98Jx4Lfzkl4uijTUcYztAV/kdAgueuUOUZuEPdabwZ3DQ3rwyyndVX8R+tGpsSWztrkWOrcfhyn55isgKgTL8QHKeauKc/lRKA1E1XznXbUpdIF6x1pF2M+ixsng2mjOnTqLvcdgJeVbLUJqNtjeHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276652; c=relaxed/simple;
	bh=N56XJI0EiIcjMPSDvxJbGigZ2/izA7E34iBHMoh5x+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gvw5DHXBJ1G12lqHKvXW7JvHtgSdx4+Y42Wt/loatQJh1rQR4Z7qNMFulnz6KKT9J/Cy9BHRZiGpc3FgyJxVfjpKwOjWvqr1c4YWrG5gKh4D5jPfopPE/kqqa6UOyaMgh3pmyjkm6XSPK4i/VH3T1SpyXh7JMw3PPuSCqK18AfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eiivsxpj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=neBSrsjj; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bW1T33X4Vz9t02;
	Mon, 30 Jun 2025 11:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751276647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43x4qYf+XWYFdBjSbvp53IjTDNmOnSJxb/KyECAnQRE=;
	b=eiivsxpj/Yt8ualMDkxFtKuwDAU90WO4bO8RlYHOc6Ff4Fw5Z3DRH4JNu7yaTZ04UVB7/4
	BIORK1YHXV70FE1dgOTVXTLZuzfmnSQZulYJ0MZLLER4AlcbwN0f7tIaYqv8POq31KFcVN
	AR+SRUjXz0umi+q73kfFYO0d/c11U7ZvaQ/I6mbhUiQUZhSjFTQ9k13oUpv66FBOFFQ+pG
	Nu+wEQ5m/tZMmt0TVRrGo+eFUsCOlfTxO8SRJJ2+iGdDiOT4YB/TsyUONTYXRu+BHeUCIF
	t8gaNbb1fRq4BUHK2ciNcDVZrN5VVAOUBB5x3XKLUKh5Zh6oKs2IVn6i861UcQ==
Message-ID: <cfa155f9-573a-479a-b8db-89c3bb077114@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751276645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43x4qYf+XWYFdBjSbvp53IjTDNmOnSJxb/KyECAnQRE=;
	b=neBSrsjj+9/XXWy5fEWu67wQxG/mQBwbhkZ6QCTRQ6EFoxFDmTiYQz+GAuiL87NhKG70md
	Dwj1zOO63JjzpgiX6wYUsHsvqn29Bl+yIfavD8KB5GqwYHdssFPiKd0U6bPPPzCxOZmY5g
	p+zVWpT74aqOcyBhwIWNNbkkyfYR+DPpNIbsJCj4DzJmTu6lK73qqC3WeiG15/VYWBFRDv
	E2LDKvX2FdZi3LeJD8bKzvhBKKV3LL7t171JKUvA4V4CReBh+drKgII5v2Pjv+e5ccQ9Xp
	1vmUT/vjfD1qXijweZAiqLb5Up8Ozvm4/RFGPeAlgtZe8FDTDLIvWlK/3F9M2A==
Date: Mon, 30 Jun 2025 11:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Input: goodix - add support for polling on devices
 without IRQ line
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-renesas-soc@vger.kernel.org
References: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>
 <6kqp24t5c23vcvv7wuirkjz6a5s3daacifw37rb5554v4uqeit@jzsinkx6qb7r>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6kqp24t5c23vcvv7wuirkjz6a5s3daacifw37rb5554v4uqeit@jzsinkx6qb7r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: z5ubrdpwnsk8ryntggohyzx3r1byrgq4
X-MBO-RS-ID: 0abd913ce55ca8d22e0
X-Rspamd-Queue-Id: 4bW1T33X4Vz9t02

On 6/30/25 3:32 AM, Dmitry Torokhov wrote:
> Hi Marek,

Hi,

> On Tue, Jun 10, 2025 at 02:54:12AM +0200, Marek Vasut wrote:
>> Add the capability of polling the touch controller for events every
>> 16ms, which is useful on hardware that did integrate this touch
>> controller, but did not integrate the IRQ line, like the RasPi .
>>
>> Make use of the generic input poller code. Factor out the code
>> from goodix_ts_irq_handler() into generic goodix_ts_handler(), so
>> it can be used both by the IRQ handler and poller callback.
>>
>> Use of_client->irq to find out whether the interrupt line is present
>> or not, independent of whether this is OF or ACPI system. It is not
>> possible to register poller in case request_irq() fails, because the
>> request_irq() in this driver is deliberately called after the input
>> device was registered, and registering the generic poller at that point
>> is too late already.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> There was another version of this patch that was submitted and reviewed
> by Hans, so I merged it.

Is it the following patch, with malformed commit message and some odd 
"LF-15225" subject tag ?

https://patchwork.kernel.org/project/linux-input/patch/20250522020418.1963422-1-qijian.guo@nxp.com/

> BTW I think this version would end up trying to disable IRQ0...
How come ?

