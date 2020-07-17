Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F50223B46
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 14:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgGQMVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 08:21:13 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50097 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgGQMVM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 08:21:12 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 883F6FF803;
        Fri, 17 Jul 2020 12:21:06 +0000 (UTC)
Message-ID: <636026bb5c1a1ea8753c0b145b93b3e542720456.camel@hadess.net>
Subject: Re: [PATCH 3/3] platform/x86: thinkpad_acpi: Map Clipping tool
 hotkey to KEY_SELECTIVE_SCREENSHOT
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 17 Jul 2020 14:21:05 +0200
In-Reply-To: <20200717114155.56222-4-hdegoede@redhat.com>
References: <20200717114155.56222-1-hdegoede@redhat.com>
         <20200717114155.56222-4-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-07-17 at 13:41 +0200, Hans de Goede wrote:
> Commit 696c6523ec8f ("platform/x86: thinkpad_acpi: add mapping for
> new
> hotkeys") added support for a bunch of new hotkeys, but the
> clipping/snipping tool hotkey got ignored because there was no good
> key-code to map it to.
> 
> Recently a new KEY_SELECTIVE_SCREENSHOT keycode was added by commit
> 3b059da9835c ("Input: allocate keycode for "Selective Screenshot"
> key")
> quoting from the commit message:
> 
> "New Chrome OS keyboards have a "snip" key that is basically a
> selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keycode for it."
> 
> Support for this "snip" key seems like it is also a good match for
> the
> clipping/snipping tool hotkey, so map this hotkey to the new
> KEY_SELECTIVE_SCREENSHOT key-code.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Added 5 years ago for the Carbon X1 2014, and finally getting
a keycode ;)

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 7fc44b6f8370..70d533b0c907 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3436,7 +3436,7 @@ static int __init hotkey_init(struct
> ibm_init_struct *iibm)
>  		KEY_UNKNOWN,
>  
>  		KEY_BOOKMARKS,			/* Favorite app,
> 0x311 */
> -		KEY_RESERVED,			/* Clipping tool */
> +		KEY_SELECTIVE_SCREENSHOT,	/* Clipping tool */
>  		KEY_CALC,			/* Calculator (above numpad,
> P52) */
>  		KEY_BLUETOOTH,			/* Bluetooth */
>  		KEY_KEYBOARD,			/* Keyboard, 0x315 */

