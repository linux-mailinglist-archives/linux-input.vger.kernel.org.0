Return-Path: <linux-input+bounces-287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3D7FB928
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 12:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CC71C20E42
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 11:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0756E4F214;
	Tue, 28 Nov 2023 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vml2hN5p"
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5152A109;
	Tue, 28 Nov 2023 03:14:43 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D4DC0010;
	Tue, 28 Nov 2023 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701170081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNMFjNjhLifrVaW3Buhm2wwZKds2TKBlbyAc5QrDcaY=;
	b=Vml2hN5pEcw7TUf/ybH0i7LwpD1b1TL9sQUO/hvpAPaUF62CV97I1tQe6NZXWCeVMrHCtw
	COFNBb6EEo89EagWG7JPAHnlKq7COnbihZFg8afIFF6GtQsl3QzmmDXnZpWTSDCD/s77oA
	EWSa2+MYAVTCi9vfLu3DHaxTQc1D45n14VG+k/GvPVG6xyQI9oQWB8TQAmHBK85L5+aeCX
	LvvQvq+3Y8ZbsPjUW5fM3PypWPlYuEub2IP/lrzpReN0q6Sil2nizWQPYYSZ5CJpnzmrLz
	0SZxhnEkxfgXIH3ii1obKmHnzjiXTjp/9Q23WLsIngm3xYtjh98ZhUo7k+JXYA==
Date: Tue, 28 Nov 2023 12:14:39 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jeff LaBundy <jeff@labundy.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: input: touchscreen: goodix: clarify
 irq-gpios misleading text
Message-ID: <20231128121439.1c4c7f8e@booty>
In-Reply-To: <729e43fb-bc01-4d68-ba1c-5874b5428b63@linaro.org>
References: <20230925032208.11698-1-luca.ceresoli@bootlin.com>
	<169565910910.1468857.379234431707593994.robh@kernel.org>
	<20231128102105.4d901b3a@booty>
	<729e43fb-bc01-4d68-ba1c-5874b5428b63@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Krzysztof,

On Tue, 28 Nov 2023 10:22:27 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 28/11/2023 10:21, Luca Ceresoli wrote:
> > Hello Rob,
> > 
> > On Mon, 25 Sep 2023 11:25:09 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >   
> >> Acked-by: Rob Herring <robh@kernel.org>  
> > 
> > I can't find this patch in your for-next, is there any blocker I should
> > handle?  
> 
> This was an Ack, not applied from Rob. Intention is that bindings go via
> subsystem maintainer (here: Dmitry).

Thanks for the clarification!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

