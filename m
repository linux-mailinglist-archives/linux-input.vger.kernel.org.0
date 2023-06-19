Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D5B734B8E
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 08:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjFSGJa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 02:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFSGJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 02:09:29 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBF4A9
        for <linux-input@vger.kernel.org>; Sun, 18 Jun 2023 23:09:29 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bb15165ba06so2250249276.2
        for <linux-input@vger.kernel.org>; Sun, 18 Jun 2023 23:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687154968; x=1689746968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C20byiI+qbDetx7La03vWCfB4xYe9DPAdjsr8bNJWT4=;
        b=sec9jk6XQLTkr605jrqbNOBhEQuzIidGFoQsTVRE8IB2+riXv7VBmq4zF/lA4ldDs0
         9yT5Sa39ruqgOaoXmomaEHn16iQWHzVzGGftEENtEbEVJ3VNwpLxRjyccNqbC7rtCr74
         NaUl+v0ogNrJA/ZQs3V2AQnw4sTvysz4KeyFgE7L1kXtRqHQg4IMfSsTe+SYsvJsYe3x
         /DmB4XdIVPo/+j62xy9KEvAr6L/iNCLrPCjHhwm+rHgJkzLaI5NFFLEl2UZol3LAHVBu
         I9vn+6xOHuY6vP1dnPZinOWWrEAC2rSC7qPyegOiL014jgKWHXzvubdpY6uex1nJOupe
         m4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687154968; x=1689746968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C20byiI+qbDetx7La03vWCfB4xYe9DPAdjsr8bNJWT4=;
        b=K2RNuyV4jLcjuTzg6ASJxHlK3a17uAbPkkvOBHktC03Xv82/D4OpnLe/Fs6IfTQd1V
         XhYnCEptYGm9GzYYkDL2Cb5v1Wen5lknBUI1B9ncu+BaNtI+SHUQvDYnWqp9gx7z7U+N
         Zabe2p3m1B+DJxidBZqLoP9OICSQhGfxZ4uFFGc7C819NPgPgqBpQm5tpBJUYPqw77YU
         PYad5DG/ZKMlySFu1SFWN80BjEpU01VjSMLq/O6AyN0lXXrjVuLKCL4f3xSwMcKQIIlv
         aErBNA0SIXVIsX76+eNDB3CjwwXZneHb4StIAe7L3/OMZK2o5lb+wGRG/Kfv1V+wQQCZ
         lNrA==
X-Gm-Message-State: AC+VfDzcHJ+hO32j+XAV7/IdJ7DJeEjk2zUW05YyLjBaYCAyABHYURJO
        PFgVBBTXffwJgIY3Q3WbDUnbOoonJ2xULI09qVO1cCAuPoY=
X-Google-Smtp-Source: ACHHUZ4tua5pJYspVunQJM73+DdyCJvcd881q0CqC6abTzhE7XIyjsyDw/ozkS1+SbPuWRV+A9ghX67Ta42QfOJeayw=
X-Received: by 2002:a25:9391:0:b0:bd5:8625:89fc with SMTP id
 a17-20020a259391000000b00bd5862589fcmr116965ybm.26.1687154967750; Sun, 18 Jun
 2023 23:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
In-Reply-To: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Mon, 19 Jun 2023 14:09:16 +0800
Message-ID: <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
Subject: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     linux-input@vger.kernel.org
Cc:     Ihor Dutchak <ihor.youw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I know that thurrent documentation has been there since it was created by
Alan Ott many years ago. And he started the HIDAPI project around that
time as well. However, I am starting to doubt whether it is correct or not
based on the testing using HIDAPI.

Please help to clarify. Thanks.

https://docs.kernel.org/hid/hidraw.html
+++++++++++++++++++++++++++++++++++++++++++++++++++++
HIDIOCGFEATURE(len):

Get a Feature Report

This ioctl will request a feature report from the device using the
control endpoint. The first byte of the supplied buffer should be
set to the report number of the requested report. For devices
which do not use numbered reports, set the first byte to 0. The
returned report buffer will contain the report number in the first
byte, followed by the report data read from the device. For devices
which do not use numbered reports, the report data will begin at the
first byte of the returned buffer.
++++++++++++++++++++++++++++++++++++++++++++++++++++++

I have doubts about the last sentence. It seems to me that for
devices which do not use numbered reports, the first byte will
be 0 and the report data begins in the second byte.

This is based on testing results using hidapi and hidapitester, which
use the ioctl.
int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
char *data, size_t length)
{
    int res;

    register_device_error(dev, NULL);

    res = ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
    if (res < 0)
         register_device_error_format(dev, "ioctl (GFEATURE): %s",
strerror(errno));

    return res;
}

Reference discussion:
https://github.com/libusb/hidapi/issues/589

Test device is Jan Axelson's generic HID example which I have tested using
libusb and hidapi across platforms as well as using Windows HID API.
So I believe the FW is good.
http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)


--
Xiaofan
