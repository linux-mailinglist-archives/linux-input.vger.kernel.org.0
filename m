Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFA9A7FC9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2019 11:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfIDJvh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 4 Sep 2019 05:51:37 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:14931 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDJvh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Sep 2019 05:51:37 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="32035645"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 04 Sep 2019 17:51:34 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(65864:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 04 Sep 2019 17:51:32 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(122355:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Wed, 04 Sep 2019 17:51:29 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?UTF-8?B?J1NUUkQyLeiUoeaDoOWsiyc=?= <jennifer.tsai@emc.com.tw>,
        =?UTF-8?B?J1NUUkQyLemZs+W0h+aYjue2k+eQhic=?= 
        <james.chen@emc.com.tw>,
        =?UTF-8?B?J+aigeWNmue/lCc=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>
References: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw> <000601d55d49$05878160$10968420$@emc.com.tw> <20190829182933.GD187474@dtor-ws> <001e01d561ff$fb3d7000$f1b85000$@emc.com.tw> <20190903155514.GL187474@dtor-ws>
In-Reply-To: <20190903155514.GL187474@dtor-ws>
Subject: RE: [PATCH] Input: elants_i2c - return real value of elants_i2c_initialize()
Date:   Wed, 4 Sep 2019 17:51:29 +0800
Message-ID: <002d01d56306$534df830$f9e9e890$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFmeLP5IfQOHpOgOs9iM2bs2d5OHQE/UdUoAQf8D7wCDKPyGQG42CZlp8i0v4A=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05MDg5ZWUzMS1jZWY5LTExZTktODg3Mi03YzVjZjg3NDk0NzhcYW1lLXRlc3RcOTA4OWVlMzMtY2VmOS0xMWU5LTg4NzItN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyNDk4IiB0PSIxMzIxMjA2NDI4ODk5MTg0OTIiIGg9ImIyYnMwazEyUE03V1llVWh6T1locHMzL2g4TT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Got it, let it dropped.

Many thanks,
Johnny
-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Tuesday, September 03, 2019 11:55 PM
To: Johnny.Chuang
Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; 'STRD2-蔡惠嬋'; 'STRD2-陳崇明經理'; '梁博翔'; 'jeff'
Subject: Re: [PATCH] Input: elants_i2c - return real value of elants_i2c_initialize()

On Tue, Sep 03, 2019 at 10:33:33AM +0800, Johnny.Chuang wrote:
> Hi Dmitry,
> 
> Thanks for your explanation.
> If I want to abandon this patch, what's step I need to do?

Absolutely nothing ;) Consider it dropped.

> 
> Many thanks,
> Johnny
> -----Original Message-----
> From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
> Sent: Friday, August 30, 2019 2:30 AM
> To: Johnny.Chuang
> Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; STRD2-蔡惠嬋;
> STRD2-陳崇明經理; '梁博翔'; 'jeff'
> Subject: Re: [PATCH] Input: elants_i2c - return real value of
> elants_i2c_initialize()
> 
> Hi Johnny,
> 
> On Wed, Aug 28, 2019 at 10:33:46AM +0800, Johnny.Chuang wrote:
> > The return value of elants_i2c_initialize() was always 0.
> > It maybe register input device when initialize fail.
> 
> We do not want to return error here, because it will abort probe, and then
> we will not be able to initiate firmware flash flow so we can attempt to
> recover the device.
> 
> If you want to try you can change the ts->iap_mode before trying to register
> input device, but then you need to be very careful about registering and
> unregistering it later, after flashing or re-flashing firmware.
> 
> > 
> > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > index d4ad24e..9c9816f 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -571,7 +571,7 @@ static int elants_i2c_initialize(struct elants_data
> *ts)
> >  	if (error)
> >  		ts->iap_mode = ELAN_IAP_RECOVERY;
> >  
> > -	return 0;
> > +	return error;
> >  }
> >  
> >  /*
> > --
> > 2.7.4
> > 
> 
> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Dmitry

