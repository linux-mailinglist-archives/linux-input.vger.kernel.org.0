Return-Path: <linux-input+bounces-10031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDCA356B9
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 07:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181F03ACF43
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 06:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED4A1DB924;
	Fri, 14 Feb 2025 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKSwJXxt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E211DB54C;
	Fri, 14 Feb 2025 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513190; cv=none; b=U371IFmWAB44s9EfsWQpn23ASWHaaTuOdauIUABa5DrWSzh0GetsZhvLfPTzaXFVQ94P2FEWLTdCkrnkJGGCq7rFAgicDsnDK5M2kX6L+meO0r6wFRDPgjAHvSDGUxyoCHdMAcDD1TAQejn1Btg6hylqAVuP8bynpEgQJzoLrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513190; c=relaxed/simple;
	bh=ayIdhlNLb2GKZSSeWxAq9c/c2OPatpC52A3/OfNRRcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYHrGbl8u3Xcuo1ChRsxOBB4ix+MfXYyfvhrP3UwPimS4UfEYrjnqu19h6JU7J1+LTaB6EEYkuMvKX0p+zo7NW7koA8Lt2wfsnSFQcXupSUeTxKslAo8TuIYU1oE/xHDMYoKdCi16NWv2cWCFXDnHan1OS1u0e0XWX1ZJPgHgD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKSwJXxt; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307bc125e2eso17505091fa.3;
        Thu, 13 Feb 2025 22:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739513187; x=1740117987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqAdZtNTVsfW+y8D7cFv5lvL1LQWxEuSxZZ2eTAoaGc=;
        b=dKSwJXxtgs3O6zhryozE5DEKy0HhaTMp7GZ9RQBzVYcHN4YHr5SM5B/DEq6oaVmqTf
         Et2Ze8obCjVfkRibTX64S8Ei/+HHWGXov0ct4We9flak1oHiT0SYcUEQ4bkjhg/ZqJ9F
         kybWic+kO9CcT55AzRym3YLVcMslizRiUYT7hrjXDAjs60a+itxYFuCfcb2od5fSmXXo
         jiPV2nQh0lNxFY7s1+448GV1g9+G0cjStShyMYdeJ7od5kEIPQolwL7hdA7JNvv5xe/n
         eWRruyOWKPXD0EpCkycb0ijyP31NXW7+h45M4BsERJBpVMfl9pTGcICtrubv6BrxZODz
         whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739513187; x=1740117987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqAdZtNTVsfW+y8D7cFv5lvL1LQWxEuSxZZ2eTAoaGc=;
        b=U4lUJCu5MrkznYy61ZcImRxhqZhdXXLMgpqZsJJduNysP7elkHZAwlB2vrbe3RoB8e
         32c+2OoeGc5EZ2OuYFJDw+1nUrShK1Fzg74300ZJDZA2Nve8zMG9+Oh9LCtD1s0NDNJI
         I4HNAR10r6kUZnwTxQQlwIvZOieWSVIF0I4nit7aM8i8qUjaIJWYepXOqmHq+iVsMWLB
         8/cJ12blDOhqg6axElZIVzWJ/unqpgwMjexhBfu5AXq6Gp5FKzpPPdtZv1vzvYCe/bEu
         fgAAJX5oPDXgfsnXvdASAXoma3vtD4GbAOpR7YRs1y37ZvjfzBQ+Eou3o7ZevWAFhCM4
         EiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrwp5oVUDAfsELvXra85hq7mkCH4pg8GcM5cfv4k6SX0OcqxkbhMpCR78FlmA6x2Hib6PrsPtNYptbYi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwQZPd5ufdSD8P9JDrPB4Zpnxop/rZHmIv41EH41+JT9eM2/1
	Hn/Sz09pOW3zp3bx5y4yxbGPopdsoE1X8Ice0Ub37hIkvx7VzRVkNdLkLvsr9UKIuFlT+C9SEA5
	lvxkMZ1GmiY0LbBJ1Xnj7X0gTDa4=
X-Gm-Gg: ASbGncsRRw5qsazQkBf6vEn/WxX/Bja13IXQKeR1lk6aMT6f7DnXr3qzN6wxSIq/d7s
	j6xvl9rOAhUdFtFHnvZ5BVLNzmyNBFFP+s5QgICXPqrPTYIk7fNTK7cDzX5XNai0psw+H6wpl
X-Google-Smtp-Source: AGHT+IHPqui+cXa8lH/ms719wR+czTAzvCdYJZEYAhb8mlpoe3XX6QltZFbLJDP0xvxV6GBUE8HKHPteKhMAAWdehUI=
X-Received: by 2002:a05:651c:a0a:b0:307:dc1f:e465 with SMTP id
 38308e7fff4ca-3090dd06af3mr18151961fa.22.1739513186599; Thu, 13 Feb 2025
 22:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125000202.20868-1-coolreader18@gmail.com>
