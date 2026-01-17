Return-Path: <linux-input+bounces-17175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049ED38F63
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 16:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B897930191B3
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 15:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F3020A5F3;
	Sat, 17 Jan 2026 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tgKdK1eZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9C18B0A;
	Sat, 17 Jan 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664026; cv=none; b=EkLC2WNforneXptjS3iSeNctGBbSNWGhohL5rK6lj1m3zFL1tjQVgYsidhmg2eC8jq8Uzh+IwLzGZGBebGxQGQb2c8NMOec7JTOEPuFRvrvL49m7o5QyDHe5QRcWpvhf8meNIBhZtRFuYNJtnrvtWIab9jnEHrtqAmS7JND6tK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664026; c=relaxed/simple;
	bh=Minogk31sVhKaZWVSIkn7TOYUFesdoqJSXnVy4OIo6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxRum/ieGEtqCFKDelt8jNBd3IYDr3s6jUdb2MP9axOt7GvVUcX+CWjJMnGObGugrRg7L4L2Vqs00uT6dzKFkN8tVtM3q0tDdvHEwbscD0EvtzOhLvfC9mZWiLk8AxPpLePx7O1NXDznJ9EJhlLtVOeZY95qOpGm7RWWReKIa0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tgKdK1eZ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dtgjc27zWz9t92;
	Sat, 17 Jan 2026 16:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768664020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zduQRhQy/KTPMZCz37XpRX0kb1n/WYZD+fSvMrNBUfs=;
	b=tgKdK1eZTZ9/XrOlw9YDJj65g2LDRvDypSGuou/AONJnk7b1yA1+6X1nDgYJQIfTI9S2pm
	ev3DYfOcHLwCKs+O24mCOKXnGysp9xq39lIL0mTITuEgagaXxPOwqSzy8dkTp92XlPSZsB
	A4aFvvYaK5U433yj/jsz7/O2YnF6d+oWaEUa3WUd8rAxPT0EuiAOzm21RUZhI0gy+tkIWe
	1hACGYd3Cw1xEYjYlp3zQMZD4AUHBnqih7FQTTvRSDQUlOEGKeRS6VJWkzigpVapm3KRAn
	QDYDMr6BOe4DnqMzfv5dRMWadmlEpFf+xVta6lDQR20fgGKp1B2+NurogZsWfA==
Message-ID: <38a146cf-8eee-4fbb-8783-231108a01b54@mailbox.org>
Date: Sat, 17 Jan 2026 16:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Job Noorman <job@noorman.info>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117-grinning-heavy-crab-11f245@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260117-grinning-heavy-crab-11f245@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8df3da9ba382fd62162
X-MBO-RS-META: zxfinzfwg4pw4uun7jz63fxbfif8tbzt

On 1/17/26 12:22 PM, Krzysztof Kozlowski wrote:
> On Sat, Jan 17, 2026 at 01:12:02AM +0100, Marek Vasut wrote:
>> The old Ilitek touch controllers V3 and V6 can operate without
>> interrupt line, in polling mode. Drop the 'interrupts' property
>> requirement for those four controllers. To avoid overloading the
>> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
>> into separate document.
> 
> One if: block is fine, so IMO, this should stay in original binding
> especially that more devices like some azoteq or semtech might have same
> rule of not requiring interrupt line. Anyway, no big deal.
I am not sure about the other non-ilitek devices, but the fruitboards do 
use at least goodix and etm/edt touch controllers without interrupt line 
too, those I have on my desk (those two have separate, more extensive, 
binding document). I also suspect we will see more of those touch 
controllers with optional interrupt line, so if we do, I think we can 
re-combine the binding documents again ?

