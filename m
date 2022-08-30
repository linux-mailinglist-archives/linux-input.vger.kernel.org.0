Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E1C5A6486
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 15:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiH3NTc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 09:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiH3NTb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 09:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAA1D759D
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661865569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+ZJucRFzP0ayhKSO7eFHYNxNFfqjKnpysabZIYewPR8=;
        b=KT9q0bGO68fSDpDdJoPKZPuyLc5unfo1TAzxT6Qw35uLuqPBhGBcp/yIeAvFNSk7RAoAdw
        tsprHyIJ6eyLgFMo5Ev6/f6O+los/Vi2409RblCeNXKsIOodMDlLz+Ul4W6J+NCYOVBoPm
        0pI8cS0kj2Kzx/pD/H9hfVVJ+1A7GLY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-dZ5KfWzYMWCe2RTeE5Xfjg-1; Tue, 30 Aug 2022 09:19:27 -0400
X-MC-Unique: dZ5KfWzYMWCe2RTeE5Xfjg-1
Received: by mail-pg1-f198.google.com with SMTP id w1-20020a63d741000000b0042c254a4ccdso2810842pgi.15
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+ZJucRFzP0ayhKSO7eFHYNxNFfqjKnpysabZIYewPR8=;
        b=qwy5P9hJ8Eu7QdROnspbtRqM4I4ez5RLsbQBbBW9VcMYSMi3oc9ZeaMbe4kfOB6ikr
         9O5Czi0O9T1RGWAj1PCoXXWxAFnCtoTwg3czU1gyNSL20Ils0eG5ETOBPdYC9XMRSk/2
         jNVBdk4BTB4/qC6HE3DwSvcLCbebivWkUGDylWbWg0bK6iktLTjAG5JyB0FlA8ONWvdH
         8MNfo1x/C19YhJWUzNGQmuL2Ubwnh3j4UD+o94RSZgBr45XzOKgIgRvECdzWk71ivfpr
         2+os0DYI+/S5kEURzspombKL19IPLKEDgVyMrGojMv3zTUb2Wpi7kwJu/CWuQNKpo4s4
         /LIg==
X-Gm-Message-State: ACgBeo3BauQ1G5ti350xJYPdiSX8Tq4+BcAoiHkOXSIS7NPheEu+h3tb
        Gcmz1r2RFMTGeZRTt6sgoTx45FzPnGY3uSv+6NVkw9rOypqT5K7wds61Eh+D52+yr6klTdL/DsG
        Z60Y1r3zrGKUayg1c7pxUxPWsL3QjT53B529XdjQ=
X-Received: by 2002:a17:902:b58a:b0:16e:f91a:486b with SMTP id a10-20020a170902b58a00b0016ef91a486bmr21758993pls.119.1661865566845;
        Tue, 30 Aug 2022 06:19:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6QgJ/r3IJlrK+UkmLEyiXHmoIMjYJVtmfcF6LF/f7ASn4LlgCJG6ONmBz9HAvmvZ42D9oq3LUKRHQdBtzyBQs=
X-Received: by 2002:a17:902:b58a:b0:16e:f91a:486b with SMTP id
 a10-20020a170902b58a00b0016ef91a486bmr21758967pls.119.1661865566616; Tue, 30
 Aug 2022 06:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220830113907.4886-1-hadess@hadess.net> <20220830113907.4886-4-hadess@hadess.net>
In-Reply-To: <20220830113907.4886-4-hadess@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 15:19:15 +0200
Message-ID: <CAO-hwJJWDFS7zCbGAvbDCx0e+xNCtr_A4gBx0T5M8WeDVhnPgA@mail.gmail.com>
Subject: Re: [v3 4/5] HID: logitech-hidpp: Fix "Sw. Id." for HID++ 2.0 commands
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 30, 2022 at 1:39 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> Always set a non-zero "Sw. Id." in the lower nibble of the Function/ASE
> and Software Identifier byte in HID++ 2.0 commands.
>
> As per the "Protocol HID++2.0 essential features" section in
> https://lekensteyn.nl/files/logitech/logitech_hidpp_2.0_specification_draft_2012-06-04.pdf
> "
> Software identifier (4 bits, unsigned)
>
> A number uniquely defining the software that sends a request. The
> firmware must copy the software identifier in the response but does
> not use it in any other ways.
>
> 0 Do not use (allows to distinguish a notification from a response).
> "
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215699
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 98ebedb73d98..9c8088d8879e 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -41,6 +41,9 @@ module_param(disable_tap_to_click, bool, 0644);
>  MODULE_PARM_DESC(disable_tap_to_click,
>         "Disable Tap-To-Click mode reporting for touchpads (only on the K400 currently).");
>
> +/* Define a non-zero software ID to identify our own requests */
> +#define LINUX_KERNEL_SW_ID                     0x06

For consistency, and as Peter already asked, please use 0x01 instead of 0x06.

The simple reason is that it was well known that the kernel used 0x01
from day one, and so we might have userspace application that uses
0x06, and in this case you are walking on their toes.

Cheers,
Benjamin

> +
>  #define REPORT_ID_HIDPP_SHORT                  0x10
>  #define REPORT_ID_HIDPP_LONG                   0x11
>  #define REPORT_ID_HIDPP_VERY_LONG              0x12
> @@ -343,7 +346,7 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
>         else
>                 message->report_id = REPORT_ID_HIDPP_LONG;
>         message->fap.feature_index = feat_index;
> -       message->fap.funcindex_clientid = funcindex_clientid;
> +       message->fap.funcindex_clientid = funcindex_clientid | LINUX_KERNEL_SW_ID;
>         memcpy(&message->fap.params, params, param_count);
>
>         ret = hidpp_send_message_sync(hidpp, message, response);
> --
> 2.37.2
>

