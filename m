Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF49151CE7
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 16:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgBDPFK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 10:05:10 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42348 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbgBDPFK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 10:05:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so18939672ljl.9;
        Tue, 04 Feb 2020 07:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xbsSRVY+zrKeKD2bmft2n6uSca8g8oklqAyVNk6FGQM=;
        b=Lw3gIJgl2OKQVaYueBuBkaV1u/r25o5yg3nDsbUPNQGyPgN4OB0v1JVIymGFlHYZAR
         01hyOWr/2p6vam1QTnZynawgmRWa3qWsQkI/BlCtB8VSHv3LhO7nxEQDYhd62e/t+/gN
         NhYoD/5a4clm1/n1akHAUlij9hEyOXggT5/ZXK/57TcAb6OpjIbkqIO6ebrBfajEi4rF
         1c8PF7ulZtKdh11g8NCFyforJ980ZUogQ563hzheyufL05eEBckwhx+R7FzUt40GfyWC
         1fKywD4i7PQvX5pTWLIi2+xc+ITVQB5LChPHEpwbzs0qNBNNei4pvkiHE4hgfM3PZ3Wo
         fRtw==
X-Gm-Message-State: APjAAAVBe7iCBEpm1PffUQb/MlhDWZggtHfjPHOBrccGr7vVUo4akOnb
        FcqPv+ULFoQygivEvRTUNmY=
X-Google-Smtp-Source: APXvYqyRyMKwmaJHozBl1yZ7dhrbWnyGc2SvVB9Gq9ugJCyZf0zX27+irtkpvgz1NBSt5sT9gSVwnQ==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr18110616ljl.65.1580828707623;
        Tue, 04 Feb 2020 07:05:07 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id v12sm11565009ljc.94.2020.02.04.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 07:05:06 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iyzlM-0004k0-Ss; Tue, 04 Feb 2020 16:05:16 +0100
Date:   Tue, 4 Feb 2020 16:05:16 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     Jiri Kosina <jikos@kernel.org>, Johan Hovold <johan@kernel.org>,
        Lauri Jakku <lja@iki.fi>, oneukum@suse.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: HID: random timeout failures tackle try.
Message-ID: <20200204150516.GN26725@localhost>
References: <20200204110658.32454-1-lja@iki.fi>
 <20200204123508.GJ26725@localhost>
 <nycvar.YFH.7.76.2002041342460.26888@cbobk.fhfr.pm>
 <3bb9f515-a5c6-3162-be5d-f9f984969882@pp.inet.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb9f515-a5c6-3162-be5d-f9f984969882@pp.inet.fi>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 04, 2020 at 02:55:41PM +0200, Lauri Jakku wrote:
> 
> On 4.2.2020 14.43, Jiri Kosina wrote:
> > On Tue, 4 Feb 2020, Johan Hovold wrote:
> >
> >>> Why modify usb-hid-core: No need to modify driver by driver.
> >> Because you cannot decide how every use should handle timeouts.
> >>
> >> Just fix up the driver that needs this.
> 
> I think that if the device is left to errorneus state without
> re-trying, it shows up to user very annoying. For example:
> My mouse now has the problem with buttons: if i click left
> button -> nothing may happen, and it is not functioning until
> right button is pressed once. I make adaption to divide the
> timeout by 100, and keep the try-loop in core.
> 
> I dont have list all the drivers that needs this -> better fix at
> one common place.

No, that's precisely my point. You cannot force this behaviour onto
every user of control requests.

Different devices need different handling, that's why this must be per
driver or possibly implemented as a device quirk as Jiri suggested.

But we need a better description of the problem first. Is this an issue
also during enumeration, or only after when you use your mouse?

And exactly which control requests are failing here? Your example above
doesn't seem to involve any such requests (only interrupt URB
completions).

> > I believe it will actually not be a particular driver, but perhaps a set 
> > of devices with b0rked USB implementation, and we could just introduce 
> > (another, oh well) per-device quirk list if needed.
> >
> > Do we have any idea / indication how many devices out there actually 
> > require this?
> Well i'd say quite many.

What do you base that on?

Johan
