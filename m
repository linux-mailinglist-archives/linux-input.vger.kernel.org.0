Return-Path: <linux-input+bounces-8185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF39D4896
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 09:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41FB2831CE
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 08:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C24E1CACEB;
	Thu, 21 Nov 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iykhJj5P"
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E759B1AA7A6;
	Thu, 21 Nov 2024 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176843; cv=none; b=nwy/5xLiixhAVaQrDxGY1zr7xxlbM51u9BKTJn+pS4/WqJ9qg5EwB5fCf5ej7Frhmhtj4WtSPa8a7HQ1Xq4mZg1DcRS5VEI8QcLbTtHu0h9pnRc07uuvIQhzxo0ojP99DJMwbxltOaq/vI8hp5xrnvkLDhXHQScYPNnEmqNNyxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176843; c=relaxed/simple;
	bh=CafMYVZ79DZqi/C5+exbASPocFVFWBObt8oXVHiDf3I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aWEFmwxmtqv8YZBkFERnh9iklmsqZZ400w4E+uonGYkiceLstE5DNk/aIlGV6gOcwLID/fp83VhWmWnYt4JhqZwjjQSeEI4k4r9U2nrij4tDywD7Kbj9uET+X1NIKb8mwpzcevIMYWwOGi1H1Y7FZcktqx4q1vcfU+gAXhFEdKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iykhJj5P; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C75B2C0002;
	Thu, 21 Nov 2024 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732176831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/7TdB2V8Qari8AxpRA55wppeVs7piY9IdN4S6uXBi0=;
	b=iykhJj5P5oKabyN/wbVvS/lWLB59wkctPUKwkPDJ4hcaCH9DkyzaCk9vC+7cINQ32qDIZk
	JOvrC1fpxMhBSx9scFzhO7+jR9R7DXppEoMCyRoW4ont/6IAIo/NeweCrVVkXzeRfYq6q1
	HHH5UyV4a7nii78i3zdWexowkO9b9DA/t3gvJfAJqI8kWN62LAD9KHS9468T848n7RRwV8
	WBQjRnzZi8Uk3K5RyZaoOh+raIDHzkCz+DGEba0aN2woidWTdIxN0P81Z6PaByyU61LwDB
	EL8+XmnlbP9EAx/CeJoSpdFEwMM2xzfQhD1WUEcCn1h9jWMiC2nG2qZzrc0AAQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 09:13:49 +0100
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Marco Felsch <kernel@pengutronix.de>,
 Henrik Rydberg <rydberg@bitmath.org>, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/5] Input: Add support for TouchNetix aXiom touchscreen
In-Reply-To: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
Message-ID: <560bfaab3c6d1fb1190f0b1daa55e797@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-11-19 23:33, Marco Felsch a écrit :
> Hi,
> 

Hi Marco,

> This adds the initial support for the TouchNetix aXiom touchcontroller
> family.
> 
> This series is the successor of [1] (many thanks to Bootlin) but I
> started from a fresh v1 since I had to rework the driver completely.
> 

Thanks for taking over and I honestly think it's good idea to completely
start it from scratch, I should have done it as well.

Greetings,
--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

