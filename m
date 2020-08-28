Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C562552BC
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 03:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgH1Bys (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 21:54:48 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:45003 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgH1Bys (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 21:54:48 -0400
X-Greylist: delayed 583 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Aug 2020 21:54:47 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="37064317"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 28 Aug 2020 09:45:03 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(163604:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 28 Aug 2020 09:45:00 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2481:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 28 Aug 2020 09:44:58 +0800 (CST)
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
        "'Jeff Chuang'" <jeff.chuang@emc.com.tw>
References: <1598492651-9072-1-git-send-email-johnny.chuang.emc@gmail.com> <CA+jURctrQcKsGwxZriX8bD3AQr-yh_J_Z7kkP+6HtD72Gt5DUw@mail.gmail.com>
In-Reply-To: <CA+jURctrQcKsGwxZriX8bD3AQr-yh_J_Z7kkP+6HtD72Gt5DUw@mail.gmail.com>
Subject: RE: [PATCH v2] Input: elants_i2c - Report resolution of ABS_MT_TOUCH_MAJOR by FW information.
Date:   Fri, 28 Aug 2020 09:44:58 +0800
Message-ID: <005b01d67cdc$d6b9abb0$842d0310$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFRGjtInX7OpHFNBLKqABUOrfrToAHhntm3qkh3FuA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0xM2M4MjJhMC1lOGQwLTExZWEtODc2YS03YzVjZjg3NDk0NzhcYW1lLXRlc3RcMTNjODIyYTItZThkMC0xMWVhLTg3NmEtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyNzE2IiB0PSIxMzI0MzA1MjY5ODIyNTYyMjIiIGg9IlJaWkh1ZjZwa29WZEVKcGMyTDVId3hYdis0OD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Wed, 26 Aug 2020 at 18:44, Johnny Chuang
> <johnny.chuang.emc@gmail.com> wrote:
> >
> > This patch adds a new behavior to report touch major resolution based
> > on information provided by firmware.
> >
> > In initial process, driver acquires touch information from touch ic.
> > This information contains of one flag about reporting resolution of
> > ABS_MT_TOUCH_MAJOR is needed, or not.
> > Touch driver will report touch major resolution after geting this flag.
> 
> I think this paragraph needs updating now that the firmware's reporting the
> actual resolution instead of a flag.

Thanks Harry, I will update patch v3 for this.

> 
> >
> > Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> > ---
> > Changes in v2:
> >   - register real resolution instead of true/false.
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > index b0bd5bb..dc7f4a5 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -151,6 +151,7 @@ struct elants_data {
> >
> >         bool wake_irq_enabled;
> >         bool keep_power_in_suspend;
> > +       u8 report_major_resolution;
> >
> >         /* Must be last to be used for DMA operations */
> >         u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned; @@ -459,6
> > +460,9 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
> >         rows = resp[2] + resp[6] + resp[10];
> >         cols = resp[3] + resp[7] + resp[11];
> >
> > +       /* Decide if report resolution of ABS_MT_TOUCH_MAJOR */
> > +       ts->report_major_resolution = resp[16];
> > +
> >         /* Process mm_to_pixel information */
> >         error = elants_i2c_execute_command(client,
> >                                            get_osr_cmd,
> > sizeof(get_osr_cmd), @@ -1325,6 +1329,8 @@ static int
> elants_i2c_probe(struct i2c_client *client,
> >                              0, MT_TOOL_PALM, 0, 0);
> >         input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> >         input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> > +       if (ts->report_major_resolution > 0)
> > +               input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR,
> > + ts->report_major_resolution);
> >
> >         touchscreen_parse_properties(ts->input, true, &ts->prop);
> >
> > --
> > 2.7.4
> >
> 
> Harry Cutts
> Chrome OS Touch/Input team

--
Johnny

