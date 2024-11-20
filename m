Return-Path: <linux-input+bounces-8160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C49D34BC
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 08:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49531F2041C
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 07:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD61189BBF;
	Wed, 20 Nov 2024 07:50:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF75189B8C;
	Wed, 20 Nov 2024 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732089027; cv=none; b=LAWa35RlcpbwG91IXRSVdc3ugxhiBBVCqaGXxH6YK710ybgsXTXFi/cceW5Ccj6c3CAMZZLHk3GSbJGkUaqr3Onarpd7lV6xd0vxyUW4l0lhqT67epKJSH+5DqZmGHhFjA3/bIQh62g0B4tlJF/Zk2Dd/kqhSnIQe+cLrUKv/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732089027; c=relaxed/simple;
	bh=Pgm6vDJSYNE6XLVqzmM2tKX1+m5dsYR/GDmcWdO6QyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctnsThNpB8kIxAb9MoCfTit2mlYXQW05AaEpdOI/BfA6JvvPcUw2TfacBkBLtbgWrn5KACuwNyuZ8nyndVvSdWH9uF6DFhG+WTJ61sWyyW/FzaixLnUdmxWeHX9I7W6kQqlax481FD1Q2025NzFtpZQlVZ6V8WfI+GSX3L6njl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C24FC4CED7;
	Wed, 20 Nov 2024 07:50:25 +0000 (UTC)
Date: Wed, 20 Nov 2024 08:50:22 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Marco Felsch <kernel@pengutronix.de>, 
	Henrik Rydberg <rydberg@bitmath.org>, Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: vendor-prefixes: Add TouchNetix AS
Message-ID: <b5hjephfcvdu2jjchodaj5u4yltvatdgmse7xvwkhaepn5dinv@sfl4utyuz34g>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-3-6124925b9718@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119-v6-10-topic-touchscreen-axiom-v1-3-6124925b9718@pengutronix.de>

On Tue, Nov 19, 2024 at 11:33:52PM +0100, Marco Felsch wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Add vendor prefix for TouchNetix AS (https://www.touchnetix.com/products/).
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think this did not happen (only Ack).

Best regards,
Krzysztof


