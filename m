Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81137B5F41
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 10:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfIRIbf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Sep 2019 04:31:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:43235 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfIRIbf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Sep 2019 04:31:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 01:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; 
   d="scan'208";a="211784281"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2019 01:31:31 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iAVN4-0003pj-J4; Wed, 18 Sep 2019 11:31:30 +0300
Date:   Wed, 18 Sep 2019 11:31:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, robh+dt@kernel.org,
        bparrot@ti.com, simon.budig@kernelconcepts.de, hdegoede@redhat.com,
        fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20190918083130.GQ2680@smile.fi.intel.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
 <20190918080609.ynra4m5dbbze5dbz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918080609.ynra4m5dbbze5dbz@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 18, 2019 at 10:06:09AM +0200, Marco Felsch wrote:
> On 19-09-17 10:26, Dmitry Torokhov wrote:
> > On Tue, Sep 17, 2019 at 07:18:14PM +0200, Marco Felsch wrote:
> > > On 19-09-17 10:07, Dmitry Torokhov wrote:

> > What I was trying to say is that I have not actually seen DTB that is
> > part of hardware or separately upgradable frimware (not talking about
> > ppc or sparc boxes, but ones that might be using this driver). It is
> > always built into the kernel in my experience, so backward compatibility
> > is simply a tool that is being used to prevent us from being too wild
> > with hacking on bindings, but rarely a practical concern.
> 
> Thanks, now I got you :)
> 
> > In cases like this I think it is worthwhile to simply update in-tree
> > DTS and arrive at a sane binding.
> 
> I'm with you, should we wait for Rob's ack before we go this way?

I also support this way.

-- 
With Best Regards,
Andy Shevchenko


