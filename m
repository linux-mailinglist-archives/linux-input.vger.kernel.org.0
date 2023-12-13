Return-Path: <linux-input+bounces-760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B53D810D1D
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 10:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE19C1C209CD
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B69200B2;
	Wed, 13 Dec 2023 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m0e0RhO2"
X-Original-To: linux-input@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E5AAD;
	Wed, 13 Dec 2023 01:14:21 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 511CC240005;
	Wed, 13 Dec 2023 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702458860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXFas3uHrej3/5fwh5/ocXJViUvs8ENkwSuqfaEMY74=;
	b=m0e0RhO21946dWE9RjUKxfUvVj7TQ/1qRrAp8R+vT/kV8GllByYT/LIw6FPQFfSldLXe+Z
	eoCKuUEsOvBTXbH7cAXafwvazx4+3tLxsM7CU2fwAX+UapvTBc3fQ3y5CTphUGjlB3WCz7
	0CFiAqubDtR3Z37BRI0o804azrek2RGhK0b+LyNaeZ05jW8YKJ5YkKBkxOkE+JW6eTCD8Y
	bwKxy+gr8YDnj0Ygy6dOgPmCX71xJS+3dX+gY+b0V5l4oEs+LeAD/+S+9GeZc4aNBoBmBs
	6VX4zQKApVIFoDGnQlwT8ypuhXTeZSONfKybYqWZkeWHMsISLMBlnM9EIQygEA==
Date: Wed, 13 Dec 2023 10:14:17 +0100
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
Message-ID: <20231213091417.GC2340704@kb-xps>
References: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
 <20231211121430.1689139-3-kamel.bouhara@bootlin.com>
 <20231212-rework-bounce-f4d9d12362a4@spud>
 <ce238248-6bac-41df-94ba-b494c5c09631@linaro.org>
 <20231213082256.GB2340704@kb-xps>
 <656f2245-ff76-48cf-9a1f-05259765c622@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <656f2245-ff76-48cf-9a1f-05259765c622@linaro.org>
X-GND-Sasl: kamel.bouhara@bootlin.com

Le Wed, Dec 13, 2023 at 09:46:03AM +0100, Krzysztof Kozlowski a écrit :
> On 13/12/2023 09:22, Kamel Bouhara wrote:
> >> It still brings the type of some fields or the constraints. However need
> >> of specifying "poll-interval" already points to missing
> >> unevaluatedProperties.
> >
> > Ok, this wasn't clear for me wether or not I should pick
> > unevaluatedProperties
>
> Yes
>
> > as I still reference "poll-interval" from the
> > input.yaml schema ?
>
> You should drop it from your binding.

The driver use it could you explain why I should drop it ?

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

