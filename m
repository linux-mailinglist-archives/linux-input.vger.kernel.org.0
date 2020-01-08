Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF9813406A
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 12:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgAHL0R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 06:26:17 -0500
Received: from mga18.intel.com ([134.134.136.126]:44512 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgAHL0Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jan 2020 06:26:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 03:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; 
   d="scan'208";a="218043679"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2020 03:26:09 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ip9TV-0001sB-6p; Wed, 08 Jan 2020 13:26:09 +0200
Date:   Wed, 8 Jan 2020 13:26:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     fengping yu <fengping.yu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200108112609.GN32742@smile.fi.intel.com>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
 <1578473162.12131.13.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578473162.12131.13.camel@mtksdaap41>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 04:46:02PM +0800, Yingjoe Chen wrote:
> On Wed, 2020-01-08 at 14:29 +0800, fengping yu wrote:

> > +	tasklet_init(&keypad->tasklet, kpd_keymap_handler,
> > +		     (unsigned long)keypad);
> > +
> > +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> > +		     keypad->base + KP_DEBOUNCE);
> 
> You use a 13 bits mask and set it directly to KP_DEBOUNCE register. Are
> you sure the debounce unit is ms?
> 
> > +
> > +	/* register IRQ */
> > +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> > +			  KPD_NAME, keypad);
> 
> please consider using devm_request_irq, otherwise you have to free it in
> _remove function.

No, you may not use devm_*_irq() when tasklets are in use. There is a nasty
race condition.

Actually the rule of thumb is to NOT use devm_*_irq() unless you exactly know
what you are doing.

P.S. Why simple not to switch to threaded IRQ handler and drop tasklet? In such
case devm_*_irq() is fine.

-- 
With Best Regards,
Andy Shevchenko


