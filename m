Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B406AF731
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 22:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjCGVGP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 16:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjCGVGO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 16:06:14 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197369E65D
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 13:06:13 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id f11so13465300wrv.8
        for <linux-input@vger.kernel.org>; Tue, 07 Mar 2023 13:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678223171;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1K0vga58c1USLwbdVplhu6z0JTjvuHE/w/Jo7hueZ7Y=;
        b=aA3cBOjQgEumRcZZOFNln4HXVziFwCoIPRDzUG+KCVGiPFqA8Pdis6nv8v20NNR7vi
         RE4USri6bzvO/EmEXrajRExextJnsISkRiL5fTy95ONZdoBWKe6YkClc9BS6cmB2gG/+
         +QbXC1KM8NqoxZ6zMWbIFJWYNA3ezRFzgTFEhP76xxP3KBO2rOgEZfsHzmTeEJ+pZ1Ol
         RjQiIeM7uMwrju1fTGfKlifP6MCORHdCPaAZaBDjTtLkKbD68HyoOge9VYNNE2nIm7Mi
         xrtaV0FYrwu+EBm+iBIQlW1xBZaKnRA3ZUW6POgMkEo7Spyv2Gg1K8cpS/rDeU4+kFRF
         lTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678223171;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1K0vga58c1USLwbdVplhu6z0JTjvuHE/w/Jo7hueZ7Y=;
        b=B+yT8hjTnpExIhkO3tKuonOvq9X8jdgeKsI5PskpVeABlUVjPBdN/wbOT859Rdir0e
         0ganIvybGKMX1f7x539g6lrvpI3INMzZrlTlNLJrisQVD5i2as1w13hSAXTUlxYT7B2J
         jX56Hr1KQjuSg2hK/4QE/+ASx/zBZBj9L/eI0Aa5jofRTMW06n6ydEZwUKgNs0kKh0io
         asKzbabcHgAV4Ppse3czjf4Sr7DQRTBvHoGjOmPlwTERfdiS9aCGI4R5PfslaZYcjU+l
         +cJ5CZBtzpQQ5Jbbl+Q7cJMWYbEyC1yEJx06bvwltMIhqxzW70fCTsGzi9h4pR4BQcuj
         A9jA==
X-Gm-Message-State: AO0yUKXxwqjWfHuiu/hvOk2DFqJeC9dWRGiXEz6x205W60JpGSSJtV/0
        YaCX0Rl3XX/9nX/HO5okB6A=
X-Google-Smtp-Source: AK7set+Yjh8iQpUfZ/aFBmEi7z1/2nqb7Cml1xh8unYwVmBGuVwxeMkoMshkQolUgCqO1CZ+2N9h+Q==
X-Received: by 2002:a05:6000:18c:b0:2c7:57e:633e with SMTP id p12-20020a056000018c00b002c7057e633emr9585715wrx.49.1678223171446;
        Tue, 07 Mar 2023 13:06:11 -0800 (PST)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id x17-20020adfdcd1000000b002c5804b6afasm13623449wrm.67.2023.03.07.13.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:06:10 -0800 (PST)
Date:   Tue, 07 Mar 2023 22:06:09 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, Roderick.Colenbrander@sony.com
Subject: Re: [PATCH v0 0/2] HID: nintendo: avoid BT rumble disconnections
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20230203215119.435091-1-djogorchock@gmail.com>
In-Reply-To: <20230203215119.435091-1-djogorchock@gmail.com>
Message-Id: <3VJ2KAML5UDUJ.2OKO60V9T01E3@homearch.localdomain>
User-Agent: mblaze/1.2-17-g916c852 (2022-12-31)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> The hid-nintendo driver has been plagued by an issue where rumble
> command traffic to bluetooth-connected controllers can cause frequent
> power downs of the controllers.
> 
> [...] 
> 
> My suspicion is that the core issue is somewhere in the bluez stack. My
> next step is to investigate that lead in more detail. This patchset at
> least allows for use of the controllers via bluetooth with rumble
> enabled without frequently disconnecting.
> 
> Daniel J. Ogorchock (2):
>   HID: nintendo: prevent rumble queue overruns
>   HID: nintendo: fix rumble rate limiter
> 
>  drivers/hid/hid-nintendo.c | 95 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 86 insertions(+), 9 deletions(-)

I haven't tested this but the code looks good to me.

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>
