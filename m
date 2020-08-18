Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AE62485B6
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 15:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgHRNM2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 09:12:28 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:59348 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgHRNM1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 09:12:27 -0400
Received: from [78.43.71.214] (helo=marius.localnet)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1k81Pb-00086x-EN; Tue, 18 Aug 2020 15:12:23 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-cpro: fix ccp_probe, add delay [HID related]
Date:   Tue, 18 Aug 2020 15:12:22 +0200
Message-ID: <79890342.HV0Al07Iil@marius>
In-Reply-To: <20200817153533.GA243558@roeck-us.net>
References: <20200817070040.7952-1-mail@mariuszachmann.de> <20200817153533.GA243558@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Con-Id: 241080
X-Con-U: 0-linux
X-Originating-IP: 78.43.71.214
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18.08.20 at 17:35:33 CEST, Guenter Roeck wrote
> On Mon, Aug 17, 2020 at 09:00:40AM +0200, Marius Zachmann wrote:
> > Possibly because of the changes in usbhid/hid-core.c the first
> > raw input report is not received during ccp_probe function and it will
> > timeout. I am not sure, whether this behaviour is expected after
> > hid_device_io_start or if I am missing something.
> > As a solution this adds msleep(50) to ccp_probe so that all initial
> > input reports can be received.
> > 
> > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> 
> Let's just ask the HID maintainers. Is this expected, and the correct fix ?
> 
> Thanks,
> Guenter
> 

This seems to be a problem with "HID: usbhid: do not sleep when opening
device". There is a bug report with some Logitech devices at the correct
thread. These drivers also use hid_device_io_start and fail. Seems to me,
this is the same problem and I retract this (not so beautiful) fix until
this is sorted out.

Thanks,
Marius

> > ---
> > v2:
> > - fix accidentally deleted comment
> > 
> > ---
> >  drivers/hwmon/corsair-cpro.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> > index 591929ec217a..c04fac1d820f 100644
> > --- a/drivers/hwmon/corsair-cpro.c
> > +++ b/drivers/hwmon/corsair-cpro.c
> > @@ -10,6 +10,7 @@
> > 
> >  #include <linux/bitops.h>
> >  #include <linux/completion.h>
> > +#include <linux/delay.h>
> >  #include <linux/hid.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/kernel.h>
> > @@ -513,6 +514,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >  	init_completion(&ccp->wait_input_report);
> > 
> >  	hid_device_io_start(hdev);
> > +	msleep(50); /* wait before events can be received */
> > 
> >  	/* temp and fan connection status only updates when device is powered on */
> >  	ret = get_temp_cnct(ccp);
> > --
> > 2.28.0
> 




