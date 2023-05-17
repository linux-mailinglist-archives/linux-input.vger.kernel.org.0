Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DA3706EF1
	for <lists+linux-input@lfdr.de>; Wed, 17 May 2023 19:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjEQRCX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 May 2023 13:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjEQRCW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 May 2023 13:02:22 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202869E
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 10:02:22 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64ac461af60so1064001b3a.3
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684342941; x=1686934941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvL9xeItG1keWTgiMnojZW9qAP5hT+RqTI7AhAb+pt8=;
        b=d2/Z0q4ovq7X8b7J7nt5nZF4UZEdSCeFVGZzAFaX3Lq37cYtcRwT2TLeVecl9s/1Bq
         80KrPPD3+i0hwoSBvaE5PQUBrtT9AyISTxLUvejoVOchUrKdwXXptDG67sn0sdEIH6PL
         Gtgeu7dVLyvyeWDZTrGdx5ughynwDa1k2Qmm5BTaP5u+YJIvlEP8N8vQxkJzXfjuLXEF
         A17f9hoNa6FegIwiKJsfTpYt4NZ22UBXLEQYnEbPStpLpHGNHEsO8ppDs9czyBHEo9Ye
         /Oc93JT8WLrhnXAJJ/fneZFliw1gsXMdpxlaGYMSoOYFU+0d8JB47rYJK+olJz1qZX2J
         WFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342941; x=1686934941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvL9xeItG1keWTgiMnojZW9qAP5hT+RqTI7AhAb+pt8=;
        b=C8/37/6OYhuCusU7pvGTokR++sdpQKaaEAHkvecRgdTdIlWsHwuHJCZs1QAnuemb32
         kYXa6YaFCb8v2otHtfZ9dHPBXpS5rjAV7v0bdHon2wtX4+XK21R7ATVLoL3ar1bSTvXI
         /Z0rbUpw4WENrmTKg7qYwk3P/5gmrF9GjN0PKcKftoIiVJFFpsILTbihLf/1UtTFrVhu
         D1xPHfG+3KVnTqVl1uQAOp1Ffq44hwh3FkXN1yVR/jada6kyzJBKl4C7xd904j+ZLtu2
         ItrZKP6wO4d/aWvCUR+9spCaEF0wDa7j9SSOOWxHal9WEC3mbrU7Yw/qx4+WXYbLXQ9P
         OcUw==
X-Gm-Message-State: AC+VfDwPTbOHYyJXbYfXvRpkbF/Mj699MBMosvd8HOz7vM72gvsyS+iR
        R67P6LwadrtuFWjOIeoEGd9XtwKMkIc=
X-Google-Smtp-Source: ACHHUZ7yqeYS0ZbpCBRWHj62+v5fupUqbMcuHWVaR6Gfn6UZQlP5riwNMUhmXDHOOP8rN022aMGj1A==
X-Received: by 2002:a05:6a00:2392:b0:645:1081:98ec with SMTP id f18-20020a056a00239200b00645108198ecmr384290pfc.13.1684342941224;
        Wed, 17 May 2023 10:02:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6ecb:b01b:2e2e:6c1])
        by smtp.gmail.com with ESMTPSA id k18-20020aa792d2000000b0064cca73d911sm2566005pfa.103.2023.05.17.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 10:02:20 -0700 (PDT)
Date:   Wed, 17 May 2023 10:02:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input: Switch i2c drivers back to use .probe()
Message-ID: <ZGUImQNUL9uNNHmO@google.com>
References: <20230517164645.162294-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517164645.162294-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Wed, May 17, 2023 at 06:46:45PM +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention. Other than that it's just s/probe_new/probe/.
> 
> I used v6.4-rc1 as base for it, there are a few patches in next that
> conflict slightly with it, but for me git can sort it all out.
> Feel free to just drop all conflicting hunks if it doesn't go so smooth
> for you, I'll care about the fallout later.

I think I saw only 1 clash in cyttsp5 driver, and I resolved it.
Hopefully I did not miss anything else.

This is now applied for the next merge window.

Thanks.

-- 
Dmitry
