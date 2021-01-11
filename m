Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F582F1003
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 11:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbhAKKX1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 05:23:27 -0500
Received: from mga05.intel.com ([192.55.52.43]:7223 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729007AbhAKKX1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 05:23:27 -0500
IronPort-SDR: cGCK05JmHZ6LGlS+dmsR9tMoFae1P9rPb0CPjibZkZcTBT3j1SULV/7R5ujdGmahS2/jt0RQ5H
 N0ZlO7PYGr2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="262617550"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="262617550"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 02:21:37 -0800
IronPort-SDR: XrxqOyIQOY7xzfAx0qIdIxIt3LI8kS6SjHlUmUsJCthRNAF5MDG2ODRFAZQVn7RiHwcpjzL1fN
 T73jdeefRvkA==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="404076510"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 02:21:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kyuLM-00A5Rt-Uj; Mon, 11 Jan 2021 12:22:36 +0200
Date:   Mon, 11 Jan 2021 12:22:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210111102236.GT4077@smile.fi.intel.com>
References: <20210108192337.563679-1-stephan@gerhold.net>
 <20210108192337.563679-2-stephan@gerhold.net>
 <20210111083612.swe2bu7mvjzjromg@pengutronix.de>
 <X/wZqiRbx6nmrj0e@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/wZqiRbx6nmrj0e@gerhold.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 11, 2021 at 10:26:25AM +0100, Stephan Gerhold wrote:
> On Mon, Jan 11, 2021 at 09:36:12AM +0100, Marco Felsch wrote:
> > On 21-01-08 20:23, Stephan Gerhold wrote:

...

> > > +	if (error)
> > > +		return dev_err_probe(&client->dev, error,
> > > +				     "failed to request regulators\n");
> > 
> > It would be nice to have a patch in front of this one which handles the
> > support for dev_err_probe().
> > 
> 
> OK, I can send a v2 with the dev_err_probe() change separated into an
> extra patch.

AFAIR Dmitry has strong opinion against dev_err_probe(). But I might be
mistaken.

-- 
With Best Regards,
Andy Shevchenko


