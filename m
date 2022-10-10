Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931245F9BBA
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 11:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiJJJQ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiJJJQ5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 05:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C078175BB
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665393413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=f7FFqlw7iRHCFCsL8WYd7/wL+sVoulh1xuopPw+9mC4=;
        b=Ydb5f87NpNA7ovqKSNdlmyXH95zJeJUCUCkt+e+h637/GeUl8eC/ulFxgLX79r62c48B/Q
        liu2qgrMheQ/mGJbBie9RANHiPqZ29/ONTBXCyypSAyMJJrB2i9r2qq4hBcIlXylEKvCJ8
        94XD2y+Hj/eQq//Kfn5o+GdGXuKc+78=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-NByJx-DXPDeKZQi-wIwGQA-1; Mon, 10 Oct 2022 05:16:51 -0400
X-MC-Unique: NByJx-DXPDeKZQi-wIwGQA-1
Received: by mail-il1-f200.google.com with SMTP id h10-20020a056e021d8a00b002f99580de6cso8273100ila.5
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 02:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7FFqlw7iRHCFCsL8WYd7/wL+sVoulh1xuopPw+9mC4=;
        b=igmVt7zBAlHSptajQAwiekGGKGtKeUlBCmGcLMD4lXWTrkTB5HYXvX14HFj4mnv16n
         ySKs6Xc43DDAecVQx6Q8j9qelsmHDfvtDVoE3w0NcRDPpUnhBlhXMrXP6/k3FnkeK4yY
         Mr7HlBln+Ix8jYG1PgKm6mThWUrZyZ3qOBq66zBVgceeqNWKHRCqgLUIfheYdE0HSYXL
         pMGgu93zZccVEy9oQO4qzq23tKzpzkURHzZ1shk1erOhA6VcBgb9HwCkiBKtdvc/jMWo
         MKH6mfeeDhF5WMGs4nbCrF4WwgMaZvYcJJTKbArU3S9vTd9g1Rix9IKwSwXdeIW5uC1w
         JhmQ==
X-Gm-Message-State: ACrzQf0lF78XYsG8Jty0PsWRfPmHerntAnpvADqwV+wwgOyaglH1RTen
        bb4qia4MHeF4FqxfId31QNKwklTcot06/e0j97r4sKZ4aQgOFt0Ed6UtWY9mY+CMIAd+Tzo/qG4
        yC8FCm0T073iOYgL2SsCHWUm+2NGSuEwZUY5jZ+k=
X-Received: by 2002:a05:6638:370d:b0:35a:91f0:e358 with SMTP id k13-20020a056638370d00b0035a91f0e358mr9070785jav.84.1665393410892;
        Mon, 10 Oct 2022 02:16:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OyTk3az283CaahrIOrySAejKR6o9+gcEdDK0LN4rALmQaopMuTkN25qdqemDJxo2oOHX4rTMGHvVOlV+G8XI=
X-Received: by 2002:a05:6638:370d:b0:35a:91f0:e358 with SMTP id
 k13-20020a056638370d00b0035a91f0e358mr9070772jav.84.1665393410624; Mon, 10
 Oct 2022 02:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221006020151.132434-1-roderick.colenbrander@sony.com> <20221006020151.132434-4-roderick.colenbrander@sony.com>
In-Reply-To: <20221006020151.132434-4-roderick.colenbrander@sony.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 10 Oct 2022 11:16:39 +0200
Message-ID: <CAO-hwJJF4ej8J9GLb+pCaH0Ke+xLqxa6Fz5BFQ895DX5fmjPmA@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: playstation: support updated DualSense rumble mode.
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

Hi Roderick,

On Thu, Oct 6, 2022 at 4:02 AM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> Newer DualSense firmware supports a revised classic rumble mode,
> which feels more similar to rumble as supported on previous PlayStation
> controllers. It has been made the default on PlayStation and non-PlayStation
> devices now (e.g. iOS and Windows). Default to this new mode when
> supported.

I am trying to see if this patch is 6.1 or 6.2 material. So I have a
couple of questions for you:
- on the current dualsense controller, with an updated firmware, is
there any drawback in keeping the current code, or do we need to
upgrade to the new one to keep functionalities?
- on the new dualsense edge, does it support the old rumble, and so do
I need to tie the addition of the DualSense Edge to this one patch?

>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  drivers/hid/hid-playstation.c | 39 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 396356b6760a..e05c61942971 100644
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
> +       __le16 update_version;

Technically, if I am not wrong, the value stored here was already
processed through get_unaligned_le16(), so you have a u16, and more
likely to be consistent you should use uint16_t.

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
> @@ -812,6 +820,14 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
>         ds->base.hw_version = get_unaligned_le32(&buf[24]);
>         ds->base.fw_version = get_unaligned_le32(&buf[28]);
>
> +       /* Update version is some kind of feature version. It is distinct from
> +        * the firmware version as there can be many different variations of a
> +        * controller over time with the same physical shell, but with different
> +        * PCBs and other internal changes. The update version (internal name) is
> +        * used as a means to detect what features are available and change behavior.
> +        */
> +       ds->update_version = get_unaligned_le16(&buf[44]);
> +
>  err_free:
>         kfree(buf);
>         return ret;
> @@ -974,7 +990,10 @@ static void dualsense_output_worker(struct work_struct *work)
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
> @@ -1348,6 +1367,24 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>                 return ERR_PTR(ret);
>         }
>
> +#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))

Was already defined above AFAICT

> +       /* Original DualSense firmware simulated classic controller rumble through
> +        * its new haptics hardware. It felt different from classic rumble users
> +        * were used to. Since then new firmwares were introduced to change behavior
> +        * and make this new 'v2' behavior default on PlayStation and other platforms.
> +        * The original DualSense requires a new enough firmware as bundled with PS5
> +        * software released in 2021. DualSense edge supports it out of the box.
> +        */
> +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +               /* Feature version 2.21 introduced new vibration method. */
> +               if (ds->update_version < DS_FEATURE_VERSION(2, 21))
> +                       ds->use_vibration_v2 = false;
> +               else
> +                       ds->use_vibration_v2 = true;

if (conditional) then false else true; can easily be transformed into
ds->use_vibration_v2 = ds->update_version >= DS_FEATURE_VERSION(2, 21)
:)

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

Cheers,
Benjamin

