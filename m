Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A1F1A3AD0
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 21:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDITvu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 15:51:50 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53187 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgDITvu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 15:51:50 -0400
Received: by mail-pj1-f66.google.com with SMTP id ng8so1735615pjb.2;
        Thu, 09 Apr 2020 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nQoGnx3wYDq4TbiXznqEUBBI4vR+wa8euXGO2wHK+o0=;
        b=tL1JajptWwr1VKOHFFNBy7BH6lAqpu93wUziJIaQJPOYBZ7h72tVhVfi9DCiUWmqQ5
         vEZqCdOhaMfYisVXDpw2iU19xbfft2KsYXAxlsIZEZkNWrn8X4Syn2CD6XCXx5PO38Ce
         i6yNSOa1W4FELVuahIUmicJW5vxhbtczPg+ddOnPRLhH7AWwXeSLNxuM5zG9NvxrE3q+
         oohJJtodzKxEaJT4NH61we5K8dMeiSHjw8XefQidiy+nZt6a2bqUKJkPTa6eQfONiZX/
         vham21ujGq+D7UqFJUOza1lwCFR7i5qHJMS4BiRJjo7fsbeBu777Ujo3wHsJGW5vYr2c
         4oPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nQoGnx3wYDq4TbiXznqEUBBI4vR+wa8euXGO2wHK+o0=;
        b=jPB4AlpVnFqS/tSZp4UwIPOL4ntzfNIW/2EDs1/3gT2AHAOHD3+NSTu2zthMgGLgmV
         AjPQq5mQ1ZDonpiHzlPsVg2aaAmOiKILDlPAQhmtNm//2P0tiqQ1JXVWyFRBijXc4V/G
         T0tv69qVXY+WtjnlJ1t7I1waam+lCtsOb/zHSnRhUWgLmAYlM3pUufFrZPLMc4t++ZVB
         gPP9hM+2SCGuFzrT2WeL1WpLNXTO8S9FF70GxND8CvjyXYuNV0qM5QXf+4t4eA3BrR1x
         bOExSnLOa4z/eSjcOY99orT2cK52J7bPqGumKbDOgFO8Qiu5nGQOSFXMU3/yum3BCaB3
         oNjQ==
X-Gm-Message-State: AGi0PuZ5WyexA8/lJDlg5beeh+7weyOduSr2f/A29hhdQChdeoF6iRmy
        02+2tMLPt9kyf5jWcMnT7gI=
X-Google-Smtp-Source: APiQypJVaKty1Dw6gK0PHwWCsMY/g3Fo6ElIq03K/tG+4KG+zcajLvzklUGboKnS1cj3EhavnTZ9mw==
X-Received: by 2002:a17:902:7488:: with SMTP id h8mr1151071pll.289.1586461907505;
        Thu, 09 Apr 2020 12:51:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id q8sm19980160pfg.19.2020.04.09.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 12:51:46 -0700 (PDT)
Date:   Thu, 9 Apr 2020 12:51:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Schonberger <robsc@google.com>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH v2] Input: elants_i2c - support palm detection
Message-ID: <20200409195144.GO75430@dtor-ws>
References: <1585551756-29066-1-git-send-email-johnny.chuang.emc@gmail.com>
 <20200330225317.GB169282@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330225317.GB169282@jelly>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 31, 2020 at 08:53:17AM +1000, Peter Hutterer wrote:
> On Mon, Mar 30, 2020 at 03:02:36PM +0800, Johnny Chuang wrote:
> > From: Johnny Chuang <johnny.chuang@emc.com.tw>
> > 
> > Elan define finger/palm detection on the least significant bit of byte 33.
> > The default value is 1 for all firmwares, which report as MT_TOOL_FINGER.
> > If firmware support palm detection, the bit will change to 0 and
> > report as MT_TOOL_PALM when firmware detecting palm.
> > 
> > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> 
> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> Cheers,
>    Peter
>    
> > ---
> > Changes in v2:
> > 	- Modify MT_TOOL_MAX to MT_TOOL_PALM
> > 
> >  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> > index 14c577c..93211fe 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -73,6 +73,7 @@
> >  #define FW_POS_STATE		1
> >  #define FW_POS_TOTAL		2
> >  #define FW_POS_XY		3
> > +#define FW_POS_TOOL_TYPE	33
> >  #define FW_POS_CHECKSUM		34
> >  #define FW_POS_WIDTH		35
> >  #define FW_POS_PRESSURE		45
> > @@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
> >  {
> >  	struct input_dev *input = ts->input;
> >  	unsigned int n_fingers;
> > +	unsigned int tool_type;
> >  	u16 finger_state;
> >  	int i;
> >  
> > @@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
> >  	dev_dbg(&ts->client->dev,
> >  		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
> >  
> > +	/* Note: all fingers have the same tool type */
> > +	if (buf[FW_POS_TOOL_TYPE] & 0x01)
> > +		tool_type = MT_TOOL_FINGER;
> > +	else
> > +		tool_type = MT_TOOL_PALM;

I changed this to

	tool_type = buf[FW_POS_TOOL_TYPE] & BIT(0) ?
			MT_TOOL_FINGER : MT_TOOL_PALM;

to be a bit more compact, and applied.

Thanks.

-- 
Dmitry
