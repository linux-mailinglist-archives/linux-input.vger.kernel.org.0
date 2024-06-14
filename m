Return-Path: <linux-input+bounces-4359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D056F908F83
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 18:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE676B21680
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 16:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EE72B9A5;
	Fri, 14 Jun 2024 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AQ8slOoI"
X-Original-To: linux-input@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F11642B;
	Fri, 14 Jun 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380972; cv=none; b=LvSiyPrqKynHMoX+Gq4SVLWoM9UyNf1xU66Zy/HdeTRrHT+okHKoEDpZgmRnTlRufw1zRYTgcGupKazEkkY9psQwZE4JFbSXYt8p9dMYwnyjmixhMUBg/z+RMMKPTb3/dshVYSssnZt0qEqPrb4udugdiRJ+l0BB8t20x68ZIso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380972; c=relaxed/simple;
	bh=HkdMIKqNfvcTwn+IKkOt/8EtqNClu1g458NTivnDlH4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=B2uahYJdgbkV8vPidvPEyGdVannS/iWN5Z+x+9DZf7IkMllJ5VHa3HnCvBlspVCH6m3fEyK7siNjcMIAdWm486B4HP+eXFa8N/jpBRBYBFIX98PO7GTe5kBZPXyVcqiFzhPkAXvM9NQYdxoE3Dofsv4IAMNs31er0dsVtagO0Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AQ8slOoI; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F36C20009;
	Fri, 14 Jun 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718380967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWy7tRAFgD9nXufUCRB9bCovDr6IUDCrTC7tiwkWhJM=;
	b=AQ8slOoI9tBNorobg7xYlv4klLsuKAQ+5Un+ClwHxt5sl5Lg0twSXFhu1GFWv9IYSuoC6i
	70vHXye2LAVqPq7LozdhpjzEU8S34cmN2uan/12y860EplybS4NpWhAmMtz2pXBbTNfUmG
	OGEzfm/IO9yKD6ZG5gx2acPfk+2Ic5Zn06xATKgEjnRXJW+R7cd2PMBZ2GqNoPolaZdCEx
	W8RXm5djvXsWdHih/827IDJ2ijNvIEbFIm8O2aXZBYo9m/U8pqCwnYKv8aT8QbMIxoVNzB
	XUR+ej4UHLHFZkQHCCAPxp1MOD2O9V4id7PsKhj9VvevfQT/WplbHHMYDpYiRA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 14 Jun 2024 18:02:47 +0200
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
In-Reply-To: <ZmIq9jmkZtEaGw19@google.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
 <Zl5ZmYyntq7OJOvZ@google.com> <20240605124746.GA57733@tpx1.home>
 <7ca4a22f903313128de5c0f65a49b319@bootlin.com> <ZmIq9jmkZtEaGw19@google.com>
Message-ID: <410b683ee96573b57b3f8f2bf8e35c29@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-06-06 23:32, Dmitry Torokhov a écrit :
> On Wed, Jun 05, 2024 at 03:48:20PM +0200, Kamel BOUHARA wrote:
>> [...]
>> 
>> > > > +
>> > > > +	error = devm_request_threaded_irq(dev, client->irq, NULL,
>> > > > +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
>> > > > +	if (error) {
>> > > > +		dev_info(dev, "Request irq failed, falling back to polling mode");
>> > >
>> > > I do not think you should fall back to polling mode if you fail to get
>> > > interrupt. If it was not specified (client->irq) then I can see that
>> > > we
>> > > might want to fall back, but if the system configured for using
>> > > interrupt and you can not get it you should bail out.
>> > >
>> >
>> > Yes, clear, the polling mode can be decorrelated to the irq not provided
>> > case.
>> 
>> Just to make sure I understood, is this what you propose ?
>> 
>> if (client->irq) {
>>         error = devm_request_threaded_irq(...)
>>         if (error) {
>> 		dev_warn(dev, "failed to request IRQ\n");
>> 		client->irq = 0;
>>          }
>> }
>> 
>> if(!client->irq) {
>>     // setup polling stuff
>>     ...
>> }
> 
> No, if you fail to acquire interrupt that was described in ACPI/DT it
> should be treated as an error, like this:
> 
> 	if (client->irq) {
> 		error = devm_request_threaded_irq(...)
> 		if (error)
> 			return dev_err_probe(...);
> 	} else {
> 		.. set up polling ..
> 	}
> 
> This also makes sure that if interrupt controller is not ready and
> requests probe deferral we will not end up with device in polling mode.
> 

OK, thanks for the clarification, this is fixed in v14.

Greetings,
--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

