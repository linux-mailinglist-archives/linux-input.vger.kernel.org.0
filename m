Return-Path: <linux-input+bounces-150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D9E7F276D
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF97281F46
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41943AC3C;
	Tue, 21 Nov 2023 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM4nuFG8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825438DC6
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997BDC433C9;
	Tue, 21 Nov 2023 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700555300;
	bh=yrkU8VJB5SKAtcRYFYmhxNO9FCZg2MU9Fl1s+k0LICs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RM4nuFG87Gcs2ajeJCX/i3p1qsayRyuOYvoGfMXS/tDcjXP1r7zeMwgMvpa45t433
	 TETW6Sxp+5LTEQDnsvlY1dvjOUz9UdCf+q8qOE2p8THl/kYvrzHhqUpUEItYPcJ+ag
	 dMcg+BIdMfvzFnIyr/AB5gy6IlxXOjYyj7eRU10dwAF7VexpfB50WG8hHznY5tYMiD
	 JwIbJ1jC4JxeBo6DOoH4x/qeX0/VrU64cetOkgF9JMkQOyDSGkk6qQplgjPs7xzXDb
	 LrWh1EfEntQWYealAN6SmbHCgR3u2m0e/9j3AO0ldtaP35PULqK2jx2IXLMkvPN0f8
	 NcWrF7EWRqNdw==
Date: Tue, 21 Nov 2023 09:28:16 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Johannes Roith <johannes@gnu-linux.rocks>
cc: sergeantsagara@protonmail.com, andi.shyti@kernel.org, 
    benjamin.tissoires@redhat.com, christophe.jaillet@wanadoo.fr, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org
Subject: Re: [PATCH v7] HID: mcp2200: added driver for GPIOs of MCP2200
In-Reply-To: <20230921164928.170383-1-johannes@gnu-linux.rocks>
Message-ID: <nycvar.YFH.7.76.2311210927510.29220@cbobk.fhfr.pm>
References: <20230921164928.170383-1-johannes@gnu-linux.rocks>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Sep 2023, Johannes Roith wrote:

> Added a gpiochip compatible driver to control the 8 GPIOs of
> the MCP2200 by using the HID interface.
> 
> Using GPIOs with alternative functions (GP0<->SSPND, GP1<->USBCFG,
> GP6<->RXLED, GP7<->TXLED) will reset the functions, if set (unset by
> default).
> 
> The driver was tested while also using the UART of the chip. Setting
> and reading the GPIOs has no effect on the UART communication. However,
> a reset is triggered after the CONFIGURE command. If the GPIO Direction
> is constantly changed, this will affect the communication at low baud
> rates. This is a hardware problem of the MCP2200 and is not caused by
> the driver.
> 
> Signed-off-by: Johannes Roith <johannes@gnu-linux.rocks>

Now applied to hid.git#for-6.8/mcp2200. Thanks and sorry for the delay 
in the review.

-- 
Jiri Kosina
SUSE Labs


