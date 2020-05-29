Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F7F1E8915
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 22:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgE2Uox (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 16:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2Uow (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 16:44:52 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EE0C03E969;
        Fri, 29 May 2020 13:44:52 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n15so425276pfd.0;
        Fri, 29 May 2020 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RdrvG/y032Pb+0M+lAlgyETU611TcK85B72yJbBhqnQ=;
        b=JcNu1BWvx5pmMHXVdvRPKRe+BPaLoXsIEeQnXPqivdgfQG+fVqdbommxb5PkoZoHk7
         jLaRya8DMtAYwzRTVCK6+ej78Ot7wra+BDsV9MLyg7vs8HFkYki907mUgL2tLv47flhc
         tojQEscFYMYklLRKxsjRjF3RiLWpmXg587EpNAql9S8q7PEio2edd8TYCW0i+eEnjuby
         wJZlXY9WtW4uRHuuQ6QLKDWtTZHwNCQdUg/gp0K18TQ7OLfrpHHZblHUkRb0xQjMhpRI
         2r3xTMC+Qt4mNn3sTsVHuiQYlL5FF1/5EXx9qfNqLMs6wZIO6iMRszqveyb2fYbqw7D2
         VxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RdrvG/y032Pb+0M+lAlgyETU611TcK85B72yJbBhqnQ=;
        b=oCEhXCaKS+3RGIsvdYr17al7BalN6J/BGfQ1y5mUgfY3+oAIwI3+GO4pzXFWMxDZCU
         4WcF4f4Wef7SfqN2n6L/DPOf9llfqNKDxSi1bOmV34vN2n/YI+aVcaMWujNcL7k6lKqW
         /oc31JauQv07lTX4M9mwMjUYMXyJAEMkDAO52VpDO0IPP9NJJRpeinEsJaM3/qEANC99
         e251Mzntc2OlOYMbQXD2OX5cw0zjpjoO/n6RMwR3AkFXocP0hdRLMLfmQYjPV06WML4H
         6p2sR+5k49++m77KesgZLhVE4a1IEOipdLAueatPKVimyqbObJlEkKs3J9wUeqHHl2wy
         A2cA==
X-Gm-Message-State: AOAM531WPm7GnmkSsTlDSSrMlTDH+hWioe322N34Dyas8oV9PEt0c746
        ZbcB53ERXEMv5Av7YX8XdAICKfFX
X-Google-Smtp-Source: ABdhPJw5QliwZDPpAl33gh7TKJAYHZQPkZR0ldTF9IGWJan9XUaxRCKFYYj9MlstKNR/hLLZbsVRGw==
X-Received: by 2002:aa7:96d7:: with SMTP id h23mr9853780pfq.259.1590785092417;
        Fri, 29 May 2020 13:44:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k24sm7977955pfk.134.2020.05.29.13.44.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 13:44:51 -0700 (PDT)
Date:   Fri, 29 May 2020 13:44:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200529204450.GA184901@roeck-us.net>
References: <20200529195951.GA3767@dtor-ws>
 <20200529201424.GA180211@roeck-us.net>
 <20200529203324.GL89269@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529203324.GL89269@dtor-ws>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 01:33:24PM -0700, Dmitry Torokhov wrote:
> On Fri, May 29, 2020 at 01:14:24PM -0700, Guenter Roeck wrote:
> > On Fri, May 29, 2020 at 12:59:51PM -0700, Dmitry Torokhov wrote:
> > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > when opening the device, but does it naively by simply sleeping in open
> > > handler, which slows down device probing (and thus may affect overall
> > > boot time).
> > > 
> > > However we do not need to sleep as we can instead mark a point of time
> > > in the future when we should start processing the events.
> > > 
> > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > index c7bc9db5b192..e69992e945b2 100644
> > > --- a/drivers/hid/usbhid/hid-core.c
> > > +++ b/drivers/hid/usbhid/hid-core.c
> > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > >  				set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > >  		} else {
> > >  			clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > +
> > > +			if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > +					       &usbhid->iofl)) {
> > > +				/*
> > > +				 * In case events are generated while nobody was
> > > +				 * listening, some are released when the device
> > > +				 * is re-opened. Wait 50 msec for the queue to
> > > +				 * empty before allowing events to go through
> > > +				 * hid.
> > > +				 */
> > > +				usbhid->input_start_time = jiffies +
> > > +							   msecs_to_jiffies(50);
> > > +			}
> > >  		}
> > >  	}
> > >  	spin_unlock_irqrestore(&usbhid->lock, flags);
> > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > >  		if (!test_bit(HID_OPENED, &usbhid->iofl))
> > >  			break;
> > >  		usbhid_mark_busy(usbhid);
> > > -		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > +		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > +		    time_after(jiffies, usbhid->input_start_time)) {
> > >  			hid_input_report(urb->context, HID_INPUT_REPORT,
> > >  					 urb->transfer_buffer,
> > >  					 urb->actual_length, 1);
> > > @@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
> > >  	}
> > >  
> > >  	usb_autopm_put_interface(usbhid->intf);
> > > -
> > > -	/*
> > > -	 * In case events are generated while nobody was listening,
> > > -	 * some are released when the device is re-opened.
> > > -	 * Wait 50 msec for the queue to empty before allowing events
> > > -	 * to go through hid.
> > > -	 */
> > > -	if (res == 0)
> > > -		msleep(50);
> > > -
> > Can you just set usbhid->input_start_time here ?
> > 	if (res == 0)
> > 		usbhid->input_start_time = jiffies + msecs_to_jiffies(50);
> > 	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
> > 
> > Then you might not need the added code in hid_start_in().
> 
> That was my first version, but if hid_start_in() fails we start a timer
> and try to retry the IO (and the "res" in 0 in this case). And we want
> to mark the time only after we successfully submitted the interrupt URB,
> that is why the code is in hid_start_in().
> 

Ah yes, that makes sense.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
