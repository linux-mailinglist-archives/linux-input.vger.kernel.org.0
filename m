Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1196F2D7EB4
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 19:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436886AbgLKStq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 13:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406393AbgLKStS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 13:49:18 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C18C0611E4;
        Fri, 11 Dec 2020 10:48:59 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w5so6957655pgj.3;
        Fri, 11 Dec 2020 10:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=P+pQqwFmWnoVuZ+vnwr1bjFcODtNnwcmc/REju0zDOs=;
        b=qL7sDfDZObPo9d9OTyM/2vWZ1ZQlOtVvaRjdzgztuxWk1u05JHsbxaoyI0xzb36WSN
         2+LdzTJR1rcbxYKVZ0mskbo7VkCg45cc+p4sW4vTnBCU2xk9XB3ZEUCFiZtBqD/TdhM9
         sA8wfe2JpSJbNuUkfhb/mhkqMqHqk5K1fGOgU8RpyAP/xfgrK/Jf7mq1XUpp4aPFPgFT
         r/eaPQDGgqmSrA+VHrQlGNz1mon3hdnuJKzpM3Yvqh/99+BaPdjFsGcTJHrrik4f47WQ
         aU5iUc5pPQKN85Cgs9ZlFJS3Mb7ewC8WeJek1JnJQZtbx/wXGzrqdU/rCfOWdO2swJMm
         BrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=P+pQqwFmWnoVuZ+vnwr1bjFcODtNnwcmc/REju0zDOs=;
        b=HR3fqq/Dqyo9Dw9nyCQzz7D6bjTepnsjwlJVcJcAnk0h6E/iw7bVuxh9JUoKaeeIwZ
         MuPsfK4mP5f1OfWR7bMXgJx2vrRi5tuDRNHmflsLMmjaRPi6/e9wuc42dw3qK5jYRWhI
         VDEb5TnINAM07I11XIx7QUyNj3hwqxNgry7W0rDYOmJJ26reaFMYcuF88Z/CF/mnc2Sq
         hfHfdBvo5n6p2H3i3QMohfSCx6MjQ91MIGyhJ58ojJ8C0anTf88Mc0n60YFLiPOGbjFZ
         n+oNotmly0S2HRxDpUGd6G/r1Fpr789TPtD/+hUrzpwPRLc7DdIaLAUrJXEOgzfFgq4J
         nJmg==
X-Gm-Message-State: AOAM533Qc+hesUB/4c+t2TXTzDoMfqy0IkNzDNGqvb+Z3H13Mi+43tWw
        d3njZ93vMiniu0Jg7udgq8w=
X-Google-Smtp-Source: ABdhPJy2lRdQIMKTpskca+a4y034/vva1/A7XTHmQ3lkQNC8xbU3L7jv6J9T3p1JDNOwqahSrDaMwg==
X-Received: by 2002:a63:c944:: with SMTP id y4mr13068986pgg.435.1607712539175;
        Fri, 11 Dec 2020 10:48:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f64sm11566939pfb.146.2020.12.11.10.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 10:48:57 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:48:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
Message-ID: <X9O/F0M4rU6cBdRi@google.com>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com>
 <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
 <20201211170401.GA31605@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201211170401.GA31605@qmqm.qmqm.pl>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 06:04:01PM +0100, Michał Mirosław wrote:
> On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
> > 11.12.2020 19:09, Michał Mirosław пишет:
> > > On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
> > >> Hi Michał,
> > >> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> > >>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
> > >>>  			}
> > >>>  
> > >>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> > >>> -			if (report_len != PACKET_SIZE) {
> > >>> +			if (report_len != PACKET_SIZE &&
> > >>> +			    report_len != PACKET_SIZE_OLD) {
> > >>>  				dev_err(&client->dev,
> > >>> -					"mismatching report length: %*ph\n",
> > >>> +					"unsupported report length: %*ph\n",
> > >>>  					HEADER_SIZE, ts->buf);
> > >> Do I understand this correctly that the old packets are only observed on
> > >> EKTF3624? If so can we expand the check so that we only accept packets
> > >> with "old" size when we know we are dealing with this device?
> > > 
> > > We only have EKTF3624 and can't be sure there are no other chips needing this.
> > 
> > In practice this older packet format should be seen only on 3624, but
> > nevertheless we could make it more explicit by adding the extra chip_id
> > checks.
> > 
> > It won't be difficult to change it in the future if will be needed.
> > 
> > I think the main point that Dmitry Torokhov conveys here is that we
> > should minimize the possible impact on the current EKT3500 code since we
> > don't have definitive answers regarding the firmware differences among
> > the hardware variants.
> 
> The only possible impact here is that older firmware instead of breaking
> would suddenly work. Maybe we can accept such a risk?

These are not controllers we'll randomly find in devices: Windows boxes
use I2C HID, Chrome devices use "new" firmware, so that leaves random
ARM where someone needs to consciously add proper compatible before the
driver will engage with the controller.

I would prefer we were conservative and not accept potentially invalid
data.

Thanks.

-- 
Dmitry
