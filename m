Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EADD579675
	for <lists+linux-input@lfdr.de>; Tue, 19 Jul 2022 11:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiGSJiS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jul 2022 05:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiGSJiS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jul 2022 05:38:18 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC0B193EF
        for <linux-input@vger.kernel.org>; Tue, 19 Jul 2022 02:38:17 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x91so18816882ede.1
        for <linux-input@vger.kernel.org>; Tue, 19 Jul 2022 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=fbZtg5dsNGpS0i8TOeLbttDF+CUihpOWE+NjHfFnVjE=;
        b=RCVI0AxiS5lAh6q9fs1MKkE67Y6v1eU7Mcj7lMIcSRvhajVTXbew6bCId9PlM+PZsw
         yFCtvycg+gmGI+3CGS3xYXtpLvBYH9i+VOjzV3V8LzKjN7AfUFj5bIJrZU+COh3oGNLF
         MXLOk2wGodHjYzwku53t4cXE8b3AniFR1K6s0fQ9qf/b+PROgc4vrZmXV05mHQNKWdvr
         JdIzQbqJp1noR+PAvZJz17mInmleN5L27bAMfnkJb/pOPoSML3V/dA0mK8sopaDACrBc
         WOQ+oqDpJP2+P7alGewpk9Ix83gBOTRTZov17Xend5679PzCx7t2LelUrpU3ZDcT3LuO
         m9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=fbZtg5dsNGpS0i8TOeLbttDF+CUihpOWE+NjHfFnVjE=;
        b=YMSmaihW+fjmbT+T+JxZczBKCbvtsNGQg842jAKLW94mffoDkc0X6ncxO8vWJ7abCJ
         awOYfFs4FoHmsFOtvggS5ZOUe+xHJ9S/1010lvzWE078OpwnrCZ9bMWgm9ut6YOfEndl
         idREL2X0Nqx6GQUKshCWIulFtx/pdVV4e7fklsgSUn4EFNm2Bb8XZk9/sLWkrsS0ZPmV
         IyzOmA7UjJM5TjffvP5ZH3ndyfm3DuERYes20eCPo6PWHZZi5kK/iOz9TExNtliC54OZ
         nosIqviutcQAcK6P8vFi2V0uiSnlh1iKyYoMeAl16HPMQhAZ+fXUcv5NdsRHuUBbMDWW
         O5Lg==
X-Gm-Message-State: AJIora+O5BmB4vfWEJJMCR+aOPhGt4Uj1GuVW9bq5DVAzpKgS5h5qk4x
        mHvYE7nr33ANsZIyQ8FdVRGPYYH/Tqg=
X-Google-Smtp-Source: AGRyM1szgLej+HBs2Pz/Z9Hq7PsFg6L1er9xN+EHgPdTcbQKxmuiCdnmydzUGkxvpA9WhYYEJRWHAQ==
X-Received: by 2002:a05:6402:34ce:b0:43a:a4bb:27a6 with SMTP id w14-20020a05640234ce00b0043aa4bb27a6mr42243859edc.158.1658223495682;
        Tue, 19 Jul 2022 02:38:15 -0700 (PDT)
Received: from ?IPV6:2a02:908:e944:95e0:6c56:74ab:9b8a:c988? ([2a02:908:e944:95e0:6c56:74ab:9b8a:c988])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7c1d9000000b0043a75f62155sm10207357edp.86.2022.07.19.02.38.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 02:38:15 -0700 (PDT)
Message-ID: <5d775fec-1c42-927b-affd-c9f7d3c602a8@gmail.com>
Date:   Tue, 19 Jul 2022 11:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To:     linux-input@vger.kernel.org
From:   Sebastian Arnhold <sebastian.arnhold387@gmail.com>
Subject: Stylus battery reported as having 1% charge even though fully charged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear developers,

when using GNOME 42.3 on Wayland on my ASUS ExpertBook B5 Flip, it 
reports my stylus battery to be stuck at 1% all the time, independent of 
its actual charging status. This is also independent from the stylus I 
use, as I've tried with two different ones.

The battery device registers as ELAN9008:00 04F3:2E12 in GNOME energy 
settings.

The GNOME developers helped me track the bug down to upower, as upower 
itself shows the charging status to be stuck at 1%. The upower 
developers then sent me here.

My kernel version is 5.18 on an x86_64 architecture on Fedora 36. My 
upower version is 0.99.19.

Observed behaviour: Kernel reports 1% after pen is switched on and 
touches the touchscreen for the first time. upower reports this to GNOME 
which then throws a "Battery low"-warning message.
Expected behaviour: Kernel reporting the correct charging percentage 
from the pen to upower, or 0% if charging status cannot be determined. 
The latter would be a workaround since 0% seems to be ignored by GNOME.

Can you help me to resolve this bug?

Thanks in advance!
Sebastian


Attachment 1 - Output of upower -d BEFORE pen switched on and touched 
screen:

Device: 
/org/freedesktop/UPower/devices/battery_hid_0018o04F3o2E12x0001_battery
   native-path:          hid-0018:04F3:2E12.0001-battery
   model:                ELAN9008:00 04F3:2E12
   power supply:         no
   updated:              Do 01 Jan 1970 01:00:00 CET (1658223097 seconds 
ago)
   has history:          yes
   has statistics:       yes
   keyboard
     present:             yes
     rechargeable:        yes
     state:               unknown
     warning-level:       none
     percentage:          0%
     icon-name:          'battery-missing-symbolic'


Attachment 2: Output of upower -d AFTER pen switched on and touched 
screen (resulting in "battery low" message in GNOME):

Device: 
/org/freedesktop/UPower/devices/battery_hid_0018o04F3o2E12x0001_battery
   native-path:          hid-0018:04F3:2E12.0001-battery
   model:                ELAN9008:00 04F3:2E12
   power supply:         no
   updated:              Di 19 Jul 2022 11:33:19 CEST (5 seconds ago)
   has history:          yes
   has statistics:       yes
   keyboard
     present:             yes
     rechargeable:        yes
     state:               discharging
     warning-level:       critical
     percentage:          1%
     icon-name:          'battery-caution-symbolic'


