Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CADA68EF9B
	for <lists+linux-input@lfdr.de>; Wed,  8 Feb 2023 14:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjBHNQT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Feb 2023 08:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBHNQS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Feb 2023 08:16:18 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC6F46160;
        Wed,  8 Feb 2023 05:16:15 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id p10so19844439vsu.5;
        Wed, 08 Feb 2023 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9kVK9c7CfGewqX3a1Lelqo2y/d2iFoRNqiWRS7Q7ZU=;
        b=YYnTf9UOVv++gL127EoqsB1eGw2w2mfYDzpqE/hecKJaTlu9lZA6D0agL6DnQGIZMW
         1zT1mJocutgpcu8vc9REuPUi3bD+yx+CxlFjr0PaDrC58ZcK5SGUzcXKPoJNrauvVyoY
         PtkjUNBeomhhco8q2BiqVMmZW1dnEx9AGcE4KXVFkv2zbL09FnWrFj4kOEx4hdEiJDeR
         6xaJeJjlchdIcB6wymMuhkkW0KugTF1Yp/xk4rfsw5uNkYdoB1aZBJmnYGq2/e+GvFRf
         tdX+X+wLFDFJ/fkLOb3VCVd/B9WIPLIERM8a7nclcpY8u0ocR3HaV11q1+8XgM1pfroY
         /9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9kVK9c7CfGewqX3a1Lelqo2y/d2iFoRNqiWRS7Q7ZU=;
        b=jzIHLweacP54GBaPF2w5lqMOef1SG4vgP8clbsKbqo9BftN3AaTEVHJrPeK5m7+wT4
         ba8e/RNAoSYEBW1543YdRez+IulgZ6Ov9zP2JtFmB40mapk5eRZojD6jtQ2H+q3coRO9
         GqRXZ3eIHeDTnrkdmPSN5HsJG7BTlyXnnfP+BRX+EuPFWWH5wDG/Jho0Sya7nB4dGrWl
         hy4GKuBwuoCg1rTQ5vaxFjMK83GBuCPIrOnFP9vD0tE6OrbjcUNAHBYKHZpIh4vSviD7
         SYq055z90zo/i1l01DZjx6yVY1HwQ6VlCWKmS6LLoogk3rQr+mSjNEQtja00LEePJpKZ
         ugZg==
X-Gm-Message-State: AO0yUKUyq4cpezH+9rPuRj6yxU1PEyPAYsolS8KdbjyjIHUQHBSdKvwQ
        BeBRXA9zsTTZLaGV3XJ2IYv6VaM9ZnFQ0+JE6Gs=
X-Google-Smtp-Source: AK7set8d+MuMChpHvoSGQ9u0F3j7rUBZKS6nsd4rn161k7Ag4YLcGc2J2bulDhR5rDO7Yz6hVP0FBmPynvf+9lpAz0U=
X-Received: by 2002:a67:2487:0:b0:3f8:6b59:61b with SMTP id
 k129-20020a672487000000b003f86b59061bmr2491073vsk.40.1675862174437; Wed, 08
 Feb 2023 05:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20230206135016.6737-1-kaehndan@gmail.com> <20230206135016.6737-2-kaehndan@gmail.com>
 <20230207185007.GA3962587-robh@kernel.org>
In-Reply-To: <20230207185007.GA3962587-robh@kernel.org>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Wed, 8 Feb 2023 07:16:03 -0600
Message-ID: <CAP+ZCCcbT6UoWNL7g-WGqO+OjcVyQvms-3YkE2TByMAuD_keng@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
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

On Tue, Feb 7, 2023 at 12:50 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 06, 2023 at 07:50:13AM -0600, Danny Kaehn wrote:
> > This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> >
> > The binding allows describing the chip's gpio and i2c controller in DT
> > using the subnodes named "gpio" and "i2c", respectively. This is
> > intended to be used in configurations where the CP2112 is permanently
> > connected in hardware.
>
> My comments on v3 still apply. Please slow down your pace of sending new
> versions so folks have change to review.
>
> Rob

Thanks for the correction -- I definitely see how that could be
frustrating / problematic. (until now I'd thought the ideal case was
that comments were addressed as soon as possible, so that folks
wouldn't be reviewing now-obsolete code that might change due to other
comments anyways)

Thanks,

Danny Kaehn
