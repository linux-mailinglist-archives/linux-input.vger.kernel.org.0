Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1E55358C9
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 07:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238059AbiE0Fgs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 01:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbiE0Fgr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 01:36:47 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF44B4474D
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:36:45 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id i18so3465782pfk.7
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UsuvokeMgWzMqn2nYKkWjjHphtm91KKkdiPBycRv2xA=;
        b=QSlRwuwfOfVLXNvHyP5VAb/C/MXx+M09WXLx0pmeFfoyJCdxLPrmYIwoG+FnBS54Ly
         8fZaxs8Ay9d/VMNwxmIq10URtH2ibB40u7sLzmXNp9bx3QrkV/DLY3nV+h/+4MflqnQp
         Yc/hyPIGjIJRYbQT6oE2prthjUXIuJXICIfzcS+OLp2E+YRC4gSiJ8jgCIu6EyKV9fPl
         wSMLqRIcyAmllIIbEpwkxx+4AKJLcdlxMzqE/usrYGK8IWm6Qr/RIDYcA47d1PqUbwaM
         +maKqWjr7sgallbm81VyHkpSVSToFe7YQA5lqPSPX7Wzty3e6u3A8lSw+uV4vt4p3GxV
         pkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UsuvokeMgWzMqn2nYKkWjjHphtm91KKkdiPBycRv2xA=;
        b=lEfjH8Io1ezyT3UNZbpz+XEEmezyH9fCUYERIhG9SXDwBdBq7dLeAyvqhBLG7xHoup
         BqDm+xW/znBzn5CwaUZHXZqcuV66tHiy+s4eF1BvqUc0SpMev0gL01MAyS+31nbAS58W
         bdIhY0nckTC6465m0chpuQ5OSjS2IUuAqzOXJi6pdxmOZmSxiTZPofYb5wAhD2OJbME6
         fE6kgENR06HxwNUwSVO92uVA0NCfNEIoCGhaPzaprUfQdL8DGKHg7hTsZk7xhHGf+FkQ
         v28HpCHiH041DCsrG+NmSjOf13iy7kBFtgL+LOG3md+Kj2paSeKiYtfErMR87KFUB9in
         8hAg==
X-Gm-Message-State: AOAM533lA3FFHmUbn8Name2dCmn7Lq9YdoHqYiXztPWzjbbEzX2XgLDb
        gxB9ltmLrkFM3Lt3ZUelGj6F1W4UOWs=
X-Google-Smtp-Source: ABdhPJwT+ljm8ZZlhpgHReJ02REuYRxWqyompNnety7EIJ1FNUM8rNTc2HdJ1MAYAxWCNB2dniVUag==
X-Received: by 2002:a05:6a00:e8e:b0:4fa:a52f:59cf with SMTP id bo14-20020a056a000e8e00b004faa52f59cfmr42274023pfb.84.1653629805400;
        Thu, 26 May 2022 22:36:45 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id 7-20020a621407000000b0050dc76281bfsm2432028pfu.153.2022.05.26.22.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:36:44 -0700 (PDT)
Date:   Thu, 26 May 2022 22:36:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 1/5] Input: zinitix - Helper dev variable in probe()
Message-ID: <YpBjatmHD6hZgDGx@google.com>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410120059.2583849-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Sun, Apr 10, 2022 at 02:00:55PM +0200, Linus Walleij wrote:
> Create a helper variable struct device *dev in probe() to
> make the code more compact and easier to read.

Actually I wonder if this is a good idea: when just seeing "dev" I often
have hard time to remember what device we are dealing with, whereas
"client->dev" gives a very string hint that we are dealing with I2C
peripheral physical device.

Did you observe object code savings from the conversion by chance?

Thanks.

-- 
Dmitry
