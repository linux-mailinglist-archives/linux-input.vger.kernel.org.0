Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CD338C12D
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 09:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEUIBP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 04:01:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37167 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhEUIBO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 04:01:14 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id DE224200011;
        Fri, 21 May 2021 07:59:47 +0000 (UTC)
Message-ID: <778dc8fea918c0ce99f0f4b5385b31162f7db53c.camel@hadess.net>
Subject: Re: [PATCH] [v5] Input: Add "Select" button to Microsoft Xbox One
 controller.
From:   Bastien Nocera <hadess@hadess.net>
To:     Chris Ye <lzye@google.com>,
        =?UTF-8?Q?=C5=81ukasz?= Patron <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Olivier =?ISO-8859-1?Q?Cr=EAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        kernel-team@android.com
Date:   Fri, 21 May 2021 09:59:47 +0200
In-Reply-To: <CAFFudd+_FNcjrodzkZ7OgiCdstR=gKRQ3O264AkG37pVkcV9tw@mail.gmail.com>
References: <20210414021201.2462114-1-lzye@google.com>
         <CAFFuddLDgidkqDsihCU0VpXC_qEXVww67DmoFOvRdgrrPgOj_A@mail.gmail.com>
         <CAFFuddK_u2XxjbXnvhaRP1PakMCPDD5tV2T6ihXcAzzC72fu9g@mail.gmail.com>
         <CAFFudd+_FNcjrodzkZ7OgiCdstR=gKRQ3O264AkG37pVkcV9tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2021-05-13 at 23:10 -0700, Chris Ye wrote:
> +Dmitry. 
> 
> On Wed, May 12, 2021 at 11:21 AM Chris Ye <lzye@google.com> wrote:
> > Hi Benjamin,
> >      It seems I don't have any further comments on patch v5, do you
> > think we can land the patch in the next kernel release? Please
> > advise
> > if there are any further comments.
> > Thank you!
> > 
> > Regards,
> > Chris
> > 
> > On Wed, May 5, 2021 at 9:57 AM Chris Ye <lzye@google.com> wrote:
> > > 
> > > Hi Bastien,
> > >        Can you please take a look at the patch v5, which has
> > restored
> > > the same tab formatting?

Patch looks fine to me.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> > > Thanks! Regards,
> > > Chris
> > > 
> > > On Tue, Apr 13, 2021 at 7:12 PM Chris Ye <lzye@google.com> wrote:
> > > > 
> > > > Add "Select" button input capability and input event mapping
> > > > for
> > > > Microsoft Xbox One controller. From product site this is also
> > referred as
> > > > "Share" button.
> > > > Fixed Microsoft Xbox One controller select button not working
> > under USB
> > > > connection.
> > > > 
> > > > Signed-off-by: Chris Ye <lzye@google.com>
> > > > ---
> > > >   drivers/input/joystick/xpad.c | 6 ++++++
> > > >   1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/drivers/input/joystick/xpad.c
> > b/drivers/input/joystick/xpad.c
> > > > index 9f0d07dcbf06..cfbf1747b205 100644
> > > > --- a/drivers/input/joystick/xpad.c
> > > > +++ b/drivers/input/joystick/xpad.c
> > > > @@ -79,6 +79,7 @@
> > > >   #define MAP_DPAD_TO_BUTTONS            (1 << 0)
> > > >   #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
> > > >   #define MAP_STICKS_TO_NULL             (1 << 2)
> > > > +#define MAP_SELECT_BUTTON              (1 << 3)
> > > >   #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS |       
> > > >    
> >       \
> > > >                                  MAP_TRIGGERS_TO_BUTTONS |
> > MAP_STICKS_TO_NULL)
> > > > 
> > > > @@ -130,6 +131,7 @@ static const struct xpad_device {
> > > >          { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
> > XTYPE_XBOXONE },
> > > >          { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0,
> > XTYPE_XBOXONE },
> > > >          { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
> > MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> > > > +       { 0x045e, 0x0b12, "Microsoft Xbox One X pad",
> > MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> > > >          { 0x046d, 0xc21d, "Logitech Gamepad F310", 0,
> > XTYPE_XBOX360 },
> > > >          { 0x046d, 0xc21e, "Logitech Gamepad F510", 0,
> > XTYPE_XBOX360 },
> > > >          { 0x046d, 0xc21f, "Logitech Gamepad F710", 0,
> > XTYPE_XBOX360 },
> > > > @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct
> > usb_xpad *xpad, u16 cmd, unsigned char
> > > >          /* menu/view buttons */
> > > >          input_report_key(dev, BTN_START,  data[4] & 0x04);
> > > >          input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> > > > +       if (xpad->mapping & MAP_SELECT_BUTTON)
> > > > +               input_report_key(dev, KEY_RECORD, data[22] &
> > 0x01);
> > > > 
> > > >          /* buttons A,B,X,Y */
> > > >          input_report_key(dev, BTN_A,    data[4] & 0x10);
> > > > @@ -1672,6 +1676,8 @@ static int xpad_init_input(struct
> > > > usb_xpad
> > *xpad)
> > > >              xpad->xtype == XTYPE_XBOXONE) {
> > > >                  for (i = 0; xpad360_btn[i] >= 0; i++)
> > > >                          input_set_capability(input_dev,
> > > > EV_KEY,
> > xpad360_btn[i]);
> > > > +               if (xpad->mapping & MAP_SELECT_BUTTON)
> > > > +                       input_set_capability(input_dev, EV_KEY,
> > KEY_RECORD);
> > > >          } else {
> > > >                  for (i = 0; xpad_btn[i] >= 0; i++)
> > > >                          input_set_capability(input_dev,
> > > > EV_KEY,
> > xpad_btn[i]);
> > > > --
> > > > 2.31.1.295.g9ea45b61b8-goog
> > > > 


