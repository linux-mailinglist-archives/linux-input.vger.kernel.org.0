Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EC9D5699
	for <lists+linux-input@lfdr.de>; Sun, 13 Oct 2019 17:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfJMPRm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 11:17:42 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43829 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfJMPRm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 11:17:42 -0400
Received: by mail-ed1-f67.google.com with SMTP id r9so12616283edl.10
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0w9pOud1Gplo2L2BKrKOM5D4pobiaZUpb7lbbCEg85o=;
        b=Ra2y9JuK5oy1CzhxLmGq7CXvBp3UpVcZt3g0E0WP9WznL0uwfWQpwg98sqwmiPL51B
         mTXt523SmE7st11A6JukzwDIbvKMiJprWbXHV+bP5DBfRMAQOb67AzblQ/rfUYIAAYgf
         PVDWkntJZaEu8YflPy5cMLAfDYDvH9db8FgncaEy0UIFGLZt40NE7NsLjt5/T3wuNoaL
         KgszKPowN6QjOGQEbBZo+NQX3v3g9BuBXtP2Jyd5oZjB9+MbaiXtN5MOKUzKwTW4OdGY
         Qa5F8MpJLksRp3yA5wWbhJ/ygXITS7aWTIHKWXXiY4FBYLS0uRgo3OnKH6yY93pLO9DZ
         Ylrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0w9pOud1Gplo2L2BKrKOM5D4pobiaZUpb7lbbCEg85o=;
        b=URhskisFrRdaySmPbe33lUjWLnETbzbnR7Y11/MiM3OG9Z3E5QcnOSlkm/CtnQdGLd
         sABfsVwelGyka1PyoSMjI0OAaIh+0s+FTVgaaAkMPSFBHsMkJwQqGLvrp/zwKqsmbyZe
         htEagek94esSRqQQazL8VkXNgUfDEr15yMLHcqCBilm/mcWvKTZO3F3LrToujb0vRT8I
         Ep2nWMUYEV9pGpZGtMt910MZFm5cSxXIZZ4xvI3NSZ9WBmC/UYoPF7G5OzObpzuEoF5G
         UH3Mfq1c55q9xfNKHgMRNHDEiMl/FZSIWl2n9AnTDJilJ5VCnkS3SwsKWKIqucG6dupB
         cM4Q==
X-Gm-Message-State: APjAAAVkufKbHZ8+eTUNpy4ltNCcvB3fHnoOxWZaFpl0KbhYUwjuAt53
        DM9bibjNX+zHeJ4Ct6l6rNnvo1JkQt0=
X-Google-Smtp-Source: APXvYqy5oyqXImchLRX8ZHfE+PG4JX8tpiElVIt8QF2zZOmFv1Gq18CmQ7lu2tNzkxH5cPYuFw+50A==
X-Received: by 2002:a17:906:4d95:: with SMTP id s21mr24169239eju.175.1570979859210;
        Sun, 13 Oct 2019 08:17:39 -0700 (PDT)
Received: from gmail.com (83-84-17-34.cable.dynamic.v4.ziggo.nl. [83.84.17.34])
        by smtp.gmail.com with ESMTPSA id m19sm1958522eja.35.2019.10.13.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 08:17:38 -0700 (PDT)
Date:   Sun, 13 Oct 2019 17:17:37 +0200
From:   Jelle van der Waa <jelle@vdwaa.nl>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add support for Razer Blackwidow keyboards
Message-ID: <20191013151736.2jbxjat724v6io52@gmail.com>
References: <20190705221605.28293-1-jelle@vdwaa.nl>
 <nycvar.YFH.7.76.1910011625000.13160@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.1910011625000.13160@cbobk.fhfr.pm>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/01/19 at 04:26pm, Jiri Kosina wrote:
