Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695B34B90E4
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 20:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbiBPTF0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 14:05:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbiBPTFZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 14:05:25 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A222599F6
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 11:05:12 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id q5so2139094oij.6
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 11:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aVYmbgVTns/qU6vGaPJo+De8qlM44UBRmgs+fYad6dw=;
        b=khs7wmXDMOrhKc1YljkX/CBjF85HvL3cBs9WN46wnqkX8Tzj8/AP3wK2Ju8tIvx5cC
         5UGUG1f2Iw4PRGkDYPrkY1pb6Ter8qA2z1GMETDmcKh/a8HU19Z073Ja5Fmaem2ZHG0x
         KWd4mnM6JlDnSlVcAbvWpU51IQxnK73BdonKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aVYmbgVTns/qU6vGaPJo+De8qlM44UBRmgs+fYad6dw=;
        b=G1Uc1uD/2gOwEsrk6E26XA5VTUBv1CCtFSn31owKxu7/2SK7mC/VDOV8LDKUslbqmg
         Yf8qpjHtVizCIcmXwCtVKbDo9GZcIR5zOUhVceOTfCRQctuF2kCMVL+wTcJL4n1Pb1QZ
         RNna7a997Ayg9iYW+EjFfKsPvr4jzv1BC8eaPDwmLE66+T4ddBo9keX2iVVyPlEfGahQ
         35uaUg2luNM4pCzwd7xAF0/jOo3wB/n7FGHc3CDgQXHHVON3woM42AayvvzDWTSIzhX6
         rn247eC/n9x120htr3adQEi5tCQcWUW5i4BWJjgcn/nRONSt2Tlfkk0/2HgyiVBUyxnx
         zchA==
X-Gm-Message-State: AOAM53033cAisv5etEZBbKPKxuZTqqczhqGvg5oIVJLTKIMVpPBdGRaR
        u2CIAlHwcKzi/i48Pp2T+dDfMIc+jeN61ru0i0J6Vw==
X-Google-Smtp-Source: ABdhPJz6oTMx5SDP1atDaHjjBaVtHdu9B64jLra7yXRoRtTP6AwMJCHcJuOUO2BdKPClntlFTZ3K3BiQsE4HR4mzK2Y=
X-Received: by 2002:a05:6808:30c:b0:2d4:655b:c8c4 with SMTP id
 i12-20020a056808030c00b002d4655bc8c4mr794909oie.90.1645038312158; Wed, 16 Feb
 2022 11:05:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 11:05:11 -0800
MIME-Version: 1.0
In-Reply-To: <YgyNScQJNVjJpqEc@google.com>
References: <20220211012510.1198155-1-swboyd@chromium.org> <20220211012510.1198155-2-swboyd@chromium.org>
 <YgyNScQJNVjJpqEc@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 16 Feb 2022 11:05:11 -0800
Message-ID: <CAE-0n51vdZ=PLXx5Hq+R+F7KwDRPBauN0XjvE_qFtNoHiRWU2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Input: Extract ChromeOS vivaldi physmap show function
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-02-15 21:36:09)
> On Thu, Feb 10, 2022 at 05:25:07PM -0800, Stephen Boyd wrote:
> >  drivers/input/Kconfig                 |  7 +++++
> >  drivers/input/Makefile                |  1 +
> >  drivers/input/keyboard/Kconfig        |  2 ++
> >  drivers/input/keyboard/atkbd.c        | 22 +++++----------
> >  drivers/input/keyboard/cros_ec_keyb.c | 32 ++++++++--------------
> >  drivers/input/vivaldi-keymap.c        | 39 +++++++++++++++++++++++++++
> >  include/linux/input/vivaldi-keymap.h  | 28 +++++++++++++++++++
>
> Since you called the config INPUT_VIVALDIFMAP I think we should call
> these files vivaldi-fmap.(h|c) as well. They are not really keymaps.

Sure. I used 'f' for 'function'. It could also be INPUT_VIVALDI_PHYSMAP
and vivaldi-physmap.(h|c) if that's more appropriate. I'll resend this
with fmap and we can take it from there.
