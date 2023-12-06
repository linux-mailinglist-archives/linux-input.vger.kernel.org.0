Return-Path: <linux-input+bounces-568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC7807A69
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 22:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A031F21323
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 21:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0F070963;
	Wed,  6 Dec 2023 21:28:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF7F10C3;
	Wed,  6 Dec 2023 13:28:32 -0800 (PST)
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rAzRA-0075kc-3C; Wed, 06 Dec 2023 22:28:08 +0100
Date: Wed, 6 Dec 2023 22:28:05 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com, tony@atomide.com,
 u.kleine-koenig@pengutronix.de, robh@kernel.org,
 Jonathan.Cameron@huawei.com, andreas@kemnade.info, frank.li@vivo.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: omap4-keypad: react on keypresses if device is
 runtime-suspended
Message-ID: <20231206222805.7e04f2b7@aktux>
In-Reply-To: <20231126194319.111504-1-andreas@kemnade.info>
References: <20231126194319.111504-1-andreas@kemnade.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Nov 2023 20:43:19 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> According to SWPU235AB, table 26-6, fclk is required to generate events
> at least on OMAP4460, so keep fclk enabled all the time the device
> is opened.
> 
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> ---
> Changes since RFC:
> - add R-by:
> 
>  drivers/input/keyboard/omap4-keypad.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
a friendly ping...

Regards,
Andreas

