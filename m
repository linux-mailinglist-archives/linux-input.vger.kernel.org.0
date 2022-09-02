Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D53B5AACB6
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 12:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbiIBKpr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 06:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbiIBKpq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 06:45:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F664599A
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 03:45:45 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e20so1744087wri.13
        for <linux-input@vger.kernel.org>; Fri, 02 Sep 2022 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=d+tzIwr+5ozDfubPv1VTyibMQFtNJExwnc7cUUpEjik=;
        b=qH3SJ1YVtNnHlOqcqME+quREt4AB8pKob4ZubQn/TnaLd34aRW9nJghVnIB3fQ0F8O
         scxt6hAnVSFjQSiTnE7VHY5c59O6rsHfHaJOLvyZGq3xIpeMP89q0fYSoV3PpqbYVwCs
         HODrNbZwKFojKvHVbOLBJRfWHnBPtJAAj/4g1mMtjLqkDbv1QONXXE/yhsIEbAqvAvm4
         RNqP2rdxOo7biwnpVcKIKL81zFjO5Y0zaxLm/ZAMrLpWgX2Rw4X4T5xgP/2Qsl3Hr4Fa
         tJxc8Hb1AsLe+8UhC+sGg1CtE3ShFE8MIVkpvTA7rayik0reegTlRyZxk+o8bavdVAEU
         Qg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d+tzIwr+5ozDfubPv1VTyibMQFtNJExwnc7cUUpEjik=;
        b=V7IVAGrUKj4X8qTvtIm0ioUKfoljnxGlIdOsUzPA1Rgr8nsTmHE5S0Tfmkci9zp/T1
         aVVIdCYomHFR7yPmKxtGQyUcIwVaMIntwkwQQLu0JtGtAklL3z+OPaKx28H2V1dQ8mfS
         T1VtckL5CW43p8o7QbO/pPCuLUnKZCRJC6FJv7vgRpuEMp4HsqZyLCSV76Cg/0ZlwQa5
         mASIM1WumPapjFGKX5QTfXidqpIfo+2utpp6cACqxCQZhaRHVBs/D+al/EF+62m4YenK
         k+Q3KFNQKCaizwPvWoBAYppEbkfngrLlxJ0VdeogppoQL5o4qNfBfVB7IXqtLjk0LP/+
         ZMHQ==
X-Gm-Message-State: ACgBeo2FovOpq5LQ2Z1K3Hyyghk6O2QVpvYnUjv1pf2nOYC1QwOQSL34
        7BSCS8p5+HwfsOwtceYJcSfm9/5f8Vg=
X-Google-Smtp-Source: AA6agR7KPVCIeWYyNujiyffhkrpP+TCeGzcAcPGpRJ+fzNRUsVK/KN3ztzScm1NaY2zlUf10VIrS0w==
X-Received: by 2002:a5d:64c4:0:b0:226:ed32:507d with SMTP id f4-20020a5d64c4000000b00226ed32507dmr6663237wri.714.1662115543747;
        Fri, 02 Sep 2022 03:45:43 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2200:9e00:806b:b7db:d7df:3c7? ([2001:9e8:2200:9e00:806b:b7db:d7df:3c7])
        by smtp.googlemail.com with ESMTPSA id bt24-20020a056000081800b0022377df817fsm1267236wrb.58.2022.09.02.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 03:45:43 -0700 (PDT)
Message-ID: <36032b16-4081-7b72-4ebf-569635ce257e@gmail.com>
Date:   Fri, 2 Sep 2022 12:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 0/4] Input: xpad - sync with github fork
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, hadess@hadess.net
References: <20220818154411.510308-1-rojtberg@gmail.com>
Content-Language: en-US
From:   Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <20220818154411.510308-1-rojtberg@gmail.com>
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

Am 18.08.22 um 17:44 schrieb Pavel Rojtberg:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> I maintain the fork of the xpad driver at https://github.com/paroj/xpad.
> This upstreams some changes that have proven to be stable.
> 
> The first patch merely updates the list of supported devices.
> 
> The next two patches improve xbox360w gamepad support.
> I have tested those myself, as I own that device.
> 
> The last patch carries most of the diff and adds support for
> "paddle" buttons found on some Xbox One controllers.
> 
> Compared to v1, this adds the requested tags to the first
> two patches of the series.
> 
> Cameron Gutman (1):
>   Input: xpad - fix wireless 360 controller breaking after suspend
> 
> Christopher Crockett (1):
>   Input: xpad - add support for XBOX One Elite paddles
> 
> Pavel Rojtberg (1):
>   Input: xpad - add supported devices as contributed on github
> 
> Santosh De Massari (1):
>   Input: xpad - Poweroff XBOX360W on mode button long press
> 
>  drivers/input/joystick/xpad.c | 298 +++++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 236 insertions(+), 62 deletions(-)
> 

Is there anything else to be done for this to get merged?

Greetings, Pavel
