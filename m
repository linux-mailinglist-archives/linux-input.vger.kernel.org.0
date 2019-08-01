Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E2C7E6EB
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2019 01:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390487AbfHAXt7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 19:49:59 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36922 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733221AbfHAXt6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Aug 2019 19:49:58 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so2240991pgp.4;
        Thu, 01 Aug 2019 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZWaIxuds+fAxPI+2i3BQU9GXQMcarXfdL0gnfPCB4yQ=;
        b=hpX3xrgbLuZLcB7WTbXosIEW9mOwfvBvwqhJD4eNrKccC+bV5g29LSoETCNwlMOktl
         GB/lsNp9rQjCj8KG7NSysGmEXBfvVHsp4DFzzazeFcnWxDN7DpPOoDi1msvs0m+FLHqa
         GU3DrCTt36Nwpcd026E9meilQcDBAPOL+Hs52npL2LqszT5pW2dHikw/BCaN/oZd2Gc7
         gDHHnxffnZWmIpKO39x/lC7S1/RBpiDxYMqiy/L/xy5D9pgjPM7XgtCg0snUVpvpaD3B
         WiwzpNHvJshrqXU72npl509nyyoWx7Xcu1EpdDbjiFetSbzOBbatWea+3E5GKJf79g86
         vTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZWaIxuds+fAxPI+2i3BQU9GXQMcarXfdL0gnfPCB4yQ=;
        b=mfTG+PZbEeTOjCFGzn4rOXabzruyeXS0Uq6vMUtfThghLfiqIWzFeFhbNWPiyalj2Z
         Dxn5VS+xBor4peJLmRpy7xv7x7cpXAu7Fq1RF9JhX0EmZNG4WiolUF1OnV0fNA/6U9K/
         Ymwip7TtI5F1Ye4pVkj34enysG5xlAlppJ+D4kd73rcErAf73fDzqdZyX06nK7XdgqUG
         LHjwhUjZq9SqH3RN89c+Ho8p0UOQuW79gCDSsYc3O0PfPLQqHnZR+du76BeID0Vksq+u
         fNBRS/VXZQtWs2skUgiKMtgl3+npRZLG2OGL3ILapx1/LhaRVf/N7zeerZvzDT73l3Mt
         BXmQ==
X-Gm-Message-State: APjAAAUGcpSM7LOenFLV9FCtfJaFTXEpVpu9ervddEJk3rB1iVS7cQ8O
        3/c5BUNZqgp4NrbtUdjzpWY=
X-Google-Smtp-Source: APXvYqylp5idCgCBoFUIRFsygvNeoUpvOKse0G/WyQ1syiU8lx75tvMLyANOaR46FOPtJwy7r45sZw==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr57377907pfi.31.1564703397147;
        Thu, 01 Aug 2019 16:49:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t96sm5884929pjb.1.2019.08.01.16.49.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 16:49:56 -0700 (PDT)
Date:   Thu, 1 Aug 2019 16:49:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
Message-ID: <20190801234954.GA178933@dtor-ws>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
 <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
 <20190725085753.GA26665@penguin>
 <ac436c3c-fa89-f777-85b2-f38adf842e10@ysoft.com>
 <20190725144009.GA27432@penguin>
 <dcee1139-c53f-5ea0-f387-a3aa5a9bf39f@ysoft.com>
 <20190727073156.GA795@penguin>
 <f06a913e-09aa-3225-a495-bb290ee2bb6f@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f06a913e-09aa-3225-a495-bb290ee2bb6f@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 30, 2019 at 11:25:49AM +0200, Michal Vokáč wrote:
