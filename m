Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C9058A01B
	for <lists+linux-input@lfdr.de>; Thu,  4 Aug 2022 20:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239558AbiHDSAt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Aug 2022 14:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239561AbiHDSAn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Aug 2022 14:00:43 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A99481D5
        for <linux-input@vger.kernel.org>; Thu,  4 Aug 2022 11:00:42 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bv3so645484wrb.5
        for <linux-input@vger.kernel.org>; Thu, 04 Aug 2022 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CpqhdINzQFNnS+A6805TeNIGZuYyBUkbrJKYmVQI670=;
        b=VkcceU5CDUYPJWjq+QGE3iEBf5pBPKIFOr8V1QNU9yfC22t8Wp0CA48f2+4cN7JSej
         1elsCOKNActAgdoCHc9BalQP833aVUa00Os7c2cN9jozuNojKphsG/53NQokdQKyiTFM
         Cv1RVVBS3ftCc6DwP/OpVbx8h0k8wRRZIKo+//2goXtF+dST5bJVkdverDnfZWpQJmAV
         uTNCBfgfpTdSWpscOIEDsHXkotEQvb3oaOh2Mp/rl5wrFm+D9U+vHhBA4i8HUg/8cpqN
         EXEemWRipxulgJzvt0XXkuB17rfw86c++X5RSayLlKMEkhay2v9mXFocm96pb/yo3ryv
         sppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CpqhdINzQFNnS+A6805TeNIGZuYyBUkbrJKYmVQI670=;
        b=XqluvXFmw8yX2VZhNYZPZSFAXyAQmsy5sBqhVjxlHKUrnbA4rWGzo0/VSMv6Okh80D
         Xqv6rrcTTwhSJE1V0/o3bjHpSE30RmI+2dy7wJTJoamZe7YJeTC2fketKGJkoN41E2kC
         8mcpThlazjrpGWUxrfz5NlzWeCsZJeTcLu7AMdcykhOmyeBshT1VeI+x7JSIToktkUHt
         2OAvONP0UmB1I1KhyS1LsuwB9InLmqQnVb6ercxIzlx83WK5Spcfs340a+vNwZ/Rmgpi
         /G7ySimEUhuv/mQkKasSSLbJv10EFRISF+HxiKD6ULhsr292DrBXgkNZWdLbSRyJ1qvs
         dPxw==
X-Gm-Message-State: ACgBeo3i8aRVxpYeuoM9hKGHR5ALVcTim0Aa/itWQ7Y1jKvNWEA6pTcS
        Y/1Iss5vpxTxoVqBjlgRc4E=
X-Google-Smtp-Source: AA6agR7vMatKGp2C2HmcWYN/yse7HBstHgwgPPSY6fq2KM7/y/o/TqEe6t3DIDxgwclqWgiqRpthZA==
X-Received: by 2002:a05:6000:2c9:b0:220:5ffc:f159 with SMTP id o9-20020a05600002c900b002205ffcf159mr2178020wry.712.1659636040878;
        Thu, 04 Aug 2022 11:00:40 -0700 (PDT)
Received: from elementary ([94.73.33.57])
        by smtp.gmail.com with ESMTPSA id n4-20020a7bc5c4000000b003a3253b705dsm1958443wmk.35.2022.08.04.11.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 11:00:40 -0700 (PDT)
Date:   Thu, 4 Aug 2022 20:00:38 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Torge Matthies <openglfreak@googlemail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
Message-ID: <20220804180038.GA8906@elementary>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804151832.30373-1-openglfreak@googlemail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Torge,

Thanks for the patch.

On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
> Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
> styluses") broke input from my XP-Pen Star G640. This is because the
> "Digitizer" usage is not recognized as a valid usage for input devices.
> 
> This patch changes the IS_INPUT_APPLICATION macro so that the "Digitizer"
> (HID_DG_DIGITIZER) usage is recognized as an input device usage.
> 
> Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for styluses")
> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
> ---
> This patch could be risky, because any digitizer devices that were
> previously not treated as input devices are now used for input.
> Alternatively the linked commit could be reverted, but that would
> re-introduce the problem detailed in its commit message.
> 
>  include/linux/hid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I hesitated about this when I sent the patch you mentioned. In the end,
I didn't include any fix because the digitizer use was tested for 2
years in DIGImend, so I (wrongly) assumed that it was safe enough.

However, my initial thought was to add in uclogic_probe():

 	hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
+ 	hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;

Let's see if we can hear more opinions, but if you are worried about
affecting other drivers, that could be a good solution.

Best wishes,
Jose

> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 4363a63b9775..07803e144d98 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hdev)
>  /* We ignore a few input applications that are not widely used */
>  #define IS_INPUT_APPLICATION(a) \
>  		(((a >= HID_UP_GENDESK) && (a <= HID_GD_MULTIAXIS)) \
> -		|| ((a >= HID_DG_PEN) && (a <= HID_DG_WHITEBOARD)) \
> +		|| ((a >= HID_DG_DIGITIZER) && (a <= HID_DG_WHITEBOARD)) \
>  		|| (a == HID_GD_SYSTEM_CONTROL) || (a == HID_CP_CONSUMER_CONTROL) \
>  		|| (a == HID_GD_WIRELESS_RADIO_CTLS))
>  
> -- 
> 2.37.1
> 
