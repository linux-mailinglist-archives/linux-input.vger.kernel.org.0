Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF03763DCAE
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 19:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiK3SHW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Nov 2022 13:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiK3SHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Nov 2022 13:07:15 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D5F83EAA
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 10:07:10 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id w37so11665498pga.5
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 10:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/XxTMPICDie9ymNdj/MdgVV0xGRFOD3AAJXtRn0C+A=;
        b=BUG7pdc6PPVgQrMC7CiGj2Cl3eIK6wgTQyCCd4Dbienm0CJNV7xL6LPRfKROL+QbPy
         PUZ3tiRzLrEDxwF860wzhgXU5H2SbuQDAg7vva0vZRvRLq+N0atW72fRVeTH17CMqkdx
         bZTV7NunSIMjvQ/f/p08lsxbdONCK/g78arTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/XxTMPICDie9ymNdj/MdgVV0xGRFOD3AAJXtRn0C+A=;
        b=i0fz7ibjUO+taNZV3DLQhYT/Xhwf+QpzVZZjHs/3h14yueQvXRMVZprS00WbqJm/mB
         XuyCwzZGRbj229yqHpHhk4j3OYaqSue9C/TfW4L0z5t9TAoXfTUZ/p7IR8ZUBFRevThM
         O/7thjHww1Y7yA8j6ozGXCAN0gPRMH6j2P1cpXQPsZZN2MJvPNlUu2JjS6iisytoAqbC
         3bR7I0FSQJw5swDymLhwm0HxOs6pugtS1mJqd9xDEALvQgDhojJJi2GLcHXRRJX0V3c1
         9wmvw4MQPsVApHFfbKd5J8Cj1gcUDoN2+8s4UngHoEFUae3jbaUbwso71/0pDn4Gwxw2
         AHPw==
X-Gm-Message-State: ANoB5pmYX1mnCPLhpt4lTdCSBmzNeF6q4A81q0Ou+KQs1XumCpGYHMMU
        zTJDlNM7w6ltPlTbY9hfCu4hvrJj7kBebA==
X-Google-Smtp-Source: AA0mqf509gKvo6FHfMrESQaxmWMz34LOc5mbpP0Vywn0hOGttWElaMItP1ylax6K7+H6RoEULw278A==
X-Received: by 2002:a65:460e:0:b0:478:cae:3097 with SMTP id v14-20020a65460e000000b004780cae3097mr16610391pgq.389.1669831630220;
        Wed, 30 Nov 2022 10:07:10 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902e84f00b00188c9c11559sm1848827plg.1.2022.11.30.10.07.09
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:07:10 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id h193so16789591pgc.10
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 10:07:09 -0800 (PST)
X-Received: by 2002:aa7:81cb:0:b0:56e:1092:1272 with SMTP id
 c11-20020aa781cb000000b0056e10921272mr44887867pfn.31.1669831629238; Wed, 30
 Nov 2022 10:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.9.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid> <Y3uP+Kx1xLWRVUAX@smile.fi.intel.com>
In-Reply-To: <Y3uP+Kx1xLWRVUAX@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 30 Nov 2022 11:06:57 -0700
X-Gmail-Original-Message-ID: <CAHQZ30CArSjaJUt2pg-3MQpbK4Zux7WXnr5E8vmnDrMyj0sN5w@mail.gmail.com>
Message-ID: <CAHQZ30CArSjaJUt2pg-3MQpbK4Zux7WXnr5E8vmnDrMyj0sN5w@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] HID: i2c-hid: acpi: Stop setting wakeup_capable
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 21, 2022 at 7:49 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 29, 2022 at 10:19:13AM -0600, Raul E Rangel wrote:
> > This is now handled by the i2c-core driver.
>
> What happened to this patch? I don't see it in the Linux Next...
>

This was just merged into dtor's next branch a few days ago:
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=1796f808e4bb2c074824dc32258ed1e719370cb3

> --
> With Best Regards,
> Andy Shevchenko
>
>
