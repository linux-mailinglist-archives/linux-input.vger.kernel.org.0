Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD8D7A8C9
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 14:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfG3Mjb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 08:39:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:10807 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729579AbfG3Mjb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 08:39:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 05:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; 
   d="scan'208";a="195783793"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jul 2019 05:39:29 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hsRPb-0003Pd-RD; Tue, 30 Jul 2019 15:39:27 +0300
Date:   Tue, 30 Jul 2019 15:39:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mao Wenan <maowenan@huawei.com>,
        Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: applespi - register touchpad device
 synchronously in probe
Message-ID: <20190730123927.GN23480@smile.fi.intel.com>
References: <20190721070523.24695-1-ronald@innovation.ch>
 <20190729132203.GB1201@penguin>
 <20190730065648.GA20206@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190730065648.GA20206@innovation.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 29, 2019 at 11:56:48PM -0700, Life is hard, and then you die wrote:
> On Mon, Jul 29, 2019 at 03:22:03PM +0200, Dmitry Torokhov wrote:
> > On Sun, Jul 21, 2019 at 12:05:23AM -0700, Ronald Tschalär wrote:

> > Question: is it possible to read command response synchronously as well?
> > I.e. I was wondering if we could add 2 (or 1?) more read xfers for the
> > actual result that is coming after the status response, and then we
> > could use spi_sync() to send the command and read the whole thing.
> 
> Yes'ish. But you still need to wait for the GPE to know when to read
> the response, and while you're doing so any number of keyboard and
> trackpad events may arrive (i.e. you may need to do any number of read
> xfers). I suppose those events could all just be discarded, though. So
> something like this:
> 
>     assemble-info-cmd(write_msg)

>     spi_sync(write_msg)
>     
>     while (1) {
>         wait_event_timeout(wait_queue, gpe_received, timeout)
>         spi_sync(read_msg)
>         if (is-info-cmd-response(read_msg))
>             break
>     }

Just a side note if you ever going to implement such loops.

Consider in this or similar case do {} while approach with more straight exit
conditional.

Like

	assemble-info-cmd(write_msg)

	do {
		spi_sync(read_msg)
		wait_event_timeout(wait_queue, gpe_received, timeout)
	} while (!is-info-cmd-response(read_msg)

> and also modify the gpe-handler to wake the wait_queue instead of
> issuing an spy_async() while doing the above.
> 
> I guess the advantage would certainly be the need to avoid the
> spi-flushing in case of a timeout, at the expense of some slight
> duplication of some of the received-message handling logic (would
> refactor make most re-usable, of course).
> 
> So would this be the preferred approach then?

-- 
With Best Regards,
Andy Shevchenko


