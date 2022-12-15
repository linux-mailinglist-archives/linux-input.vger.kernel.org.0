Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E259564E416
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 23:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLOW65 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 17:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiLOW6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 17:58:55 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B8C5C765
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 14:58:55 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3bf4ade3364so10907887b3.3
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0UUZcz2M6JUovGJxizjQWESY/vxVUxzAMePTGkmavQ=;
        b=EdSH76dSor7phZGQyOiwpRrYz2IYRV2FrdAcs8yfb2GL43X/HGKqd2Y74yO4xc25Pp
         yrZurNWm4B6wKF+8bBgMl+33nDH2coVPGXm46TNi6eT7YVDO39ctrQTcSMF5qrVrFWYY
         TvShntjwr6bFx3HhLCfu3Sr1oCzQmHxFLqVRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0UUZcz2M6JUovGJxizjQWESY/vxVUxzAMePTGkmavQ=;
        b=mwp/oHSOSVFBoV7F9tUKmDyank53Hw/Xn+FwtSFZVMEF4ikTL2X+9G4OKxQ7KYypOY
         aJjGlZ878nQVJgpbPBOaTZ9fvxqqEl4yDurnzqM5IK4xbteiXTpKOxhF8mv7Tnl3G8iH
         KecY/i2mqxpJr3WmplQ+C9EiIbEBcEyF8IxrVVdTV+aOKhB4DPp3SF7D9uco8/qkPq7B
         OCu6I3S+m3hAHYLzA3uTEwmjzchtxVfz9gTmgrrSb4AwmVu93LUgW14Dz4EXtSVSeORe
         4Ai1JnpLyoJ+fcmv/a8CKXUTlWzcAVrb6y8NbMBtjQluLu/xl7udvzfEZhknuaXXOthH
         fDDA==
X-Gm-Message-State: ANoB5plf3w7B4WENXnhEe4ls44Tk2E9MSTQEpNUIMa8a4azo5Kc2AR7l
        EMOHlsfsC7Fxo7MdjZXVL4zccB3kHz/ZmiTl0/baLQ==
X-Google-Smtp-Source: AA0mqf6Xuhli+7ti+l4aYdZwyYygJLY0D+mcLV3NEWJ8pbkP3gOxmcy3nkpAnxrwmTp2ZPuKJQFoyTwPxiLz77hRStI=
X-Received: by 2002:a05:690c:909:b0:368:70a8:9791 with SMTP id
 cb9-20020a05690c090900b0036870a89791mr19619784ywb.197.1671145134170; Thu, 15
 Dec 2022 14:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
In-Reply-To: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 15 Dec 2022 14:58:41 -0800
Message-ID: <CACeCKae01WNKbP8wWONdpbNJQjLWFF67AFay0kwA_zmoaUNVUQ@mail.gmail.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
To:     Joe Wu <joewu@msi.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Xiang wangx <wangxiang@cdjrlc.com>,
        linux-input@vger.kernel.org, Derek Huang <derekhuang@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benson Leung <bleung@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        chrome-platform@lists.linux.dev,
        Douglas Anderson <dianders@chromium.org>,
        "Dustin L . Howett" <dustin@howett.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Wed, Dec 14, 2022 at 10:15 PM Joe Wu
<joewu@msi.corp-partner.google.com> wrote:
>
> This patch is to add extra 3 buttons: 'brightness up',
> 'brightness down' and 'leave PC(cros) mode' to support
> monitor navigation function.

nit: Please use the imperative form [1] while describing patches.
In this case, that would translate to:
"Add extra 3 buttons..."

Thanks,

-Prashant

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
