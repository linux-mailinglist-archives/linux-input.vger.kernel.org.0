Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D2C680785
	for <lists+linux-input@lfdr.de>; Mon, 30 Jan 2023 09:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235621AbjA3IhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 03:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjA3IhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 03:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2E918153
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675067796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
        b=TfdTnAlyUueo5ZKYZ/XZbyfsXu4mhbBSmIaPx731l+EeVVg5B+VzErIlPdvp4ydySRV7z9
        aobGKFlNEOVPioC8xw+Hd4JhOKj8QcWmvQwhqtGa5fkT8do5PRgXC6Kgrp+tilxeKVo6wK
        KrzSzOXSIOE7V8ySEwBbOHTNA6jXTDA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-sN-Rv5JQPnmmCx3Tg5MpcA-1; Mon, 30 Jan 2023 03:36:35 -0500
X-MC-Unique: sN-Rv5JQPnmmCx3Tg5MpcA-1
Received: by mail-ed1-f72.google.com with SMTP id o21-20020aa7dd55000000b004a245f58006so1454763edw.12
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
        b=uo81j5+plraEZ7Jbppbl9DmY4tE/KKLVT6egB10Cik6y5tM/ZXZMup0kSjZKSr5Ep3
         Oa+IdVc7O/3o/8I848ZGRoSI+2QAQUNWGUPttyplt0F2hhCaJEYsQH7UDZ+quOiLNJ96
         67DhaFaU+DeyW6fgQN/EA4uCaqu4imqnKOR74FE/TeT9Dzfc9U5eShlw0Fkb7XX92noL
         MJgY0Sc5yJKIo5KSkvczq+M6cie6LBFcWuRggG85einko4LnYatwKRVr6sTJnA3KjDjX
         uhljoln6cfHwIb0taO2V9B1K0Nc+b3nqgsI8QyLl0xVG3wsnM3ulW3KzmTdLlsWR4Bp1
         bmqA==
X-Gm-Message-State: AO0yUKVLbryiIby1JoYHjjNL2qQCL1ym2jFAfqwTfzTMqsqk9nqexW12
        +yP/0RSZO4Q3LQODOYlBvO4xXsXW2iBUajPcSzuHU6LrpaETuMDomkrprfyDxBvLn9RmiICk3XN
        39z8U0PtlYG/67RKmDl1Gho8=
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019126ejs.11.1675067794095;
        Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/0R+gvMcJBFdYRnrzzxOkxWBZLXr5z/Tqk0BP+fIcTMCHK94EHX6VpDr3nSMq6rTGD5CNmOQ==
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019103ejs.11.1675067793927;
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906714200b00888161349desm1582823ejj.182.2023.01.30.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Message-ID: <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
Date:   Mon, 30 Jan 2023 09:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
        linux-staging@lists.linux.dev
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/30/23 04:59, Thomas Weißschuh wrote:
> Since 52d225346904 ("HID: Make lowlevel driver structs const") the
> lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structures, too.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll also pick up / merge patches 7 + 8 into pdx86/for-next
sometime this week.

Regards,

Hans



> ---
> Thomas Weißschuh (9):
>       HID: amd_sfh: Constify lowlevel HID driver
>       HID: hyperv: Constify lowlevel HID driver
>       HID: logitech-dj: Constify lowlevel HID driver
>       HID: steam: Constify lowlevel HID driver
>       HID: intel-ish-hid: Constify lowlevel HID driver
>       HID: surface-hid: Constify lowlevel HID driver
>       platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
>       platform/x86: asus-tf103c-dock: Constify toprow keymap
>       staging: greybus: hid: Constify lowlevel HID driver
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c      | 2 +-
>  drivers/hid/hid-hyperv.c                   | 2 +-
>  drivers/hid/hid-logitech-dj.c              | 4 ++--
>  drivers/hid/hid-steam.c                    | 2 +-
>  drivers/hid/intel-ish-hid/ishtp-hid.c      | 2 +-
>  drivers/hid/surface-hid/surface_hid_core.c | 2 +-
>  drivers/platform/x86/asus-tf103c-dock.c    | 4 ++--
>  drivers/staging/greybus/hid.c              | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: e04955db6a7c3fc4a1e6978649b61a6f5f8028e3
> change-id: 20230130-hid-const-ll-driver-fcfdd3af11b8
> 
> Best regards,

