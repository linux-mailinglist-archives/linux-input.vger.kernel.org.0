Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F717190D3B
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 13:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbgCXMUy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 08:20:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44614 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbgCXMUy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 08:20:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id j188so9147755lfj.11
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xE4MP5AqUCPd9XtoEWD/FK2YPE6NfLNz1ySPK/KUqcg=;
        b=XS7FO5quXRQMzlcU6oLgb0XC3ZGpFmBkGVb2+urTxc0RoXE+LhQwMcjmE1iMAOa4zj
         5PDAtVRds458I1ZL9d59wLIw4CZpPrU4m4igICIiVAXvDor0bsq0DssE4nmVlA1PDTlr
         9Juvmpsk6zwiXtmO5tbpYKysU5GPTSeag89VuFevHBL8HovL4xeC2CptKa/9avBarldI
         TNKRCuIdtZyWoZlwAcrKcb4Cq5dHK9UKgDmiunIO8+8Ty4coajwPeKXNmvWqU9OBiiIQ
         YkQFBoINbMMKzAyLh7/C9VyRE7zFm2KikI2U9i1pS66meUqbKQlBhvdRAOHMPTiLB293
         udYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xE4MP5AqUCPd9XtoEWD/FK2YPE6NfLNz1ySPK/KUqcg=;
        b=tC13E8LdG8nCUljZO4fvDjb9KIM3Em7amXkAPxKq4moZuc1gcYTs9kW5YY24MdjS7V
         tgeIYZrF9CvRjUdoilBeDxsv/keANwWwd4Co5nVqL4LoY92HFB6MpvTT4kVexjlxioXn
         W9jLaCosACzU0FVY3gLuYT2zukY+1IziKNoQOM5d+PPaYMrywUE+CP+uBC3+dZpwKXIy
         3t3DdF8XV+690iIS3MIj7+hpZ8pNCFFrAfLEsPzIwq9z8kVbIHg0wRLzlXiI/GB2Vdpf
         z6NO+M0w3vbwARYLN+IyLYIDLRbPONdvS6fftNVcXWJUFVan4Nc9/FHT9W6Jk4NspqPN
         PdRw==
X-Gm-Message-State: ANhLgQ3QKV7NMQ5iQX43DnC+2z4pSGeC+KgnNzjtVw0aXkiO4ygJa2Cs
        DRHqjqMQjZ//V+PkttbAHlKMIymMR8amKS9A+WM0gg==
X-Google-Smtp-Source: ADFU+vvOwzEWB/KB6v68gGlAUeCZXrHF76lOWQJ2agZ6yCYIP2gtQNst0yT5ZM3f+idvKa0KVyZTDM7DqQh+3t9vivQ=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr2148928lfp.21.1585052452258;
 Tue, 24 Mar 2020 05:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323234505.226919-1-rajatja@google.com> <20200324115059.GA2333340@kroah.com>
In-Reply-To: <20200324115059.GA2333340@kroah.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 24 Mar 2020 05:20:14 -0700
Message-ID: <CACK8Z6EHAv03XGXT0sY2H3TSjS4-yQtCscbHG_o1qCuG94zb6g@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/5] input/serio/i8042: Attach fwnode to serio
 i8042 kbd device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dmitry Torokhov <dtor@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Furquan Shaikh <furquan@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@google.com>,
        Zentaro Kavanagh <zentaro@google.com>,
        Dominik Behr <dbehr@google.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On Tue, Mar 24, 2020 at 4:51 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 23, 2020 at 04:45:01PM -0700, Rajat Jain wrote:
> > Attach the firmware node to the serio i8042 kbd device so that device
> > properties can be passed from the firmware.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > Change-Id: I36032f4bdee1dc52f26b57734068fd0ee7a6db0b
>
> Didn't you run checkpatch.pl on your patches which told you to remove
> all of these Change-Id: values?

My apologies. However I did run checkpatch.pl on my patches before
sending (also checked just now again) and it did not complain about
the Change-Id values in the commit log. Not sure if I'm running the
command incorrectly?

rajatja@rajat2:~/stock_kernel/linux$ ./scripts/checkpatch.pl
../patches/input_atkbd/v1/000*
-----------------------------------------------------------------------------------------
../patches/input_atkbd/v1/0001-input-serio-i8042-Attach-fwnode-to-serio-i8042-kbd-d.patch
-----------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 28 lines checked

../patches/input_atkbd/v1/0001-input-serio-i8042-Attach-fwnode-to-serio-i8042-kbd-d.patch
has no obvious style problems and is ready for submission.
-----------------------------------------------------------------------------------------
../patches/input_atkbd/v1/0002-Input-atkbd-Expose-function-row-physical-map-to-user.patch
-----------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 106 lines checked
../patches/input_atkbd/v1/0002-Input-atkbd-Expose-function-row-physical-map-to-user.patch
has no obvious style problems and is ready for submission.
......
<snip>
......

I will now resubmit the patches removing the Change-Id(s).

Thanks & Best Regards,

Rajat



>
> Please do so...
>
> greg k-h
