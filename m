Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402B362A31A
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 21:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiKOUi6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 15:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbiKOUhr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 15:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FE8B7
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668544609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MnCwkJuBrbQi4jFAnLoKxJdQqDQ2wVkd4vbCMgrgnTI=;
        b=BmP1ltITOKetIrN1rQuIyJqHBREc31zFmqPWp3Lfih4TLKIX7tv58t0Zy5LSvXhzC2zlGq
        3WL0Z/Z8wwSxRrrmvLud9DJfOjBEfO9elleWeRbASFXzT4HH43kLLjq5wntwjPEokn3YF6
        iVMIhgjJM37oxI8qzjmzeXvDC7p22AM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-N2UCvzqDPgqjflw4VwTzQA-1; Tue, 15 Nov 2022 15:36:48 -0500
X-MC-Unique: N2UCvzqDPgqjflw4VwTzQA-1
Received: by mail-ej1-f71.google.com with SMTP id qf25-20020a1709077f1900b0078c02a23da3so7980345ejc.0
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 12:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnCwkJuBrbQi4jFAnLoKxJdQqDQ2wVkd4vbCMgrgnTI=;
        b=KO6neh6qikdr4HQl1TmVLzvd9b521tGQjEYdmb6UJA+E0mAE0EeE+lae2bKXWTNByl
         KZmS+QR+C8IAZ9IT1esiNwL15BuXot5ZaMatNVI0OsshlMLBzYMiz67QZXHSZ7Vf30WI
         ejU5Tq0GfzktEKqZmz9FpqJGq8lfEybbhGyGe+lYTfpokNhopbXwAa0uby/DEih3SoSG
         30BFgDa2apAzZnjgmQ3k2JMFiUoz1dwawsJvCkuZipsH7CUxk6TllSEKsB3XgFgZqfR4
         k5nuHe91K6v+3dfcQBv2ba0q+0B+lbhPSUfXFmgEfZlElR38XfplDUGWAvAkujGhw3SG
         ab9Q==
X-Gm-Message-State: ANoB5pkXF0QZtxPa3GP/fBsc3HNNzKDoovnGi/MiarMhmlsV8lhpbye4
        UT4iGdsi+2jUDAbYEmawe1EiTZGmhJm6pns3JwcnPX/mPLgpcr6RXBLb+FklgLGzWN81Dv8ARKY
        J6etbI+rP2moGfR3i0yaIyho=
X-Received: by 2002:a05:6402:378c:b0:463:ab06:f338 with SMTP id et12-20020a056402378c00b00463ab06f338mr16529267edb.371.1668544607120;
        Tue, 15 Nov 2022 12:36:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Pp8BVmKktgBH1+0vE/L+7q8G0Q9+JLckU7Dj4vlKkOtDNKwnZoysRUMitXJunf1kp928WJA==
X-Received: by 2002:a05:6402:378c:b0:463:ab06:f338 with SMTP id et12-20020a056402378c00b00463ab06f338mr16529249edb.371.1668544606872;
        Tue, 15 Nov 2022 12:36:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b007ad96726c42sm3434659ejf.91.2022.11.15.12.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 12:36:46 -0800 (PST)
Message-ID: <d1532665-25f4-9d32-b276-c23077b34cbd@redhat.com>
Date:   Tue, 15 Nov 2022 21:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 4/7] platform/x86: ideapad-laptop: Add new _CFG bit
 numbers for future use
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-5-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029120311.11152-5-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/29/22 14:03, Eray Orçunus wrote:
> Later IdeaPads report various things in last 8 bits of _CFG, at least
> 5 of them represent supported on-screen-displays. Add those bit numbers
> to the enum, and use CFG_OSD_ as prefix of their names. Also expose
> the values of these bits to debugfs, since they can be useful.
> 
> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/ideapad-laptop.c | 33 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 0ef40b88b240..f3d4f2beda07 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -46,10 +46,22 @@ static const char *const ideapad_wmi_fnesc_events[] = {
>  #endif
>  
>  enum {
> -	CFG_CAP_BT_BIT   = 16,
> -	CFG_CAP_3G_BIT   = 17,
> -	CFG_CAP_WIFI_BIT = 18,
> -	CFG_CAP_CAM_BIT  = 19,
> +	CFG_CAP_BT_BIT       = 16,
> +	CFG_CAP_3G_BIT       = 17,
> +	CFG_CAP_WIFI_BIT     = 18,
> +	CFG_CAP_CAM_BIT      = 19,
> +
> +	/*
> +	 * These are OnScreenDisplay support bits that can be useful to determine
> +	 * whether a hotkey exists/should show OSD. But they aren't particularly
> +	 * meaningful since they were introduced later, i.e. 2010 IdeaPads
> +	 * don't have these, but they still have had OSD for hotkeys.
> +	 */
> +	CFG_OSD_NUMLK_BIT    = 27,
> +	CFG_OSD_CAPSLK_BIT   = 28,
> +	CFG_OSD_MICMUTE_BIT  = 29,
> +	CFG_OSD_TOUCHPAD_BIT = 30,
> +	CFG_OSD_CAM_BIT      = 31,
>  };
>  
>  enum {
> @@ -368,6 +380,19 @@ static int debugfs_cfg_show(struct seq_file *s, void *data)
>  		seq_puts(s, " camera");
>  	seq_puts(s, "\n");
>  
> +	seq_puts(s, "OSD support:");
> +	if (test_bit(CFG_OSD_NUMLK_BIT, &priv->cfg))
> +		seq_puts(s, " num-lock");
> +	if (test_bit(CFG_OSD_CAPSLK_BIT, &priv->cfg))
> +		seq_puts(s, " caps-lock");
> +	if (test_bit(CFG_OSD_MICMUTE_BIT, &priv->cfg))
> +		seq_puts(s, " mic-mute");
> +	if (test_bit(CFG_OSD_TOUCHPAD_BIT, &priv->cfg))
> +		seq_puts(s, " touchpad");
> +	if (test_bit(CFG_OSD_CAM_BIT, &priv->cfg))
> +		seq_puts(s, " camera");
> +	seq_puts(s, "\n");
> +
>  	seq_puts(s, "Graphics: ");
>  	switch (priv->cfg & 0x700) {
>  	case 0x100:

