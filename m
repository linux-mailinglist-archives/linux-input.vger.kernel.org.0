Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B4F1E88F6
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 22:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgE2Udb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 16:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgE2Ud1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 16:33:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD88C08C5CB;
        Fri, 29 May 2020 13:33:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p30so451530pgl.11;
        Fri, 29 May 2020 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SFmuSEf0AGpMxKm8V34s/d7k2oUKvRzQXSbrrQduN4k=;
        b=LM1dPShEli098FLDwnYhkV+0T2hp8Uwz984pm/7QF4xIByrHV/6bRnEvoAL59nx1Ek
         lWt+92RZtwue8pHMoXS1yN+So60GTR+wtRgKzqimp6JhUQh5KqHa3Ua6JmfMF3CBeBr5
         diK6yJrOHUfwiH73ui1MfXPWaPbTfpxf/fax8XLb0eUt7cGij5ikAlfVmZ7sq1Hvci0Y
         aR6v3w1jLkXzvQpnO2aN++0QYGOqFRmvQhxXxewrF/mvOA5SoA6P/lkAtCjlS8ofUFEj
         UlEFtEezp3VpUT4O7+AWbEzELarcEbG2x2xzqWgAvuuHj4llEenZvcM23PkOV+1tIQze
         ucQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SFmuSEf0AGpMxKm8V34s/d7k2oUKvRzQXSbrrQduN4k=;
        b=SRBKOYXItjhI9kYt5S4U126y1Ng9q849l7qPQ1EbdIpubfOjrmoHObbhfFForReJOb
         Zgx1CQX2gTSw6uPqq0TRb3ZTYdKNjMrpZoI46yasNddWvOfVuvmsYJII8XRBNChfYO+Q
         kAenGZJ/BHtIhghxX2qkzZFvsR6yj04GxGP6h8RHW5+r9faFI/Ys6NgJTK9IIy0yv77l
         SkMWW8nwLOWbjXWujS7s1hhf6kjEDyQ6zxe6f1uEQx9eyEEBRE8FilRENEPjGmBC7MLW
         GVoXNlmKBhm0wn6TO6Wkq0D6kBuqjq1B0qVOS7KW2m3FaDqscRb/mME6NsHD2YsH+hTN
         p4Ow==
X-Gm-Message-State: AOAM532l8UGnsJInUYgwEyByw9WekEiCMrGYzgEwB25MlG8OZCjVd/S4
        cif9YDcTnBSJ+YioDLCH5ZI9oNSf
X-Google-Smtp-Source: ABdhPJzhaSX/OYtOM2+g4EKqdUmnyU/S1XaNnapVtdvqpdgjvRfde7Y1l6mMzph3FlWapk0JPV+aRQ==
X-Received: by 2002:aa7:8c44:: with SMTP id e4mr10221335pfd.108.1590784406650;
        Fri, 29 May 2020 13:33:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y4sm7834796pfn.101.2020.05.29.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 13:33:26 -0700 (PDT)
Date:   Fri, 29 May 2020 13:33:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200529203324.GL89269@dtor-ws>
References: <20200529195951.GA3767@dtor-ws>
 <20200529201424.GA180211@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529201424.GA180211@roeck-us.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 01:14:24PM -0700, Guenter Roeck wrote:
> On Fri, May 29, 2020 at 12:59:51PM -0700, Dmitry Torokhov wrote:
> > usbhid tries to give the device 50 milliseconds to drain its queues
> > when opening the device, but does it naively by simply sleeping in open
> > handler, which slows down device probing (and thus may affect overall
> > boot time).
> > 
> > However we do not need to sleep as we can instead mark a point of time
> > in the future when we should start processing the events.
> > 
> > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> >  drivers/hid/usbhid/usbhid.h   |  1 +
> >  2 files changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > index c7bc9db5b192..e69992e945b2 100644
> > --- a/drivers/hid/usbhid/hid-core.c
> > +++ b/drivers/hid/usbhid/hid-core.c
> > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> >  				set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> >  		} else {
> >  			clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > +
> > +			if (test_and_clear_bit(HID_RESUME_RUNNING,
> > +					       &usbhid->iofl)) {
> > +				/*
> > +				 * In case events are generated while nobody was
> > +				 * listening, some are released when the device
> > +				 * is re-opened. Wait 50 msec for the queue to
> > +				 * empty before allowing events to go through
> > +				 * hid.
> > +				 */
> > +				usbhid->input_start_time = jiffies +
> > +							   msecs_to_jiffies(50);
> > +			}
> >  		}
> >  	}
> >  	spin_unlock_irqrestore(&usbhid->lock, flags);
> > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> >  		if (!test_bit(HID_OPENED, &usbhid->iofl))
> >  			break;
> >  		usbhid_mark_busy(usbhid);
> > -		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > +		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > +		    time_after(jiffies, usbhid->input_start_time)) {
> >  			hid_input_report(urb->context, HID_INPUT_REPORT,
> >  					 urb->transfer_buffer,
> >  					 urb->actual_length, 1);
> > @@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
> >  	}
> >  
> >  	usb_autopm_put_interface(usbhid->intf);
> > -
> > -	/*
> > -	 * In case events are generated while nobody was listening,
> > -	 * some are released when the device is re-opened.
> > -	 * Wait 50 msec for the queue to empty before allowing events
> > -	 * to go through hid.
> > -	 */
> > -	if (res == 0)
> > -		msleep(50);
> > -
> Can you just set usbhid->input_start_time here ?
> 	if (res == 0)
> 		usbhid->input_start_time = jiffies + msecs_to_jiffies(50);
> 	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
> 
> Then you might not need the added code in hid_start_in().

That was my first version, but if hid_start_in() fails we start a timer
and try to retry the IO (and the "res" in 0 in this case). And we want
to mark the time only after we successfully submitted the interrupt URB,
that is why the code is in hid_start_in().

Thanks.

-- 
Dmitry