> On 27. 07. 19 9:31, Dmitry Torokhov wrote:
> > On Fri, Jul 26, 2019 at 01:31:31PM +0200, Michal Vokáč wrote:
> > > On 25. 07. 19 16:40, Dmitry Torokhov wrote:
> > > > On Thu, Jul 25, 2019 at 02:58:02PM +0200, Michal Vokáč wrote:
> > > > > On 25. 07. 19 10:57, Dmitry Torokhov wrote:
> > > > > > Hi Michal,
> > > > > > 
> > > > > > On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
> > > > > > > On 21. 05. 19 7:37, Dmitry Torokhov wrote:
> > > > > > > > Hi Michal,
> > > > > > > > 
> > > > > > > > On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > I have to deal with a situation where we have a custom i.MX6 based
> > > > > > > > > platform in production that uses the MPR121 touchkey controller.
> > > > > > > > > Unfortunately the chip is connected using only the I2C interface.
> > > > > > > > > The interrupt line is not used. Back in 2015 (Linux v3.14), my
> > > > > > > > > colleague modded the existing mpr121_touchkey.c driver to use polling
> > > > > > > > > instead of interrupt.
> > > > > > > > > 
> > > > > > > > > For quite some time yet I am in a process of updating the product from
> > > > > > > > > the ancient Freescale v3.14 kernel to the latest mainline and pushing
> > > > > > > > > any needed changes upstream. The DT files for our imx6dl-yapp4 platform
> > > > > > > > > already made it into v5.1-rc.
> > > > > > > > > 
> > > > > > > > > I rebased and updated our mpr121 patch to the latest mainline.
> > > > > > > > > It is created as a separate driver, similarly to gpio_keys_polled.
> > > > > > > > > 
> > > > > > > > > The I2C device is quite susceptible to ESD. An ESD test quite often
> > > > > > > > > causes reset of the chip or some register randomly changes its value.
> > > > > > > > > The [PATCH 3/4] adds a write-through register cache. With the cache
> > > > > > > > > this state can be detected and the device can be re-initialied.
> > > > > > > > > 
> > > > > > > > > The main question is: Is there any chance that such a polled driver
> > > > > > > > > could be accepted? Is it correct to implement it as a separate driver
> > > > > > > > > or should it be done as an option in the existing driver? I can not
> > > > > > > > > really imagine how I would do that though..
> > > > > > > > > 
> > > > > > > > > There are also certain worries that the MPR121 chip may no longer be
> > > > > > > > > available in nonspecifically distant future. In case of EOL I will need
> > > > > > > > > to add a polled driver for an other touchkey chip. May it be already
> > > > > > > > > in mainline or a completely new one.
> > > > > > > > 
> > > > > > > > I think that my addition of input_polled_dev was ultimately a wrong
> > > > > > > > thing to do. I am looking into enabling polling mode for regular input
> > > > > > > > devices as we then can enable polling mode in existing drivers.
> > > > > > > 
> > > > > > > OK, that sounds good. Especially when one needs to switch from one chip
> > > > > > > to another that is already in tree, the need for a whole new polling
> > > > > > > driver is eliminated.
> > > > > > 
> > > > > > Could you please try the patch below and see if it works for your use
> > > > > > case? Note that I have not tried running it, but it compiles so it must
> > > > > > be good ;)
> > > > > 
> > > > > Hi Dmitry,
> > > > > Thank you very much for the patch!
> > > > > I gave it a shot and it seems you forgot to add the input-poller.h file
> > > > > to the patch.. it does not compile on my side :(
> > > > 
> > > > Oops ;) Please see the updated patch below.
> > > 
> > > Thank you, now it is (almost) good as you said :D
> > > 
> > > > > 
> > > > > > Input: add support for polling to input devices
> > > > > > 
> > > > > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > 
> > > > > > Separating "normal" and "polled" input devices was a mistake, as often we want
> > > > > > to allow the very same device work on both interrupt-driven and polled mode,
> > > > > > depending on the board on which the device is used.
> > > > > > 
> > > > > > This introduces new APIs:
> > > > > > 
> > > > > > - input_setup_polling
> > > > > > - input_set_poll_interval
> > > > > > - input_set_min_poll_interval
> > > > > > - input_set_max_poll_interval
> > > > > > 
> > > > > > These new APIs allow switching an input device into polled mode with sysfs
> > > > > > attributes matching drivers using input_polled_dev APIs that will be eventually
> > > > > > removed.
> > > > > 
> > > > > After reading this I am not really sure what else needs to be done
> > > > > to test/use the poller. I suspect I need to modify the input device
> > > > > driver (mpr121_touchkey.c in my case) like this:
> > > > > 
> > > > > If the interrupt gpio is not provided in DT, the device driver probe
> > > > > function should:
> > > > >    - not request the threaded interrupt
> > > > >    - call input_setup_polling and provide it with poll_fn
> > > > >      Can the mpr_touchkey_interrupt function be used as is for this
> > > > >      purpose? The only problem I see is it returns IRQ_HANDLED.
> > > > 
> > > > I'd factor out code suitable for polling from mpr_touchkey_interrupt()
> > > > and then do
> > > > 
> > > > static irqreturn_t mpr_touchkey_interrupt(...)
> > > > {
> > > > 	mpr_touchkey_report(...);
> > > > 	return IRQ_HANDLED;
> > > > }
> > > > 
> > > 
> > > Probably a trivial problem for experienced kernel hacker but I can not
> > > wrap my head around this - the interrupt handler takes the mpr121
> > > device id as an argument while the poller poll_fn takes struct input_dev.
> > > 
> > > I fail to figure out how to get the device id from the input device.
> > > 
> Thanks for the hints Dmitry. I am trying my best but still have some
> issues with the input_set/get_drvdata.
> 
> The kernel Oopses on NULL pointer dereference in mpr_touchkey_report.
> Here is the backtrace:
> 
> [    2.916960] 8<--- cut here ---
> [    2.920022] Unable to handle kernel NULL pointer dereference at virtual address 000001d0
> [    2.928138] pgd = (ptrval)

Ah, that's my fault I believe. Can you please try sticking

	poller->input = dev;

into input_setup_polling()?

Thanks.

-- 
Dmitry
