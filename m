Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFAF6C11D9
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 13:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjCTMZ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 08:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjCTMZ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 08:25:56 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA4910EA;
        Mon, 20 Mar 2023 05:25:50 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id e12so2848698uaa.3;
        Mon, 20 Mar 2023 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679315150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzMF9oRXvhDt5faC9/xMWqdfiuEh4ucyCMthx1muzCg=;
        b=Qw8fV4CN4F4T2Njk6nZe9TzMAcT+MCcBs8Gc+HYCGfYtNs9EHRWjZz8bHmlWaCoZPu
         xq6WF8ri22LXoYix6oCJl/1yx8a81r6XRVi0DF/nxXgCieY9lIZZ4KG/4eYLqtEBNVYx
         kczZqgJKnbZJhcsr8M4GdAgvR/YKpxIkSKeH6UM7VhlblCRISTUzYr4IyqYSQQZvC8Zc
         0xdVd9kZ2PSdCfPCmwgX7XAdYfPA9Emef0snQcKgn1vnWSF2f3BLvN6JvhvnnHfm58fn
         qRpwuKj6O+iwsO1wAGMxBw0MDfptXnqJzJ1BXQfPeNePqf31FiqMjTJ4pJVm6Zzr3KPr
         CuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzMF9oRXvhDt5faC9/xMWqdfiuEh4ucyCMthx1muzCg=;
        b=xwqzQlBc5zt4H/RfW98Nax8bj0cSXJBWJqAG1usceUeMFsdhLFv6BdUJkM9ea4cQaa
         lNfMRckqC0cNGjF44W0zW/70PXQlgxX9B7fh3wkEB4cN/W+L/DZRCWL9riDvLUWNnqdu
         u9tyPxzoH+X/VAgedL/aHMAjr8kmnS5Z5v28DYojmM3NdkoOVUlmgbKim6l6VGd06YpK
         X9KBDAKNFuba2YXSegGsCE81hPlE5cyXB5yBkdBpZlme+WOnfrARYJozOZNRhW1ambQR
         FJwfbQuHO7kl4aziDgiD+LJGDR+W6xgCu1WGnFqVkhaRnC0vESHd7Ku9b7f1K0iuFXRC
         Zyaw==
X-Gm-Message-State: AO0yUKVsoaVEOk7MNFp3xasKQllL6HTXZWgihQUJqWyos4I9gQt+cLR6
        p0afdEosqnFUNccLYHTuE//PV2P5zPqKx0T4qi0=
X-Google-Smtp-Source: AK7set9BclMGc5sZrLZLZnawSHj4a3lHNXsfDrs/oUsBvP6n6cG0VdZCwlYSYqMnHaMD6T/5J4xVXbPOBFzflraqC4c=
X-Received: by 2002:ab0:1006:0:b0:68a:5bba:ba40 with SMTP id
 f6-20020ab01006000000b0068a5bbaba40mr4047098uab.1.1679315149875; Mon, 20 Mar
 2023 05:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230319204802.1364-1-kaehndan@gmail.com> <20230319204802.1364-2-kaehndan@gmail.com>
 <a7a20a06-5a06-e196-07a5-c5f62fc7c065@linaro.org>
In-Reply-To: <a7a20a06-5a06-e196-07a5-c5f62fc7c065@linaro.org>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 20 Mar 2023 07:25:40 -0500
Message-ID: <CAP+ZCCeSKRLi_2jPMB-bM9BzdzNMjtrJqsKbMpY-vQqab=yvKA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        bartosz.golaszewski@linaro.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 20, 2023, 1:44 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/03/2023 21:48, Danny Kaehn wrote:
> > This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> >
> > The binding allows describing the chip's gpio and i2c controller in DT
> > using the subnodes named "gpio" and "i2c", respectively. This is
> > intended to be used in configurations where the CP2112 is permanently
> > connected in hardware.
> >
> > Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> From where did you get it? There was no such tag at v7:
> https://lore.kernel.org/all/20230223213147.268-2-kaehndan@gmail.com/
> nor at v6:
> https://lore.kernel.org/all/20230217184904.1290-2-kaehndan@gmail.com/
>
> ???

Hi Krzysztof,

My apologies. It looks like you reviewed this in v4 [1].

I had received feedback on v7 that I should be carrying tags from
previous reviews
forward if minimal / no changes have been made to the patch reviewed,
out of respect
for reviewers who look at lots of patches (like yourself) [2], and
hadn't retroactively applied
your tag until v8.

Since v4, I'd only made a few changes suggested by Rob, plus added an example of
specifying bus recovery GPIOs in the binding, and thought those would
fall within the
scope of minor changes -- but my apologies if this was a bad
assumption! I can remove
and re-submit if desired.

Thanks,

Danny Kaehn

[1]: https://lore.kernel.org/all/c999c387-401a-e3a1-f431-2770930c5ecc@linaro.org/
[2]: https://lore.kernel.org/all/Y%2FjpME2mb5CqPooj@smile.fi.intel.com/
