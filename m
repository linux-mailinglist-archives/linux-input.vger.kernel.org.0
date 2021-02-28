Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFCD327008
	for <lists+linux-input@lfdr.de>; Sun, 28 Feb 2021 03:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhB1CBz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Feb 2021 21:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhB1CBy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Feb 2021 21:01:54 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35825C06174A;
        Sat, 27 Feb 2021 18:01:13 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id r19so13038722otk.2;
        Sat, 27 Feb 2021 18:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WbDTDSD+pooalGRBxwzeThmXKAo3OdDPmk31/HmMBm8=;
        b=eLJN0XRVawJ3gNrF5EW/Ke80AitwOV9RSH+lzvWjyeGBZO1fyOIl5PeZb7lkpcW2nC
         EQUhZPjiFqa25cDVOD0OVcVL92NH7MK6W5lqJEhTr1ZZqcyJqki01mTVD3JK9Z44Gi74
         DwHNP3yWOnlhAIg5gEkyehY+z1hmqePG5jDwVB/0SIeb2aOFR7TLLOMijltKk796THN1
         7TfwO9lRhAug7QHk0D1/y8magsiIudpdi9jlTi8JPAQ84vfvEDRBdiE6TuFTzgKxVPoq
         616AAOMZxuPqKiAlpQGOVEDPVAsW/keBZZ7sRr+jyqad8CH2DzqD+m7UnDbSvb8s3r06
         MakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WbDTDSD+pooalGRBxwzeThmXKAo3OdDPmk31/HmMBm8=;
        b=Z0uBMAhAsWnGLRT5KrWrj93nPw2/RNIpyT7Wcn4AHAoIcmp/0I0TgpV82l+d5ZRctA
         ttsqXfG1DayqIQjgsgCNCUA17HGqm9soi1kF8gAsXWM0OLK3SqNiOrjzuJA+apEgODdT
         BuNIquNHVtAU72cMZWRZ4AwMTfsDDO0srTZfaDkBnhiPtWc60sEBnPWI7g0s8VRZ3c7i
         P90+47l2T73NKPplnuQOeDDW00nt1SvhVF2jtWfTBCHpWAondrIx0X7oKdMs0tt9hafP
         sxuhnH9BTQ5R1ZktbCkc2hgyQ76Oi6nSA7QIRy7G+T7oZyV6uB1eUCNzxtEMoa27eM7E
         ozfQ==
X-Gm-Message-State: AOAM530s47LvpShEnY2ojk7vOJkVwCfLIPdPn56spIYJZzPUlN81rnDt
        ElrrgsaQDAIP7EoaY5cLo9c=
X-Google-Smtp-Source: ABdhPJzDx64ZR3gE1M62LSYbuSVzAMJFuqDLegTJngVaRBBVxvsHGLqLNiHQiSMw4gQsfwhJW6IEsw==
X-Received: by 2002:a9d:5551:: with SMTP id h17mr8056105oti.15.1614477672388;
        Sat, 27 Feb 2021 18:01:12 -0800 (PST)
Received: from ?IPv6:2600:1700:4830:3f7f:181:222f:a61e:fa21? ([2600:1700:4830:3f7f:181:222f:a61e:fa21])
        by smtp.gmail.com with ESMTPSA id 69sm2803057otc.76.2021.02.27.18.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Feb 2021 18:01:11 -0800 (PST)
Subject: Re: [PATCH] [v2] Input: Add "Share" button to Microsoft Xbox One
 controller.
To:     Chris Ye <lzye@google.com>,
        =?UTF-8?Q?=c5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=c3=aate?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, kernel-team@android.com
References: <20210225053204.697951-1-lzye@google.com>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <78269a7f-f50b-d763-3511-0b3cf80fdbef@gmail.com>
Date:   Sat, 27 Feb 2021 20:01:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225053204.697951-1-lzye@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/24/21 11:32 PM, Chris Ye wrote:
> Add "Share" button input capability and input event mapping for
> Microsoft Xbox One controller.
> Fixed Microsoft Xbox One controller share button not working under USB
> connection.
> 
> Signed-off-by: Chris Ye <lzye@google.com>
> ---
>  drivers/input/joystick/xpad.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 9f0d07dcbf06..0c3374091aff 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -79,6 +79,7 @@
>  #define MAP_DPAD_TO_BUTTONS		(1 << 0)
>  #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
>  #define MAP_STICKS_TO_NULL		(1 << 2)
> +#define MAP_SHARE_BUTTON		(1 << 3)
>  #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
>  				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
>  
> @@ -130,6 +131,7 @@ static const struct xpad_device {
>  	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> +	{ 0x045e, 0x0b12, "Microsoft X-Box One X pad", MAP_SHARE_BUTTON, XTYPE_XBOXONE },

Let's use 'Xbox' for new entries instead of 'X-Box'. There was an effort to
standardize on 'Xbox' (which is what Microsoft uses), but changing device
names can impact userspace which may use these names in mapping heuristics
(SDL does this). We can at least not make the problem worse though.

>  	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
>  	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
>  	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
>  	/* menu/view buttons */
>  	input_report_key(dev, BTN_START,  data[4] & 0x04);
>  	input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> +	if (xpad->mapping & MAP_SHARE_BUTTON)
> +		input_report_key(dev, KEY_RECORD, data[22] & 0x01);
>  

I was worried adding a button to an existing supported gamepad like this
might cause a breaking change to SDL's gamepad mapping for this gamepad,
since SDL assigns each present button an index rather than using the keycodes
directly (adding a new one could change the old indices). Fortunately, SDL
always processes buttons in the BTN_GAMEPAD range first, so this new button
ends up at the end of the list anyway.


>  	/* buttons A,B,X,Y */
>  	input_report_key(dev, BTN_A,	data[4] & 0x10);
> @@ -1669,9 +1673,12 @@ static int xpad_init_input(struct usb_xpad *xpad)
>  
>  	/* set up model-specific ones */
>  	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W ||
> -	    xpad->xtype == XTYPE_XBOXONE) {
> +		xpad->xtype == XTYPE_XBOXONE) {
>  		for (i = 0; xpad360_btn[i] >= 0; i++)
>  			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
> +		if (xpad->mapping & MAP_SHARE_BUTTON) {
> +			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
> +		}

Style nit: Drop the uneeded {} here

>  	} else {
>  		for (i = 0; xpad_btn[i] >= 0; i++)
>  			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
>
LGTM, other than the minor changes suggested above.


Regards,
Cameron
