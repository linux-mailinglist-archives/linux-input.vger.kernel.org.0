Return-Path: <linux-input+bounces-758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B8C810C4A
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 09:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D421F21172
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759DA1DA23;
	Wed, 13 Dec 2023 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N+z7mjaL"
X-Original-To: linux-input@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBEC8E;
	Wed, 13 Dec 2023 00:22:59 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BA091C0005;
	Wed, 13 Dec 2023 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702455778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nASj6QRSQzI//PIj4tEF3qRtUOc2zC8xgFSZZ4QeEQ=;
	b=N+z7mjaLBn3sK4wjlwKaw5uN/sTm8opT1W2Rn9HDhvyWwxAziH7lEFb2Qa42Z1cVEOgKKd
	fwlIpj8xpwBYJCQzoZhtPpuaQChOHiyVn5GSITzMCO3Mrmsc4YpqnIg8fANrq/m+NjAHGq
	KOA1rliiLKGuaTYuPcdRWKQWPphBF2M34QT+2HDrd0y/8AgSPbqpXOk9zfUy6xh8T7WtZZ
	4P4Xgy5FXUEy/eACeNRgoB+f3i93JyO/gEOAtFPaM146FOm7PrrxQclVNCb5IRXYjYVQG2
	wtI3q0zS4Q+f4xQgyLNw7KoD/PXqLUvJ8h/nEHrFkKjFn+xTntcb6QWkpHaisw==
Date: Wed, 13 Dec 2023 09:22:56 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com, bartp@baasheep.co.uk,
	hannah.rossiter@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v5 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Message-ID: <20231213082256.GB2340704@kb-xps>
References: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
 <20231211121430.1689139-3-kamel.bouhara@bootlin.com>
 <20231212-rework-bounce-f4d9d12362a4@spud>
 <ce238248-6bac-41df-94ba-b494c5c09631@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce238248-6bac-41df-94ba-b494c5c09631@linaro.org>
X-GND-Sasl: kamel.bouhara@bootlin.com

Hello Krzysztof,

Le Wed, Dec 13, 2023 at 07:44:33AM +0100, Krzysztof Kozlowski a écrit :
> On 12/12/2023 17:57, Conor Dooley wrote:
> > On Mon, Dec 11, 2023 at 01:14:28PM +0100, Kamel Bouhara wrote:
> >> Add the TouchNetix axiom I2C touchscreen device tree bindings
> >> documentation.
> >>
> >> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> >> ---
> >>  .../input/touchscreen/touchnetix,ax54a.yaml   | 64 +++++++++++++++++++
> >>  MAINTAINERS                                   |  6 ++
> >>  2 files changed, 70 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
> >> new file mode 100644
> >> index 000000000000..cbdf48fc538b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
> >> @@ -0,0 +1,64 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TouchNetix Axiom series touchscreen controller
> >> +
> >> +maintainers:
> >> +  - Kamel Bouhara <kamel.bouhara@bootlin.com>
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> >
> > Weird, you add this ref here but do not actually allow any properties
> > from it since you have "additionalProperties: false" below.
> >
> > What's the point of its inclusion?
>
> It still brings the type of some fields or the constraints. However need
> of specifying "poll-interval" already points to missing
> unevaluatedProperties.

Ok, this wasn't clear for me wether or not I should pick
unevaluatedProperties as I still reference "poll-interval" from the
input.yaml schema ?

Regards,

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

