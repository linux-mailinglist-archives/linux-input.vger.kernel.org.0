Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12371A3B1E
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 22:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgDIUHv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 16:07:51 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40845 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgDIUHu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 16:07:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id c5so5466422pgi.7;
        Thu, 09 Apr 2020 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gFbgLvA9IhNM6MS+duI6ZIiItgpmMayKTmOoqArHpEk=;
        b=Wo8uwSUOk5gr4ciM3Mm7hxCSwPVI02l6a7YUFVcamVf9M9cFL8y+2yGQ+gBiRkwofK
         OkSEHrjC3Fia+rWqSGFhCuAzYBdMVtvkvkJLbZNpvE0reNA7giBWAhcwkVi+nqsTnW9j
         sj/3E7UsT66cxUBZ4ZLCrFk+jzupvF6CCMij3BpAo6efbn1/zt+9wHxC8gmURaf8j2qi
         khwhA64g0MLeKbvQFNwYCp49SAgWa18G39YVWhwjOFiAkEbXsIQX8W10aTUcasc0kn/k
         kDaEKK3QxzVDNP/hkpRBmXVRPxco3OyDUqMra8s8gr/uphlLzYd+OSlPQytznmplEz4m
         3SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gFbgLvA9IhNM6MS+duI6ZIiItgpmMayKTmOoqArHpEk=;
        b=fJReW1WhnIo228O22F3O82lh6jTsD17bbZPnGUdMsdVI5YhTLGsZgTLUyGj4n0RMsU
         VFwLJ1Dp5/Qtwref88WjCGw09eBSfwS2cGIvVQoexbvAaHAj62LjRs+83c84+qtoe0fH
         zrLgxlufIDKpk1Zqyz8m+JQeN0wz7x7dp9rfP54p3pDkhMs/JiXeLSvX1zrMoZ0tGZbI
         W5WrIUohBu9aaHWM8Uqow7cQczDwCL/+TLK9XnbkvEye7x+mdx4THqZ9i7W0Q1oTyxfR
         ZzmAWXTtEV7FqmD/OYS0x/X6m9i+tcYvr4Sz/cMMaAWvRSXiQZPNokcgUmtvyTV/8ZOS
         MhcA==
X-Gm-Message-State: AGi0PuaqKBsQF7ho0DMWP651iVg0p9bz2TOjSFmv0p+3fDgbxclWsFUN
        bayAvDC7iaVXPcxPpxZly7GZOzpo
X-Google-Smtp-Source: APiQypJT/cplvpNA6ox65vRjd3FD8P4lnzxQa3HquewNsN63tHFVMvzR7A8Q+/Q0UIM10NOjYhgrKw==
X-Received: by 2002:a63:ff53:: with SMTP id s19mr1129626pgk.247.1586462869353;
        Thu, 09 Apr 2020 13:07:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id k24sm93772pfk.164.2020.04.09.13.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:07:48 -0700 (PDT)
Date:   Thu, 9 Apr 2020 13:07:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Dave.Wang" <dave.wang@emc.com.tw>, jingle <jingle.wu@emc.com.tw>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Aaron Ma <aaron.ma@canonical.com>
Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values
Message-ID: <20200409200746.GP75430@dtor-ws>
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com>
 <PR2PR03MB51799BF709B3975A08F139F4E4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB51702AF00C6BA06BBC9F517EE4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
 <AM6PR03MB51705B32136F527B99CCD907E4C10@AM6PR03MB5170.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR03MB51705B32136F527B99CCD907E4C10@AM6PR03MB5170.eurprd03.prod.outlook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bernd,

On Thu, Apr 09, 2020 at 07:38:17PM +0200, Bernd Edlinger wrote:
> Are you there?
> 
> Should I re-post the v2 patch, was that dropped somehow?
> 
> If I don't hear anything I'll assume I just repost, probably
> as unchanged v3, right?

I do not think we ever got confirmation from Dave or Jingle; from my POV
I really dislike arbitrary mangling of the data.

I think you are right that the issue is with order of calls, and we need
to switch the touchpad into absolute mode to get valid results from the
ID query call. Dave, Jingle, any impot here?

Benjamin, Kai-Feng, do you know if we try to switch to absolute mode
to begin with, will it cause issues with SMBus mode?

Thanks.

> 
> Thanks,
> Bernd.
> 
> 
> On 4/5/20 7:54 AM, Bernd Edlinger wrote:
> > And, furthermore, there is one thing I find really confusing,
> > 
> > I do not see the message v2 quoted below which had an updated commit message,
> > due to that Benjamin Tissoires request.
> > 
> > It was from my point of view sent on 2/27/20 11:03 PM,
> > but I cannot find it neither on spinics, nor on marc.info.
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
> >> This patch works fine for me since several weeks,
> >> without it I would not be able to use my laptop any more.
> >>
> >> Could you please accept this patch?
> >>
> >>
> >> Thanks
> >> Bernd.
> >>
> >>
> >> On 2/27/20 11:03 PM, Bernd Edlinger wrote:
> >>> Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> >>> moved the querying of the x_max/y_max values from
> >>> elantech_set_input_params to elantech_query_info,
> >>> the returned x_max/y_max values are different than before,
> >>> at least for some firmware versions.
> >>>
> >>> The reason is likely that this is now done before
> >>> elantech_set_absolute_mode does run.  So it may happen that
> >>> the returned values are exactly half of what they used to be,
> >>> which makes input_report_abs in PS/2 mode report ABS_X values which
> >>> exceed the x_max value, which is very annoying since the mouse stops
> >>> to move then, and ABS_Y value become negative, which is benign.
> >>>
> >>> This was observed with a MSI GX70 laptop:
> >>>
> >>> elantech: assuming hardware version 3 (with firmware version 0x250f01)
> >>> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
> >>> elantech: Elan sample query result 05, 0e, 00
> >>> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
> >>>
> >>> Correct this by doubling the returned x_max and y_max
> >>> value for this specific firmware version.
> >>>
> >>> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> >>>
> >>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> >>> ---
> >>>  drivers/input/mouse/elantech.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> >>> index 2d8434b..3399db8 100644
> >>> --- a/drivers/input/mouse/elantech.c
> >>> +++ b/drivers/input/mouse/elantech.c
> >>> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
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
