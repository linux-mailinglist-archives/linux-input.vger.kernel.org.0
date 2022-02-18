Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3094BC1BB
	for <lists+linux-input@lfdr.de>; Fri, 18 Feb 2022 22:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbiBRVRl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Feb 2022 16:17:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBRVRk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Feb 2022 16:17:40 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA571D6
        for <linux-input@vger.kernel.org>; Fri, 18 Feb 2022 13:17:23 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id e2so2697754ljq.12
        for <linux-input@vger.kernel.org>; Fri, 18 Feb 2022 13:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=k7ARL4DCbXIaVCltZLGL8mGK8yEKzeF9wFErbTIFmEY=;
        b=D67QgQyAhJzA2Oicq5PeezgTpUIQykqJlQvzT53vLWsqYxyhq0Vgt1E+YBgCc7NqfO
         d/v0Jfo0VO7/idRRAcHwJDG0A+703XX8XiLB9IAOZ/15VrQfJMS4vOeBYeJfkz4TkI6I
         CJlS+9pifd2ZP4wxaVnpvZo7mkdd5xau9WucwJeekQffHvQKQgl8FESDbEIyJCe54FdL
         3e+Qv4xTErfTO5+w1zv2k2ENgpWtHnj5Eh8ieG9OxjqKnCbQ0awbpgyp2xDMGsrVs+FJ
         uFRYlGspypHAbd4pg+iKzVGsa1t5Sgrqb13LnJ7W1TC03lbsTVh50dWaFplHqz2lAuTU
         BZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=k7ARL4DCbXIaVCltZLGL8mGK8yEKzeF9wFErbTIFmEY=;
        b=rpqTLk/J6p2mDJt1c1YkxndaiSN9TasnFd5MFJi02jwD5N1yRJ9YzjyDfH1pDQFy4v
         1NFZzueA3WP6BbkRTzB2R8cIBDrKEUanHb5LuMsSSc68jwK50mHCCWTwQJomPpY/2txT
         /8TMjrGvv4J7wq7dGnhRO56Vwbx9/y2z60Yt9TuhCqGj7cD1hvikKOY4/Et7sLZkorSq
         xfOmeVaP8mCaIUr82SSXy6ntz8o5zSyqzpvGwQqPmJCE92MzdKsGakt54PQioWCD5qpl
         zRtz++6mIsNCNFutUtoIqyKmckfK2w0j1pcNxoGpHLvZnYWDjCs7m7ugS3SbVj16rUUV
         J8mA==
X-Gm-Message-State: AOAM530D/JjSrJLzmFoOFhuJ6gqNKz+uigrzHWv8Owd+b2gz/e+QrMfA
        TMLfUG/anynwgQ2yg3osRSUUQevA4Xo=
X-Google-Smtp-Source: ABdhPJx68D1CqxSqAAUyhKwgXm6S/0QeAnvNeczVNBZimdUGQ3231n61noXhWijfmIcsGWUU3jAmBg==
X-Received: by 2002:a05:651c:170d:b0:244:df25:db27 with SMTP id be13-20020a05651c170d00b00244df25db27mr6758802ljb.310.1645219041346;
        Fri, 18 Feb 2022 13:17:21 -0800 (PST)
Received: from ?IPv6:2a02:2168:8737:3600:54d1:3e17:47b1:979d? ([2a02:2168:8737:3600:54d1:3e17:47b1:979d])
        by smtp.gmail.com with ESMTPSA id 16sm371789lfz.245.2022.02.18.13.17.20
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 13:17:20 -0800 (PST)
To:     linux-input@vger.kernel.org
From:   Andrey Butirsky <butirsky@gmail.com>
Subject: Lenovo Legion M600 wireless bluetooth mouse connected and paired yet
 not working
Message-ID: <9acf2313-1f4e-02ea-1328-1332d676dd8b@gmail.com>
Date:   Sat, 19 Feb 2022 00:17:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

the mouse works on Android, Windows(detected as "Bluetooth Low Energy 
GATT compliant HID device") without additional drivers.

On Linux, it works with USB cable and wireless RF-dongle modes, but not 
with Bluetooth mode (still it connects fine).

We did monitoring with btmon and apparently it gets an events, so the 
problem was considered on HID level.
See btmon logs and conversation here:
https://www.spinics.net/lists/linux-bluetooth/msg96904.html

I'm trying to understand if the mouse speaks some proprietary protocol 
and we need additional driver for it, or it's  just generic HID mouse 
and it doesn't work because of bug somewhere in Linux HID stack?

Could someone give me a clue?
Thanks.

