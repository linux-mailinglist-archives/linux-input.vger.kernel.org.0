Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D217631C42E
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 00:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhBOXBY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 18:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhBOXBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 18:01:23 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0E3C061756
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 15:00:42 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id v10so5945247qtq.7
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 15:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvE/meSnSzBUHxjA37G3fitD+WZ6bXS3ShAbDM/I+R8=;
        b=rzdC54VwYpXHZmNTpGHut+EZwemXIsNpG+x5vEVfZv35T8Bpx6pPkw0cTKxW6LvWuM
         xUBGTZzTIcb14jsIXELESW7CFa6HtvmSW8hB6PP+ejUrxgAcJQvYqlqX9RzlbNcQnILQ
         wgO5395xL/ySlWQEYNnp77FMU0Hn+GZK6b9KkhMnQaeVN1DtGMkjAJA/o7ZBcR0ggvRr
         kPo7GBDI2CNUq9qUSpts6UYLHWCTTz719xCMzsHXmsOgT4Gl/HJSHWcMLjvjRs+Nzb8t
         H1GymHecVqVVRq0mpIHM/JomSiOtb1NrqqW+ak8g0PIe4pijDAo2LToNoPk+rqT7/Feg
         4UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvE/meSnSzBUHxjA37G3fitD+WZ6bXS3ShAbDM/I+R8=;
        b=l80YPf1wNWN0Sgknn6sb5nXKWeqZ35BOJnha9ojc4stzDQaC+sYZyisiwj/U7HxBQe
         7Txf67nlwKJ0w3O4rngIpiLv2ep1KZ42U3MvfblpIXcpuHZmoXiEfPaAkXJZV5rXawrI
         BkowGUisqZ/Sqn2BnNSBkxqD67nPzpSGO851bHV2mcPFrQsFvK45lN/taWrUcl9Ga6pk
         eadw12tJa7dS0tMMGgTIgHpx9X4g7fxaMa80D+Cby1ffRPUss1Ja9FO74AaHVMYwBZne
         aJ3PRje5ZtZpi/gl5qlIrbLeYb1UveX6lyzt728GbQDQ/0EwKRbAwD5aOa478lumRdGI
         Tcgg==
X-Gm-Message-State: AOAM530rgIOyOTVvarJPUT8Zt0aqCeso4lp6vNtwfyqkbdd4Ppx9l+1S
        Q+ep5gAlGvePgPm5SFrBfGonhpxHtT6UJS7TEOhngQ==
X-Google-Smtp-Source: ABdhPJzOMWkifrQGVzv0CIXVtZmJIpLXGgwwKhVjj/LxcZNPsk1zyWvdzxzORCeSU715nq2hoJxEjpJRwf5MRQy8XHk=
X-Received: by 2002:ac8:1408:: with SMTP id k8mr16512324qtj.204.1613430041562;
 Mon, 15 Feb 2021 15:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-4-roderick@gaikai.com>
In-Reply-To: <20210215004549.135251-4-roderick@gaikai.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 15 Feb 2021 15:00:30 -0800
Message-ID: <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs support.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Sun, Feb 14, 2021 at 4:46 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> The DualSense features 5 player LEDs below its touchpad, which are
> meant as player id indications. This patch exposes the player LEDs
> as individual LEDs.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  drivers/hid/hid-playstation.c | 60 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index c436ac8f7a6f..2d96785c397d 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -112,6 +112,7 @@ struct ps_led_info {
>  #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
>  #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
>  #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
> +#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
>  #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
>  #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
>  #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
> @@ -157,6 +158,11 @@ struct dualsense {
>         bool last_btn_mic_state;
>         struct led_classdev mute_led;
>
> +       /* Player leds */
> +       bool update_player_leds;
> +       uint8_t player_leds_state;
> +       struct led_classdev player_leds[5];
> +
>         struct work_struct output_worker;
>         void *output_report_dmabuf;
>         uint8_t output_seq; /* Sequence number for output report. */
> @@ -778,6 +784,35 @@ static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led
>
>  }
>
> +static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
> +{
> +       struct hid_device *hdev = to_hid_device(led->dev->parent);
> +       struct dualsense *ds = hid_get_drvdata(hdev);
> +
> +       return !!(ds->player_leds_state & BIT(led - ds->player_leds));
> +}
> +
> +static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
> +{
> +       struct hid_device *hdev = to_hid_device(led->dev->parent);
> +       struct dualsense *ds = hid_get_drvdata(hdev);
> +       unsigned long flags;
> +       unsigned int led_index;
> +
> +       spin_lock_irqsave(&ds->base.lock, flags);
> +
> +       led_index = led - ds->player_leds;
> +       if (value == LED_OFF)
> +               ds->player_leds_state &= ~BIT(led_index);
> +       else
> +               ds->player_leds_state |= BIT(led_index);
> +
> +       ds->update_player_leds = true;
> +       spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +       schedule_work(&ds->output_worker);
> +}
> +
>  static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
>                 void *buf)
>  {
> @@ -870,6 +905,13 @@ static void dualsense_output_worker(struct work_struct *work)
>                 ds->update_lightbar = false;
>         }
>
> +       if (ds->update_player_leds) {
> +               common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
> +               common->player_leds = ds->player_leds_state;
> +
> +               ds->update_player_leds = false;
> +       }
> +
>         if (ds->update_mic_mute) {
>                 common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
>                 common->mute_button_led = ds->mic_muted;
> @@ -1119,12 +1161,20 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>         struct dualsense *ds;
>         struct ps_device *ps_dev;
>         uint8_t max_output_report_size;
> -       int ret;
> +       int i, ret;
>
>         static const struct ps_led_info mute_led_info = {
>                 "micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
>         };
>
> +       static const struct ps_led_info player_leds_info[] = {
> +               { "led1", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
> +               { "led2", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
> +               { "led3", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
> +               { "led4", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
> +               { "led5", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness }
> +       };
> +
>         ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
>         if (!ds)
>                 return ERR_PTR(-ENOMEM);
> @@ -1206,6 +1256,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>         if (ret)
>                 goto err;
>
> +       for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
> +               const struct ps_led_info *led_info = &player_leds_info[i];
> +
> +               ret = ps_led_register(ps_dev, &ds->player_leds[i], led_info);
> +               if (ret < 0)
> +                       goto err;
> +       }
> +
>         return &ds->base;
>
>  err:
> --
> 2.26.2
>

What is the desired naming for these player LEDs? There is not an
officially designed function based on DT bindings. So far they used
"playstation::mac::ledX". When changing the naming scheme towards
"hid" and removing MAC, they would be: "hid%d::led1" etcetera.

Thanks,
Roderick
