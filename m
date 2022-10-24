Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2214060B93F
	for <lists+linux-input@lfdr.de>; Mon, 24 Oct 2022 22:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbiJXUGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Oct 2022 16:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbiJXUGO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Oct 2022 16:06:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD1D297F25
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 11:26:34 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g16so4234083pfr.12
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4oIVzfpMgaAT0HX4FWTthc6xrrun7ylc9/g6rsWhf08=;
        b=1O1ZHqYiBlXY2fwJNdkh+vQ/VNUVsNL1SE/FLAfOhoxD5MPiaq4El7Qm3wHo+8cgb3
         gl9aeVRIggYlqbyizkSb3bBtxGG+NDi5jQPFLC5t5vcs2zVF6v3XXS2LwIAxKpdiwggC
         n0PBC2uHZpCn05uEfUStTvJ1YOjR10a1WhlYwJ1EMZXodMLzQ2LjYg7xigqwXSPkiO03
         194iUFBYOfLlARIf+xoEZo/W0V34QwVqxfhOTk30UjgjuOg0gjGBGTFOiN2O2yCX/CJd
         B7mqvd4VripHn5nnSvfz8dNOkV/MSTcHE9+6t9xVPrjJY5DORvB26GRhxou4kxGlK326
         FM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oIVzfpMgaAT0HX4FWTthc6xrrun7ylc9/g6rsWhf08=;
        b=fuQfUVkW9LXtJhwprgvr85XWVWrlCjpVZvG3V6wjw0UsTWSxoTFVEg+XOBmvwHH58T
         4lDPcNxzVlCffMxEfA1zGfna97a+o0KhSLfKDGcUpYeQ80OilmYnj8wnKnECQvDVBUQu
         4TrcN/83xJn78QqRR42HfjYLwcBZ+CFfIH12rJqfvz4tmnv3SXU+TWzuYISLNTHUpxj4
         ZH1SVJw4H3rFkO9eCowwBYAZIkgyzapnF8Y2UcCozl1upTyhIqWK5OlN9sjS7YpuRlXD
         +bgoEpBaLJG1nMY6Vbccp1/AJNBTdm60M4zTS1B9LyHeF9iD3X8YbtHB3/aUFbN/ihZr
         uaQQ==
X-Gm-Message-State: ACrzQf27Ni/EdnxN+My3O43FKB+xDuo0+PbPf1pVnyrVO1f4LPuWd4yA
        OIBQIuFjGmaQRCpavTLkjSdIjw==
X-Google-Smtp-Source: AMsMyM5NJO1kEdsQTHB/8tQPhUzIwVroAro5GyKcBeo3+9Tpkq+lfovTaDaocHC24z3Nm955Wr4NWg==
X-Received: by 2002:aa7:81cc:0:b0:563:4e53:c08b with SMTP id c12-20020aa781cc000000b005634e53c08bmr34743652pfn.19.1666635958991;
        Mon, 24 Oct 2022 11:25:58 -0700 (PDT)
Received: from localhost ([75.172.140.17])
        by smtp.gmail.com with ESMTPSA id z11-20020a170903018b00b00177f4ef7970sm72911plg.11.2022.10.24.11.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:25:58 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Arnd Bergmann <arnd@kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-media@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/14] ARM: remove unused davinci board & drivers
In-Reply-To: <20221019152947.3857217-1-arnd@kernel.org>
References: <20221019152947.3857217-1-arnd@kernel.org>
Date:   Mon, 24 Oct 2022 11:25:57 -0700
Message-ID: <7h7d0phydm.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As part of removing all board files that were previously marked as unused,
> I looked through the davinci platform and recursively removed everything
> that has now become unused.
>
> In particular, this is for all dm3xx support, in addition to the dm64xx
> support removed previously. The remaining support is now for da8xx using
> devicetree only, which means a lot of the da8xx specific device support
> can also go away.

Acked-by: Kevin Hilman <khilman@baylibre.com>

Kevin
