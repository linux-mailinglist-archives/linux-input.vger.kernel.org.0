Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B874B53B4
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfIQRMw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:12:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:41656 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbfIQRMw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:12:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 10:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; 
   d="scan'208";a="191453000"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2019 10:12:48 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iAH1y-0002B1-Sg; Tue, 17 Sep 2019 20:12:46 +0300
Date:   Tue, 17 Sep 2019 20:12:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org,
        bparrot@ti.com, simon.budig@kernelconcepts.de, hdegoede@redhat.com,
        fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Message-ID: <20190917171246.GL2680@smile.fi.intel.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-7-m.felsch@pengutronix.de>
 <20190917163536.GI2680@smile.fi.intel.com>
 <20190917165245.GM237523@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917165245.GM237523@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 09:52:45AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 17, 2019 at 07:35:36PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 17, 2019 at 05:58:08PM +0200, Marco Felsch wrote:
> > > Currently the driver do not care about the regulator which supplies the
> > > controller. This can lead into problems since we support (deep-)sleep
> > > because the regulator can be turned off before we send the (deep-)sleep
> > > command to the controller. Using a own regulator improves the power
> > > consumption during sleep even more.
> > 
> > > +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > > +	if (IS_ERR(tsdata->vdd)) {
> > > +		error = PTR_ERR(tsdata->vdd);
> > > +		if (error == -EPROBE_DEFER)
> > > +			return error;
> > 
> > Before it worked w/o regulator. You have to make it optional.
> 
> No, regulators are funky this way. If there isn't one declared in the
> device tree then a dummy is created automatically. Optional regulators
> are only to be used when parts of an IC can be powered up separately.

It depends if platform has full constrains or not.
For the former, indeed, you are right, for the latter, we will get -ENODEV.

-- 
With Best Regards,
Andy Shevchenko


