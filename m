Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66726604C11
	for <lists+linux-input@lfdr.de>; Wed, 19 Oct 2022 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbiJSPsE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Oct 2022 11:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiJSPrV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Oct 2022 11:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3A91ABEC6
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666194050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=irtRw/ObYM3H1Qw7IuZvbpJZN7jp2rsEVf0tl33Bzes=;
        b=YXBZ9NGptzl3WW4b1C+9EDEOsOzN57lwWp5H4bzThZMETWG1kz5tc4toE/g3rE/qnxs7bK
        xs/c4SEDyCwEezvDjTNxvwfx5yq6jw2t3uB1Wkl0Pb6HaCklkPewWf3l64CrvbEJiBiqWV
        +AETF3RSW76WmFgkojrOpolqMYaPJKQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-oKUmXIxCPJeoRlk7tY4HiQ-1; Wed, 19 Oct 2022 11:40:48 -0400
X-MC-Unique: oKUmXIxCPJeoRlk7tY4HiQ-1
Received: by mail-lj1-f198.google.com with SMTP id n5-20020a2e86c5000000b0026fb0a05122so7425734ljj.11
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 08:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irtRw/ObYM3H1Qw7IuZvbpJZN7jp2rsEVf0tl33Bzes=;
        b=oyS+2XZllFJHlCWTsuDfJLy4WMJKt2eUZ2roXronc27YqVazAhRJ/BXLSDu9cuz4+e
         EIyc5uih2SYtr0qe0ySzKERXtFgj2645vruM2F9ghlvcvOinwsFxC/20U6SGuCpas2QB
         Mcs2/uuEQjgtvN9jZBAJobEAz+bBsrUMNDKskD7hTK16Sb12ecLFoIiPQmvJL9kS3w1j
         jLM6awOtth4fy1fYjhjPrMffqt8r2d+XijlQNjNqmndxt+rOj27k+IcVCOmxS4NAAx2p
         dCTj/pgss9Q4zVl2oYL4NpktqQ/Etz2FQ59wI2m+x9doJ7Rbrwz2ENWZu9iDfmhW0bbV
         dl3Q==
X-Gm-Message-State: ACrzQf0dhoUHpJeS+hIJ7NaQZRhu13xSOuiXJLc5SAPvGfEGgWrdnN7Q
        8g/2JNFFF0/Z+oSYgO+50G5ll0GuJXe111AFBvSUYqrzDjdVNnJupOhIZ1ki4kEEWx9jrwXpnW8
        RK3kdRcllSDPDCGG2EON54Gnd1jfTvMGgYvapM6I=
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id p9-20020ac246c9000000b004a447ccfc9dmr3296865lfo.1.1666194047233;
        Wed, 19 Oct 2022 08:40:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gdtGTMyLShVPOsOgc9LPS/Q1NW7BqsMC3ZTtE5VOfALbC3jdEs9wdfpwJRaW0e/8X3bE1vFEkVBKc278JVoM=
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id
 p9-20020ac246c9000000b004a447ccfc9dmr3296852lfo.1.1666194047029; Wed, 19 Oct
 2022 08:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221019151832.44522-1-jason.gerecke@wacom.com>
In-Reply-To: <20221019151832.44522-1-jason.gerecke@wacom.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 19 Oct 2022 17:40:35 +0200
Message-ID: <CAO-hwJLnuvfic+8vw6OzM0NV66eL40-QEVvXj97dxVimbF7PDA@mail.gmail.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
To:     "Gerecke, Jason" <killertofu@gmail.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 19, 2022 at 5:18 PM Gerecke, Jason <killertofu@gmail.com> wrote:
>
> From: Jason Gerecke <jason.gerecke@wacom.com>
>
> "Digitizer" is a generic usage that may be used by various devices but
> which is particularly used by non-display pen tablets. This patch adds the
> usage to the list of values matched by the IS_INPUT_APPLICATION() macro
> that determines if an input device should be allocated or not.
>
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> ---
>  include/linux/hid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 4363a63b9775..07803e144d98 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hdev)
>  /* We ignore a few input applications that are not widely used */
>  #define IS_INPUT_APPLICATION(a) \
>                 (((a >= HID_UP_GENDESK) && (a <= HID_GD_MULTIAXIS)) \
> -               || ((a >= HID_DG_PEN) && (a <= HID_DG_WHITEBOARD)) \

FWIW, this has always been problematic, and I am pretty  sure this is
breaking existing devices.

Have you been running the hid-tools testsuite to see if there were any
regressions?

Cheers,
Benjamin

> +               || ((a >= HID_DG_DIGITIZER) && (a <= HID_DG_WHITEBOARD)) \
>                 || (a == HID_GD_SYSTEM_CONTROL) || (a == HID_CP_CONSUMER_CONTROL) \
>                 || (a == HID_GD_WIRELESS_RADIO_CTLS))
>
> --
> 2.38.0
>

