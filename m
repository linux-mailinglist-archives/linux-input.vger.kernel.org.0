Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8294505112
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 14:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbiDRMak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 08:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240229AbiDRM3Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 08:29:25 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C466240AC
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 05:23:29 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id w4so18374954wrg.12
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nEsla70Mr9gbDl0xOJROe0Z+qCjIjuEe02IdrS4x8Fs=;
        b=ZjKbaI47uDjr3mdbZJFA8rm7cFZuW1PaEbrMaj2lZ97LH/EqqMz0z8OqSAwJHRcJgC
         rGWBn3Y4qtnMh1qPyDtJe91OFI3PK/xpNh890K8Jsx9W/JbkkXXpxMjmziBLEn34hDSZ
         WzJi25MEfQ+K1Osl1EPpIF3YoFKTeB9GlKX2a+cT6PyoZO2WFpbttDvHqGoi2MH5dYvC
         kk5R84oIJde/5IRARnsod17tA/mod+ZuTUxj17QgbjD7CpFzvGEqic3lCmiGxbPBZHeG
         Www3SrzwGT+nIqtp1aAhpQ0JWDEpyWmWqNOXDvdrIxMdGjKK4TuqV1UlhY30Uuy/DqDL
         /txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nEsla70Mr9gbDl0xOJROe0Z+qCjIjuEe02IdrS4x8Fs=;
        b=dXYGAirZFubvC3wUXWIK5zk6kTC98BFRmbDfBdA9V6+rtZS6DVdV7toEREECfaXzJr
         dke4gUJCmARuPwn5yl7iJR9pA+Yjx+YS7kTmOmNkTMdAgEhyc31yLceXJcbEjXpd+Wn0
         Els1WtlYnND73w1Mg4PCIyDa7ttcXCvw9hC6KRpZiKQwUZdyk5hJ0jglCVESWQhAwJom
         WgcmgfnqjHyo/fW4p96bqupZ3QheOQ5SsJUZ8Bbq++QjT36D2OGgkHACyG7PTejZPKjp
         AHoDuyAke46nmSDPJiiSp8Vz2nFsGuWVBMpPTfq0/n8i4hiCTspG8f7eYt+XjXbVSsbL
         tQJw==
X-Gm-Message-State: AOAM532o3Bx1Vh200IvkYN7SWixJs1mjw5Wvqjliwmf8W3gprhqPyce7
        6k+ZFYm03LiztsVxofQ8wFg=
X-Google-Smtp-Source: ABdhPJxZAyA3+oM+1sVhWnd9KTumOn42U6pOeIy0iR2B82U67dPMqOTz47q48PD+feV8rwX2xdhXSg==
X-Received: by 2002:a5d:6b11:0:b0:20a:a247:25f4 with SMTP id v17-20020a5d6b11000000b0020aa24725f4mr376541wrw.234.1650284607844;
        Mon, 18 Apr 2022 05:23:27 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2205:7500:31a3:8b23:14e3:7ccf? ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.googlemail.com with ESMTPSA id f8-20020a5d64c8000000b0020784359295sm13470356wri.54.2022.04.18.05.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:23:27 -0700 (PDT)
Message-ID: <aa3320eb-4ba7-e4c4-5ec9-f4ad3037ffaa@gmail.com>
Date:   Mon, 18 Apr 2022 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/3] Input: xpad - sync with github fork
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <20220418114022.23673-1-rojtberg@gmail.com>
 <Yl1ToPGOMqOR7Y3G@kroah.com>
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Yl1ToPGOMqOR7Y3G@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Am 18.04.22 um 14:03 schrieb Greg KH:
> On Mon, Apr 18, 2022 at 01:40:19PM +0200, Pavel Rojtberg wrote:
>> From: Pavel Rojtberg <rojtberg@gmail.com>
>>
>> This upstreams some changes contributed on github.
>> The first patch merely updates the list of supported devices.
>> Compared to github and v1, sorting of the lists is preserved.
>>
>> The remaining patches improve xbox360w gamepad support.
>> Those were verified by me, as I own that device.
>>
>> Cameron Gutman (1):
>>   Input: xpad - fix wireless 360 controller breaking after suspend
>>
>> Pavel Rojtberg (1):
>>   Input: xpad - add supported devices as contributed on github
>>
>> Santosh De Massari (1):
>>   Input: xpad - Poweroff XBOX360W on mode button long press
>>
>>  drivers/input/joystick/xpad.c | 33 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 32 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.25.1
>>
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/SubmittingPatches for what needs to be done
>   here to properly describe this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

should I spin a v3 to fix this?
Without knowing better, I put the changes to v1 into the cover letter.
Also, PATCH 3 was carried over unchanged.

Greetings, Pavel
