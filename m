Return-Path: <linux-input+bounces-12652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26CAC8B71
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 11:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA87E7A5681
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 09:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69755221DA7;
	Fri, 30 May 2025 09:48:59 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A3217733
	for <linux-input@vger.kernel.org>; Fri, 30 May 2025 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598539; cv=none; b=eZ8SG2bvuz36c5RobIja2z4e3VpVz78m9CGw3pZ/kqdLS5f+TxA8X89ksEWEPCOLrNBmX2LtBR9wahZVVtuxkomAQE9YUp/BerjKS7by5EoThtBWd29e4Ib3voDM3WDULeoFlLFbGc87hKFtsYg6pgxJhXDjyy9/JVz8sacS/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598539; c=relaxed/simple;
	bh=osIVgiPlUuOifo6kGVJERafbl89rNSzwCqE6Wefp6Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv45JBjH/51veyh2ogjpdiD07zOTf2ZEFmakWZZ4ex/TSAh00Lkdmoy9F7YFohft/d0/30jkueE1u/LoQjXrAJR3jIhE+lZWxYcTORG/S+5oCpnLeeJM0toPl1cQoS/d3Msh8qtPU8OnSuMevN9vbcuGX/1OhRWTooAJlu8Bg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwLx-0004hT-3t; Fri, 30 May 2025 11:48:41 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwLw-000xHP-2C;
	Fri, 30 May 2025 11:48:40 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKwLw-000pQP-1o;
	Fri, 30 May 2025 11:48:40 +0200
Date: Fri, 30 May 2025 11:48:40 +0200
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
Message-ID: <20250530094840.o2ocasflqphr5px7@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-3-a5edb105a600@pengutronix.de>
 <c4514a7e-d5d5-416e-bc4d-d91476bebb35@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4514a7e-d5d5-416e-bc4d-d91476bebb35@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 25-05-29, Krzysztof Kozlowski wrote:
> On 29/05/2025 00:08, Marco Felsch wrote:
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      touchscreen@66 {
> > +        compatible = "touchnetix,ax54a";
> > +        reg = <0x66>;
> > +        interrupt-parent = <&gpio2>;
> > +        interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> I have doubts that it works. It is perfectly possible that you inverted
> the signal, but rather rare, and datasheet clearly says active low.

Good point albeit it's just an example and board specific. As you already
pointed out, the signal can be inverted on the PCB.

The driver itself uses gpiod and correctly assert/deassert the
reset-gpios.

Anyway, I change it to GPIO_ACTIVE_LOW to match it with the datasheet.

Regards,
  Marco

