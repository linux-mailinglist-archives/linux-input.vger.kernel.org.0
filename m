Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D7624BF4
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 11:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfEUJq1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 05:46:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52407 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfEUJq1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 05:46:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id y3so2250428wmm.2;
        Tue, 21 May 2019 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LGbYDZXM+TVpMUOXUAmsay+usEVwkEDYwUxh6Mz8Qn4=;
        b=AEqa8eu4K5znqUpNZBOFLxaBxFoxcytTTN1fsVKzfKlmQZoFEod6NmwAxxEZzYHlkA
         IXWxsmG2TX7mvSwTBy1ZlRibHqfXk9n8xcFtAg0e1243uLY2LPwhmbeuF57Ac5E5HFZr
         3Jknh1HeNgj0njxACwMsGOLAZadOFnXDV3a4ORCu4lXXaPSuVIAuFuJsGfHo5/9JDa60
         BMCk36uZViurM4yDmsmFW6uac04vQZPs7ceSvkK9ZHbFa5L9DYLUBYUNC31KKAX7aPXE
         H6NfZluThY/vO2E70F6t1SOGrgP8s21w36inlpp5nufu9Amw/9pQKROPVln8CuEHT2Xs
         G4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LGbYDZXM+TVpMUOXUAmsay+usEVwkEDYwUxh6Mz8Qn4=;
        b=nY/p3mMJdr24p+Rg4+hGuSbcR1ZfCfA+c4KCzS1guFGccPHzmwA/VyUh3CpNhbonqM
         q7XRCh7XbyBEuXameYlz07zpMOOlc+QVXyJfeE4Yv8PApPDvzNvsPMCsOeDYNVYnnvWg
         QWJohEDgvlLrJK1GbY2NOBFBtmii8XqeAnfsUeOGyxoo5/3xFx/csxHCQ95Hwws6Sl8p
         0nP6gShypnB0F3HNOFWk0AZB3qoS3i3mjQf5pftyqghM+auEqclhQuEewj5Iu9n4gRg/
         qx5ZpCPS8NMVCtbgsAYtdftl/saG7jE4lvH5K/HxshXPmsFaTl89crOEHoOVdBHrSKuV
         jXEQ==
X-Gm-Message-State: APjAAAW6+sHUPSQsawEefkf8tETy+usYyThxpUfLiwpKW7hWnzdYKR8S
        alQgnzE1oO0y4IFt3ACogKvpB0RJndE=
X-Google-Smtp-Source: APXvYqxwV56bby12S0q7yrWg2xPcQFdrDRDU7ey5rNFNVyA/Lv+lMIBYILFOh36I/IyB0d7kYtoymg==
X-Received: by 2002:a1c:3cc2:: with SMTP id j185mr2617966wma.26.1558431984423;
        Tue, 21 May 2019 02:46:24 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id o6sm43665243wrh.55.2019.05.21.02.46.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 02:46:23 -0700 (PDT)
Date:   Tue, 21 May 2019 11:46:22 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?=
 alps-fix the issue the special alps trackpoint do not work.
Message-ID: <20190521094622.syeub6tcqhbyc7sg@pali>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello!

On Tuesday 21 May 2019 10:26:47 Hui Wang wrote:
> Tested-by: Hui Wang <hui.wang@canonical.com>
> 
> On 2019/5/21 上午9:07, Xiaoxiao Liu wrote:
> > Add Pali Rohár.
> > 
> > -----邮件原件-----
> > 发件人: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > 发送时间: Monday, May 20, 2019 7:02 PM
> > 收件人: dmitry.torokhov@gmail.com
> > 抄送: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; hui.wang@canonical.com; 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>; XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > 主题: [PATCH] input: alps-fix the issue the special alps trackpoint do not work.
> > 
> > when the alps trackpoint is detected and using the alps_v8_protocol_data procotol,
> > the alps driver will not report the input data.

Why it does not report input data?

> > solution: use standard mouse driver instead of alps driver when the specail trackpoint was detected.

This looks like an (undocumented) hack or workaround. Not a solution.

> > Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > ---
> >   drivers/input/mouse/alps.c | 23 ++++++++++++++++++++++-
> >   1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c index 0a6f7ca883e7..516ae1d0eb17 100644
> > --- a/drivers/input/mouse/alps.c
> > +++ b/drivers/input/mouse/alps.c
> > @@ -24,7 +24,7 @@
> >   #include "psmouse.h"
> >   #include "alps.h"
> > -
> > +#include "trackpoint.h"
> >   /*
> >    * Definitions for ALPS version 3 and 4 command mode protocol
> >    */
> > @@ -2864,6 +2864,22 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
> >   	return NULL;
> >   }
> > +int alps_check_is_trackpoint(struct psmouse *psmouse) {
> > +	u8 param[2] = { 0 };
> > +	int error;
> > +
> > +	error = ps2_command(&psmouse->ps2dev,
> > +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> > +	if (error)
> > +		return error;
> > +
> > +	if (param[0] == TP_VARIANT_ALPS)
> > +		return 0;
> > +	psmouse_warn(psmouse, "It is not alps trackpoint.\n");
> > +	return -ENODEV;
> > +}

So, this function returns 0 when detected ALPS trackpoint and -ENODEV
when not.

> > +
> >   static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)  {
> >   	const struct alps_protocol_info *protocol; @@ -2912,6 +2928,11 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
> >   			protocol = &alps_v3_protocol_data;
> >   		} else if (e7[0] == 0x73 && e7[1] == 0x03 &&
> >   			   (e7[2] == 0x14 || e7[2] == 0x28)) {
> > +				if (alps_check_is_trackpoint(psmouse) == 0) {
> > +					psmouse_warn(psmouse,
> > +					"It is alps trackpoint, use the standard mouse driver.\n");
> > +					return -EINVAL;

And here I'm lost. If we have *not* detected ALPS trackpoint then if
block is not called which means that ALPS driver is used.

So why is for non-ALPS trackpoints used ALPS driver? This does not seem
like a correct...

And when we have detected ALPS trackpoint (return value 0) then standard
mouse driver is used and returned -EINVAL. This seems strange too.

So either this code is wrong or there are missing more details for
explaining this strange logic. But still this looks like a hack not a
proper fix/solution.

> > +				}
> >   			protocol = &alps_v8_protocol_data;
> >   		} else if (e7[0] == 0x73 && e7[1] == 0x03 && e7[2] == 0xc8) {
> >   			protocol = &alps_v9_protocol_data;
> > --
> > 2.20.1
> > 

-- 
Pali Rohár
pali.rohar@gmail.com
