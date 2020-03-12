Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9681C182D24
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 11:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgCLKLn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 06:11:43 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58297 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgCLKLn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 06:11:43 -0400
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jCKoV-00089R-23; Thu, 12 Mar 2020 11:11:39 +0100
Message-ID: <e66f788ae84b13df9ff8d28129c089431f1af9b4.camel@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - Do not set reduced reporting
 mode thresholds are not set by the driver
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Thu, 12 Mar 2020 11:11:36 +0100
In-Reply-To: <20200312031422.GA1823643@jelly>
References: <20200312005549.29922-1-aduggan@synaptics.com>
         <20200312031422.GA1823643@jelly>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter,

On Do, 2020-03-12 at 13:14 +1000, Peter Hutterer wrote:
> Hi Andrew,
> 
> On Wed, Mar 11, 2020 at 05:55:49PM -0700, Andrew Duggan wrote:
> > The previous patch "c5ccf2ad3d33 (Input: synaptics-rmi4 - switch to
> > reduced reporting mode)" enabled reduced reporting mode
> > unintentionally
> > on some devices, if the firmware was configured with default Delta
> > X/Y
> > threshold values. The result unintentionally degrade the
> > performance of
> > some touchpads.
> 
> could this be the cause of a stuttering cursor on a P50 as well?
> A recording in the issue below shows the cursor moving by ~25 units per
> event, regardless of the time between those events.
> https://gitlab.freedesktop.org/libinput/libinput/issues/448

Yes, that's very much possible, as reduced reporting mode is about only
reporting events once they cross a predefined movement threshold.

Regards,
Lucas

> thanks!
> 
> Cheers,
>    Peter
> 
> > This patch checks to see that the driver is modifying the delta X/Y
> > thresholds before modifying the reporting mode.
> > 
> > Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
> > ---
> >  drivers/input/rmi4/rmi_f11.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/rmi4/rmi_f11.c
> > b/drivers/input/rmi4/rmi_f11.c
> > index 6adea8a3e8fb..ffa39ab153f2 100644
> > --- a/drivers/input/rmi4/rmi_f11.c
> > +++ b/drivers/input/rmi4/rmi_f11.c
> > @@ -1203,8 +1203,8 @@ static int rmi_f11_initialize(struct
> > rmi_function *fn)
> >  	 * If distance threshold values are set, switch to reduced
> > reporting
> >  	 * mode so they actually get used by the controller.
> >  	 */
> > -	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
> > -	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
> > +	if (sensor->axis_align.delta_x_threshold ||
> > +	    sensor->axis_align.delta_y_threshold) {
> >  		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
> >  		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
> >  	}
> > -- 
> > 2.20.1
> > 

