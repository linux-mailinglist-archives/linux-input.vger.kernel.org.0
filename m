Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0EFF6791A
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 09:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfGMH7p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 03:59:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33544 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfGMH7p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 03:59:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so5317595pfq.0;
        Sat, 13 Jul 2019 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CrNDkUuwB+PjYr8jIxPgYFNlndVx63iPmPItfW7P2AI=;
        b=gELMIq6/IV4lTCZ2kAo15uZN2xAArcDmXY6VNgb/591gksl6JX6XJsTrIGCYYE4rEX
         XtMRuP5lhruBrgzEycu7EII49DHItvGuJddrcPYCdJR+JyyK675W+/WHTnyDTFCPN9wV
         Mow4n+gdSvlI3Qg3s3RSDefDA5hbmcxLxdfDyH0/dbE3EXIEFd/8EeIt5UiqALzw/6pi
         ux5Kzfr5kBAJ9088biU8NTDmYWCtLoDlex1xQ7BZl29OeiV69y+c4pSwvRYI+sIg8/+4
         gnZeuD+GGg0C+psY41PFaeoafkS1uBFJnwWdSUWoP+xpEIH0ZVh34HJESoRxQsz/oxOa
         qZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CrNDkUuwB+PjYr8jIxPgYFNlndVx63iPmPItfW7P2AI=;
        b=Dp6kRzruv7A0qVW6aFGtFYmznpMJWItPcbtP70bcupA4vcvdQ97eMs3dKnE+eYJxkR
         yUwQhpVkPyADF5zvpLMLlsjNWVGzD3IrxVAXNvfs7cNOSLTyo+vY/wx7HfGklw8hDPRF
         UA+/HTzEEttycy+TFatTLYnSnzmcryWn4zCyeZKocruOlJbloNXqFe2SM25H6FWtHYL7
         3e8NRH8cmItN7ZVamCjJhsFziKPYlfUzKCpA6ShYR4ONep+C+4CeXLCOPVQ36xFWPdgQ
         imE1PD7i397rsUBVHIEjU/zroCuwbAyIn9Te/6rtfHz7vEUAWp4tAooimW17ZeFw9ew3
         Js9A==
X-Gm-Message-State: APjAAAWBkaM2g0b9O9Oz4B5vHQeBIbPkWDNSc2lXnsMS439gV8w2bn0l
        q/E72FehPLujR7fz0WBFqmQ=
X-Google-Smtp-Source: APXvYqx13S+/wN/KvX4i75bDahr+7pZaao7oYc+IWltsQc0FeYWVqAyg0pmBW5oGKg1m/XGjGU9p9A==
X-Received: by 2002:a17:90a:8984:: with SMTP id v4mr16869413pjn.133.1563004784544;
        Sat, 13 Jul 2019 00:59:44 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 135sm10494390pfb.137.2019.07.13.00.59.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 00:59:43 -0700 (PDT)
Date:   Sat, 13 Jul 2019 00:59:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Atif Niyaz <atifniyaz@google.com>,
        Atif Niyaz <atifniyaz11@gmail.com>,
        Siarhei Vishniakou <svv@google.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: API for Setting a Timestamp from a Driver
Message-ID: <20190713075942.GA243807@dtor-ws>
References: <20190710230410.9386-1-atifniyaz@google.com>
 <20190712064134.GA150689@dtor-ws>
 <CAO-hwJK-VAGpjN03XDTmmT4fYxb1V_izfvT9Z3tKDmLJ3henGw@mail.gmail.com>
 <20190712114619.GA7753@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712114619.GA7753@jelly>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 12, 2019 at 09:46:19PM +1000, Peter Hutterer wrote:
> On Fri, Jul 12, 2019 at 09:23:20AM +0200, Benjamin Tissoires wrote:
> > On Fri, Jul 12, 2019 at 8:41 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Atif,
> > >
> > > On Wed, Jul 10, 2019 at 04:04:10PM -0700, Atif Niyaz wrote:
> > > > Currently, evdev stamps time with timestamps acquired in
> > > > evdev_events. However, this timestamping may not be accurate in terms of
> > > > measuring when the actual event happened. This API allows any 3rd party
> > > > driver to be able to call input_set_timestamp, and provide a timestamp
> > > > that can be utilized in order to provide a more accurate sense of time
> > > > for the event
> > > >
> > > > Signed-off-by: Atif Niyaz <atifniyaz@google.com>
> > >
> > > This looks OK to me. Benjamin, Peter, any concerns here?
> > >
> > 
> > No red flags from me (though Peter is the one using all of this).
> > 
> > Just curious, which drivers do you think will be using this new API?
> > I can see that we might want to use hid-multitouch for it, with the
> > Scan Time forwarded by the device, but what do you have in mind?
> 
> that'd be my question as well. I'm all for more precise evdev timestamps but
> there's some overlap with MSC_TIMESTAMP (which at least libinput isn't
> handling well right now, with the exception of some quirk detection). 

I expect it will be used by drivers that use threaded interrupts to mark
the time in the hard interrupt and avoid the latency of scheduling the
thread, slow bus communication, etc.

This is not supposed to replace MSC_TIMESTAMP as MSC_TIMESTAMP carries
timestamp acquired by the device itself.

Thanks.

-- 
Dmitry
