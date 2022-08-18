Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F35984D4
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245263AbiHRNwA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245274AbiHRNv7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:51:59 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102976170B
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:51:58 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h1so858437wmd.3
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ocSIe/Hc+XTgSXHZDkiYs7QLidjOXuCK4ZxjjAkveFM=;
        b=dp+9zSKI0wAYPMeTc3U17tVz/2ILW+SaesRPFaoCLVRMu+pjtrpi+16Dh27pMqnZmB
         rN4vKoxssikDG6xgpgrIoKImJg0hU14CXBPnbDRmNr7t9oFavyLuF9tLJ7EHkn4eWG4U
         Nihbj0OsGEJUTFFT/O/zYkR/pZ89UJX3ys5oPcB48qhFODnU2E2wmFDJjpsRg+1fj97Y
         TIzeM82uWv4e1u4TxQFaAR/tG3Nr7K87HCIdh9sSZI3NnDRAVjfnS5WJFpsv9q5MD4p8
         aLCo/mT2Q5h5OWkW50aEng+ijribn/jV27+nsscrZj/KiVxz//RkxeJMv02n7mLM9ASS
         ULdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ocSIe/Hc+XTgSXHZDkiYs7QLidjOXuCK4ZxjjAkveFM=;
        b=EX+ZxERZaQXpI5XfNcSZYteGWUn2jIFFX/+rkooLtThDma8+mk7+0L0RGkZv41dVcK
         UXKJLc9jW10hAtepkhzRVotHZlkEEh8+0W0TfYFbY4UEVM46qTfJFm+eyLIiZyvu9q+Y
         A7xIRXRLzv4hF2wmG1gMxmxEIQb7V5KN7lAxCYt+l2rGQaZRHCHwosb2QadNLH1CdS+l
         ebrWmDu5aVVzjL/N7BaNgjvgBBv/F8II6vI8v7Cj6gPcFJEhH8By7My1fkuBIMW4HXi6
         MVjiW2IAtPuK0VrPvrco4NMNbqliBJpucWeisItaCVZiqusVjEgjE1dOUS+iaszzV4ZD
         6bKg==
X-Gm-Message-State: ACgBeo0V2e1fiyJEejIYJrgnjAUwKYOhd4kvT9pg8gHhMOoc/ZUrzOU8
        Ij5jHEeBSsQHoqRiqBVDCzYU9p7UUWZHVQ==
X-Google-Smtp-Source: AA6agR7XG2a6fsfxXiQtj8u+FvKACaU7oCo4Yu4VCM8oWaKeY9PToZqPAtpJh+MVaFAu9C4ByWqF9Q==
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id f1-20020a7bc8c1000000b003a5bb57e7a9mr5219914wml.18.1660830716521;
        Thu, 18 Aug 2022 06:51:56 -0700 (PDT)
Received: from ?IPV6:2001:9e8:220d:e00:f78b:3e64:f8af:69ef? ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.googlemail.com with ESMTPSA id m9-20020adfe0c9000000b00225206dd595sm1515171wri.86.2022.08.18.06.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:51:56 -0700 (PDT)
Message-ID: <69d7663a-eaab-124b-4e68-83567c79c56f@gmail.com>
Date:   Thu, 18 Aug 2022 15:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 2/4] Input: xpad - fix wireless 360 controller breaking
 after suspend
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Cameron Gutman <aicommander@gmail.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-3-rojtberg@gmail.com> <Yv46XUD1/Kx9cGcy@kroah.com>
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Yv46XUD1/Kx9cGcy@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 18.08.22 um 15:10 schrieb Greg KH:
> On Thu, Aug 18, 2022 at 03:00:19PM +0200, Pavel Rojtberg wrote:
>> From: Cameron Gutman <aicommander@gmail.com>
>>
>> Suspending and resuming the system can sometimes cause the out
>> URB to get hung after a reset_resume. This causes LED setting
>> and force feedback to break on resume. To avoid this, just drop
>> the reset_resume callback so the USB core rebinds xpad to the
>> wireless pads on resume if a reset happened.
>>
>> A nice side effect of this change is the LED ring on wireless
>> controllers is now set correctly on system resume.
>>
>> Signed-off-by: Cameron Gutman <aicommander@gmail.com>
>> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
>> ---
>>  drivers/input/joystick/xpad.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> What commit id does this fix?  Should it go to stable kernels?
> 
> thanks,
> 
> greg k-h

this is a fixup for 4220f7db1e424f2a086ad41217b5770cc9f003a9.

It should be applied to stable kernels, too.

Greetings, Pavel
