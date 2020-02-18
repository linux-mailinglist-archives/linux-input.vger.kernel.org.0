Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654EC1629D9
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 16:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgBRPvv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 10:51:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:47243 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgBRPvv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 10:51:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 07:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="382490238"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 18 Feb 2020 07:51:46 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j45A4-0035xT-CI; Tue, 18 Feb 2020 17:51:48 +0200
Date:   Tue, 18 Feb 2020 17:51:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     "fengping.yu" <fengping.yu@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        DTML <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 2/2] drivers: input: keyboard: add mtk keypad driver
Message-ID: <20200218155148.GJ10400@smile.fi.intel.com>
References: <20200114122738.103344-1-fengping.yu@mediatek.com>
 <20200114122738.103344-3-fengping.yu@mediatek.com>
 <CAOwMV_w=Ad8gt1rftFw_EbtaZ2uCz=oWpm_P5YMHLNpok7Q09Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOwMV_w=Ad8gt1rftFw_EbtaZ2uCz=oWpm_P5YMHLNpok7Q09Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 18, 2020 at 04:14:24PM +0100, Fabien Parent wrote:
> On Tue, Jan 14, 2020 at 1:39 PM fengping.yu <fengping.yu@mediatek.com> wrote:

...

> > +#define KP_STA                         0x0000
> > +#define KP_MEM1                                0x0004
> > +#define KP_MEM2                                0x0008
> > +#define KP_MEM3                                0x000c
> > +#define KP_MEM4                                0x0010
> > +#define KP_MEM5                                0x0014
> > +#define KP_DEBOUNCE                    0x0018
> > +#define KP_SEL                         0x0020
> > +#define KP_EN                          0x0024

...

> > +#define KPD_NUM_MEMS   5
> > +#define KPD_MEM5_BITS  8
> > +#define KPD_NUM_KEYS   72      /* 4 * 16 + KPD_MEM5_BITS */

> > +       kpd_get_keymap_state(keypad->base, new_state);
> 
> kpd_get_keymap_state(keypad->base + KP_MEM1, new_state);

Why?

-- 
With Best Regards,
Andy Shevchenko


