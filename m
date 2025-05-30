Return-Path: <linux-input+bounces-12650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933BAC8A1E
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 10:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769B54A640F
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 08:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BB42116FE;
	Fri, 30 May 2025 08:45:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3320E6E3
	for <linux-input@vger.kernel.org>; Fri, 30 May 2025 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594736; cv=none; b=ig8dEq6YT9qabJUTHvZAOvaQknjY7pPUzY3bpoB7lenWduU7uKne+j38ayFT6QtTc+poHWA3qXJQGXPJC9XbvWBSjiLXzuxvfdafHiUr84M3btTvXpc86NIbe8Qq/CgWk6LPLHWYHNRJU/zfGhG4GS1pHNo99whAaM7OFJzB3oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594736; c=relaxed/simple;
	bh=JhBOgQKJ+gaH4GCJNHE7uDE6a7wv2txMpliHbTgHazs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq2Vc7BCv3sUuAhHf2yNjbCICntb2ybVIveJYeKERcGxg4nQIe+y11hSnsh/yJLnUEA2j9n/hHNu0MW6P4S6lN+Mmb06I8MSMlIQbSo6bhB2ACBwGnWVWMFynPowtg4p9tyS/94UUzJk9YiTVhaz9ILBCmRJBcW3MAEPzeaYVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMb-0006SK-Jl; Fri, 30 May 2025 10:45:17 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMa-000wrU-2X;
	Fri, 30 May 2025 10:45:16 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKvMa-000ooT-26;
	Fri, 30 May 2025 10:45:16 +0200
Date: Fri, 30 May 2025 10:45:16 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Message-ID: <20250530084516.ee2kre7kmdd6uikv@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-3-a5edb105a600@pengutronix.de>
 <119eba0a-2c81-4232-8b20-acc0a0eea969@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <119eba0a-2c81-4232-8b20-acc0a0eea969@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 25-05-29, Krzysztof Kozlowski wrote:
> On 29/05/2025 00:08, Marco Felsch wrote:
> > +maintainers:
> > +  - Marco Felsch <kernel@pengutronix.de>
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/input/input.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: touchnetix,ax54a
> > +
> > +  reg:
> > +    enum: [ 0x66, 0x67 ]
> 
> Isn't this the same address? You just added the write bit.

No the i2c addresses are always the 7-bit i2c-addresses without the R/W
bit.

> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  panel: true
> 
> So that was the reason of dropping tag?
> https://lore.kernel.org/lkml/821ce1d4-bc15-4764-bbe0-315c57e8536e@linaro.org/
> 
> Anyway, drop the property. Redundant.

Why is this redundant? The touchscreen.yaml defines it but I need to
request it? At least I understood it that way and all other users of
this property do it same way. Same is true for all the touchscreen-*
properties definied in touchscreen.yaml.

Regards,
  Marco

