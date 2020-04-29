Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC291BE7A5
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 21:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgD2TrW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Apr 2020 15:47:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727811AbgD2TrP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Apr 2020 15:47:15 -0400
Received: from pobox.suse.cz (unknown [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB36120BED;
        Wed, 29 Apr 2020 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588189635;
        bh=imdDb6SEe8egaE3DWtE90vcKygzMU7wmOuUhdRPk8zY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bN0B9f6iw/MfZp7uh/2hFkPjkJeuedU1Yd0zv33xUVg/SOOcYKIQp+zIFOEQN1eEm
         sCeux0tPex7kTp7ewfQBWL/e5iN9qn9XlQSFYIvvdoVKzj0pbkIXTxa+iyvnLDeZve
         Sa0O882EPvX4uUtIWkaEYwJqN5NHmV0hKeIZhIDM=
Date:   Wed, 29 Apr 2020 21:47:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rishi Gupta <gupt21@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <bnocera@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: add gpiolib dependency
In-Reply-To: <20200428213035.3108649-1-arnd@arndb.de>
Message-ID: <nycvar.YFH.7.76.2004292147030.19713@cbobk.fhfr.pm>
References: <20200428213035.3108649-1-arnd@arndb.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 28 Apr 2020, Arnd Bergmann wrote:

> Without gpiolib, this driver fails to link:
> 
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp2221_probe':
> hid-mcp2221.c:(.text+0x1b0): undefined reference to `devm_gpiochip_add_data'
> arm-linux-gnueabi-ld: drivers/hid/hid-mcp2221.o: in function `mcp_gpio_get':
> hid-mcp2221.c:(.text+0x30c): undefined reference to `gpiochip_get_data'
> 
> Fixes: 328de1c519c5 ("HID: mcp2221: add GPIO functionality support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks Arnd.

-- 
Jiri Kosina
SUSE Labs

