Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FF92F1A06
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 16:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730420AbhAKPta (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 10:49:30 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:18920 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbhAKPta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 10:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610379998;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=vLyYz99L0YavfYACFiH1Ov36RMm83JVQzIoH1waUWPg=;
        b=ZnRCHC6aHrdgahAQdomtz7jA2BcAlgD3P3QpuCG7yP5gwHgLC3biKEVvhh6N2tyPLN
        qkYckysNrS7asTsT5Suswd8czlHGGoljzVkyPLndINukrzrcE62UlRjEN1JXa0qVezta
        Qql+OPiC02Edbj7htE1pNu0Koze+6z0nsvP9vKfDuOwyKVORHkZIjDh/L66ODf0WOSWG
        HzYsDCMxyQ+sd26a/zdiFkIV6eVcm1Veaxz/PgD1hIYRzKYTUZV3OUpv5OSnQnsObcXa
        Vs3GWRImtTANObKYsy50lzqxqu/3ychjgzHZ+aGGt6CxdTTmO+gKb7vbc0C3YlIFAzoM
        mx0Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8jxIcvGBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0BFkUwAg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 11 Jan 2021 16:46:30 +0100 (CET)
Date:   Mon, 11 Jan 2021 16:46:25 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <X/xy0fIvIcD36Ab1@gerhold.net>
References: <20210108192337.563679-1-stephan@gerhold.net>
 <20210108192337.563679-2-stephan@gerhold.net>
 <20210111083612.swe2bu7mvjzjromg@pengutronix.de>
 <X/wZqiRbx6nmrj0e@gerhold.net>
 <20210111094538.yg3otwgesgyemktp@pengutronix.de>
 <X/wj+bxe/IlznCj6@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/wj+bxe/IlznCj6@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 11:10:16AM +0100, Stephan Gerhold wrote:
> On Mon, Jan 11, 2021 at 10:45:38AM +0100, Marco Felsch wrote:
> > On 21-01-11 10:26, Stephan Gerhold wrote:
> > > On Mon, Jan 11, 2021 at 09:36:12AM +0100, Marco Felsch wrote:
> > > > On 21-01-08 20:23, Stephan Gerhold wrote:
> > > > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > > > index 2eefbc2485bc..bf2e208112fe 100644
> > > > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > > > @@ -103,7 +103,7 @@ struct edt_ft5x06_ts_data {
> > > > >  	struct touchscreen_properties prop;
> > > > >  	u16 num_x;
> > > > >  	u16 num_y;
> > > > > -	struct regulator *vcc;
> > > > > +	struct regulator_bulk_data regulators[2];
> > > > 
> > > > Is there an enabling order we must follow?
> > > > 
> > > 
> > > I don't know, sadly. The datasheets I was able to find do not mention
> > > anything about this; the power-on sequence only includes the VDD line.
> > 
> > I've goolged a bit :)
> > 
> > Check this: https://focuslcds.com/content/FT5X26.pdf, page 12 of 32
> > 
> 
> Thanks! I looked at several datasheets, that's probably one of the few I
> did not look at. :(
> 
> > There it is mentioned that we need to enable it first and add a 10us
> > delay till we can enable the vdd line. So unfortunately the bulk_api
> > can't be used as it is today. Another solution could be to extended the
> > bulk api to respect on/off delays.
> > 
> 
> I think for two regulators like here it's still manageable to
> get/enable/disable/put them separately, so I will just revert the bulk
> API change in v2.
> 

While implementing this I noticed that the power-up sequence in probe()
does not quite seem right. The power-up sequence implemented by Marco in
edt_ft5x06_ts_resume() seems to match the datasheet(s) but in probe() we
enable VCC before doing anything with the reset line.

So before I add the IOVCC regulator I will try to refactor the code a
bit to make this consistent. :)

Thanks,
Stephan
