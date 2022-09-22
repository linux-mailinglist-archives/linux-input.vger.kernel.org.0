Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B263B5E6886
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 18:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiIVQfV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 12:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiIVQfS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 12:35:18 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6E198CB3
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:35:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e18so14429652edj.3
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wZaKULsqE6LPfhGn2zZsoD5uf/xGzt0VKkKFX+0TH68=;
        b=UM+JHRUYPPnGIIYrfOp9SmuYFha6xXnmUVgZxEr0ywxHcy8N9/J2BSrqRRuQc+uAin
         36pw1bn21loi8UlPSenX+31DU+Dp0JgFyqRxYRuxbEcvvbi1ELpSOBauYHgALMaqnkxr
         TogNE7SeC9G4XnLJ+v0G/dxG5NzU3e3QSB/xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wZaKULsqE6LPfhGn2zZsoD5uf/xGzt0VKkKFX+0TH68=;
        b=MRhR7U5aFmZ4wl/2sI0iHtRAYkIsXoCDcn+Oz52iHl3bpImPGx7UgIZNDDBlTYO6Ty
         ju0YdCtab/RBRzoJ/uGWFQYF/4uqTwxrHGyDfplu8pkgh1PFE5jiig5l/vnJBGbhL7Om
         d0IimNgK99B/BQq+dIFb/vwJSQ4rEO7KUhKW+gPBP9y63Bn863QqrnOH7MMlvsCY3uMX
         +GdV3lI0hjRZUBJcPs/ZONZx9LfB78GvQtA7FkD/yphlHrPbybVZP2CN9KPdNHuObFY1
         i8TvUwTkLS8jmIUI4QwvsC6EObl5jWFY7Lfa2UNoI0Fg4fw42Bgyw8h06GJ1Xd+kwbrF
         lh/A==
X-Gm-Message-State: ACrzQf2MKjxG/yisl3ucFUZ4RZM2JtBIQiSJiA5ZMq5udyaVvMMwxTOz
        f3EgYa8knyTJuNO6QQ3Xyr8yfSKB6N4pMvFY
X-Google-Smtp-Source: AMsMyM4LVFIU/Y6iuGTdNkfJWpubK74xnQAkkIzqqCac0mrf+HVzVkf1LVyx07K8emy8y/Qfg3/9mQ==
X-Received: by 2002:a05:6402:1910:b0:450:fb10:fddf with SMTP id e16-20020a056402191000b00450fb10fddfmr4154192edz.321.1663864515853;
        Thu, 22 Sep 2022 09:35:15 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id t22-20020a056402021600b00443d657d8a4sm3876026edv.61.2022.09.22.09.35.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:35:14 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id r7so16468781wrm.2
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 09:35:14 -0700 (PDT)
X-Received: by 2002:a05:6000:168c:b0:226:f4c2:d6db with SMTP id
 y12-20020a056000168c00b00226f4c2d6dbmr2591189wrd.659.1663864514135; Thu, 22
 Sep 2022 09:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101813.v4.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
 <20220922101813.v4.4.I0cebec46a06dd3ea8f6b7abde038faed917dd5d4@changeid>
In-Reply-To: <20220922101813.v4.4.I0cebec46a06dd3ea8f6b7abde038faed917dd5d4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Sep 2022 09:35:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEa=+Gp5o1YjLnLrYQ7uMPa3QLy1R6m6Cygo0bbugYcg@mail.gmail.com>
Message-ID: <CAD=FV=WEa=+Gp5o1YjLnLrYQ7uMPa3QLy1R6m6Cygo0bbugYcg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] input: touchscreen: elants_i2c: Add eth3915n
 touchscreen chip
To:     Yunlong Jia <ecs.beijing2022@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 3:23 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> The ekth3915 and ekth3500 are almost the same.
>
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

You shouldn't have added my Reviewed-by here. I haven't seen this patch before.

Also: you should drop this patch. The way we've specified it in the
bindings you can rely on the "fallback" compatible string for the 3500
to handle things.
