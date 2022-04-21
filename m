Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED432509AA5
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 10:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386640AbiDUIaZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 04:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386600AbiDUIaZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 04:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB27012749
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650529654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=y9L43dIAoZA8/KK54NyaMxBpfO1m5+AMY2eIRV3UDqs=;
        b=bAqqikjjf3wtSPNMVnndEZFBp3meehCqbpGyyFYMUIIp+UR5kErZkjXxnh+kBcO92JACdn
        uSP1LeYasCqW8dOQifXETPDH5uRFIWApoiu1574/3LwDU9ICNT9C7Wyeg0MXWja0usiGr+
        1OGOcUWbPuNetE44vjsZqIhT6NhaM/Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-O6N7Nig4NSGwjKYM15R5DA-1; Thu, 21 Apr 2022 04:27:33 -0400
X-MC-Unique: O6N7Nig4NSGwjKYM15R5DA-1
Received: by mail-pj1-f70.google.com with SMTP id j24-20020a17090aeb1800b001d17733a1a6so4676659pjz.6
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 01:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9L43dIAoZA8/KK54NyaMxBpfO1m5+AMY2eIRV3UDqs=;
        b=6rAC1vqfx0DjKTD9Oh76QWlh09qSaYAy2lu53MDu/3V3GvY+JdpA9WFISkT8TE0XrQ
         /gSPT+Y+m8u4qNBuMu0KM6Xn1OF4tS5KCZzlt8SmHT1OsDgVTHbGhOFfpEwjCXGkJRpg
         28EgMIFzpgp2REoT9tuBHer2A9572ADSUoO/w0UqM+Zdt2qFIUErbcZ310B4Ud747lX0
         UT/1ELNH1Bzew+NewGoR5H3LfCyxrhjOC6oGFJHhLjE8d5sX5nPJMpZ0UKrEfFFx/ZlH
         4vBRftxz2PEfuwpJ8fNJsdB/RhBgdas0qvB0Le8vHTQEBailULh2q0tpm/HeKxEd08q7
         aHjA==
X-Gm-Message-State: AOAM533o9lVZdMjkQJ/QbC707NMc9UaR+qJmW1fmYVEtP4j3iXBT5+zI
        FK5WsGv5WI36RjNWHbcrZ0JDQuWYXOEW8hx/lXpxCHqiM1Lggs07DJpgfBRVEGWVzkhwq/OmxtI
        l6hMLCSr1QeTYWunavyYMM9w+sDgtzuRWwz8sPLQ=
X-Received: by 2002:a17:90b:4c42:b0:1d2:8eeb:108 with SMTP id np2-20020a17090b4c4200b001d28eeb0108mr9164831pjb.113.1650529652354;
        Thu, 21 Apr 2022 01:27:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUKPbhL+bIFh0XEyrXadUZ97RKTrLxCOLElOfX7wu3xgGOUaYC2K63ypMe9J4tgMSEMofkqFmGWG5y8/LZPto=
X-Received: by 2002:a17:90b:4c42:b0:1d2:8eeb:108 with SMTP id
 np2-20020a17090b4c4200b001d28eeb0108mr9164819pjb.113.1650529652145; Thu, 21
 Apr 2022 01:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <CO6PR03MB6241819B3312BAD5A4DDE332E1F39@CO6PR03MB6241.namprd03.prod.outlook.com>
In-Reply-To: <CO6PR03MB6241819B3312BAD5A4DDE332E1F39@CO6PR03MB6241.namprd03.prod.outlook.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 21 Apr 2022 10:27:21 +0200
Message-ID: <CAO-hwJJkp0EPEaV_Ws4ZFLPk+RafcjVUX8QphwzqFJ+AMsQmzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hid: multitouch: add module paramter to override quirks
To:     Tao Jin <tao-j@outlook.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        linux-kernel@vger.kernel.org,
        Bingchen Gong <gongbingchen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Apr 18, 2022 at 5:18 AM Tao Jin <tao-j@outlook.com> wrote:
>
> There is a sysfs interface to specify the quirks. However, some
> quirk bits such as HID_QUIRK_MULTI_INPUT are only read once during
> init/probe. Setting the quirks in sysfs does not make any change to the
> behaviors related to those bits. Also, it is hard to wait for udev to
> modify the quirks in case there is a rule given the current init and
> state machine structure.
>
> A simple kernel paramter is provided so that any time a custom quirk
> needs to be tested can be easily applied. This enables the users to test
> out which bits are indeed necessary with just a rmmod then
> insmod/modprobe cycle. Thus, new hardware support can be added very
> soon and unneccsary mildly costly quirks using mutex and timer can also
> be removed based on user's self-test.

I don't think the last sentence above is adding anything. I don't see
where the mutex and timers are related to this patch.

>
> Co-Developed-by: Bingchen Gong <gongbingchen@gmail.com>
> Signed-off-by: Bingchen Gong <gongbingchen@gmail.com>
> Signed-off-by: Tao Jin <tao-j@outlook.com>
> ---
>  drivers/hid/hid-multitouch.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 3ea57f3..c6d64f8 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -398,6 +398,10 @@ static const struct mt_class mt_classes[] = {
>         { }
>  };
>
> +static int override_quirks = -1;
> +module_param(override_quirks, int, 0444);
> +MODULE_PARM_DESC(override_quirks, "Signed integer to override quirks in mtclass, must >= 0 to enable override.");
> +
>  static ssize_t mt_show_quirks(struct device *dev,
>                            struct device_attribute *attr,
>                            char *buf)
> @@ -1749,7 +1753,12 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         if (id->group != HID_GROUP_MULTITOUCH_WIN_8)
>                 hdev->quirks |= HID_QUIRK_MULTI_INPUT;
>
> -       if (mtclass->quirks & MT_QUIRK_FORCE_MULTI_INPUT) {
> +       if (override_quirks >= 0) {
> +               hid_info(hdev, "overriding quirks with: %d(0x%x)", override_quirks, override_quirks);
> +               td->mtclass.quirks = override_quirks;
> +       }
> +
> +       if (td->mtclass.quirks & MT_QUIRK_FORCE_MULTI_INPUT) {
>                 hdev->quirks &= ~HID_QUIRK_INPUT_PER_APP;
>                 hdev->quirks |= HID_QUIRK_MULTI_INPUT;
>         }
> @@ -1760,7 +1769,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         if (ret != 0)
>                 return ret;
>
> -       if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
> +       if (td->mtclass.quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)

The 2 changes "s/mtclass->quirks/td->mtclass.quirks/" should probably
be added as a separate patch (before this one). The reason is that
hid_parse might change the quirks values, and
MT_QUIRK_FIX_CONST_CONTACT_ID and MT_QUIRK_FORCE_MULTI_INPUT might be
different from the class definition at the end of probe, so
definitively, this is a bug (without consequences) that should be
addressed separately.

Cheers,
Benjamin

>                 mt_fix_const_fields(hdev, HID_DG_CONTACTID);
>
>         ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> --
> 2.35.1
>

