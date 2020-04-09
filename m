Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8EFA1A340C
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 14:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDIMgW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 08:36:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:15362 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIMgW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 08:36:22 -0400
IronPort-SDR: U1cjUZrrUJVeo79R3yhmcD9o0zbhRwzWNCdiw5WIn5taYYupLWbnqOM6dGZQvQxXxM1XuHPRtO
 IwfVkUJEuJdA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 05:36:22 -0700
IronPort-SDR: JHmvK/8heplCA/1OkTxw8zcPViPkWtbLJkh2Q/88MdeEzo4LOa19MJFYnJUvQe+zpxjxTgeLzV
 ydMzzR1C2XPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="398553773"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 09 Apr 2020 05:36:20 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMWPu-00GxF6-Oe; Thu, 09 Apr 2020 15:36:22 +0300
Date:   Thu, 9 Apr 2020 15:36:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, dmitry.torokhov@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Message-ID: <20200409123622.GA3676135@smile.fi.intel.com>
References: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
 <20200409105253.qvezbikpbnrkig52@pengutronix.de>
 <20200409120242.GA17410@portage>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200409120242.GA17410@portage>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 09, 2020 at 02:02:42PM +0200, Oliver Graute wrote:
> On 09/04/20, Marco Felsch wrote:
> > Hi Oliver,
> > 
> > thanks for your patch.
> > 
> > On 20-04-09 11:27, Oliver Graute wrote:
> > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > ...
> > 
> > >  drivers/input/touchscreen/edt-ft5x06.c | 4 ----
> > >  1 file changed, 4 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > index 06aa8ba0b6d7..6fbc87d041a1 100644
> > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > @@ -819,10 +819,6 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
> > >  	 * to have garbage in there
> > >  	 */
> > >  	memset(rdbuf, 0, sizeof(rdbuf));
> > > -	error = edt_ft5x06_ts_readwrite(client, 1, "\xBB",
> > > -					EDT_NAME_LEN - 1, rdbuf);
> > > -	if (error)
> > > -		return error;
> > 
> > 
> > I don't see how this call can corrupt the stack..
> 
> I admit that this is strange. The patch fixed my problems so I posted
> it. Still interested in the root-cause.

I'm wondering how you nailed down to this function? Have you able to use kASAN?

By the way, what I²C controller behind this? Maybe the bug in its driver?

-- 
With Best Regards,
Andy Shevchenko


