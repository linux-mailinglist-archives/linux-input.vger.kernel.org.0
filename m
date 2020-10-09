Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975E6288610
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 11:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733140AbgJIJi7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 05:38:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:60154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733139AbgJIJi7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Oct 2020 05:38:59 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 674C72225A;
        Fri,  9 Oct 2020 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602236338;
        bh=GW8nn9+XG0kj1tkIE4csBRiTl3rs/3EEgpOCfNTksPI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=0kJwaSe9TuW6RP6C7pGHmG17L6oyi7cCTK7C++1eiKDyWXbFFh3UxjWTjgK3DJQFy
         vqkGFbW13Avj8E4i3foELQ7bDYDWckG797nQ/0iJtHp0/Lj0ajpdbGnrxLsgxk+XIv
         Jl8Qm4tcxluu7Gyk3Jqf5GsVXJYtRgy1Xiloays0=
Date:   Fri, 9 Oct 2020 11:38:55 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke D Jones <luke@ljones.dev>
cc:     benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key
 keyboard
In-Reply-To: <20200923215633.209724-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2010091137510.3336@cbobk.fhfr.pm>
References: <20200923215633.209724-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Sep 2020, Luke D Jones wrote:

> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> almost all modern ASUS gaming laptops with slight changes to the
> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
> 
> The keyboard has many of the same key outputs as the existing G752
> keyboard including a few extras, and varies a little between laptop
> models. The key-sets have been split and sub-grouped so that there
> will not be conflict between key event codes used.
> 
> An existing key event used across some keyboards for "Mic Toggle"
> has been changed to emit "F20" as this is what all the main
> desktop environments are using.
> 
> Additionally this keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.
> 
> Misc changes in scope: update some hardcoded comparisons to use an
> available define.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>

Thanks for the patch. Looks good to me in general, one small nit before 
this can be merged as a whole ...

> ---
>  drivers/hid/hid-asus.c                     | 188 ++++++++++++++++++---
>  drivers/hid/hid-ids.h                      |   1 +
>  include/linux/platform_data/x86/asus-wmi.h |   2 +

... I'd like to get Ack from Andy (CCing) on the addition below to 
asus-wmi.h.

[ ... snip ... ]
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 897b8332a39f..05253cfe786c 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -27,6 +27,8 @@
>  #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
>  #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
> 
> +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method ?? */
> +
>  #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> 
>  /* Wireless */

Thanks,

-- 
Jiri Kosina
SUSE Labs

