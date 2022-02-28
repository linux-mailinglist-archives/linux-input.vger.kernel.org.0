Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D578F4C7B10
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 21:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiB1U4u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 15:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiB1U4u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 15:56:50 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7F1289BF
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 12:56:09 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a7-20020a9d5c87000000b005ad1467cb59so10513166oti.5
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 12:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RDqFD5RGNd2mlaW+kJIN5AvKm+S1e0ARVsZ+mgZPisY=;
        b=cz4tgnw/uS4S4VlH+shG8vkdGIJV2FVKY44Qfa2bq1w45OBG/UIwy3DQGcEllHSuUi
         hDQf0iyRsP+47xgxajtBXkf5h2AullM60yawplCQUm5fkgrBySFhHQIvht8Ze0Vs+nMe
         CNZnmmsCwEHwjiM8P4inI+lpBRPG+HrzGpLHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RDqFD5RGNd2mlaW+kJIN5AvKm+S1e0ARVsZ+mgZPisY=;
        b=CgPr6DAYcMLfETDfgpC9MO22hjxFI6aTBS585oLcoCi4QL4BYQhZmYSMpSZ1nVdKwq
         5Q5V3ehWXXH/+WRJ1trNZYO4to2tK09WTgR0IKpIG1EZXYMBl+K1E3cRn3rsim4dTDyd
         bTnIxpTLTvsXmEC/a5a5gd4N4/THFL+ssLaIJh7OVcxNPdnp3xTaWg6NJ9E6RnsJOYSI
         RtdBRXlmeVRR1Nq8HXHBBqa1wn1ogagdpLkLGY6dgq9rxj7MWRzrQEBYgtrj8luOJXxE
         GO9PaPjqZeGMHqlkjdr0Mri5leI9ZphGGjCXv5GWi218hgJ3Nk3opKYUX0A2TGT8E9JZ
         rYtQ==
X-Gm-Message-State: AOAM5318A53CpksBZwJnQS8By70uYMRq+HlXPpYAyZSwTjAK/nGS8/7i
        y7bEcq/UUEnNBVC28qxew+xVv08pgb62JfhO66VDVg==
X-Google-Smtp-Source: ABdhPJwRPQr41TzGGubT9xP6LgHUMl8H/FP3EK4h9RyLrSX0+iQf9uf4rujn6Q6KBYWRRUPjudd+LJsyzvWEUI/+CpI=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr10421533otl.77.1646081768677; Mon, 28
 Feb 2022 12:56:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 12:56:08 -0800
MIME-Version: 1.0
In-Reply-To: <20220228075446.466016-4-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com> <20220228075446.466016-4-dmitry.torokhov@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 12:56:08 -0800
Message-ID: <CAE-0n50xkGUoJvy5BLBPgR67nFGLfyL50qO2dHUuMpxrZd=2gw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] HID: google: extract Vivaldi hid feature mapping
 for use in hid-hammer
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        "Sean O'Brien" <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TRACKER_ID,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-02-27 23:54:44)
> diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
> new file mode 100644
> index 000000000000..c88b26f4c78b
> --- /dev/null
> +++ b/drivers/hid/hid-vivaldi-common.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0
[...]
> +/**
> + * vivaldi_feature_mapping - Fill out vivaldi keymap data exposed via HID
> + * @hdev: HID device to parse
> + * @field: HID field to parse
> + * @usage: HID usage to parse
> + *
> + * This function assumes that driver data attached to @hdev contains an

Maybe add

Note: This function assumes ...

> + * instance of &struct vivaldi_data in the very beginning.

It makes me nervous that this can't be checked statically but OK.

> + */
> +void vivaldi_feature_mapping(struct hid_device *hdev,
> +                            struct hid_field *field, struct hid_usage *usage)
> +{
> +       struct vivaldi_data *data = hid_get_drvdata(hdev);
> +       struct hid_report *report = field->report;
> +       u8 *report_data, *buf;
> +       u32 report_len;
> +       unsigned int fn_key;
> +       int ret;
[...]
> +
> +static DEVICE_ATTR_RO(function_row_physmap);
> +static struct attribute *vivaldi_sysfs_attrs[] = {
> +       &dev_attr_function_row_physmap.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group vivaldi_attribute_group = {
> +       .attrs = vivaldi_sysfs_attrs,
> +};
> +
> +/**
> + * vivaldi_feature_mapping - Complete initialization of device using vivaldi map

vivaldi_input_configured

> + * @hdev: HID device to witch vivaldi attributes should be attached

s/witch/which/

> + * @hidinput: HID input device (unused).

Drop the period? It's not on the hdev argument description above.

> + */
> +int vivaldi_input_configured(struct hid_device *hdev,
> +                            struct hid_input *hidinput)
