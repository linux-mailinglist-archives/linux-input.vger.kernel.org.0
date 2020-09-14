Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A940268338
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 05:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgINDju (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Sep 2020 23:39:50 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:22763 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgINDju (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Sep 2020 23:39:50 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="37297018"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Sep 2020 11:39:44 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(13710:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 14 Sep 2020 11:39:42 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2482:1:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 14 Sep 2020 11:39:40 +0800 (CST)
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
References: <1598581195-9874-1-git-send-email-johnny.chuang.emc@gmail.com> <CA+jURcs2tLsVihoiXLsvLzdJZ4LKv0sQTu7FAqqT6r+pCi0wsA@mail.gmail.com>
In-Reply-To: <CA+jURcs2tLsVihoiXLsvLzdJZ4LKv0sQTu7FAqqT6r+pCi0wsA@mail.gmail.com>
Subject: RE: [PATCH v3] Input: elants_i2c - Report resolution of ABS_MT_TOUCH_MAJOR by FW information.
Date:   Mon, 14 Sep 2020 11:39:39 +0800
Message-ID: <002a01d68a48$ad112a30$07337e90$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQI77ytWzSZun9942hZafipM5V6HSAGb0KaPqI/UJFA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1lYThjZjEwZS1mNjNiLTExZWEtOGZkOC03YzVjZjg3NDk0NzhcYW1lLXRlc3RcZWE4Y2YxMTAtZjYzYi0xMWVhLThmZDgtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyODA3IiB0PSIxMzI0NDUyODM3OTc2ODAxNzkiIGg9IkNOa084QUpoeElCTEFzRi9aTEpsbTcxelJwOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Thu, 27 Aug 2020 at 19:20, Johnny Chuang
> <johnny.chuang.emc@gmail.com> wrote:
> >
> > This patch adds a new behavior to report touch major resolution based
> > on information provided by firmware.
> >
> > In initial process, driver acquires touch information from touch ic.
> > It contains one byte about the resolution value of ABS_MT_TOUCH_MAJOR.
> > Touch driver will report touch major resolution by this information.
> >
> > Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> 
> Thanks Johnny!
> 
> Reviewed-by: Harry Cutts <hcutts@chromium.org>
> 
> Harry Cutts
> Chrome OS Touch/Input team
> 

Hi Sirs,
Can you help to review this patch?

> > ---
> > Changes in v2:
> >   - register a real resolution value from firmware,
> >         instead of hardcoding resolution value as 1 by flag.
> > Changes in v3:
> >   - modify git log message from flag to real value.
> >   - modify driver comment from flag to real value.
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > index b0bd5bb..661a3ee 100644
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
> > +       /* get report resolution value of ABS_MT_TOUCH_MAJOR */
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

