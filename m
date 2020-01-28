Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3EA14B1D8
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 10:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgA1JlS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 04:41:18 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41415 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgA1JlR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 04:41:17 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iwNMv-000580-AG; Tue, 28 Jan 2020 10:41:13 +0100
Message-ID: <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Christopher Heiny <Cheiny@synaptics.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Date:   Tue, 28 Jan 2020 10:41:12 +0100
In-Reply-To: <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
         <20200127022448.GC184237@dtor-ws>
         <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
         <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
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

Hi Christopher,

On Di, 2020-01-28 at 07:02 +0000, Christopher Heiny wrote:
> On Mon, 2020-01-27 at 11:21 -0800, Andrew Duggan wrote:
> > Hi Dmitry,
> > 
> > On 1/26/20 6:24 PM, Dmitry Torokhov wrote:
> > > On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
> > > > When the distance thresholds are set the controller must be in
> > > > reduced
> > > > reporting mode for them to have any effect on the interrupt
> > > > generation.
> > > > This has a potentially large impact on the number of events the
> > > > host
> > > > needs to process.
> > > > 
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > ---
> > > > I'm not sure if we want a separate DT property to allow the use
> > > > of
> > > > reduced reporting mode, as this change might lead to problems for
> > > > controllers with unreasonably large threshold values. I'm not
> > > > sure if
> > > > any controller with bogus threshold values exist in the wild.
> > > > ---
> > > Andrew, any feedback on this patch?
> > > 
> > > Thanks!
> > 
> > The RMI4 spec does say that delta X/Y thresholds are only used in 
> > reduced reporting mode, so this patch is needed for the threshold
> > values 
> > to have an effect.
> > 
> > Reviewed-by: Andrew Duggan <aduggan@synaptics.com>
> > 
> > Because reduced reporting mode is so dependent on these thresholds,
> > my 
> > opinion is that it is better not to add a separate DT property, but
> > to 
> > instead control reduced reporting mode through the setting of these 
> > thresholds. My guess is that the if reduced reporting is not enabled
> > in 
> > the firmware by default, then the thresholds may not be valid.
> > Setting 
> > the thresholds to 0 will essentially disable reduced reporting mode.
> > So 
> > that would be how a user could disable reduced reporting mode without
> > a 
> > separate DT property. Chris, do you have an opinion on this? Anything
> > I 
> > overlooked?
> 
> Hi Dmitry, Andrew, Lucas,
> 
> I'm in agreement with Andrew on this.  Having two ways to
> enable/disable reduced reporting (that is, both the DT property and the
> thresholds) could lead to confusion and unexpected behavior.  Simpler
> is better, in my opinion.
> 
> However, in that case I'm a little concerned about the logic in the
> patch below.  When either of the thresholds are set to non-zero, we
> clear the report mask and then enable the reduced reporting bit. 
> Subsequently setting both thresholds to zero will disable reduced
> reporting, but will not enable another report mode.  Unless there is
> code elsewhere to catch this case (and if there is, it seems like a bad
> idea to be handling this in two different places), it could result in
> the touchpad being disabled.
> 
> As a hypothetical instance of this, imagine a user using the touchpad
> to manipulate report threshold sliders in a GUI.  Setting both sliders
> to zero would disable the touch sensor reporting, potentially leaving
> the user with a dead touch sensor and no easy way to recover from that.

I can see how this would be a problem, but then I see no interface in
the driver to actually change the threshold values on the fly. They are
either set by firmware or specified via DT properties. So I don't see
how the threshold values would change on an active device. Anything i'm
overlooking?

Regards,
Lucas

> > 
> > > >   drivers/input/rmi4/rmi_f11.c | 14 ++++++++++++++
> > > >   1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/drivers/input/rmi4/rmi_f11.c
> > > > b/drivers/input/rmi4/rmi_f11.c
> > > > index bbf9ae9f3f0c..6adea8a3e8fb 100644
> > > > --- a/drivers/input/rmi4/rmi_f11.c
> > > > +++ b/drivers/input/rmi4/rmi_f11.c
> > > > @@ -412,6 +412,10 @@ struct f11_2d_sensor_queries {
> > > > 
> > > >   /* Defs for Ctrl0. */
> > > >   #define RMI_F11_REPORT_MODE_MASK        0x07
> > > > +#define RMI_F11_REPORT_MODE_CONTINUOUS  (0 << 0)
> > > > +#define RMI_F11_REPORT_MODE_REDUCED     (1 << 0)
> > > > +#define RMI_F11_REPORT_MODE_FS_CHANGE   (2 << 0)
> > > > +#define RMI_F11_REPORT_MODE_FP_CHANGE   (3 << 0)
> > > >   #define RMI_F11_ABS_POS_FILT            (1 << 3)
> > > >   #define RMI_F11_REL_POS_FILT            (1 << 4)
> > > >   #define RMI_F11_REL_BALLISTICS          (1 << 5)
> > > > @@ -1195,6 +1199,16 @@ static int rmi_f11_initialize(struct
> > > > rmi_function *fn)
> > > >                ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD] =
> > > >                        sensor->axis_align.delta_y_threshold;
> > > > 
> > > > +     /*
> > > > +      * If distance threshold values are set, switch to reduced
> > > > reporting
> > > > +      * mode so they actually get used by the controller.
> > > > +      */
> > > > +     if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
> > > > +         ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
> > > > +             ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
> > > > +             ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
> > > > +     }
> > > > +
> > > >        if (f11->sens_query.has_dribble) {
> > > >                switch (sensor->dribble) {
> > > >                case RMI_REG_STATE_OFF:
> > > > --
> > > > 2.20.1
> > > > 
> > > --
> > > Dmitry
> 
> 

