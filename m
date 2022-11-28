Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BE263A54C
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 10:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiK1Jor (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 04:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK1Jor (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 04:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFD718E0A
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669628623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j0ljOwUEl67kxlJtut4P6tsqofn1ccksqN/PMi84OLk=;
        b=IUX1ABt2ol67rIYI/eC6alzYqQuK/Gw+GVm4N7ViL54N3oAjoXYgDumbB465D7ZSbxLNCe
        MRkIZE36FhcA0s2RzzdZLvILxYCCmthyA7WophM/lLjWLGGxuf4WgDJz9kZfpCPul9a7cS
        xWXoovucUAVsDoHmC2E1/5iizW/NPOg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-EZvGT2H0MkW5v28fnVRGtw-1; Mon, 28 Nov 2022 04:43:42 -0500
X-MC-Unique: EZvGT2H0MkW5v28fnVRGtw-1
Received: by mail-ej1-f70.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso4035091ejb.5
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 01:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0ljOwUEl67kxlJtut4P6tsqofn1ccksqN/PMi84OLk=;
        b=78e5GN4cfIuYnOCLebi4Z18NX129XSc3HN4gKmcWTHHJuQ28Zqa5ufVnMMzA4eb+6j
         e++LS1hoWufPZHMWOq9uKdIX0NxvD3ZdgIS5kdnrQoDdTz4gGosVCuh4wvC2/zJJU0y8
         ESZjS8vVzV081G9D9ww3ZUm3FL8MLWw8wq9lRLbs3EoCOCvdhsOpKQC6N+E0lI4maQ48
         v+kwzCM+fGcsWH8qXPHbqak/tZN4nGIemuCmhr+rB3+CussLMOEjVfyPCPHmHcvs+MRJ
         1kttUnLG3RonDW+uJDlXiM8/CvCRSRiY6E/N2TVcdz1pgvZo2TRBNyld9rOh4h1VymS+
         5cQQ==
X-Gm-Message-State: ANoB5pl35Wxi8EgLm3zi53ho1OGutl3wILHX7NkEVbwLSo7C6cvyxrxh
        QNLUEhPxzkmWxf+V4uX3FDwRenQEH0dMeQZJHmuDmjQ0AzVZLrHJuLySf0xt3ouPhM2540sEVCi
        IkAhV45sbNddyJqy3MAT/d0c=
X-Received: by 2002:a17:906:2288:b0:7bf:888b:f039 with SMTP id p8-20020a170906228800b007bf888bf039mr4053495eja.429.1669628620327;
        Mon, 28 Nov 2022 01:43:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hy1Zxu79ROr55lZsqEjtcRhPk0GFcQCmnrXGzhi/35aTU6NVgf0wCv72g4e0Wrjw0eUoHRw==
X-Received: by 2002:a17:906:2288:b0:7bf:888b:f039 with SMTP id p8-20020a170906228800b007bf888bf039mr4053481eja.429.1669628620125;
        Mon, 28 Nov 2022 01:43:40 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906308900b0073d83f80b05sm4799225ejv.94.2022.11.28.01.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:43:39 -0800 (PST)
Message-ID: <e985c885-6b2a-c4c6-d926-0e36fc1cd10c@redhat.com>
Date:   Mon, 28 Nov 2022 10:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/4] Input: touchscreen - Extend
 touchscreen_parse_properties() to allow overriding settings with a module
 option
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20221025122930.421377-1-hdegoede@redhat.com>
 <20221025122930.421377-3-hdegoede@redhat.com> <Y2QWbMFzBvc2JzwD@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y2QWbMFzBvc2JzwD@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 11/3/22 20:28, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Tue, Oct 25, 2022 at 02:29:28PM +0200, Hans de Goede wrote:
>> On x86/ACPI platforms touchscreens mostly just work without needing any
>> device/model specific configuration. But in some cases (mostly with Silead
>> and Goodix touchscreens) it is still necessary to manually specify various
>> touchscreen-properties on a per model basis.
>>
>> This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
>> a large list of per-model touchscreen properties which it attaches to the
>> (i2c)device before the touchscreen driver's probe() method gets called.
>> This means that ATM changing these settings requires recompiling the
>> kernel. This makes figuring out what settings/properties a specific
>> touchscreen needs very hard for normal users to do.
>>
>> Add a new, optional, settings_override string argument to
>> touchscreen_parse_properties(), which takes a list of ; separated
>> property-name=value pairs, e.g. :
>> "touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y".
>>
>> This new argument can be used by drivers to implement a module option which
>> allows users to easily specify alternative settings for testing.
>>
>> The 2 new touchscreen_property_read_u32() and
>> touchscreen_property_read_bool() helpers are also exported so that
>> drivers can use these to add settings-override support to the code
>> for driver-specific properties.
> 
> I totally understand the motivation for this, but I do not think that
> having special handling for only touchscreen properties is the right
> thing to do. I would very much prefer is we had a more generic approach
> of adding/overriding properties (via an swnode?).

I understand where you are coming from, but I suspect the devicetree
folks are going to not like any generic solution for 2 reasons:

1. Allowing overriding devicetree properties like regulator voltage is a bad idea,
granted users can already do this with a custom DTB, but that is a higher
threshold to pass for a user then just adding something on the kernel cmdline

2. Devicetree supports devicetree-overlays and I expect the devicetree folks
to steer people who want to override random devicetree  properties in that
direction (or in the direction of using a custom DTB)

So the ACPI/x86 case really is somewhat special here and especially the
silead touchscreens are special here. Normally all the settings we are
talking here come from ACPI tables (or can directly be read from the
touchscreen controller) and then messing with these settings would be
a case of using an initrd with a custom ACPI DSDT, just like how
on devicetree I think we would expect people to use a custom DTB and
or a devicetree overlay.

but because of this info lacking from the ACPI tables we have it
hardcoded per 2-in-1/tablet model in:
drivers/platform/x86/touchscreen_dmi.c

The downside of this hardcoding is that testing new settings requires
building a custom kernel, which is both not helpful for having
a quick change settings -> test -> adjust settings cycle when trying
to find the right settings for a new model as well as quite a steep
hill to climb for novice users who want to get things to work on
a new model.

So I do believe that because of this the touchscreen properties
or special in this case and a somewhat custom solution to allow
setting just the touchscreen properties from the cmdline thus
is justified.

Also:

1. Having a mechanism specific to touchscreen properties is
simpler (more KISS) then having to come up with some more
complicated generic property override mechanism.

2. A touchscreen property specific mechanism is much less
susceptible to being misused. Setting the touchscreen properties
wrong cannot really result in any harm. OTOH setting the
max / end-of charging voltage of a lipo cell to 4.6 volt
(this is a real world example) is very much harmful.

The lipo-cell max charge voltage is something which we
in the sysfs interface deliberately disallow to be set any higher
then the boot-time value (lower is allowed). Adding a generic
cmdline mechanism for setting properties would allow
overriding this.

Regards,

Hans



