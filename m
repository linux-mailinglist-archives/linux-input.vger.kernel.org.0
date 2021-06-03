Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FF3399788
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 03:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFCBfC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 21:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhFCBfC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 21:35:02 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7C8C06174A
        for <linux-input@vger.kernel.org>; Wed,  2 Jun 2021 18:33:12 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v14so3835671pgi.6
        for <linux-input@vger.kernel.org>; Wed, 02 Jun 2021 18:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Mv1MKdHgiY68S1+Rgc9nlV0r+arHtDvGgasBu28uhuU=;
        b=tLlslm4ELdYYnhxBroqAF2UtNIWYy4oBX+jL2jGbKhpHKReiCyCe+RuCiCpR6lRq5g
         vqBuu91bvrUIV7n8f/EcEgBUdy7ZawOkRYpiginfiF1xfAbWUA0En31LHXlXjWiohwB4
         OL7teYI5YrguEM5phzZn4dTzxVbjHtWd6vvJp2IfMIKO+lEeSCpOS+koqm47sYuMesUn
         box4u/aL+Kf7/1+yolSOtNFvIayM5zXvnw8iORwg8upO/fOMs/lI2qh0vBgcFFRpm5sc
         OJDcgI7P28VDMNbtiY89eqDTgjteXqWkeV0bTNh2Kg9joNIEx3coARsMUhLjtN5qtvZw
         Wt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Mv1MKdHgiY68S1+Rgc9nlV0r+arHtDvGgasBu28uhuU=;
        b=U1L9nZS2BHtG5czihVXoGsYOyDc4r4ew5iRUzFNKB0ceU8d6WTkeQ196B+6L8GLlrG
         uxQlPKxgy6/BRII8amdkOQWLJnyMGenCRf3E8RKt1xUqFDi3WjntcjyINqF1+2rzyKyq
         WtzxkDMSPItO2tCI6Im9esHJG8AVsOnTfmNEJPDx2MqHcaegdIvnyzWG5KtgNItzPLkV
         3VlXksq0sTSLUKquFNHRNq5i21hSwQYuxrd85TXlYdwuCXViyBkuL1x5oVGfcT12pS4O
         1ILZ5Cvi5srAuijy4wvmVy6D6GoNTlVyejZuAKlvRCC4Zcdvkab7mWsdJoFbmyOVqNRa
         SbOQ==
X-Gm-Message-State: AOAM530MSBC2qRZtRxrSESDqun6Pq2hrUb+cWIsMkwO8pACNAbZVfEGq
        OrxU6EwoA9/b/hYhYfWAbsY=
X-Google-Smtp-Source: ABdhPJwzqXb/DJ/1IuzPwWcmxo2iQuW5IdV6L9XjEafRg/SRVEbsSozcBlwHlf5+HNPTxgDlqbSaDA==
X-Received: by 2002:a63:f341:: with SMTP id t1mr6391651pgj.260.1622683989838;
        Wed, 02 Jun 2021 18:33:09 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id n69sm656247pfd.132.2021.06.02.18.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 18:33:09 -0700 (PDT)
Date:   Wed, 2 Jun 2021 18:33:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gerecke, Jason" <Jason.Gerecke@wacom.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Yiyuan GUO <yguoaz@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Yiyuan GUO <yguoaz@cse.ust.hk>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: check input_dev->absinfo in
 wacom_bpt3_touch_msg
Message-ID: <YLgxUnP8cTi9J9eg@google.com>
References: <20210517093403.74276-1-yguoaz@cse.ust.hk>
 <nycvar.YFH.7.76.2105261250060.28378@cbobk.fhfr.pm>
 <VI1PR07MB58210C73FCD05B54826446E4ED239@VI1PR07MB5821.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR07MB58210C73FCD05B54826446E4ED239@VI1PR07MB5821.eurprd07.prod.outlook.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 02:19:37PM +0000, Gerecke, Jason wrote:
> From: Jiri Kosina <jikos@kernel.org>
> >  
> > On Mon, 17 May 2021, Yiyuan GUO wrote:
> > 
> > > The function wacom_bpt3_touch_msg calls input_abs_get_res(input,
> > > ABS_MT_POSITION_X) to obtain x_res, which may equal to 0 if
> > > input->absinfo is NULL. Since x_res is used as a divisor, this
> > > may lead to divide by zero problem.
> > >
> > > Signed-off-by: Yiyuan GUO <yguoaz@cse.ust.hk>
> > > ---
> > >  drivers/hid/wacom_wac.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > > index 81d7d12bc..a5a6fb8bc 100644
> > > --- a/drivers/hid/wacom_wac.c
> > > +++ b/drivers/hid/wacom_wac.c
> > > @@ -2892,7 +2892,7 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
> > >       bool touch = data[1] & 0x80;
> > >       int slot = input_mt_get_slot_by_key(input, data[0]);
> > >
> > > -     if (slot < 0)
> > > +     if (slot < 0 || !input->absinfo)
> > >               return;
> > >
> > >       touch = touch && report_touch_events(wacom);
> > 
> > CCing Wacom driver maintainers in order to get their ack.
> > 
> > --
> > Jiri Kosina
> > SUSE Labs
> 
> A NULL input->absinfo is very much an unexpected condition. We've
> either failed somewhere during setup or things have gone off the rails
> afterwards. Silently limping along like this is a bad idea. I'd really
> like to see an error message logged and the device removed if
> possible.

Input core (input_register_device) will refuse registering an input
device claiming to be absolute (EV_ABS present in dev->absbit) but not
having dev->absinfo allocated, so this is not going to happen in real
life.

Thanks.

-- 
Dmitry
