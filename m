Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB7A37A0BE
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 09:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhEKHWk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 03:22:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:1879 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhEKHWj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 03:22:39 -0400
IronPort-SDR: 8x4j/ik5IKCjtkGBqSKJbMY5ixRGn+9ZRFH3Ngrg6/iCNnnufMxm9PzkofFKFwDpjzw3Mor0P/
 DNFC8ZyQ1zOQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199054412"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="199054412"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:21:34 -0700
IronPort-SDR: iJYINuSqGpL4F1giBSzzS2yjgLLuhmyhgi3UOoV7k0GlxYEkFCZzjYx+9Ib+L+3rHrgDAOapEj
 LsWjVBbAzSAw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="468722384"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:21:31 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lgMhr-00BNKa-49; Tue, 11 May 2021 10:21:27 +0300
Date:   Tue, 11 May 2021 10:21:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <YJowd/tDgVD2TBKO@smile.fi.intel.com>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
 <YJmUm/6Vm3d9hp1z@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJmUm/6Vm3d9hp1z@gerhold.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 10:16:41PM +0200, Stephan Gerhold wrote:
> On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:

...

> The reasons were:
> 
>   - Bulk regulator API: AFAICT there is no way to use it while also
>     maintaining the correct enable/disable order plus the 10us delay.
>     See https://lore.kernel.org/linux-input/X%2Fwj+bxe%2FIlznCj6@gerhold.net/

This by the way can be fixed on regulator level (adding some like ranges into
bulk structure with timeouts, and if 0, skip them).

>   - dev_err_probe(): For some reason the patch set that converted a lot of
>     input drivers (including edt-ft5x06) to dev_err_probe() was never applied:
>     https://lore.kernel.org/linux-input/20200827185829.30096-12-krzk@kernel.org/
>     I dropped the change from my patch since Andy already mentioned
>     a similar thing back then.

This question to Dmitry, because I don't remember any good argument why he
doesn't like it. Maybe he can refresh our memories by providing it again.

-- 
With Best Regards,
Andy Shevchenko


