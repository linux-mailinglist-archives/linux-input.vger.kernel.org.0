Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D3B56C727
	for <lists+linux-input@lfdr.de>; Sat,  9 Jul 2022 06:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiGIE4F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jul 2022 00:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiGIEz4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jul 2022 00:55:56 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805508874B
        for <linux-input@vger.kernel.org>; Fri,  8 Jul 2022 21:55:47 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso3734303pjc.1
        for <linux-input@vger.kernel.org>; Fri, 08 Jul 2022 21:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E1etkggh1pGAP1EpxmAedcdQmE+stEvOs87dduPeLw0=;
        b=Eb+Zqe+xJ0j7inVCX5ZDvK7b8fR+iJhEM6+iGUbL9hxvtdv/1VfbQQVD6TSF24KbwN
         cFG8bs3d4o/nHH4HMFcGzXt6DuudgWFQfhtqWbzf8d+gCI/8L9GZ7pcJHMuczIAksngK
         ctxd7NoZanRO/NbxAyqIItFks56ka+HbIfb3xniKf2WkWr9csXOJE6/QmEiTEfGFUGgz
         FIxMf0hoRudTtfFwdTye8GbkQPCC1wVi7r2NlYl1jIT0lyEyZKVHneLJgzITMmJhQh0D
         gh3jd9MpqMT7rNWrPuzPJ9+atlsRLCtH83F9aNk4lbsosd4eoojiHOGhbb/npxC2eR7D
         B0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E1etkggh1pGAP1EpxmAedcdQmE+stEvOs87dduPeLw0=;
        b=LkQOQG1T+U8an6UEl0bR9xHrSyaoYlFAWFAqjk8eHBGZXrAKu2Uv4k41494/qbOxT0
         oowU6+yOyBhOiVPOIPWJSv8b03Yo+yLraIaC77QH4bOfgsF+C8y9srl31qxpi3lKru59
         3QV3opN0PMkNwkLhCiAyaigFeq0cCggk0Aa+pGyDCapyq/JgtltQC7uQ1/U/I0+3Z93i
         58vZnSrshZAVZGnPE4Yl4o9riIA3fSdjgiI0qJD4l7WwaajDVx4ILJMDHcb0XGAOEGS3
         voySctzWv0XEWvJZGGgrlgxb33VBgFuJ2EMi0s43v2NgQaOHBpU8ZjCOfPMeZX1cbGHg
         xYMg==
X-Gm-Message-State: AJIora9PE9qtfxEzXWw8AiyeQblW8NF2X9kqfoPGp6nx3x2OiKkdTshF
        eI3Gq3Gg7ZUWXg/nsPGxTeY=
X-Google-Smtp-Source: AGRyM1unLeF4EGOHLwbTK1jYXn+/L/vbFs+9Qs8HmEi0mF/E5DbXkU7frCm1oO49b4G6EQdFvZD3RA==
X-Received: by 2002:a17:902:7d96:b0:16c:2f71:7809 with SMTP id a22-20020a1709027d9600b0016c2f717809mr2416700plm.149.1657342546927;
        Fri, 08 Jul 2022 21:55:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5011:9ea9:1cc2:a4c0])
        by smtp.gmail.com with ESMTPSA id o21-20020a635d55000000b00415320bc31dsm299883pgm.32.2022.07.08.21.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 21:55:45 -0700 (PDT)
Date:   Fri, 8 Jul 2022 21:55:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH] Input: goodix - call acpi_device_fix_up_power() in some
 cases
Message-ID: <YskKT+swv3HgjZ4v@google.com>
References: <20220618210233.208027-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618210233.208027-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 18, 2022 at 11:02:33PM +0200, Hans de Goede wrote:
> On ACPI boards, when we cannot get the GPIOs to do a reset ourselves
> if necessary, call acpi_device_fix_up_power() to force the ACPI _PS0
> method to run.
> 
> On some devices without proper GPIO descriptions this will reset
> the touchscreen for us and this may be necessary for us to be able
> to communicate to the touchscreen at all.
> 
> Specifically on an Aya Neo Next this change will cause the _PS0()
> ACPI function to call INIT() which does:
> 
>             Method (INIT, 0, Serialized)
>             {
>                 TP_I = 0x00A50000
>                 TP_R = 0x00A50000
>                 Sleep (0x0A)
>                 TP_I = 0x00E50000
>                 Sleep (One)
>                 TP_R = 0x00E50000
>                 Sleep (0x06)
>                 TP_I = 0x00A50000
>                 Sleep (0x3C)
>                 TP_I = 0x00041800
>             }
> 
> On older kernels the ACPI core assumed a power-on was necessary by itself
> and would run _PS0 before our probe function runs, which can be seen from
> the GPIO pin ctrl registers in /sys/kernel/debug/gpio which match
> the above hex values with older kernels.
> 
> With newer kernels before this change the GPIO pin ctrl registers do not
> match, indicating INIT() has not run and probing the touchscreen fails.
> 
> This change makes Linux run _PS0() again fixing the touchscreen not working
> on the Aya Neo Next.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209061
> Reported-and-tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
