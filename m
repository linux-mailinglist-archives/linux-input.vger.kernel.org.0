Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A392E483441
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 16:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiACPcT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 10:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49854 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231320AbiACPcT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jan 2022 10:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641223938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HliNpOEJJNbTwtY+nGH0OhpBCQiEPjmmG0pxCb8hm+A=;
        b=H13HTPwHUTQks8OJFtP4EQp5i0smbdL/gU+ihIaUcn8/ZdtVB3jcaQAtcqKU3vHTrJJiSQ
        iT95px3BxS/i9XSqNEUsCY731US2I8fHcRS+FZKha1VeKWkeEFW/yG9/QmCHA5Aen+eOLR
        JqdStJ+5B/xITAi6zWQSnrRtdRk733g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-Qr3uF8VOP-6XDD27oFM_Fw-1; Mon, 03 Jan 2022 10:32:16 -0500
X-MC-Unique: Qr3uF8VOP-6XDD27oFM_Fw-1
Received: by mail-pj1-f71.google.com with SMTP id a14-20020a17090a8c0e00b001b2c566be8dso81633pjo.2
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 07:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HliNpOEJJNbTwtY+nGH0OhpBCQiEPjmmG0pxCb8hm+A=;
        b=bR3ABZIlytidbI9jvAUWzD5LlMX0mbKW5KMAzrGrSe+cs92OL1THy4Ip9LdaFsQrUR
         VCc0Fm7YhwCcDI0gxQbt4J0tYmr5CtxDsF6DaU5164OeeHGHUEsp0cgnNlaRVwBFswH1
         BaU4Unho8mHi74aZWfwFKJPeSkItSN1+6mKwViHKTsJjfDpYDtFJZ8wNPXxHKRTYxjTR
         wqjN9dOLD6cDSiWOakc2smvqgp4jpR2iqD6mFWfdYi/hBenhsOTDrtDZaWlJigwCetRj
         4156HhU8ueLg2wLtlj6VFSbAWO3UQhhwwR1bsM9udaukU9b0org/y6QSdLBsgdTWbmFH
         es7Q==
X-Gm-Message-State: AOAM530eBssR/Hy5Y3uMo5jfegdNk1Ktg/ngxzvMr1taZTavRUuIFZig
        RvczUA5MmfzJ6bD8n3SVScGrzr+ZJ293PzKt2LkqLchZjZu9iUa2Yk/THSgqMgteeT591cvukWG
        zrE14uMUsdNLcxbCNHWzIJT/yOLD+9AizrzyacJQ=
X-Received: by 2002:a63:78c5:: with SMTP id t188mr24644787pgc.363.1641223935575;
        Mon, 03 Jan 2022 07:32:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcgrqhF+L0UqOZ3T2Jc1OD0FsL47TnFmM2Wy1bP+VI76T724a6cb/rIDxyMWW48eHRDBFbRqb4ca42H8lAYY8=
X-Received: by 2002:a63:78c5:: with SMTP id t188mr24644767pgc.363.1641223935376;
 Mon, 03 Jan 2022 07:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-5-dmanti@microsoft.com>
In-Reply-To: <20211229231141.303919-5-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jan 2022 16:32:04 +0100
Message-ID: <CAO-hwJKoqZgVjAHtD8_7_GE09ij3UzWU7WeQfEtmAhpVR9SPhQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] HID: add reset() field to struct hid_ll_driver
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> This new API allows a device driver to reset the device.
>
> Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> ---
>  include/linux/hid.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 97041c322a0f..129b542e1adb 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -823,6 +823,7 @@ struct hid_driver {
>   * @output_report: send output report to device
>   * @idle: send idle request to device
>   * @may_wakeup: return if device may act as a wakeup source during system-suspend
> + * @reset: reset the device

I'm OK with this, but we probably expand it a little bit more (and in
the commit description too). What are we supposed to reset here? Just
assert the reset line or do a full probe of the device with re-asking
for the device descriptor, then the report descriptor?

If you can, it would be very nice (but not mandatory) to implement the
expected reset callback in i2c-hid or usbhid, so we get an idea on
what need to be done in that case. (i2c-hid would probably be closer
to spi-hid).

Cheers,
Benjamin

>   */
>  struct hid_ll_driver {
>         int (*start)(struct hid_device *hdev);
> @@ -848,6 +849,8 @@ struct hid_ll_driver {
>
>         int (*idle)(struct hid_device *hdev, int report, int idle, int reqtype);
>         bool (*may_wakeup)(struct hid_device *hdev);
> +
> +       void (*reset)(struct hid_device *hdev);
>  };
>
>  extern struct hid_ll_driver i2c_hid_ll_driver;
> --
> 2.25.1
>

