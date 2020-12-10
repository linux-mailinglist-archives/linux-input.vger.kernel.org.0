Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D1C2D594F
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 12:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732556AbgLJLeb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 06:34:31 -0500
Received: from mga11.intel.com ([192.55.52.93]:16536 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbgLJLeU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 06:34:20 -0500
IronPort-SDR: Ut5zoj7FwXankmGOR28pGzamW8iKEI6CDyEtWseIw0vPFnA+M0OGmj1Ud6x6RjRFQ6N5zFcdmU
 xWhJtSytqjKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="170732060"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="170732060"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 03:32:34 -0800
IronPort-SDR: VSPww2xSyJ1jwgHSm10TH7YLDBIp3WPatk1kyCCNsdQsg+yEziz23pdrbr38sDHAgUxN2OHgCt
 6Su7XgnD1GIw==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="319024823"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 03:32:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knKCU-00DP8D-Hr; Thu, 10 Dec 2020 13:33:34 +0200
Date:   Thu, 10 Dec 2020 13:33:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - consolidate handling of number of
 electrodes
Message-ID: <20201210113334.GD4077@smile.fi.intel.com>
References: <X9FZFs3NZADoIhhH@google.com>
 <20201210100803.bfohc5fglvrwrtcz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210100803.bfohc5fglvrwrtcz@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 10, 2020 at 11:08:03AM +0100, Marco Felsch wrote:
> On 20-12-09 15:09, Dmitry Torokhov wrote:

...

> >  	case EV_FT:
> >  		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
> > +		reg_addr->reg_report_rate = NO_REGISTER;
> >  		reg_addr->reg_gain = EV_REGISTER_GAIN;
> >  		reg_addr->reg_offset = NO_REGISTER;
> >  		reg_addr->reg_offset_x = EV_REGISTER_OFFSET_X;
> >  		reg_addr->reg_offset_y = EV_REGISTER_OFFSET_Y;
> >  		reg_addr->reg_num_x = NO_REGISTER;
> >  		reg_addr->reg_num_y = NO_REGISTER;
> > -		reg_addr->reg_report_rate = NO_REGISTER;
> >  		break;
> 
> Nit:
> Unrelated change.

I guess the motive is to get these assignments consistent between the cases.
Documentation actually allows this kind of modifications of code in one change
when them are toughly related.

-- 
With Best Regards,
Andy Shevchenko


