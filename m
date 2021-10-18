Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D204323B4
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 18:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhJRQX7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 12:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbhJRQX7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 12:23:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08267C06161C
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 09:21:48 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id e5-20020a17090a804500b001a116ad95caso364600pjw.2
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jy10WD9JmIg2aq/NGW1WjhyntemPtMSnsAGvcUWCTRY=;
        b=JzkkwzmkhLoZqvpNYONbCRxYsMSMAB7Ocifx8FArOiOvw6U1TIiBvyh7Ij+GsxyZp+
         gbT3lzv4wYKRLmpd23hasU7kdeNiqC/fbfH5VWofArZC45eSBa0MuTuqb1gkc0jN3xVA
         ye4pP7CrtG50VgfsniowLnK5xZXrTkdCbSF1uZ8grUUzkJV+77bH0dAAPVvBSUA/xQkj
         h5LALo3vZEobxJg6+tcGOQgMjXw+HF18nfv/8yi9oBZ4X8PFQnN4vYgP6KTGgg32MM6o
         WImmwvc9TFTCjpmuL9c1oQxPPcDbR6BtJXJNevomdV3Z2g1YpzrolSi3boyay+4nsCHC
         /Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jy10WD9JmIg2aq/NGW1WjhyntemPtMSnsAGvcUWCTRY=;
        b=vw23qK/NoLT/C3TiSYQ4mLhHqEHjUFR1lGx1K68uMEr1k78cZ9F7axxa9nexQBdjtw
         4G1dDPWsASuzL6axJYK3dLyQNmsus75mjss+GPK3y86DEQEVH0qOHxijsvR8cz8A2QLl
         XwOR+fpnzPPRXyWEvqEuHANWtKSnLZoGkFfWUyF4neQQRNTKYQDx0B8EuJnhdaVLJUNB
         pX6qMFyeJQDytwYY00N/ik9q+6OcYqEUcl9MOe20Mq1AsbrNO3Nvsa7Ha0Uh98geddTM
         SzIPmNkKgj37OYIJQLEEYNDu1irtwjDn2NQtUirP7/3Fdhu3kkv0MududMILEYwF5jfG
         kdWw==
X-Gm-Message-State: AOAM530p8UeHk2rcL7qfr1CSoLR3JBGd62i0zTAKF9nII//jyP92d8Td
        0QuxDySOOrYs7X5Q0PFYRE4=
X-Google-Smtp-Source: ABdhPJzi2C0t6+lPCKHB0U+YByYHQXEkr2tl5QDc5p1HeASONOcGFSbVAnzR8ggtlFgj0Vtbuf6jIA==
X-Received: by 2002:a17:90b:694:: with SMTP id m20mr48934200pjz.160.1634574107281;
        Mon, 18 Oct 2021 09:21:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:54f8:9d9:1fa7:9eae])
        by smtp.gmail.com with ESMTPSA id c9sm13248568pgq.58.2021.10.18.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:21:46 -0700 (PDT)
Date:   Mon, 18 Oct 2021 09:21:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org
Subject: Re: [PATCH v16 13/16] HID: nintendo: add IMU support
Message-ID: <YW2fF815BiZ8AryC@google.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
 <20210911173639.5688-14-djogorchock@gmail.com>
 <nycvar.YFH.7.76.2109141525170.15944@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2109141525170.15944@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 14, 2021 at 03:26:23PM +0200, Jiri Kosina wrote:
> On Sat, 11 Sep 2021, Daniel J. Ogorchock wrote:
> 
> [ CCing Dmitry ]
> 
> > This patch adds support for the controller's IMU. The accelerometer and
> > gyro data are both provided to userspace using a second input device.
> > The devices can be associated using their uniq value (set to the
> > controller's MAC address).
> > 
> > A large part of this patch's functionality was provided by Carl Mueller.
> > 
> > The IMU device is blacklisted from the joydev input handler.
> > 
> > Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> [ ... snip ... ]
> > diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> > index 947d440a3be63..b45ddb4570028 100644
> > --- a/drivers/input/joydev.c
> > +++ b/drivers/input/joydev.c
> > @@ -758,6 +758,12 @@ static void joydev_cleanup(struct joydev *joydev)
> >  #define USB_VENDOR_ID_THQ			0x20d6
> >  #define USB_DEVICE_ID_THQ_PS3_UDRAW			0xcb17
> >  
> > +#define USB_VENDOR_ID_NINTENDO		0x057e
> > +#define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
> > +#define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
> > +#define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
> > +#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
> > +
> >  #define ACCEL_DEV(vnd, prd)						\
> >  	{								\
> >  		.flags = INPUT_DEVICE_ID_MATCH_VENDOR |			\
> > @@ -789,6 +795,10 @@ static const struct input_device_id joydev_blacklist[] = {
> >  	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
> >  	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE),
> >  	ACCEL_DEV(USB_VENDOR_ID_THQ, USB_DEVICE_ID_THQ_PS3_UDRAW),
> > +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_PROCON),
> > +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_CHRGGRIP),
> > +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONL),
> > +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONR),
> >  	{ /* sentinel */ }
> 
> Dmitry, could you please Ack the joydev.c part so that I could take it 
> through HID tree with the rest of the patchset?

Sure and sorry for the delay.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
