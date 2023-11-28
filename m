Return-Path: <linux-input+bounces-285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 366017FB588
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 10:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC42B1F2060F
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 09:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34F73AC21;
	Tue, 28 Nov 2023 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b1Ixi4AZ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE94EAB;
	Tue, 28 Nov 2023 01:21:08 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 940B06000E;
	Tue, 28 Nov 2023 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701163267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AHfL8OlK5Wws5aBHfXQszsiM7vcGe9qGfq3zPeCIPk=;
	b=b1Ixi4AZJSKM3Hx5tZCcYnSm7Ixnt3mfB0C74X85YbM2kyyjJ3JtUqkEXYfvZ520BiYW47
	ccNtbgp/SdfNGOYYQYKRn8qoZvth9rggVjj8Tn1DoVFJaBb5cFVzqzYNcHHUF2lvNI5vPY
	shBwufx+v81gJuze7HFAYmHz/OFK+ZwOa4XC7KGSeIrXy78910kQE6sK/Whn9DbSk3XG6T
	X6D8CexFn6weqq27rfhqVRuHy2VYwAiu3Q1PkUF0tmnA7dTPFJlFK1KYI/eytNvXS+yfw6
	KJuwFHG8FJXnzM7yGY53qcqztktUrH8va16YvBXtftbMszgySgfa5HYWaN0bRA==
Date: Tue, 28 Nov 2023 10:21:05 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jeff LaBundy <jeff@labundy.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: input: touchscreen: goodix: clarify
 irq-gpios misleading text
Message-ID: <20231128102105.4d901b3a@booty>
In-Reply-To: <169565910910.1468857.379234431707593994.robh@kernel.org>
References: <20230925032208.11698-1-luca.ceresoli@bootlin.com>
	<169565910910.1468857.379234431707593994.robh@kernel.org>
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

Hello Rob,

On Mon, 25 Sep 2023 11:25:09 -0500
Rob Herring <robh@kernel.org> wrote:

> Acked-by: Rob Herring <robh@kernel.org>

I can't find this patch in your for-next, is there any blocker I should
handle?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