In-Reply-To: <20250125000202.20868-1-coolreader18@gmail.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Fri, 14 Feb 2025 01:06:14 -0500
X-Gm-Features: AWEUYZnZBpXqrOIQvba5AWr20SzZvvKiaCRfp898MjSVIAl4QLUruh9S104uiQA
Message-ID: <CAEVj2t=mHasbuve8cwWpuPRsN=Wvsfrf+u5hLP_16GR3XqkMfg@mail.gmail.com>
Subject: Re: [PATCH] Enable HW LED blinking for hid-nintendo controllers
To: Noa <coolreader18@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Noa,

Thanks for this patch. Integrating the firmware LED blinking support
is something I've wanted the driver to have for a long time.
Especially for joycond when it places the controller in "pairing"
mode.

Can you prepend the commit title with "HID: nintendo: " to match the
convention for other commits in the hid folder?

On Fri, Jan 24, 2025 at 7:02=E2=80=AFPM Noa <coolreader18@gmail.com> wrote:
>
> This is my first patch, so hopefully I'm doing this right. I noticed
> when trying to use `ledtrig-timer` on the Joycon LEDS that it at times
> would hang for a while (I assume the firmware isn't a fan of frequent
> LED subcommands, or something), and I've tested with this patch and it
> blinks consistently with carefree abandon.
>
> Separately, I was also thinking about exposing the LEDs as evdev codes,
> but it doesn't seem like there's any good options of the `LED_*`
> constants to represent them.
>
> Signed-off-by: Noa <coolreader18@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 11ac246176ae..83dff0c4f7e1 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -2183,14 +2183,13 @@ static int joycon_input_create(struct joycon_ctlr=
 *ctlr)
>         return 0;
>  }
>
> -/* Because the subcommand sets all the leds at once, the brightness argu=
ment is ignored */
> -static int joycon_player_led_brightness_set(struct led_classdev *led,
> -                                           enum led_brightness brightnes=
s)
> +/* Update the on/flash status of the leds according to their led_classde=
v fields */
> +static int joycon_update_player_leds(struct device *dev)
>  {
> -       struct device *dev =3D led->dev->parent;
>         struct hid_device *hdev =3D to_hid_device(dev);
>         struct joycon_ctlr *ctlr;
>         int val =3D 0;
> +       int flash =3D 0;
>         int i;
>         int ret;
>
> @@ -2200,16 +2199,47 @@ static int joycon_player_led_brightness_set(struc=
t led_classdev *led,
>                 return -ENODEV;
>         }
>
> -       for (i =3D 0; i < JC_NUM_LEDS; i++)
> -               val |=3D ctlr->leds[i].brightness << i;
> +       for (i =3D 0; i < JC_NUM_LEDS; i++) {
> +               if (ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_d=
elay_off)
> +                       flash |=3D 1 << i;
> +               else if (ctlr->leds[i].brightness)
> +                       val |=3D 1 << i;
> +       }
>
>         mutex_lock(&ctlr->output_mutex);
> -       ret =3D joycon_set_player_leds(ctlr, 0, val);
> +       ret =3D joycon_set_player_leds(ctlr, flash, val);
>         mutex_unlock(&ctlr->output_mutex);
>
>         return ret;
>  }
>
> +static int joycon_player_led_brightness_set(struct led_classdev *led,
> +                                           enum led_brightness brightnes=
s)
> +{
> +       led->brightness =3D brightness;
> +
> +       if (!brightness)
> +               led->blink_delay_on =3D led->blink_delay_off =3D 0;
> +
> +       return joycon_update_player_leds(led->dev->parent);
> +}
> +
> +/* the blink period of the leds can't be changed, and is always these va=
lues */
> +static const JC_LED_BLINK_DELAY_ON =3D 500;
> +static const JC_LED_BLINK_DELAY_OFF =3D 200;

nit: it might be nice to append the constant names with "_MS" for
clarity on the time unit used.


> +/* the different leds on a joycon can't actually be set to hw blink inde=
pendently
> + * of each other, since they all use the same one subcommand, so this fu=
nction
> + * actually resets the cycle of all the leds */
> +static int joycon_player_led_blink_set(struct led_classdev *led,
> +                                    unsigned long *delay_on,
> +                                    unsigned long *delay_off)
> +{
> +       led->blink_delay_on =3D *delay_on =3D JC_LED_BLINK_DELAY_ON;
> +       led->blink_delay_off =3D *delay_off =3D JC_LED_BLINK_DELAY_OFF;
> +
> +       return joycon_update_player_leds(led->dev->parent);
> +}
> +
>  static int joycon_home_led_brightness_set(struct led_classdev *led,
>                                           enum led_brightness brightness)
>  {
> @@ -2268,6 +2298,7 @@ static int joycon_leds_create(struct joycon_ctlr *c=
tlr)
>                 led->max_brightness =3D 1;
>                 led->brightness_set_blocking =3D
>                                         joycon_player_led_brightness_set;
> +               led->blink_set =3D joycon_player_led_blink_set;
>                 led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
>
>                 led_val |=3D joycon_player_led_patterns[player_led_patter=
n][i] << i;
> --
> 2.48.1
>


Looks good overall to me other than the commit message format.

Thanks,
Daniel

