Return-Path: <linux-input+bounces-9401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94328A16993
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 10:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B2AF18831C3
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 09:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852FA1AF0B5;
	Mon, 20 Jan 2025 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="V8x0JkvK"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CB1AF0B0
	for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365386; cv=none; b=GDxseGYrQSjSlIS7CMghwbOHAh3b5FJZIl9mYLt7gCrUM/FNbSAYi34vUJ+g0UTHYJBHbTYNHLh8pUtT1wJB2Hp08xvyOl6tccuJKH23bYDXwUrWDYyzwYKt1lsXcyJXCQLZ1oloumsoq/k3RcctRIbL3mWSW4UaFQswQ28ivWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365386; c=relaxed/simple;
	bh=qsWnYCOaNaptUvU4odH4QOIwC/kiXpbv1BO6t31ZeWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+TBJ815tAGDy9Iw1U9/DNQtGXMfZkK0SbJsD1TaW0Qecl4MVpt/kDZF3oT0iKXLFTmRecmaZSDPhqzYXnNOSiMmnW+Qe76yB+644km4G+g5iQFinPjsgoewdxx3JVSQ9vc7JMLACPjNMKvAY6ohC2uX+tvjQryA3QqQVPL76J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=V8x0JkvK; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A888E101C71BA;
	Mon, 20 Jan 2025 10:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737365382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKY/OwHsVUMorl5nBGKUNQriNe9Mqn4EEdZ2KvNMHws=;
	b=V8x0JkvKgdBrLtxXQkBeh1o27vdEjXDqSSGJ7EFJiR8XMGFLxUNjiVY3GlSdd+eegYnWq0
	QmQ330Xz17n+Ns6cYFLa3pUVD0Y8FnBsviWtSubPuRGEgyyIA7IxiAHY6x4jjQIkvj/KYc
	g/6o9kgRWYCet7VTtGOyKsRq6GoDNaazu12T04kZgG8bpokHZjjmMUNwYkCUABPQmNI18/
	2q/rmqLVg9lX3AvMDL1V4YQlRzVVBvEIrVhDF8gaCiNAQg+t551zW67eo8+cs2LVzJq7iC
	ID0+mQP5rHs1BdTlhDblqhWnuQE1G2p2ktbZ9KRRqboh7p7vRZ7Bjv+72qhC5w==
Message-ID: <2624fa66-a777-4931-9a06-f43c4ab433e5@denx.de>
Date: Mon, 20 Jan 2025 10:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
To: Michael Gong <mksgong@gmail.com>, Nick Dyer <nick@shmanahar.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
References: <20241223190416.52871-1-marex@denx.de>
 <Z4VsxKJ56jqQnZGr@google.com> <952a79a6-a13f-42b5-a311-13321076686e@denx.de>
 <Z4haguYzh87Bz8hx@google.com> <d43894eb-3a63-4da8-9f21-d50ec9b93c6c@denx.de>
 <CADF57Jdt6PjMyj_DbQtUfDUFAv-P24h_r74-Aq0fEx7S+0R53g@mail.gmail.com>
 <CAH6H9=RjC4V1scV3A7=diixOXKde+Fd81ZhKGehtBGhBYS9pNQ@mail.gmail.com>
 <CAH6H9=T7a9DBKwi43qf7nodqM1Ghh6kY-LJYqvWBDQ6UrTD+0g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAH6H9=T7a9DBKwi43qf7nodqM1Ghh6kY-LJYqvWBDQ6UrTD+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/20/25 7:53 AM, Michael Gong wrote:
> Resending: Plain text mode:

Hi,

both emails made it through.

> Some clarifications:the two knobs on the display are configured to be
> predefined widget areas/shapes.
> In this case, two pushable knob dials with a predefined center area
> which acts as a push button.
> Current knobs report dents or an absolute position, relative data and
> graduations (although graduations are not well defined yet).
> 
> Idea was to create two separate input devices (i.e. to associate all
> reports to these input devices) as the knobs are separately reporting
> wheel type data, although are part of the same touchscreen.

Indeed, I saw the downstream driver.

> Not clear what ABS_GAS event type is and assumed that REL_HWHEEL was
> more of a mouse related event code.
GAS is a gas pedal , like in a car , what would really be needed is 
wheel2 code I think.

