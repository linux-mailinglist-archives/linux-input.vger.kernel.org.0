Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9C55BBE81
	for <lists+linux-input@lfdr.de>; Sun, 18 Sep 2022 16:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiIROkR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Sep 2022 10:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiIROkR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Sep 2022 10:40:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910BC22531
        for <linux-input@vger.kernel.org>; Sun, 18 Sep 2022 07:40:15 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w28so13859790edi.7
        for <linux-input@vger.kernel.org>; Sun, 18 Sep 2022 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WJeTo/YoIqzGxBFJQlGTAeJS2JaDh5aCUVTVnuwF7YM=;
        b=Z/2KbxcMC57BZRevUCvexaoh4RLqSuY7+hZthoy4SnlD+bZFq6GBoRcZ/fWJIoMQtf
         +Ju45vTDpB8TYm7gm3nMbR37EYcD9lus81WKL4zNrw8xo9dh1NewU7aVBDn6k8zXBHYo
         DjMwm3ouqFsn0T+JuZy3EWLBcnLELIF57WDi4ux5UfdoiuEZY1VTSj7qab8LH5p3goXg
         WVwQbn1VZpvv8LH6SPccyFutWl1Will7xgwI9Raua6SGkEFdHlwxmCNKMPGWabWkUnSe
         rUnFMnj5BfuL4hYsX72gw4AybGTd6sH/OKcR3pRQxDYcXx2dc6yhrnOqlQa5HQWh5zbL
         1dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WJeTo/YoIqzGxBFJQlGTAeJS2JaDh5aCUVTVnuwF7YM=;
        b=ZIu+UxwxynHaJE7sWltwj6jfD+9vB6y3sZAIXSx3fj4pC/7D8JRlB4u3eZL9qiDURY
         yxyc/d3UMW9YUW1LltLMLS9uzl58/aEOMu0xuHSpjc0CQaXc33akCBUWhHbxUuO0BxbK
         LePahGrLv0kqpHOjoJm/ra3SQfA8qEz9h6mU87M2qqDpA7tfN/SWooZWpqBOlO3Tl19z
         LSDopIImRbRiKkaYsbWBOVJk8/0lTuXLMKVzTwtd+arqGxvKF2E2oNlkJ9saJTVSH3Dm
         Efc+et2oPUdSUDyY2pONxtn3aU5Pco8yH7bw/L/qoQwjAYj8iqR1fB5y8KynZ4K5u9Io
         YKIg==
X-Gm-Message-State: ACrzQf3ewqCzS/PGQ/9ImBjW1QwSj/WPwe+I92U2V5gBvdcRhI/kcT8u
        2jLEn7C9YjrtkQeFuHNuMhgSxM8yV9Bl2+tlls+gVxgO8QQ=
X-Google-Smtp-Source: AMsMyM7hDs2F6N0cDYpOC844+/sfzkePCFn2OXMPH0gr5/awqAUxuGJMsI5iGClyBfJv6MxsPUtAbJSMah2R7urb35U=
X-Received: by 2002:aa7:d994:0:b0:451:e570:8a7d with SMTP id
 u20-20020aa7d994000000b00451e5708a7dmr11832915eds.205.1663512014151; Sun, 18
 Sep 2022 07:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220914141428.2201784-1-dmitry.torokhov@gmail.com> <20220914141428.2201784-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20220914141428.2201784-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 18 Sep 2022 16:40:03 +0200
Message-ID: <CACRpkdad4CVo6xuesaN-rgrq+Tb+MUdAyyeP13V-b-e6FUMvzA@mail.gmail.com>
Subject: Re: [PATCH 2/5] Input: auo-pixcir-ts - switch to using gpiod API
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 14, 2022 at 4:14 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This switches the driver to gpiod API and drops uses of of_get_gpio() API.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
