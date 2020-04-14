Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AE71A737C
	for <lists+linux-input@lfdr.de>; Tue, 14 Apr 2020 08:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405874AbgDNGTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Apr 2020 02:19:22 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:39329 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgDNGTU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Apr 2020 02:19:20 -0400
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Apr 2020 02:19:18 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="35193920"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Apr 2020 14:09:21 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(20963:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Apr 2020 14:09:19 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2480:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Apr 2020 14:09:17 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Bernd Edlinger'" <bernd.edlinger@hotmail.de>
Cc:     "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Dave.Wang'" <dave.wang@emc.com.tw>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        "'Kai-Heng Feng'" <kai.heng.feng@canonical.com>,
        "'Enrico Weigelt'" <info@metux.net>,
        "'Allison Randal'" <allison@lohutok.net>,
        "'Aaron Ma'" <aaron.ma@canonical.com>,
        =?gb2312?B?J9LlwqEtcGhvZW5peCc=?= <phoenix@emc.com.tw>
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com> <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com> <PR2PR03MB51799BF709B3975A08F139F4E4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com> <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com> <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com> <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com> <AM6PR03MB51705B32136F527B99CCD907E4C10@AM6PR03MB5170.eurprd03.prod.outlook.com> <20200409200746.GP75430@dtor-ws>
In-Reply-To: <20200409200746.GP75430@dtor-ws>
Subject: RE: [PATCH v2] Input: elantech - fix x_max/y_max values
Date:   Tue, 14 Apr 2020 14:09:17 +0800
Message-ID: <001b01d61223$3b1e5fd0$b15b1f70$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="gb2312"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEpX/8zKGl4MBCQipzcX+4OlxZsZwI+6lN+Aab7QkMBJBxwHQLYD+UWAf7ur9ICEY/IrgKBF86aqV3o9/A=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03OGI1OGM4Yi03ZTE2LTExZWEtYjZmOS1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcNzhiNThjOGQtN2UxNi0xMWVhLWI2ZjktZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSI0NDAzIiB0PSIxMzIzMTMxODE1NzgwNzc2NDMiIGg9IkE4bDdXckZGMFJHdmg3a0wwaXlMZDlUTSt1RT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Bernd:

We have checked the related function internal. 
It is right to switch the touchpad into absolute mode first to get valid
results from the ID query call in hardware version 2 and 3.

Thanks
jingle

-----Original Message-----
From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, April 10, 2020 4:08 AM
To: Bernd Edlinger
Cc: Benjamin Tissoires; Dave.Wang; jingle; linux-kernel@vger.kernel.org;
linux-input@vger.kernel.org; Kai-Heng Feng; Enrico Weigelt; Allison Randal;
Aaron Ma
Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values

Hi Bernd,

On Thu, Apr 09, 2020 at 07:38:17PM +0200, Bernd Edlinger wrote:
> Are you there?
> 
> Should I re-post the v2 patch, was that dropped somehow?
> 
> If I don't hear anything I'll assume I just repost, probably as 
> unchanged v3, right?

I do not think we ever got confirmation from Dave or Jingle; from my POV I
really dislike arbitrary mangling of the data.

I think you are right that the issue is with order of calls, and we need to
switch the touchpad into absolute mode to get valid results from the ID
query call. Dave, Jingle, any impot here?

Benjamin, Kai-Feng, do you know if we try to switch to absolute mode to
begin with, will it cause issues with SMBus mode?

Thanks.

> 
> Thanks,
> Bernd.
> 
> 
> On 4/5/20 7:54 AM, Bernd Edlinger wrote:
> > And, furthermore, there is one thing I find really confusing,
> > 
> > I do not see the message v2 quoted below which had an updated commit 
> > message, due to that Benjamin Tissoires request.
> > 
> > It was from my point of view sent on 2/27/20 11:03 PM, but I cannot 
> > find it neither on spinics, nor on marc.info.
> > That is funny.
> > 
> > Did it reach you guys at all?
> > Or should I re-send it just in case?
> > 
> > 
> > Thanks
> > Bernd.
> > 
> > On 4/5/20 7:26 AM, Bernd Edlinger wrote:
> >> Ping...
> >>
> >> This patch works fine for me since several weeks, without it I 
> >> would not be able to use my laptop any more.
> >>
> >> Could you please accept this patch?
> >>
> >>
> >> Thanks
> >> Bernd.
> >>
> >>
> >> On 2/27/20 11:03 PM, Bernd Edlinger wrote:
> >>> Since commit 37548659bb22 ("Input: elantech - query the min/max 
> >>> information beforehand too") moved the querying of the x_max/y_max 
> >>> values from elantech_set_input_params to elantech_query_info, the 
> >>> returned x_max/y_max values are different than before, at least 
> >>> for some firmware versions.
> >>>
> >>> The reason is likely that this is now done before 
> >>> elantech_set_absolute_mode does run.  So it may happen that the 
> >>> returned values are exactly half of what they used to be, which 
> >>> makes input_report_abs in PS/2 mode report ABS_X values which 
> >>> exceed the x_max value, which is very annoying since the mouse 
> >>> stops to move then, and ABS_Y value become negative, which is benign.
> >>>
> >>> This was observed with a MSI GX70 laptop:
> >>>
> >>> elantech: assuming hardware version 3 (with firmware version 
> >>> 0x250f01)
> >>> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
> >>> elantech: Elan sample query result 05, 0e, 00
> >>> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
> >>>
> >>> Correct this by doubling the returned x_max and y_max value for 
> >>> this specific firmware version.
> >>>
> >>> Fixes: 37548659bb22 ("Input: elantech - query the min/max 
> >>> information beforehand too")
> >>>
> >>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> >>> ---
> >>>  drivers/input/mouse/elantech.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/input/mouse/elantech.c 
> >>> b/drivers/input/mouse/elantech.c index 2d8434b..3399db8 100644
> >>> --- a/drivers/input/mouse/elantech.c
> >>> +++ b/drivers/input/mouse/elantech.c
> >>> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct 
> >>> psmouse *psmouse,
> >>>  
> >>>  		info->x_max = (0x0f & param[0]) << 8 | param[1];
> >>>  		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> >>> +		if (info->fw_version == 0x250f01) {
> >>> +			info->x_max <<= 1;
> >>> +			info->y_max <<= 1;
> >>> +		}
> >>>  		break;
> >>>  
> >>>  	case 4:
> >>>

--
Dmitry

