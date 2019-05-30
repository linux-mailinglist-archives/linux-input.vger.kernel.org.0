Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 915952F8EA
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2019 11:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfE3JAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 May 2019 05:00:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59076 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfE3JAo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 May 2019 05:00:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrewsh)
        with ESMTPSA id 8201A2808DE
Subject: Re: [PATCH] [trivial] HID: Typo s/to back 0/back to 0/
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190527122532.6084-1-geert+renesas@glider.be>
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.shadura@collabora.co.uk; prefer-encrypt=mutual;
 keydata=
 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
 Ooa/yj03j5gtPgECL7c=
Organization: Collabora
Message-ID: <7c4d1462-4cf0-7d2a-177b-4d47698fd9cb@collabora.co.uk>
Date:   Thu, 30 May 2019 11:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527122532.6084-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/05/2019 14:25, Geert Uytterhoeven wrote:
> Fix a silly word ordering typo.
> 
> Fixes: 42337b9d4d958daa ("HID: add driver for U2F Zero built-in LED and RNG")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index c3c390ca369022f0..735223f90035b2bf 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1028,7 +1028,7 @@ config HID_U2FZERO
>  
>  	  U2F Zero only supports blinking its LED, so this driver doesn't
>  	  allow setting the brightness to anything but 1, which will
> -	  trigger a single blink and immediately reset to back 0.
> +	  trigger a single blink and immediately reset back to 0.
>  
>  config HID_WACOM
>  	tristate "Wacom Intuos/Graphire tablet support (USB)"

That was a silly typo indeed :D

Not sure this is needed, but just in case:

Acked-by: Andrej Shadura <andrew.shadura@collabora.co.uk>

-- 
Cheers,
  Andrej
