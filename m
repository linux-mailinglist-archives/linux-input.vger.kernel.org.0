Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E38E7857BC
	for <lists+linux-input@lfdr.de>; Wed, 23 Aug 2023 14:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbjHWMPP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Aug 2023 08:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbjHWMPO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Aug 2023 08:15:14 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB4D19A
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 05:15:12 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-ccc462deca6so5431928276.0
        for <linux-input@vger.kernel.org>; Wed, 23 Aug 2023 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692792911; x=1693397711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N2gnvcEfGb3L+QEwC+N38b9ItEwrmfrslDJ70apZRE=;
        b=KvEB3qKN8VzcKjqujVsocMw0sRuVeLhCp/KM+QEqtq5mdYjWS+/Xbey3x0VhW2vxXz
         VpTfTvsCMtcZL9UXJtIr6ifbntVhGAzDURD898eT8D+vsinNENQn5JRbPoa8quLBMgDU
         pG7Icamv1V9xAVdOs2cILcbbaTHRft9hc+8T3CZwhjCL3BVsq2gpAIyQNfyJE+2A7t37
         FKHwN3wuT/Pad75An0kTaCsolWpRDZRHmGrnMg3UAp8KcoRcyplidXycGiapECsZ3cM7
         sdoi8xM9p7HaSzcfpzdAqKTqeqTEYyA5sdX33QZaVuksD5nUEHAO8n8jzSkKUIdmAglW
         K7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692792911; x=1693397711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0N2gnvcEfGb3L+QEwC+N38b9ItEwrmfrslDJ70apZRE=;
        b=JaqXNxaMgdz17gvdewk+P1vXkWTJ+NR+85SjhWUVwd6OYsSKw13nU/udl6kIgPKgCv
         ggrzFe38xPT/LXqlFBLbzXJu3GK+g6zPYAoaKglu8FB3RIOb4uaQbnM/aEH6q1QgaKIt
         P4CLKZIuM7QQh7Y99BlcpeXFlGTHTY1CoYtpKCS2N/fysLSk5JZZSdDk0G/kEvkCWiA6
         INY6gnQ0w/Ik7OxSCIKjXTPn0aluVEZ9IYLWw7lMZmDUikvDE9Kh6H6knSQJx2mSlqL+
         7HnkyFTI9c/eYxvBqeJpwOOTU6uM6yuhRIkx5sY1mmfQuRapRM2WLin8KD9lay1o25Wq
         WxRg==
X-Gm-Message-State: AOJu0YwZrW/7sI+1N09dGRn3G+FjqKmB/HL2cXKtrZb1/xauda8fp8Zi
        N8PCF4I01LUj4mrvIYEMDSmsC2FWS5ufaRyfI4rrCA==
X-Google-Smtp-Source: AGHT+IEozVHXH4Oln+v1G7Ein85g60u9KEJ8wZA2BteuvSIbfcJGpkjoSLO9O42JwgcVVVFGEFzwIBnJ3zMVc1ykWhk=
X-Received: by 2002:a25:d78c:0:b0:d73:e979:d5c8 with SMTP id
 o134-20020a25d78c000000b00d73e979d5c8mr13520994ybg.34.1692792911487; Wed, 23
 Aug 2023 05:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230822152244.214394-1-brgl@bgdev.pl>
In-Reply-To: <20230822152244.214394-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Aug 2023 14:14:59 +0200
Message-ID: <CACRpkdZWKDsHtYHqWSqz6QYp4TKT4OskWO7v6w=2v3NhvYWc4w@mail.gmail.com>
Subject: Re: [PATCH] HID: cp2112: make the irqchip immutable
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 22, 2023 at 5:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This make the GPIO irqchip exposed by the CP2112 driver use an immutable
> irq_chip struct thus addressing the following warning on probe:
>
>   (cp2112_gpio): not an immutable chip, please consider fixing it!
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for fixing this. FWIW:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Marc Z, have you checked how we stand with immutable GPIO
irqchips? We should be able to smoke it out to default behaviour
soon I think.

Yours,
Linus Walleij
