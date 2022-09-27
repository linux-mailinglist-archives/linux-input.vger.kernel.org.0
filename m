Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 278D35ECACF
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 19:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiI0R07 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 13:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiI0R05 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 13:26:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE247E99B0
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 10:26:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l14so22150003eja.7
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Jrce6jrVwSGuZ16KN/LJnm0s9TqcgyXCDkmOJSVzET4=;
        b=nR2VbweZolmUhDWj2iscdHYaaFq1/VPaKR2UQ/u1bzf+C8SP15ENNneTzVapROP8EK
         2RRUikmHi/rMXcuPyEoMhU1xxgyV5SW/iGEVL+u5r/CspNmafqblaNrJ1d1VzbYev+EP
         GCY8uVrYoOu7VwxT5I6Uer6V935WCKTn7Es4Qx7rPhUmyjF3SOXaEru8Ke1AqnEWwYnj
         egNqZcMCz6DCgGu43A87gtHZhDhC52LrD3M3kAjT690BoBb6BFq4Z31zdr7rEc0HP5q/
         ODM3vkYKwYxf+Jht88s0SkEeLM7W/JMC5y5ssD71plzuOLVHkZ9qa0vPJRf6psUXmgTM
         FAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Jrce6jrVwSGuZ16KN/LJnm0s9TqcgyXCDkmOJSVzET4=;
        b=yoHpuu4d0op0DWAqNnOIuBkoOVC4dTbhkj82JB3I4ulQvSHjRWGlvz20Bay03oUI8Y
         WXEibnp3M/JpDuYvRoOKa23tnc4mKila+VLmMDQuFz8vIh/rPsaTNsGyYvh5L2TZ4Xzw
         VywUbH5ekZP1dueh0uqjsn4I8dpAF0WMF0u5fKAmcK2F+b+V1Fe9UJDOTt+eS45KnpCs
         6KVrJbGLRF6w0Gpfsw+NALs2SYUIUN30iE8ofQkzJ2NQTZug4fgbJ6/jjoCkoZz6oPrt
         4reGPb8+HAaLdBckshofbpziextsaUylfwyhuBf+vHeSJsf7PfmFzpUfkoKOyPEP+Cim
         5SFQ==
X-Gm-Message-State: ACrzQf3ie709oUs6mlfPFKQTVDlRhdROQDbumohc1kuFDAu7eVQxdrQf
        vz1Qvp+v0FQH0Fi2rltolAodC0r7Qd8=
X-Google-Smtp-Source: AMsMyM6Q3jk9l+TMDprAiMW2RCitpYgIdCnDeZ17Jg9tFBSPXAWNZ2lzyRRTHzL8d1myYKHHTLvhVg==
X-Received: by 2002:a17:906:ee86:b0:741:89bc:27a1 with SMTP id wt6-20020a170906ee8600b0074189bc27a1mr24091284ejb.725.1664299615061;
        Tue, 27 Sep 2022 10:26:55 -0700 (PDT)
Received: from ?IPV6:2001:9e8:223b:3c00:c7f6:f1d4:b5a8:5368? ([2001:9e8:223b:3c00:c7f6:f1d4:b5a8:5368])
        by smtp.googlemail.com with ESMTPSA id c22-20020a056402159600b004573052bf5esm1636369edv.49.2022.09.27.10.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 10:26:54 -0700 (PDT)
Message-ID: <e2346958-6b7f-cd07-5bd9-3af4a813929b@gmail.com>
Date:   Tue, 27 Sep 2022 19:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/2] Input: xpad - reduce amount of magic numbers
Content-Language: en-US
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
References: <20220913213133.584979-1-rojtberg@gmail.com>
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <20220913213133.584979-1-rojtberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 13.09.22 um 23:31 schrieb Pavel Rojtberg:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This patchset slightly refactors the code of the xpad driver.
> These are only renames and no functional changes were made yet.
> 
> The first patch introduces the BIT() macro as promised in my last patchset.
> The second patch introduces GIP_* defines to make the xboxone packets readable.
> 
> Pavel Rojtberg (2):
>   Input: xpad - refactor using BIT() macro
>   Input: xpad - decipher xpadone packages with GIP defines
> 
>  drivers/input/joystick/xpad.c | 211 ++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 125 insertions(+), 86 deletions(-)
> 

merge/ rework/ never submit again?

Greetings, Pavel
