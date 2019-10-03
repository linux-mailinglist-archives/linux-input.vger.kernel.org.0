Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C54BC9FA4
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbfJCNmS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 09:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730568AbfJCNmS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:18 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DED4E20865;
        Thu,  3 Oct 2019 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110137;
        bh=nfv+bj3iT+FagIWjzUN2dth6+c8YD5ShSa2B93Fk3JE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=u8hwo61mKfnzYDmHadT7PG8x85Gk1qFu2mOH/kYrHF8vuINdQJPv86jTuUKFJv5Ds
         cNs6d9WaCDAQVtr7vy3gm8KI/X/QXH0kY8IJD9mQ4VmgzjQsApMFKVIRtGBY/0DKCg
         bxFNLbHmnb/kcrhf0EqLiZ0wUjMHuIXjFcSSmGU4=
Date:   Thu, 3 Oct 2019 15:41:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/7] HID: Add driver for Logitech gaming keyboards
 (G15, G15 v2)
In-Reply-To: <20190828124130.26752-2-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1910031540530.13160@cbobk.fhfr.pm>
References: <20190828124130.26752-1-hdegoede@redhat.com> <20190828124130.26752-2-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Aug 2019, Hans de Goede wrote:

> Add a driver to stop the extra "G" keys from sending F1 - F12 instead
> making them send KEY_GKEY# and also make the non-functional M1 - M3 and MR
> keys and the non-functional buttons below the LCD panel properly generated
> key events.
> 
> Note the connect_mask and gkeys_settings_output_report variables may seem
> unnecessary since they are always set to the same value, these are there in
> preparation of adding support for the G, M and LCD keys on the G510 kbd.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - s/KEY_LCD_MENU/KEY_KBD_LCD_MENU/
> ---
>  MAINTAINERS              |   7 ++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ids.h    |   2 +
>  drivers/hid/hid-lg-g15.c | 256 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 266 insertions(+)
>  create mode 100644 drivers/hid/hid-lg-g15.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6480cf7c8bb3..8dfad599d367 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9474,6 +9474,13 @@ S:	Maintained
>  F:	Documentation/admin-guide/ldm.rst
>  F:	block/partitions/ldm.*
>  
> +LOGITECH HID GAMING KEYBOARDS
> +M:	Hans de Goede <hdegoede@redhat.com>
> +L:	linux-input@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> +S:	Maintained
> +F:	drivers/hid/hid-lg-g15.c
> +
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>  M:	Sathya Prakash <sathya.prakash@broadcom.com>
>  M:	Chaitra P B <chaitra.basappa@broadcom.com>
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cc5d827c9164..666f4358207e 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_HID_KYE)		+= hid-kye.o
>  obj-$(CONFIG_HID_LCPOWER)	+= hid-lcpower.o
>  obj-$(CONFIG_HID_LENOVO)	+= hid-lenovo.o
>  obj-$(CONFIG_HID_LOGITECH)	+= hid-logitech.o
> +obj-$(CONFIG_HID_LOGITECH)	+= hid-lg-g15.o

Hi Hans,

I've finished reviewing this pile, and would like to queue it for 5.5, but 
have one remaining question -- what is the reason you decided to factor 
this out as a separate driver, instead of putting it under the 
hid-logitech umbrella?

Thanks,

-- 
Jiri Kosina
SUSE Labs

