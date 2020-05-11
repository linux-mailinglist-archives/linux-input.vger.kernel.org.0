Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D051CD5F0
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 12:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgEKKIt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 06:08:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:60812 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbgEKKIt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 06:08:49 -0400
IronPort-SDR: m8k3N1Ko3bEP5B+yP0N5aG8HN2EpbrzbIuJ5wzrdWuIZmrdyVQYts4f72QdzZnM845/PsB46po
 gxJBKlzunzvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 03:08:49 -0700
IronPort-SDR: WtAREVsPtJooVOiH+poizBax3hR688fNEcX5pDoU7eklXyuaQoBdze2nCu9EoO8jVWdFitveAM
 1+ItRLU3j8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; 
   d="scan'208";a="286224579"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 03:08:48 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jY5Mh-005wEw-8h; Mon, 11 May 2020 13:08:51 +0300
Date:   Mon, 11 May 2020 13:08:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 4/5] Input: edt-ft5x06 - do not try to allocate too
 much memory
Message-ID: <20200511100851.GG185537@smile.fi.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
 <20200303180917.12563-4-andriy.shevchenko@linux.intel.com>
 <20200307010837.GO217608@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307010837.GO217608@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 06, 2020 at 05:08:37PM -0800, Dmitry Torokhov wrote:
> On Tue, Mar 03, 2020 at 08:09:16PM +0200, Andy Shevchenko wrote:
> > When mode switch happens we try to allocate too much memory in case
> > when num_x and num_y are being assigned to their maximum.
> > 
> > Since the resolution should come from property in such case, reassign
> > values back to num_x and num_y to prevent too much memory allocation.

> > +	if (tsdata->num_x == U16_MAX && tsdata->prop.max_x &&
> > +	    tsdata->num_y == U16_MAX && tsdata->prop.max_y) {
> > +		/* Reassign num_x and num_y from properties */
> > +		tsdata->num_x = tsdata->prop.max_x;
> > +		tsdata->num_y = tsdata->prop.max_y;
> 
> No. num_x and num_y reprsenet number of electrodes on a given axis and
> we should not be assigning maximum coordinates to them.

Thank you for explanation.

> Moreover, the factory mode can only be activated on M06, where we do
> read these values from registers, so we will not be allocating too much
> memory. If anything, we should add error handling for
> edt_ft5x06_register_read() when trying to fetch num_x and num_y.

-- 
With Best Regards,
Andy Shevchenko


