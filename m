Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467156A20DE
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 18:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjBXRsr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 12:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBXRsZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 12:48:25 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F4DCDE2;
        Fri, 24 Feb 2023 09:48:15 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id o6so439377vsq.10;
        Fri, 24 Feb 2023 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nI4MTy4hfmIHZczxuvxQkj6TviIESlZvjhSFN/mxO7c=;
        b=nuKnC2m16pkQSZekabJxPlgkqSj00V0UU1BihH1nRPRFuU5k7fbTH9EmoTeINdFtwp
         FaY9NobP22m5XimRdWICjVXkopn9cea8Jh9Ovj2wVPVPZoxoDOg0ClUpNNj0ZUcaB3wf
         I4LPWNIoyehaQGy7iwNoLcnfb2aqCKPBxdgr5eOyd8qfhnnxbN75OqUm8pnhCclnUi1l
         aKGSo+YjusYr/wlBDJa7PUSnfcoJ21QoOM1wBXoHkVWJXkFiLkQ2It9mPP4InIWGLuI+
         vlrlui6MEVPeGDUVN1AsR3xV/3wQ9MzGMDMcN4R17iX9UJ+3CUnhVhX8emSUt4v+meBA
         xk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI4MTy4hfmIHZczxuvxQkj6TviIESlZvjhSFN/mxO7c=;
        b=PWtvgGFR4hXWIJXskOnUvWUdcZIcCn9qksRnTNqty/FkSE+aRLv2gxevtMU0VtZRQG
         BSPGIVF58VhK5qdPEfqEuJbXd39+SPnyRO/OOJwZF3t9esMpPeaBe6rCTX79qu4Rm25B
         gC3IBXrdAyVMZdYRp1emWSKpp1P9Bg601RXThJU1Dz+VQwfezRYLHCTAfT9nmGrL9Zjr
         b6N8t5Isq6wPHLJ/SxNW4oozszG08ks9TINeLFpZefj0w6MqercTLmnLOgnJGdbVlCXS
         VTp4PgVxhJO0A6/vDD6I9H+oqeuOvwXHiaAVF/RqxDQrtQ5wthK1KTvTOrveBeT883k5
         t20Q==
X-Gm-Message-State: AO0yUKX/0JcNDbZJ1VLKS/VL/Rb5vQZmWMXrFmVi8mdME/Q9ksuSmAya
        Y6nANcp4gELbxg1jbRpHhjLlmhbDm2vcCj1QJ8c=
X-Google-Smtp-Source: AK7set/Bq+JucHQePYu4eno61QosclIS07ewhQ/+kp60WwVOFqxMYZasokoNzNNvR9yvHTqoQOmHb+tMAZhGVUQ9Oqs=
X-Received: by 2002:a05:6102:236b:b0:412:48b2:48fe with SMTP id
 o11-20020a056102236b00b0041248b248femr2918623vsa.1.1677260894002; Fri, 24 Feb
 2023 09:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20230223213147.268-1-kaehndan@gmail.com> <Y/jpME2mb5CqPooj@smile.fi.intel.com>
In-Reply-To: <Y/jpME2mb5CqPooj@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Fri, 24 Feb 2023 11:48:02 -0600
Message-ID: <CAP+ZCCeTg5jggU9hLax43ZNppjArSnc4dKQMHdC8S-xM1sD6Tg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Firmware Support for USB-HID Devices and CP2112
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

On Fri, Feb 24, 2023 at 10:43 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 23, 2023 at 03:31:44PM -0600, Danny Kaehn wrote:
> > This patchset allows USB-HID devices to have DeviceTree bindings through sharing
> > the USB fwnode with the HID driver, and adds such a binding and driver
> > implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> > USB-HID change). This change allows a CP2112 permanently attached in hardware to
> > be described in DT and interoperate with other drivers.
>
> It's your responsibility to carry the tags you have got in the previous rounds
> of the review. Please, be respectful to the reviewers who spent a lot of time
> on yours, in particular, code. Otherwise why to bother with it (upstreaming)
> at all?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hello Andy,

My sincerest apologies on this! I wasn't actually aware that this is
something I could do / am responsible for doing. No disrespect is
intended, though I see how this would be frustrating for reviewers (I
previously thought that maintainers used some sort of automated tool
to keep track of who approved/acked what in previous versions, but
didn't really know how that would work).

If I'm understanding correctly, this means that whenever someone
responds to my patch with a "Reviewed-by", etc.. I should be adding
that tag to the end of the commit message of that patch if a future
revision is needed? I assume this only applies on future revisions
where patches other than the one initially reviewed are changed, and
that any tags I take with should be dropped if that patch is changed?
Apologies about these questions - - I looked for guidance on this in
the various "submitting patches to the kernel" guides out there, and
wasn't able to find much.

Thanks,
Danny Kaehn
