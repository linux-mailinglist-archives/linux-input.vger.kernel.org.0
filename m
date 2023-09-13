Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2003079F0A6
	for <lists+linux-input@lfdr.de>; Wed, 13 Sep 2023 19:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjIMRv1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Sep 2023 13:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjIMRv0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Sep 2023 13:51:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28A919B6
        for <linux-input@vger.kernel.org>; Wed, 13 Sep 2023 10:51:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-403012f27e3so633305e9.3
        for <linux-input@vger.kernel.org>; Wed, 13 Sep 2023 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694627480; x=1695232280; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyYx53FxfQAw89va0cpnMmgS15dAzd07q2KbIgbInrY=;
        b=Nls/83M6nVqSO7V/qs+xMAtqcqaWoPVKJ3385RWOkdkpibSXzm2rRBNI4BKI+FfBV1
         gHzSENaPL2eqzQHQPuo5+1FFuqu/B72lcnJpjpSgnTpVZ13bXtp4a/+KYYaiXLJXEatj
         QgDc+JD2PKkgB1RCR9jmF2CWHKFUk162trpQIyFq3diKV0UrOSRYdI4qBFNMpIzx+eF9
         2cmoC586s1wJIuWSeGwJQjai6HyUrppWdv8aBle0N7YmC2TQOoBU2Oq4N/bLLVMjFFR6
         e+GUpaDykwC4Cg7+cBy5kiibrEcTAT89cjua+Z8CzWJopsYqcXN1/x4OMRSkvmc7mBEg
         Zb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694627480; x=1695232280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyYx53FxfQAw89va0cpnMmgS15dAzd07q2KbIgbInrY=;
        b=kj3TKfVK5DZUX7/Z5QCEzjBOzPH7dY/V+c/oUPoJ7yfnoCwHvFuRA/578ub3wKErn7
         DWVY+043Cn5d0Lut+MzJzEvvoam/pZIRTNbhrErmMFF6LZrJGQBfMM3vFHbOw61zsY4e
         K6ZGJ8jxbeyQ4daH8lKAqCSSOv9Ocx/ZoxXxUZT5wEfhFqrWfNm1rmd4O19iSOLd94Rx
         KL1/zCMIsJkI/RjyM6uKqH36/fu4ssUfJlq8DSdJshE0+FGrdprLf709a7wXDQAoVr6E
         ucox4ONqfWXzI9J+CcW49tl+gk0fm3cGn2umivKON6Bcy/qzBM9SugWG326L8W3Qvcf9
         bpZQ==
X-Gm-Message-State: AOJu0Yxbu6CRUlkvgqlpf6PCiRNQjhJiPG23K/mxIy4mNI1H6FIzkX1X
        y5mf2pJVPc4y3MS2RBVFJtqa8w==
X-Google-Smtp-Source: AGHT+IELlc+r0cfJgPdnyPQO/pphf431jMg+zw/m3Zlk+KFfPLVGjzhiNVEt/6LVuguJr7V0DLLvQQ==
X-Received: by 2002:a1c:7703:0:b0:3ff:516b:5c65 with SMTP id t3-20020a1c7703000000b003ff516b5c65mr2883462wmi.30.1694627480327;
        Wed, 13 Sep 2023 10:51:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b00403038d7652sm2641434wmi.39.2023.09.13.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:51:20 -0700 (PDT)
Date:   Wed, 13 Sep 2023 20:38:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <ca55accf-5a7b-43f5-83e0-59c48d0a9389@kadam.mountain>
References: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
 <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 13, 2023 at 04:43:29PM +0200, Bastien Nocera wrote:
> Hey Dan,
> 
> On Thu, 2023-09-07 at 12:55 +0300, Dan Carpenter wrote:
> > The hid_hw_raw_request() function returns negative error codes or the
> > number bytes transferred.  If it returns negative error codes, then
> > the
> > problem is that when we check if "ret <
> > sizeof(arctis_1_battery_request)",
> > negative values are type promoted to high unsigned values and treated
> > as
> > success.  Add an explicit check for negatives to address this issue.
> 
> I would be grateful if you could either add the compiler's error
> message or explain in greater details the integer type promotion (or
> demotion from signed to unsigned in this case) in the commit message.
> 

This is a Smatch warning but you have to have built the cross function
database and I only know one other person who does that for sure...

drivers/hid/hid-steelseries.c:393 steelseries_headset_arctis_1_fetch_battery()
warn: error code type promoted to positive: 'ret'

I can add that and resend.

> > Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1
> > XBox")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> 
> > ---
> >  drivers/hid/hid-steelseries.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> > steelseries.c
> > index 43d2cf7153d7..485d2287d58a 100644
> > --- a/drivers/hid/hid-steelseries.c
> > +++ b/drivers/hid/hid-steelseries.c
> > @@ -390,7 +390,7 @@ static int
> > steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
> >         ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
> >                                  write_buf,
> > sizeof(arctis_1_battery_request),
> >                                  HID_OUTPUT_REPORT,
> > HID_REQ_SET_REPORT);
> > -       if (ret < sizeof(arctis_1_battery_request)) {
> > +       if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {
> 
> I prefer:
> -       if (ret < sizeof(arctis_1_battery_request)) {
> +       if (ret < (int) sizeof(arctis_1_battery_request)) {
> 
> although I'm not sure that's the kernel-style for this sort of checks.
> 

I grepped to see which format is more popular and it's 14 vs 13 in favor
of casting.  I prefer to avoid casts, but I can resend.

regards,
dan carpenter


