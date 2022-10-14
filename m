Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3885FED64
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 13:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiJNLrj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 07:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiJNLrd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 07:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B95133303
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665748044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EM/2udl+mwBmY3Xe6Rcv1yYGaIP3m5XRtCTxReKYVC8=;
        b=PSTvpiNpooe/mYMqdp6ukiqKqWvM20Kd3yXgFy2et26qUXbiG4VFxQ1CfBfSTj9k5VDGxM
        8hBBcbjBo6XqtIRD+KYVRWtmqZBhW78cFKdLuOb+xqCYJmQlGLmyiGDvkD8+bVU+PaRykR
        t/RdLJEphgSKQhrgEhWS1Iaa4qg+dvg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-IZK4tWb7NGe0MVRQ0cQDeg-1; Fri, 14 Oct 2022 07:47:23 -0400
X-MC-Unique: IZK4tWb7NGe0MVRQ0cQDeg-1
Received: by mail-il1-f200.google.com with SMTP id g13-20020a056e021e0d00b002fc57cd18e3so3729335ila.11
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 04:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EM/2udl+mwBmY3Xe6Rcv1yYGaIP3m5XRtCTxReKYVC8=;
        b=Ff6EKjbuMoN50CGk3XNLkFvFi+7PsxBG5Fkt2LDYVEepLyWdC7Gt+c+f8Bb90CMklp
         dJY9iKs1eftd8xy+LBWLrWHf28ghJ3ypVn+c/vQgHi+BI9rZZgWZ7CRe3T1ex3UB3yFP
         wVd1Rpoo4rs6q687VteTXiZVGc0fC4mFaiDBBxUr7flQU0mp+I8iQSunXO2p1s7bl00z
         vkNkqgWHxO/lM+BrlfcG2+rrD6gibXTiyWMZkO4XFtbab3CsHSd0tuFUeRtCUhTk0zPY
         jzWwii2z0RF9zvSNDbYiE22YHPZyxQ6JY2NjQ1IXxeGHyR8K7sflpwEcx/IyzmnYscLW
         vtlQ==
X-Gm-Message-State: ACrzQf2Q0v88c1ZeGlvdUn0lysKpaQP7TizubN1AN0WOVeS8Ut0+u8D+
        Zd3pe8P+rWtxrfGJEVKHobqtHe1+rBWg5Gvia48mm2MJTuU5XLoQTb208nvOIFj9+j/SD1meTi5
        Oy/Q+InuTGXUJsI8IT61Tt54ZDepch3ihUDBgNkA=
X-Received: by 2002:a05:6e02:194e:b0:2f8:fa94:9da1 with SMTP id x14-20020a056e02194e00b002f8fa949da1mr2299227ilu.102.1665748042175;
        Fri, 14 Oct 2022 04:47:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ierqUNm9GsEhiS7GRlvKmYjhJH4v4J+1Z0XQ4EIcZ9aBGAmiId0pNxCX8gk5O0T8Izxq4sd4YwH/utqaiZ/o=
X-Received: by 2002:a05:6e02:194e:b0:2f8:fa94:9da1 with SMTP id
 x14-20020a056e02194e00b002f8fa949da1mr2299217ilu.102.1665748041918; Fri, 14
 Oct 2022 04:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221010212313.78275-1-roderick.colenbrander@sony.com> <20221010212313.78275-4-roderick.colenbrander@sony.com>
In-Reply-To: <20221010212313.78275-4-roderick.colenbrander@sony.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Oct 2022 13:47:10 +0200
Message-ID: <CAO-hwJKp2gzgPaCivT1Ak4=NZOcb0wyWbOyWnhsyDQgx1UC9AA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: playstation: support updated DualSense rumble mode.
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 10, 2022 at 11:23 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> Newer DualSense firmware supports a revised classic rumble mode,
> which feels more similar to rumble as supported on previous PlayStation
> controllers. It has been made the default on PlayStation and non-PlayStation
> devices now (e.g. iOS and Windows). Default to this new mode when
> supported.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  drivers/hid/hid-playstation.c | 37 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 396356b6760a..2a9870a62301 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -108,6 +108,9 @@ struct ps_led_info {
>  #define DS_STATUS_CHARGING             GENMASK(7, 4)
>  #define DS_STATUS_CHARGING_SHIFT       4
>
> +/* Feature version from DualSense Firmware Info report. */
> +#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
> +
>  /*
>   * Status of a DualSense touch point contact.
>   * Contact IDs, with highest bit set are 'inactive'
> @@ -126,6 +129,7 @@ struct ps_led_info {
>  #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
>  #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
>  #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
> +#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
>  #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
>  #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
>
> @@ -143,6 +147,9 @@ struct dualsense {
>         struct input_dev *sensors;
>         struct input_dev *touchpad;
>
> +       /* Update version is used as a feature/capability version. */
> +       uint16_t update_version;
> +
>         /* Calibration data for accelerometer and gyroscope. */
>         struct ps_calibration_data accel_calib_data[3];
>         struct ps_calibration_data gyro_calib_data[3];
> @@ -153,6 +160,7 @@ struct dualsense {
>         uint32_t sensor_timestamp_us;
>
>         /* Compatible rumble state */
> +       bool use_vibration_v2;
>         bool update_rumble;
>         uint8_t motor_left;
>         uint8_t motor_right;
> @@ -812,6 +820,15 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
>         ds->base.hw_version = get_unaligned_le32(&buf[24]);
>         ds->base.fw_version = get_unaligned_le32(&buf[28]);
>
> +       /* Update version is some kind of feature version. It is distinct from
> +        * the firmware version as there can be many different variations of a
> +        * controller over time with the same physical shell, but with different
> +        * PCBs and other internal changes. The update version (internal name) is
> +        * used as a means to detect what features are available and change behavior.
> +        * Note: the version is different between DualSense and DualSense Edge.
> +        */
> +       ds->update_version = get_unaligned_le16(&buf[44]);
> +
>  err_free:
>         kfree(buf);
>         return ret;
> @@ -974,7 +991,10 @@ static void dualsense_output_worker(struct work_struct *work)
>         if (ds->update_rumble) {
>                 /* Select classic rumble style haptics and enable it. */
>                 common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
> -               common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
> +               if (ds->use_vibration_v2)
> +                       common->valid_flag2 |= DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2;
> +               else
> +                       common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
>                 common->motor_left = ds->motor_left;
>                 common->motor_right = ds->motor_right;
>                 ds->update_rumble = false;
> @@ -1348,6 +1368,21 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>                 return ERR_PTR(ret);
>         }
>
> +       /* Original DualSense firmware simulated classic controller rumble through
> +        * its new haptics hardware. It felt different from classic rumble users
> +        * were used to. Since then new firmwares were introduced to change behavior
> +        * and make this new 'v2' behavior default on PlayStation and other platforms.
> +        * The original DualSense requires a new enough firmware as bundled with PS5
> +        * software released in 2021. DualSense edge supports it out of the box.
> +        * Both devices also support the old mode, but it is not really used.
> +        */
> +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +               /* Feature version 2.21 introduced new vibration method. */
> +               ds->use_vibration_v2 = ds->update_version >= DS_FEATURE_VERSION(2, 21) ? true : false;

I have removed the extra "? true : false" and applied the full series
to for-6.1/upstream-fixes.

I'll let things in for-next for a few days and hopefully send it to
Linus next week.

Cheers,
Benjamin

> +       } else if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
> +               ds->use_vibration_v2 = true;
> +       }
> +
>         ret = ps_devices_list_add(ps_dev);
>         if (ret)
>                 return ERR_PTR(ret);
> --
> 2.37.3
>

