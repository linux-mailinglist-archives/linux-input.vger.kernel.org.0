Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6911258B363
	for <lists+linux-input@lfdr.de>; Sat,  6 Aug 2022 04:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbiHFCUO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Aug 2022 22:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbiHFCUM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Aug 2022 22:20:12 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FF42A8
        for <linux-input@vger.kernel.org>; Fri,  5 Aug 2022 19:20:10 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id j11so2917915qvt.10
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hpL2SD3c6BbQtJILsmAr9lDTBlieQYxegWxZpRuWWIo=;
        b=M43HUrj5YwVccl1wPw3h6jdTTliD4PDE2p4BBvZrsdk6ng5PRnUdcSW33vChDkOoyB
         FrNZm2U91gE+23UMDJQWzEIpgtlQw6ntW9HdAP/isq7bEMhAVz8hFJYWLBySvcmbBOH0
         hQAaTRn31YJ2Zv/rwLvz78JeKO4ftpi+ml9EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hpL2SD3c6BbQtJILsmAr9lDTBlieQYxegWxZpRuWWIo=;
        b=7sDJCwkd0TX1lRDCgA0dV1rwj6P3J0ZnykdrEz7b89nzuXZrIS23Bo3IRek3ZVJQVe
         ajuFfwXICwu8ohlEOh2yxIWoTiMcmyPX4FmokP79ja/P0ZXbKCSjTSp+3aOIFiXcliYM
         e0Eefdz9HVYmKTuuiG9nfwKRS98BlGwAYNg/+EfyTO/PDl5BNOwmqiQsNRjyknzdjASU
         00y+HYXJyIxUPzw4+dwVYQCfpCUF4yatI8fuTXENycQbYdIHkBc6+ZGYTyiXF4sVXRdD
         btPnIBd/t+pv8cKhowb/FSK2/thvUZb9AaqLSZs9opb8dJ84XFRiGEqCNT/uxCbX0O0r
         mICA==
X-Gm-Message-State: ACgBeo1z74hhx3YkREZGKt9XJSpCrxIprcRBfHWEo8sTuvXJOWAD/7od
        ePfveOhsq9D1dI2HawIk6KrEeh64nUvvW90W
X-Google-Smtp-Source: AA6agR6BY89yjx2PMb4W94LtgtU7As5s58BjbLO2MqJV8DrD1pF95zzgVUY5bNt6MDH9SkyrQoLJ1g==
X-Received: by 2002:ad4:5ca9:0:b0:474:9143:6ffc with SMTP id q9-20020ad45ca9000000b0047491436ffcmr8043497qvh.19.1659752409239;
        Fri, 05 Aug 2022 19:20:09 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id i18-20020a05620a405200b006b8e049cf08sm3766564qko.2.2022.08.05.19.20.07
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 19:20:08 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id a2so3120194qkk.2
        for <linux-input@vger.kernel.org>; Fri, 05 Aug 2022 19:20:07 -0700 (PDT)
X-Received: by 2002:a05:620a:129b:b0:6b9:211e:aff0 with SMTP id
 w27-20020a05620a129b00b006b9211eaff0mr2862012qki.552.1659752407244; Fri, 05
 Aug 2022 19:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <12042830.O9o76ZdvQC@kreacher> <1c7fa65d-47ab-b064-9087-648bcfbf4ab5@amd.com>
 <CAJZ5v0ie7B=GvhbfBsi7Zxu+=YzYKUqvUNs6dNZQfT3CRm=KPg@mail.gmail.com> <a2d2b61e-87c0-ee39-ea4e-3c575da0a66c@redhat.com>
In-Reply-To: <a2d2b61e-87c0-ee39-ea4e-3c575da0a66c@redhat.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Fri, 5 Aug 2022 20:19:56 -0600
X-Gmail-Original-Message-ID: <CAHQZ30DjkyDT8KbsHzfwiyg6Tst9EFhtCnjx3MmwbWRerzW_6A@mail.gmail.com>
Message-ID: <CAHQZ30DjkyDT8KbsHzfwiyg6Tst9EFhtCnjx3MmwbWRerzW_6A@mail.gmail.com>
Subject: Re: [PATCH] i2c: ACPI: Do not check ACPI_FADT_LOW_POWER_S0
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I do plan on coming back and updating those patches. I got derailed
with other priorities. But as Hans pointed out, we wanted to use
`ExclusiveAndWake` to make the decision since not all IRQs can be wake
sources while in s0i3.


On Fri, Aug 5, 2022 at 12:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 8/5/22 19:08, Rafael J. Wysocki wrote:
> > On Fri, Aug 5, 2022 at 6:59 PM Limonciello, Mario
> > <mario.limonciello@amd.com> wrote:
> >>
> >> On 8/5/2022 11:51, Rafael J. Wysocki wrote:
> >>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>>
> >>> The ACPI_FADT_LOW_POWER_S0 flag merely means that it is better to
> >>> use low-power S0 idle on the given platform than S3 (provided that
> >>> the latter is supported) and it doesn't preclude using either of
> >>> them (which of them will be used depends on the choices made by user
> >>> space).
> >>>
> >>> Because of that, ACPI_FADT_LOW_POWER_S0 is generally not sufficient
> >>> for making decisions in device drivers and so i2c_hid_acpi_probe()
> >>> should not use it.
> >>>
> >>> Moreover, Linux always supports suspend-to-idle, so if a given
> >>> device can wake up the system from suspend-to-idle, then it can be
> >>> marked as wakeup capable unconditionally, so make that happen in
> >>> i2c_hid_acpi_probe().
> >>>
> >>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>
> >> +Raul
> >> +Hans
> >> +KH
> >>
> >> Raul had a patch that was actually going to just tear out this code
> >> entirely:
> >> https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/
> >>
> >> As part of that patch series discussion another suggestion had
> >> transpired
> >> (https://patchwork.kernel.org/project/linux-input/patch/20211220163823.2.Id022caf53d01112188308520915798f08a33cd3e@changeid/#24681016):
> >>
> >> ```
> >> if ((acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) &&
> >>             !adev->flags.power_manageable) {
> >>                  device_set_wakeup_capable(dev, true);
> >>                  device_set_wakeup_enable(dev, false);
> >>          }
> >> ```
> >>
> >> If this is being changed, maybe consider that suggestion to
> >> check `adev->flags.power_manageable`.
> >
> > Fair enough, I'll send a v2 with this check added.
>
> Re-reading the original thread:
> https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/T/#u
>
> The conclusion there was that the :
>
>                  device_set_wakeup_capable(dev, true);
>                  device_set_wakeup_enable(dev, false);
>
> Calls should be made conditional on the IRQ being
> marked ExclusiveAndWake instead of the ACPI_FADT_LOW_POWER_S0
> check.
>
> Regards,
>
> Hans
>
