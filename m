Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5245AC0F
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 20:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbhKWTPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 14:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbhKWTPx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 14:15:53 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50605C061574;
        Tue, 23 Nov 2021 11:12:44 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso27570wmr.5;
        Tue, 23 Nov 2021 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xss5SnKgkPp02wd6AdAAL9ymcU61G/FhRa1CNPWUDyA=;
        b=jG/MFOnUgGW0y4hNUy1Q/1R2833GAaNQDWVQ942N8PycS1Q105SBeNretlz63bygZU
         KHkolfNovyz45jBYBarKq71COsOdC8HpwCBAlLq7B2K1RWAPNHNK9f3p/fX6GNloRXTd
         LBSuEpPqiAeB1oY79FdDs8G+E6r7mdD54knQJyGEiVJLlxh14zqMTKN5+E5MUad5sDhL
         5mmUuOUeddGxodlTSFQAWZGrxXvlOJ6vfc9juiADkkcdy1E16RwDDgwJ+4QNm0Oe26EP
         XjATQWoN81Y1v1Qtj8GvCj1f6ulH3t9MAzbuOAssclymqO8DkguQfH/tdFqw39NvYU3Z
         WUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xss5SnKgkPp02wd6AdAAL9ymcU61G/FhRa1CNPWUDyA=;
        b=rMGK4R2k/haSYNj4xdxqVzrUcg/GAeh4Mz6GRXdBgMTAYfZKH+dCcI5HE044VLdsnG
         jkoJJjJ7ZM1UdMQQfnf3W22t73L9MMtGIbxzPrXYf0Y0o48RqWQBkGHvvGnWsrslWuDn
         hmpTtr/UOttYWm/tx3J8g78gE8BIQYjgYIVrTCsgh+CabkVW6t+YSklkCIt0fJm3Y/Zg
         ROYModUCnEPsWMlImUg2fZyqnrs+o+bn9DP5mrVempTMi8wNySOPpLR8v7NjUJfk4fbv
         3qrEgsPyUnPkGIFYa1pZ9blTJN57fqRftmJhJ6igN8/27uQsZmUTfIm58mvVk9XiWa0j
         gxCg==
X-Gm-Message-State: AOAM532GDvzBAxoV97sr76gfDFAnEA13TDXyq17oWrTAAfWv2VAq/uSt
        deoZlW785Mgbui7IhSYX5tY=
X-Google-Smtp-Source: ABdhPJxKyG+7D3DPw0a510IGP4zadQmNd5kBFQ/DMFXMt5tt6Ye5DjbUDdbBI9uYKzeXDfOnllTb7g==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr6056537wmj.149.1637694762579;
        Tue, 23 Nov 2021 11:12:42 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id r11sm3088081wrw.5.2021.11.23.11.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 11:12:42 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, peter.hutterer@who-t.net,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 0/1] Do not map BTN_RIGHT/MIDDLE on buttonpads
Date:   Tue, 23 Nov 2021 20:12:37 +0100
Message-Id: <20211123191238.12472-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

Historically, libinput has relayed on the INPUT_PROP_BUTTONPAD property
to detect buttonpads.

Since buttonpads are expected to have only one button (BTN_LEFT),
recently we added a new rule to detect buttonpads: Where a touchpad
maps the BTN_RIGHT bit, libinput assumes it is NOT a buttonpad.

However, this change leaded to several false possitives, so we ended up
reverting it. For more context:
https://gitlab.freedesktop.org/libinput/libinput/-/issues/704

And for a full list of affected hardware, HID reports and bug reports
please see:
https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/726

My understanding is that buttonpads should not map BTN_RIGHT and/or
BTN_MIDDLE and to avoid it I would like to fix the required drivers.

One option to fix it (this patch) is to clear the bits that might have
been added because of the HID descriptor on every driver.
However, since this code will be common to all drivers, I would like to
ask if you consider it worth it to add a function to handle adding
properties.

A function similar to input_set_capability but for props could be added
in input.h/c:

    /**
     * input_set_property - add a property to the device
     * @dev: device to add the property to
     * @property: type of the property (INPUT_PROP_POINTER, INPUT_PROP_DIRECT...)
     *
     * In addition to setting up corresponding bit in dev->propbit the function
     * might add or remove related capabilities.
     */
    void input_set_property(struct input_dev *dev, unsigned int property)
    {
            switch (property) {
            case INPUT_PROP_POINTER:
            case INPUT_PROP_DIRECT:
            case INPUT_PROP_SEMI_MT:
            case INPUT_PROP_TOPBUTTONPAD:
            case INPUT_PROP_POINTING_STICK:
            case INPUT_PROP_ACCELEROMETER:
                    break;

            case INPUT_PROP_BUTTONPAD:
                    input_set_capability(dev, EV_KEY, BTN_LEFT);
                    __clear_bit(BTN_RIGHT, dev->keybit);
                    __clear_bit(BTN_MIDDLE, dev->keybit);
                    break;

            default:
                    pr_err("%s: unknown property %u\n", __func__, property);
                    dump_stack();
                    return;
            }

            __set_bit(property, dev->propbit);
    }
    EXPORT_SYMBOL(input_set_property);


Which approach do you think is the best?

Thank you very much in advance,
Jose


José Expósito (1):
  HID: multitouch: only map BTN_LEFT on buttonpads

 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

