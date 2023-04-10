Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D8A6DC28A
	for <lists+linux-input@lfdr.de>; Mon, 10 Apr 2023 04:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDJCJJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 22:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDJCJI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 22:09:08 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9213F2D58
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 19:09:07 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso6073106pjm.3
        for <linux-input@vger.kernel.org>; Sun, 09 Apr 2023 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681092547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bA2mgCGY2/4a4N4VGTQ0T+MQPM6u+AXQOWFtOs5m9xQ=;
        b=UdKrLQvbaHEfIdCZXcnO4mXJUGm992JtJkJGmaYzhRAudXGhItFDbiDChllS5/5aCC
         jo6URIxcaoEwo+KKpf6TCG/pTjA7+ehI9XcQohpw26sLqtlXtpCJ4PS5P7We8x/m+8T/
         KcW2ruzDasS4a9QCsXnXg54mUdmNLmgD+WDGjbp5r6yLdZN9hfiThLQ1ZR5DGHpOTKog
         /cR+2nu/fhQoUV1cLvI0jIwt1S+CQGv+bydkVuNw1+kz1dn9K+zVQefWdI8GSlh6EL9r
         Ibbhb/NbiRfWJJAKD84GNRV31VTzI9V+Nlvuu0MvKePNPg1koA2M1MlgRNjsJ0iU6BAu
         kfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681092547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA2mgCGY2/4a4N4VGTQ0T+MQPM6u+AXQOWFtOs5m9xQ=;
        b=WrOAM4MElTQg5KnJU1xBLiFEZyEB+igmcV6nqf+w69+h1pOeRfndrIm3RY5cZz5SdZ
         uovFBz2ybv7ogMN+H6CwLRQzkEfyINAyxlnr6+eRnTJtls4msCxsFC2OhgxfwNOiHFmX
         YBl1gA2l/0KIMyrRSybWTX523eU622jlKBXiH91hTc/k0nG/iVLbwPi04cb3ZPbRgtIt
         dW4jdrBe9nT6Ps6i02upDmrgNRNnJjNZKSfFPzoSTCpAUhKxklykDE/BN2mZo3+sEOcU
         8VM0ReeqWMTjsLd4mFBevaukM4oMjR/CUMEdfKoggnswqA6l2N/skASjKVg29hMTh3M8
         k1Sw==
X-Gm-Message-State: AAQBX9cc7eynJpkr0DHIZZzrQkykY4zPXlULaomKP/Gew7ws2eDTnGkH
        I+4ZZpAKVZD0BHJzDsATqsU=
X-Google-Smtp-Source: AKy350aGRMPrwQwNPeizF7gbMKmIhKTMn9lCgR4bgWlXiDxKCZXVb3UMsur3qY7yALj+LmKll//y+w==
X-Received: by 2002:a05:6a20:6722:b0:d0:45c1:831 with SMTP id q34-20020a056a20672200b000d045c10831mr10782134pzh.60.1681092546697;
        Sun, 09 Apr 2023 19:09:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:803c:4683:913e:ce04])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0062de3e977bcsm6646408pfb.26.2023.04.09.19.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 19:09:05 -0700 (PDT)
Date:   Sun, 9 Apr 2023 19:09:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH 2/2] Input: xpad - fix PowerA EnWired Controller guide
 button
Message-ID: <ZDNvvtfhjcS4x8f4@google.com>
References: <20230330024752.2405603-1-vi@endrift.com>
 <20230330024752.2405603-3-vi@endrift.com>
 <ZCilF4RM5LY85aHP@google.com>
 <a02e0ba4-4ea7-40a0-1d33-8f87f2fe8f2f@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02e0ba4-4ea7-40a0-1d33-8f87f2fe8f2f@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 05, 2023 at 07:40:32PM -0700, Vicki Pfau wrote:
> 
> 
> On 4/1/23 14:41, Dmitry Torokhov wrote:
> > On Wed, Mar 29, 2023 at 07:47:52PM -0700, Vicki Pfau wrote:
> >> This commit explicitly disables the audio interface the same way the official
> >> driver does. This is needed for some controllers, such as the PowerA Enhanced
> >> Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.
> >>
> >> Signed-off-by: Vicki Pfau <vi@endrift.com>
> >> ---
> >>  drivers/input/joystick/xpad.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> >> index 698224e1948f..c31fc4e9b310 100644
> >> --- a/drivers/input/joystick/xpad.c
> >> +++ b/drivers/input/joystick/xpad.c
> >> @@ -1396,6 +1396,14 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
> >>  	unsigned long flags;
> >>  	int retval;
> >>  
> >> +	/* Explicitly disable the audio interface. This is needed for some
> >> +	 * controllers, such as the PowerA Enhanced Wired Controller
> >> +	 * for Series X|S (0x20d6:0x200e) to report the guide button */
> >> +	retval = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
> >> +	if (retval)
> >> +		dev_warn(&xpad->dev->dev,
> >> +			 "unable to disable audio interface: %d\n", retval);
> > 
> > I would prefer if we first validated that the interface is in fact
> > present. Can we do something like:
> > 
> > 	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
> > 		error = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
> > 		if (error)
> > 			...
> > 	}
> > 
> 
> Yup, that makes sense. Wasn't sure what the cleanest way to do that was, though I'm unconvinced that the first party driver would work without this interface. It can't hurt to add the check.
> 
> Should I resubmit both patches in the series, or just this one?

Both please.

Thanks.

-- 
Dmitry