> On Sat, 6 Jul 2019, Jelle van der Waa wrote:
> 
> > Add support for the macro keys on the Razor Blackwidow keyboards. By
> 
> So I guess it should say 'Razer' here?
> 
> > default the macro keys do not work and have to be enabled via a feature
> > report. After being enabled they report as XF86Tools, XF86Launch5-8.
> > 
> > Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
> > ---
> >  drivers/hid/Kconfig     |  7 ++++
> >  drivers/hid/Makefile    |  1 +
> >  drivers/hid/hid-ids.h   |  3 ++
> >  drivers/hid/hid-razer.c | 78 +++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 89 insertions(+)
> >  create mode 100644 drivers/hid/hid-razer.c
> > 
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 3872e03d9a59..0b4bc464fc11 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -1135,6 +1135,13 @@ config HID_ALPS
> >  	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
> >  	and want support for its special functionalities.
> >  
> > +config HID_RAZER
> > +	tristate "Razer Blackwidow keyboard support"
> > +	depends on HID
> > +	---help---
> > +	Say Y here if you want the Razer Blackwidow keyboards to enable macro
> > +	keys.
> > +
> >  endmenu
> >  
> >  endif # HID
> > diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> > index cc5d827c9164..417168a88193 100644
> > --- a/drivers/hid/Makefile
> > +++ b/drivers/hid/Makefile
> > @@ -121,6 +121,7 @@ obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
> >  obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
> >  obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
> >  obj-$(CONFIG_HID_VIEWSONIC)	+= hid-viewsonic.o
> > +obj-$(CONFIG_HID_RAZER)		+= hid-razer.o
> 
> Please keep the list sorted, as it was before.
> 
> >  wacom-objs			:= wacom_wac.o wacom_sys.o
> >  obj-$(CONFIG_HID_WACOM)		+= wacom.o
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index b032d3899fa3..8f6ce553b52c 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -955,6 +955,9 @@
> >  
> >  #define USB_VENDOR_ID_RAZER            0x1532
> >  #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
> > +#define USB_DEVICE_ID_RAZER_BLACKWIDOW 0x010e
> > +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE 0x011a
> > +#define USB_DEVICE_ID_RAZER_BLACKWIDOW_2013 0x011b
> >  
> >  #define USB_VENDOR_ID_REALTEK		0x0bda
> >  #define USB_DEVICE_ID_REALTEK_READER	0x0152
> > diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
> > new file mode 100644
> > index 000000000000..d958fd9f9311
> > --- /dev/null
> > +++ b/drivers/hid/hid-razer.c
> > @@ -0,0 +1,78 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * HID driver to enable macro keys on Razer keyboards
> > + *
> > + * Copyright (c) 2019 Jelle van der Waa <jelle@vdwaa.nl>
> > + */
> > +
> > +#include <linux/hid.h>
> > +#include <linux/module.h>
> > +#include "hid-ids.h"
> > +
> > +#define RAZER_BLACKWIDOW_FEATURE_REPORT 0x00
> > +#define BUF_SIZE 91
> > +
> > +static const u8 data[BUF_SIZE] = {0, 0, 0, 0, 0, 0, 2, 0, 4, 2, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> > +	0, 0, 4, 0};
> > +
> > +static const struct hid_device_id razer_devices[] = {
> > +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW) },
> > +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_2013) },
> > +	{ HID_USB_DEVICE(USB_VENDOR_ID_RAZER, USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE) },
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(hid, razer_devices);
> > +
> > +static int razer_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > +{
> > +	struct hid_report_enum *rep_enum;
> > +	struct hid_report *rep;
> > +	unsigned char *dmabuf;
> > +	bool has_ff000002 = false;
> > +	int ret = 0;
> > +
> > +	dmabuf = kmemdup(data, BUF_SIZE, GFP_KERNEL);
> > +	if (!dmabuf)
> > +		return -ENOMEM;
> > +
> > +	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> > +
> > +	ret = hid_parse(hdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rep_enum = &hdev->report_enum[HID_FEATURE_REPORT];
> > +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> > +		if (rep->maxfield && rep->field[0]->maxusage)
> > +			if (rep->field[0]->usage[0].hid == 0xff000002)
> > +				has_ff000002 = true;
> > +	}
> > +
> > +	if (has_ff000002) {
> > +		ret = hid_hw_raw_request(hdev, RAZER_BLACKWIDOW_FEATURE_REPORT,
> > +				dmabuf, BUF_SIZE, HID_FEATURE_REPORT,
> > +				HID_REQ_SET_REPORT);
> > +		if (ret != BUF_SIZE)
> > +			hid_err(hdev, "Razer failed to enable macro keys\n");
> > +	}
> > +
> > +	kfree(dmabuf);
> > +
> > +	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> 
> Can't this all be done in userspace via udev script through hidraw?

I guess it could, but that would mean everyone has to install a package
for it being able to work.
