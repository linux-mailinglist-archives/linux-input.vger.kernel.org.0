Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E91699CC3
	for <lists+linux-input@lfdr.de>; Thu, 16 Feb 2023 20:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBPTCx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Feb 2023 14:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBPTCx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Feb 2023 14:02:53 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6084E047;
        Thu, 16 Feb 2023 11:02:51 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id d6so566973vsv.6;
        Thu, 16 Feb 2023 11:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676574171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha38f0fmpEOnM1kND5UJ5DXzvrawvRzyWhHxzv54J54=;
        b=k4e8tJRTk/ST2Zuu9Jj7yT2yrrzp2dTtvkU9E+tUBgW0F9T8FHJD9m9EQhPDxAFxIh
         PB9KQjyHwgWkrGMMz0TENX3Edp63QP2QNQWjwBmzHXcAb1WhT77+4KzSmbz9kTpGaaVe
         ZGtcIARy6tFjRbyGlelUngrDHcg1tAQVRQXbCwOuyt2jFxxsKyMSx2OdSlmZsgQaeqNZ
         U5QolkzSC6pf3hk+TIHcEmejUyiE2QoogJ7dYennyPS6oB343S5rMFL0UpJinFSYwh/G
         mXrRt9EmUgnG8cX8TS2q7GPy2o0Ygc/uTWOIrcFmF04ZRIfNELsiG1q8dHbE6/kgVps1
         goGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676574171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ha38f0fmpEOnM1kND5UJ5DXzvrawvRzyWhHxzv54J54=;
        b=UEBZMlCUnElPD/isQJ0III+azAe5t5NtsefQHrBMtvu3CNxDJBDpmS12lq1nA0LjW9
         nCx186M+OJrBBDAVooKb60k7Q7/3PyiL4uHuuxdeksQ6sF8uHk7ylHLOsXrBN6GJsb1a
         6TdYUae/PRDey1hP6xim6E+6EXi4r1UMUF83IDT+K6hfV5wU+hkjqJy4p7JNA4JPm50m
         Zk6P3hWQd5qu1leHZENEuFJD9PlruC6ENLd6/PnPWbxW3ZV5rRXLszq3Gr1aC7Q2cL9/
         V5VJUBTvGDjl3hPm7g+mnKXwdrFmDsyKyrho9qMOOSGXFN9fkbVxK3tmlscMn9VWeYN8
         SI4w==
X-Gm-Message-State: AO0yUKVeEfxldgNkM1z1Nf8IlRfO2fjHno/NOkjPE3Yiko4hNjRP5+qP
        FBXHRjdyMhVVnQqO1DmJp3jbAawb/cO4KNXiwSg=
X-Google-Smtp-Source: AK7set/E7pMIS7oAR73XeCfoO9S741Ct5H+sLf46Ix6uSMr2jWMdsM6k9JX7n0ycuwuRP0B2NKEGjPFBtD0BZKdEigA=
X-Received: by 2002:a67:6c05:0:b0:412:378c:a3a5 with SMTP id
 h5-20020a676c05000000b00412378ca3a5mr1400063vsc.8.1676574170853; Thu, 16 Feb
 2023 11:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20230210223638.12796-1-kaehndan@gmail.com> <20230210223638.12796-4-kaehndan@gmail.com>
 <Y+eFhKw5KcPUNyXy@smile.fi.intel.com>
In-Reply-To: <Y+eFhKw5KcPUNyXy@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Thu, 16 Feb 2023 13:02:40 -0600
Message-ID: <CAP+ZCCcC6hVxMqZCR3qcRXAcUkQp_B=DF4PVy--ngLwmPY-UjQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
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

Hi Andy,

On Sat, Feb 11, 2023 at 6:10 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 10, 2023 at 04:36:38PM -0600, Danny Kaehn wrote:
> > Bind i2c and gpio interfaces to subnodes with names
> > "i2c" and "gpio" if they exist, respectively. This
> > allows the gpio and i2c controllers to be described
> > in firmware as usual. Additionally, support configuring the
> > i2c bus speed from the clock-frequency device property.
>
> Entire series (code-wise, w/o DT bindings, not an expert there) looks good to
> me, but one thing to address.
>
> ...
>
> > +     dev->gc.fwnode                  = device_get_named_child_node(&hdev->dev, "gpio");
>
> Using like this bumps a reference count IIRC, so one need to drop it after use.
> But please double check this.
>

Thanks for bringing this up -- I should have explicitly called this
out as something I was looking for feedback on, as I was unsure on
this.

I noticed that many of the users of device_get_named_child_node didn't
explicitly call fwnode_handle_put, and was unsure about the mechanics
of when this is needed.

The underlying call to device_get_named_child_node for an of_node is
of_fwnode_get_named_child_node, which does call
for_each_available_child_of_node and returns from within the loop, so
I _think_ you're right that the return will have its refcount
incremented (of_get_next_available_child calls of_node_get on the next
node, and doesn't call put until the next iteration).

However, I also noticed that many other functions in
drivers/base/property.c contain a message like the following in their
header comment:
"The caller is responsible for calling fwnode_handle_put() for the
returned node."
and this isn't present for device_get_named_child_node, which is
defined in that same file, which made me suspicious that this is
somehow done elsewhere internally (although I should know better than
to trust documenting comments :) ).

I'll wait a while longer to see if someone with a better grasp than me
on dynamic DT/firmware weighs in, otherwise, I'll assume I'll need to
call fwnode_handle_put both on error paths in _probe as well as in
_remove, since that appeared to be the case with the DT-specific
of_get_child_by_name path.

Thanks,

Danny Kaehn

> --
> With Best Regards,
> Andy Shevchenko
>
>
