Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7F5386EB5
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 03:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240000AbhERBJN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 17 May 2021 21:09:13 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:42182 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239122AbhERBJN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 21:09:13 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="40764565"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 18 May 2021 09:07:54 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(177985:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 18 May 2021 09:07:54 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2473:3:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 18 May 2021 09:07:53 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Harry Cutts'" <hcutts@chromium.org>,
        "'Johnny Chuang'" <johnny.chuang.emc@gmail.com>
Cc:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Peter Hutterer'" <peter.hutterer@who-t.net>,
        "'lkml'" <linux-kernel@vger.kernel.org>,
        "'linux-input'" <linux-input@vger.kernel.org>,
        "'James Chen'" <james.chen@emc.com.tw>,
        "'Jennifer Tsai'" <jennifer.tsai@emc.com.tw>,
        "'Paul Liang'" <paul.liang@emc.com.tw>,
        "'Jeff Chuang'" <jeff.chuang@emc.com.tw>,
        "'Douglas Anderson'" <dianders@chromium.org>,
        "'Jingle'" <jingle.wu@emc.com.tw>, "'Paris Yeh'" <pyeh@google.com>,
        "'sukumar . ghorai'" <sukumar.ghorai@intel.corp-partner.google.com>
References: <1621295824-12730-1-git-send-email-johnny.chuang.emc@gmail.com> <CA+jURcv-o3g3C6zZhGio7KKtco-b+dGk+vm=3Nj8ps_-yMQRNA@mail.gmail.com>
In-Reply-To: <CA+jURcv-o3g3C6zZhGio7KKtco-b+dGk+vm=3Nj8ps_-yMQRNA@mail.gmail.com>
Subject: RE: [PATCH] HID: i2c-hid: Add I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON to optimize timing
Date:   Tue, 18 May 2021 09:07:53 +0800
Message-ID: <089701d74b82$3b0c1c00$b1245400$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKTds7H4vJlViKUoEQ2K8NJpxt9xgIFo9jjqV/oReA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03ODgyODQxOS1iNzc1LTExZWItODY2Mi03YzVjZjg3NDk0NzhcYW1lLXRlc3RcNzg4Mjg0MWItYjc3NS0xMWViLTg2NjItN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyNDAyIiB0PSIxMzI2NTc3MzY3MzYyNzYxNTYiIGg9IlpXYng0VXJYT0lKRnp4WmtPdjE1NWpWRk9mOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Mon, 17 May 2021 at 16:57, Johnny Chuang
> <johnny.chuang.emc@gmail.com> wrote:
> >
> > There is a hard coding 60ms delay after I2C_HID_PWR_ON commadn.
> > Elan didn't need the delay, so we add a quirk to reduce boot time and
> resume time.
> >
> > Optimized: eef4016243e9("HID: i2c-hid: Always sleep 60ms after
> > I2C_HID_PWR_ON commands")
> 
> I don't think Optimized: is a valid commit tag, though I'm not sure if it'll cause
> any problems.

I will change to Fixed tag at PATCH v2.

> 
> >
> > Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
> > b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index 9993133..e7ec280 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > [...snip...]
> > @@ -178,6 +179,11 @@ static const struct i2c_hid_quirks {
> >                  I2C_HID_QUIRK_RESET_ON_RESUME },
> >         { USB_VENDOR_ID_ITE,
> I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
> >                 I2C_HID_QUIRK_BAD_INPUT_SIZE },
> > +       /*
> > +        * Optimize boot time and resume time
> > +        */
> 
> This comment is a bit too vague to be useful; maybe state that Elan devices
> don't need the delay instead, or just remove the comment.
> 
> Other than that,

Okay, I will change to Elan devices don't need the delay at PATCH v2.

> 
> Reviewed-by: Harry Cutts <hcutts@chromium.org>
> 
> > +       { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> > +                I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON },
> >         { 0, 0 }
> >  };
> >
> > @@ -427,7 +433,8 @@ static int i2c_hid_set_power(struct i2c_client *client,
> int power_state)
> >          * PWR_ON requests. Testing has confirmed that several devices
> >          * will not work properly without a delay after a PWR_ON
> request.
> >          */
> > -       if (!ret && power_state == I2C_HID_PWR_ON)
> > +       if (!ret && power_state == I2C_HID_PWR_ON &&
> > +           !(ihid->quirks &
> I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON))
> >                 msleep(60);
> >
> >         return ret;
> > --
> > 2.7.4
> >

