Return-Path: <linux-input+bounces-356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D47FEEB2
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 13:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356E01C20B10
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 12:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A60045949;
	Thu, 30 Nov 2023 12:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="b6vcnrzh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA6CD46
	for <linux-input@vger.kernel.org>; Thu, 30 Nov 2023 04:15:45 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C249A60513;
	Thu, 30 Nov 2023 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701346545;
	bh=Xcv7BSUEDf312JviWiQadR3dOJXljJO+faF18GGsn2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6vcnrzh+ptm06btotfIhiCuBM+EEJ11byn9loKKbPOCH+YV9LmJwA4HSFgNCSNAH
	 ZEcgHJSsgmJQJ7kkeew3DhTdqD3h2rKqlyTEiZUREFBN+txp5B90178kjlgUnknodz
	 D70f7nItfTvokyY+xtp4g0IyotkL2yh9zSuEa+pkoVDn/JoTkA6UabU6an300jx/Hk
	 8pFWKjj1pu6qEM/WCRk/22EYKmRpw/BzsZOrF7iWWJphuNSE5lDvuXO7/khZ18wRNR
	 vJdbqGcZz5+KK9CpnH4QVBse63EgUtIOteTHQQjPNGwcQAopV70izyh81gT3TZHqCt
	 ttYJ0JZ2Ihs6g==
Date: Thu, 30 Nov 2023 14:15:36 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: omap-keypad - Drop optional GPIO support
Message-ID: <20231130121536.GR5166@atomide.com>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-3-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-input-v1-3-9433162914a3@linaro.org>

* Linus Walleij <linus.walleij@linaro.org> [231129 13:51]:
> Remove the support for these unused GPIOs, if need be support can
> be reestablished in an organized fashion using GPIO descriptors.

Sounds good to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>

