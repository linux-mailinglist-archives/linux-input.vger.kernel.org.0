Return-Path: <linux-input+bounces-4133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6D8FD01A
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 15:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48ACE1F2723F
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 13:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A653D17559;
	Wed,  5 Jun 2024 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bD/3uUx9"
X-Original-To: linux-input@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664CFC08;
	Wed,  5 Jun 2024 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595308; cv=none; b=rt2KI7VHocxlmFX1kDSqHD0S2SZDiG4AJ0cdXUTPDuvDmfb7lDgdZ5zkEA5mobEmVR6sd89jsdn7LAS5B+Sqz0XiGizf6XvcwxXX8KJAR3dxmQw7Pcvh9E9GZxKf0nPQOrqh+MZ2C2Y81lsq7trW8vB8qgAVxnqwHgMn3eUVX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595308; c=relaxed/simple;
	bh=KLGoXYEyiKiVioiSy1o4l3JrW+RVHuBQRMY6ey0/uJo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Eq74OavQcj/pqO5zDAtLSyL0gxL83wyaHkdJ8SwHQQwY+mwPZ2M4+wFNE7IBnwf4lin1WaTBUirB7seuUwZ7j/ud73LYVRToux1xOYAUtB6cXwIHl0f3i5IQjG3eOXeTdKWqSMtGd44v04WM4tQq7zbJU31db9a3STwjz5Xbcn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bD/3uUx9; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E6B1E0003;
	Wed,  5 Jun 2024 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717595301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oYspSAh9r3LxQwguONvXuvtQjqwAdO7gA+8g9Aaz40=;
	b=bD/3uUx9uNS8Q2paK6zhQj2kqPrtdKE9R0wdIsPo7euw/mz67MJIP07wTvBfxgcKJycS/B
	L0ZdYyRLPLyPYHjduis6xmkB5WmIwCHkBAhuuy1mZiR/M5sl1j0v16xVRr/V1+6Bk5+4rA
	YJPIu6BrFwJ9/tlaeMs3TLf1StCSHxRroYkO6mxUqGMhURLPvlNsgVDycfQN+dvW7dNRZ8
	yw7lL2CT+AZBN0eFnFgkKhXCSgqlbk5yGyObxGUhf2uMufD44kBnGGzcaLAs3wOOvz+/Il
	6/uUee4evNcg72vs2/b1r7L/b4uZ6Cs6xiTw5XpnE2Oh/CJr6JwMlGO6Xz+plQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Jun 2024 15:48:20 +0200
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>,
 catalin.popescu@leica-geosystems.com, mark.satterthwaite@touchnetix.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v13 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
In-Reply-To: <20240605124746.GA57733@tpx1.home>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
 <Zl5ZmYyntq7OJOvZ@google.com> <20240605124746.GA57733@tpx1.home>
Message-ID: <7ca4a22f903313128de5c0f65a49b319@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

[...]

>> > +
>> > +	error = devm_request_threaded_irq(dev, client->irq, NULL,
>> > +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
>> > +	if (error) {
>> > +		dev_info(dev, "Request irq failed, falling back to polling mode");
>> 
>> I do not think you should fall back to polling mode if you fail to get
>> interrupt. If it was not specified (client->irq) then I can see that 
>> we
>> might want to fall back, but if the system configured for using
>> interrupt and you can not get it you should bail out.
>> 
> 
> Yes, clear, the polling mode can be decorrelated to the irq not 
> provided
> case.

Just to make sure I understood, is this what you propose ?

if (client->irq) {
         error = devm_request_threaded_irq(...)
         if (error) {
		dev_warn(dev, "failed to request IRQ\n");
		client->irq = 0;
          }
}

if(!client->irq) {
     // setup polling stuff
     ...
}

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

