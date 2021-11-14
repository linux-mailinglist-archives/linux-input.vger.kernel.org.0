Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A28944F5DB
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 02:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhKNBL2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 20:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhKNBL1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 20:11:27 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6561DC061714
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:08:34 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t19so26297986oij.1
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2p0shO82wBUqqd0QCpAqVaVdpDlqKxREibLZsjDUsnA=;
        b=Pzp3YOf2fH7cWMj90R/xWLYfNcHfNOiNTHyu+odv48LtIxxna8W/FFO1jbjGol/czy
         /oJAgVw70SM/0afVSpNpxJPBTCM3WXPvHB5j9fcUnh3SDRCqlKEfz8aK2Kf0v2qurGEJ
         mFFliD6NfsqHTqDXef7tM3GOubElYfv8P8FTI/1z8e0/ofb08I+UFlAZTR6T+qX5YzRG
         iTgQdCj0AyOLSMFig2WWFL2qRFj1RFfAnnXj+gxy/dbSerOa1BumAVTGWxn3CGSZP1/Y
         k1Y4FqevFFOa0JwgyKYXPUggO3agUcSEmOT7uy3gwr/CfA8UmCr/wXCy2/X9gMsqEM2w
         lEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2p0shO82wBUqqd0QCpAqVaVdpDlqKxREibLZsjDUsnA=;
        b=aKxxS+fCZ7Q9+i0M/zhfgoevbm+aqB51jcgzKHiCrRgcWu3udvMcQzh49A0FEGPW6L
         aHaONPiTtsoJoUnrmYShFlT2c2busPQ4pwwc9ts+gntVDcqSwaVJaKuTd4ptzZzMA2rE
         PPLjRvz0bGfzgoIUafnp9127b9pIHNpdL9bIK5xIuVUo8UNoOEU/ucTrtdHAFOWlQuwy
         8Q0G8LcyAwPtP8ZnxKuMHCOAvg0X81x0Vg2MhKFDKVBd0eVhm4UglnzmKy415JDyecaf
         YTwUQYAQy6DMefBc5J/Am2bdqWRFyi6BXfqcIkRe4zYSVbPrOl+e2EjM4qevBzWT9N/l
         TtZg==
X-Gm-Message-State: AOAM5335KWv8WRkUduJvZkHACLyyarsyVXUIoUrQc1QtB8zzzN21g4Cu
        2PN4P32KbpwI4Mi1SyfmLZZ/cu9PfWlAA5qk
X-Google-Smtp-Source: ABdhPJwZahTUiOAT+26fNmweOJvMg9EXs39OBHXnmET7MdWKFSHtZaRVZwlDVyrfaC/HUm90KJeEhA==
X-Received: by 2002:aca:1708:: with SMTP id j8mr22156164oii.62.1636852113262;
        Sat, 13 Nov 2021 17:08:33 -0800 (PST)
Received: from ?IPV6:2600:1700:4830:3f7f:7aac:34da:1863:159e? ([2600:1700:4830:3f7f:7aac:34da:1863:159e])
        by smtp.gmail.com with ESMTPSA id a13sm2319808oiy.9.2021.11.13.17.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Nov 2021 17:08:32 -0800 (PST)
Message-ID: <e484c98a-e16a-acd0-45b8-3ea098f97517@gmail.com>
Date:   Sat, 13 Nov 2021 19:08:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Input: xpad - add OneXPlayer Gamepad
Content-Language: en-US
To:     Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Ruineka <ruinairas1992@gmail.com>, Lee Jones <lee.jones@linaro.org>
References: <20211113122706.4b5ba2b9@rechenknecht2k11>
From:   Cameron Gutman <aicommander@gmail.com>
In-Reply-To: <20211113122706.4b5ba2b9@rechenknecht2k11>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/13/21 05:27, Benjamin Valentin wrote:
> This is needed to get the gamepad on the OneXPlayer handheld console to work.
> 
> See https://github.com/paroj/xpad/issues/176
> 
> Signed-off-by: Ruineka <ruinairas1992@gmail.com>
> Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 4c914f75a902..e51f3a2bf06b 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -334,6 +334,7 @@ static const struct xpad_device {
>  	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>  	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
> +	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
>  	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>  	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
> @@ -450,6 +451,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
>  	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
>  	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
> +	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
> 


LGTM.

Reviewed-by: Cameron Gutman <aicommander@gmail.com>
