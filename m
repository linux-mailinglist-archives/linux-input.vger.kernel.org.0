Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161016B27B6
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 15:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjCIOse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 09:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjCIOsK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 09:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8E8F7EDD
        for <linux-input@vger.kernel.org>; Thu,  9 Mar 2023 06:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678373094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6bLsdByetxHu6U0aJe15zxYPzV/VC0JqJ57J4Z+iH2Y=;
        b=QSE+dSR8K8997nrrH932JctKTzX4Sv+PJ1dLhbDRpI4edYnv3p1XGsRSG7vX3j57/4gBkn
        ZrD3wLsC58nk5Inx3RGiNFhU4XxEzcpw6cAlJ8mh0z1cLwN0+bB46cLyBTzDNrF9a8cioe
        6zlyWQif5yzeg/ViZFbM5fFx9xUosks=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Avlj7cH2PQO3c2ry7IgzNQ-1; Thu, 09 Mar 2023 09:44:49 -0500
X-MC-Unique: Avlj7cH2PQO3c2ry7IgzNQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-536a4eba107so21674337b3.19
        for <linux-input@vger.kernel.org>; Thu, 09 Mar 2023 06:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bLsdByetxHu6U0aJe15zxYPzV/VC0JqJ57J4Z+iH2Y=;
        b=ywJGhrnw4LjqoA9yUYt6ZX6mrkOwLubF6+x6mWSlqrn262duUqBbBZcfJe7nMdaSr3
         cp2pV4GYg08daWVac5PgDjE/UfXhD+8SdqhdwwubUUojIBPxDo4NuZjYhnetA2zIF9eD
         /vUrIuuqd47GvZLWrHLZoXuGXxXC0eJJGi2sxld2KZfvTrXqunk7R/sNvd9ZjS/wOCcA
         XGv5qHpouZRE5V9aE/bBm5kvAiv6I8jvGd7SUuajy5EpfX9eyw2LaiESK0w9uCVQeYC+
         A1wKm2me59lk4MrpumkPn474UGhd0y5ui4mKQ3c3ilR8DZIjtHNjRKiCFahd/UazL8YL
         VBIw==
X-Gm-Message-State: AO0yUKXFsLaopsN75s4EITOXhFEk7Z+fWZj+EbZfxCpQPAGpCm2AKuU3
        xlqezjHV3r5Cd6FFZ8+YPmuDudLE+OpmbZXsdkovSHl3Aq2m/KJcl+VsnZbOPTx+RQUNd4EMiki
        7PSeQbYh9c2n+Dt+HROgFMPv+UoFXx283jRe1462aGucknt8=
X-Received: by 2002:a5b:c4e:0:b0:9f2:a1ba:6908 with SMTP id d14-20020a5b0c4e000000b009f2a1ba6908mr10873393ybr.12.1678373087427;
        Thu, 09 Mar 2023 06:44:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/IPCcisHieG2T7MWz4D+1e/UNrR57fzDSmOtSFea12wSccgfVkzPDlmmovHrH3YI0VZC25An8kPCuzSj1b9Tg=
X-Received: by 2002:a5b:c4e:0:b0:9f2:a1ba:6908 with SMTP id
 d14-20020a5b0c4e000000b009f2a1ba6908mr10873389ybr.12.1678373087172; Thu, 09
 Mar 2023 06:44:47 -0800 (PST)
MIME-Version: 1.0
References: <38F34842-3087-43CB-B814-CDBC52FD2084@getmailspring.com>
In-Reply-To: <38F34842-3087-43CB-B814-CDBC52FD2084@getmailspring.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 9 Mar 2023 15:44:36 +0100
Message-ID: <CAO-hwJJ63Nr0YqX4UMvR_UUgBLX=MCgxZEyuuf7PC_Hwv4d7tg@mail.gmail.com>
Subject: Re: [PATCH] HID: hidraw: Keep the report ID on buffer in get_report
To:     Antoine C <contact@antoinecolombier.fr>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 9, 2023 at 12:36=E2=80=AFPM Antoine C <contact@antoinecolombier=
.fr> wrote:
>
> The ioctl syscall with arg HIDIOCGINPUT must not override
> the report ID contained in the first byte of the buffer
> and should offset the report data next to it.
>
> Signed-off-by: Antoine Colombier <kernel@acolombier.dev>
> ---
> Hello,
>
> Apologies for the resend, I forgot to disable the HTML format on the
> previous email. Please ignore the previous one.
>
> This addresses the bug report in the hidapi: https://github.com/libusb/hi=
dapi/issues/514
> The patch was tested using the test snippets attached in the issue above
> on 6.2.0-76060200-generic (PopOS 22.04)

The problem is that hidapi is not the sole user of hidraw, and this is
a breaking change for everyone.

If we were to accept this, when hidraw has always been that way on
linux since 2011 when it was introduced, you can be sure that there
are going to be very angry users who suddenly have a failure when
retrieving the input/feature report.
So if hidapi expects the first byte to stay the same, just fix that
case when calling that hidraw ioctl in hidapi.

A possible solution would be to add a new ioctl with a "better"
behavior, but a new ioctl will actually be worse because you have to
update both the kernel *and* hidapi to make use of the new ioctl, at
which point, just fixing userspace is actually simpler and better.

Cheers,
Benjamin

>
>  drivers/hid/hidraw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
>
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index 197b1e7bf029..2c12f25817e6 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -231,9 +231,10 @@ static ssize_t hidraw_get_report(struct file *file,
> char __user *buffer, size_t
>   if (ret < 0)
>   goto out_free;
>
> + count--;
>   len =3D (ret < count) ? ret : count;
>
> - if (copy_to_user(buffer, buf, len)) {
> + if (copy_to_user(buffer + 1, buf, len)) {
>   ret =3D -EFAULT;
>   goto out_free;
>   }
>

