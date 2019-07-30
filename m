Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C742E7A180
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 08:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfG3G4t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 02:56:49 -0400
Received: from chill.innovation.ch ([216.218.245.220]:57120 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfG3G4t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 02:56:49 -0400
Date:   Mon, 29 Jul 2019 23:56:48 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 600D3640134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1564469808;
        bh=Od2NAmDDJDdKzTDbZFvssSbYkExTHaj6TafsL+/oUOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DjuNVMhMu7SHWoeMq6zE0i6PG8YYfxRz+7wFUy73qJh8QhtnrtfzovnCMHrjm2yKz
         AKrtNOELoUzReoYWHxEEMFcgGwHWOzxYnfh0pDzlWV6rxPasKqMeGY5QXHWBOb7RiD
         RdkLg4q6CTHyGwNwOCUtpcPmbk9g3wzcI0mdOGz/DRO4XP96TMCbdQdi1Jvy/IrG/1
         naPhI9BGsWJvSXwcqvuyb9xew5IKkj+twXxdDT3xxfbLmzkBcSFzBbWiRoZ91MkGz2
         yCuICdJUaUoS4U/08SxrnZsD86Qcdz7OtIbRPfsxhbKt0WpaJ/TmIx+qRj9cUsqlC1
         3E5yYoM+KaSZQ==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>,
        Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: applespi - register touchpad device
 synchronously in probe
Message-ID: <20190730065648.GA20206@innovation.ch>
References: <20190721070523.24695-1-ronald@innovation.ch>
 <20190729132203.GB1201@penguin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729132203.GB1201@penguin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


  Hi Dmitry,

On Mon, Jul 29, 2019 at 03:22:03PM +0200, Dmitry Torokhov wrote:
> Hi Ronald,
> 
> On Sun, Jul 21, 2019 at 12:05:23AM -0700, Ronald Tschalär wrote:
> > This allows errors during registration to properly fail the probe
> > function.
> > 
> > Doing this requires waiting for a response from the device inside the
> > probe function. While this generally takes about 15ms, in case of errors
> > it could be arbitrarily long, and hence a 3 second timeout is used.
> > 
> > This also adds 3 second timeouts to the drain functions to avoid the
> > potential for suspend or remove hanging forever.
> 
> Question: is it possible to read command response synchronously as well?
> I.e. I was wondering if we could add 2 (or 1?) more read xfers for the
> actual result that is coming after the status response, and then we
> could use spi_sync() to send the command and read the whole thing.

Yes'ish. But you still need to wait for the GPE to know when to read
the response, and while you're doing so any number of keyboard and
trackpad events may arrive (i.e. you may need to do any number of read
xfers). I suppose those events could all just be discarded, though. So
something like this:

    assemble-info-cmd(write_msg)
    spi_sync(write_msg)
    
    while (1) {
        wait_event_timeout(wait_queue, gpe_received, timeout)
        spi_sync(read_msg)
        if (is-info-cmd-response(read_msg))
            break
    }

and also modify the gpe-handler to wake the wait_queue instead of
issuing an spy_async() while doing the above.

I guess the advantage would certainly be the need to avoid the
spi-flushing in case of a timeout, at the expense of some slight
duplication of some of the received-message handling logic (would
refactor make most re-usable, of course).

So would this be the preferred approach then?


  Cheers,

  Ronald

