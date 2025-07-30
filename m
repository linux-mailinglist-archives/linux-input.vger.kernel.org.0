Return-Path: <linux-input+bounces-13727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F035BB168F1
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 00:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FD418C4361
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 22:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332861F7904;
	Wed, 30 Jul 2025 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tGg7DklG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Sz4EPmOZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B41DED57;
	Wed, 30 Jul 2025 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913664; cv=none; b=R/wbLwbJig1BRMWUvyGd6w0QSSxPyzSP2SVvs68lWWnL37dVmX5Akx24MnJQiLs6UdcVX8HHYLQBFwyKsOCFmDOZQ6GJpNyIgqNZM3QbNle4oI2aRVr8LoW4+syUa7CfIR+768fs77twkitiE9hKqMwCQ3LHGyV+SNjK7tprFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913664; c=relaxed/simple;
	bh=VXNv1CY4rYlURx2Xvz87YYss0gcbJ71iawWXgQl0stM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uY6T5CJeJYjsIBiFJVcNrRTsq4J/1qE72EzV4E6h8NQCkIucX2YwFZxGE32p3flGo8MUCJaTHn5fOg3+bR9OAP6WWo8DXlTRd2J7csLZcmzrgZP4H1YSeAzL40NsOrYnAP5088upHSnssAV7xNKk4bTtmy7miY0/t5wDZFJZ/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tGg7DklG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Sz4EPmOZ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bsmhj68JDz9tSn;
	Thu, 31 Jul 2025 00:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753913653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8CWksLx1mLapQnnOZN8xsm/x5QszWCNlZNE7nYusws=;
	b=tGg7DklGHfnibTiA8zogOZHRCnPhCdaynBWmfyWR5i43yjaaxiiEq4X9pyDDyG2snRTfR3
	yJ5dZi3/eyu5engM90AbY1C7RDREPozHFTSICFjkWdlnEDIqUrCb1IeJweGbyBizmjM+pZ
	Pu9Ic0BEenxVcPMczSe2bWTgso8Za3lW/ViCMaxw8ElULuMuhw2ucab+UJISFS7BXmdkyS
	992SrAXokMr7aNY000OBA1ndcr6ku0Dbd9ilvWRQu0EC7Y4u2Sd8XkRZ+/DPw5+y1Ay8qC
	1Z8taueSetj7YfQ+An8egbsY1KZN+41Meovpjx1oG7tBewaOQ0HLpZ1e+JFWqA==
Message-ID: <9187a38c-89d8-455e-a1b3-ee584d983064@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753913651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8CWksLx1mLapQnnOZN8xsm/x5QszWCNlZNE7nYusws=;
	b=Sz4EPmOZ5v/HAw0vsMzZuyVFotFdOjBIc77C5ULBlRyVSsaWrqJkR8u2BQzoRJRU7PASZs
	rdauLb43JrTFiVODz2zQJYPmXhtatK0+75oerTJg0fFTqxO7qeFi+abjKEkUVktdwBzQ7+
	JhhcBLLhE1UJenc9jmX2xVJbWXmMhpSWsCAaOQrW8MxSYdNwDoWuOoow+L4JFvZHwvx8Yc
	mG341NnwFErQkjW7dL8nTeijJOHY40bKU53wJQK7kKwxfXfPBqzo3DudLmNcNDVgo9I6Ik
	ibkiAzRRMX1PtmtjwW5VEkvEfauQIopybzV76k+fLQdU15XWzdg6LtD96+Zbcw==
Date: Thu, 31 Jul 2025 00:14:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Input: goodix - add support for polling on devices
 without IRQ line
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-input@vger.kernel.org, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>
 <6kqp24t5c23vcvv7wuirkjz6a5s3daacifw37rb5554v4uqeit@jzsinkx6qb7r>
 <cfa155f9-573a-479a-b8db-89c3bb077114@mailbox.org>
 <csjblrulwqcmcjvyzbetng6o3ct4xedff26nvgwlb56fkqphew@rp63nsl7reuk>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <csjblrulwqcmcjvyzbetng6o3ct4xedff26nvgwlb56fkqphew@rp63nsl7reuk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9atjx5rzbxmrgbwbfdmr6u66famueosd
X-MBO-RS-ID: 9ee2df0d5b4e547d427

On 6/30/25 5:40 PM, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 11:44:03AM +0200, Marek Vasut wrote:
>> On 6/30/25 3:32 AM, Dmitry Torokhov wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On Tue, Jun 10, 2025 at 02:54:12AM +0200, Marek Vasut wrote:
>>>> Add the capability of polling the touch controller for events every
>>>> 16ms, which is useful on hardware that did integrate this touch
>>>> controller, but did not integrate the IRQ line, like the RasPi .
>>>>
>>>> Make use of the generic input poller code. Factor out the code
>>>> from goodix_ts_irq_handler() into generic goodix_ts_handler(), so
>>>> it can be used both by the IRQ handler and poller callback.
>>>>
>>>> Use of_client->irq to find out whether the interrupt line is present
>>>> or not, independent of whether this is OF or ACPI system. It is not
>>>> possible to register poller in case request_irq() fails, because the
>>>> request_irq() in this driver is deliberately called after the input
>>>> device was registered, and registering the generic poller at that point
>>>> is too late already.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> There was another version of this patch that was submitted and reviewed
>>> by Hans, so I merged it.
>>
>> Is it the following patch, with malformed commit message and some odd
>> "LF-15225" subject tag ?
>>
>> https://patchwork.kernel.org/project/linux-input/patch/20250522020418.1963422-1-qijian.guo@nxp.com/
> 
> Yes, I cleaned the commit message.

OK. I just tested that patch and it does work on my hardware too.

-- 
Best regards,
Marek Vasut

