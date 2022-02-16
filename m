Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD994B8DEA
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 17:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiBPQ0C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 11:26:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236286AbiBPQ0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 11:26:01 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96552860DD
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 08:25:48 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id o24so4378502wro.3
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edjWIVwhuFt91Pw8VH5r8zVVg9dmeIMhzSsEafLiRtA=;
        b=Bz+Qqu4IXSx730AZVKjQ+tSbjx3K065dVk42DzZStFsMJeVzGf5QOHzZJF82rFTCem
         TMjDINnIfN0nvwsGdW6tdDoeBadcySeK1ISjNOOk3n8IPOfYtjjwxEEjUfUFXx0lYy6E
         AlZxswqxDiRH5x67iSgn5C3rpxvGjboRdkcw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edjWIVwhuFt91Pw8VH5r8zVVg9dmeIMhzSsEafLiRtA=;
        b=0NS7ERnaMPahSWIrBeoRBmmNFscERiYoL9vlUYJwskJBs4oasxOffY0PGKGcsKK2BC
         2eXAJiOulyn8BQx41jEZog1nJAE1t18EN6o/9EpvizkxY2TiV8lwkTfklr83Lulwzh6O
         knXQzwBP+Ff11iX66EWbWiUjUfob6qYth8Ga7MRmWy4LCwuO3/xhNXCbq3BN/cImLNOC
         HmmsxidQDRYEA316ArwQiPT2DfNH1lD5Rzi25KlNFw7+vOw7qJsk8ysra2GMBXwp3jGj
         ZQolpri3SwPvEqql2tBDEhP1pROBGY/9iK58Kom7UW/D1UnlUxm2daHJt513sgfu+eX5
         JuLg==
X-Gm-Message-State: AOAM53311lzilPVuAuU0sc49+hZEeEJDD+g3INH13HoY1Rotn/+uUvr2
        oc6x6do7Io6ECyDjEjhbWxqHumMLkocz95yIi8VaVw==
X-Google-Smtp-Source: ABdhPJwIrmtqvQuYmhkiDOdoG0D0y+HSySX6VjTkn4+bYwYMgK5SG17ByKMMb8hoVS8664AKZTnZv55Ov4u3W8BRiK8=
X-Received: by 2002:adf:ce8f:0:b0:1e4:bcd3:3aa6 with SMTP id
 r15-20020adfce8f000000b001e4bcd33aa6mr2752349wrn.561.1645028747340; Wed, 16
 Feb 2022 08:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20220211012510.1198155-1-swboyd@chromium.org> <20220211012510.1198155-2-swboyd@chromium.org>
 <CAOOzhkpDvR14-D9YcZzbAQdQkDmas_XUtV-CLBR7+a3AuxgstQ@mail.gmail.com> <CAE-0n52aueW5N+d2d6tjWtca31werhwk6-6yqDm-XibtTfJsTA@mail.gmail.com>
In-Reply-To: <CAE-0n52aueW5N+d2d6tjWtca31werhwk6-6yqDm-XibtTfJsTA@mail.gmail.com>
From:   "Sean O'Brien" <seobrien@chromium.org>
Date:   Wed, 16 Feb 2022 11:25:36 -0500
Message-ID: <CAOOzhkqhQdO3LvfqW+sizLW3eTFnmYiXMrYk3oAKa8ynjyLJhg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Input: Extract ChromeOS vivaldi physmap show function
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 15, 2022 at 9:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
> Thanks. Can you provide a Tested-by: tag with your name and email?

Yes,
    Tested-by: Sean O'Brien <seobrien@chromium.org>
