Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD5C379822
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 22:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhEJUKf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 16:10:35 -0400
Received: from mga14.intel.com ([192.55.52.115]:40448 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231463AbhEJUKf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 16:10:35 -0400
IronPort-SDR: ixkYGllkiB7NnrEIAai3mE+mob385Fa6MeISFT+elYShpWAdSpE5BwIsAecKAoLtImjMoAFPH/
 Jzx9VEXdwiuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="198956035"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="198956035"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 13:09:29 -0700
IronPort-SDR: D1dv6S6ttrb/tUHHJJk3u+ikTxhScWYMfl0OMfNNNW9zWUVkZFLbPdqwDX9fhozZUbSn9+47rh
 z4dHlzZBMBgQ==
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="541347239"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 13:09:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lgCDU-00BFqK-Cn; Mon, 10 May 2021 23:09:24 +0300
Date:   Mon, 10 May 2021 23:09:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <YJmS9NqGFGem6gxg@smile.fi.intel.com>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510194848.g7cgty3lirxkht5g@core>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> On Mon, May 10, 2021 at 09:31:08PM +0200, Stephan Gerhold wrote:

> > +	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
> > +	if (IS_ERR(tsdata->iovcc)) {
> > +		error = PTR_ERR(tsdata->iovcc);
> > +		if (error != -EPROBE_DEFER)
> > +			dev_err(&client->dev,
> > +				"failed to request iovcc regulator: %d\n", error);
> 
> Please use dev_err_probe instead. If this pattern is used for vcc-supply, maybe
> change that too. Maybe also consider using a bulk regulator API.

Dmitry seems is having something against it last time I remember it was
discussed with him.

-- 
With Best Regards,
Andy Shevchenko


