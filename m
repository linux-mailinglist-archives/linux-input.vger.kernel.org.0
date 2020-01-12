Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB181387A0
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2020 19:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbgALSEG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 13:04:06 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:35832 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgALSEG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 13:04:06 -0500
Received: by mail-io1-f67.google.com with SMTP id h8so7205051iob.2
        for <linux-input@vger.kernel.org>; Sun, 12 Jan 2020 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kko+HIl19IWsNEtqxNzXuwfgFEu8eSGgK7eBm8qJ1IQ=;
        b=Wt1DISyd0RfNRf/7E88wxO3yAvjVwXPQPIaQ4APlmnF5Wijo7akDjNRIlVCed2egny
         48zwoyzMCLacP4385yMXltQ2L/pBCqHCtAH9K/nfyYrmmOAsILu7nZgAMifji9ePk1yz
         dshdhnjAKq7dd+XPH/67/LaYO7+kIHeZ+ZMlHz6B7OXiUuPkiddQ0QqTnYi9xc+c9eGz
         mbfxwzUG8wmganbfbt8Dugp4ziMweXsUZEnhpboFg3KeSkdOJaxb990XlopMi/cL1sSO
         HWO5NEpH+8aWXkkkj9Im0eGLXJAVhw2xLZiKNXAe2/4Vi7sVbr0rlZWxmTzrdCANCMLc
         Tpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kko+HIl19IWsNEtqxNzXuwfgFEu8eSGgK7eBm8qJ1IQ=;
        b=VnrkKJccfH+R/5v8d8xN5mwkiO9b8JczXRt2vkhpI/TIXZGloVY6QTcPRhupAVChxO
         Un2GYCFKblOLGz+T8mPrKIQnQN50qvwJ02mGAZC0ubA09aCDtHRandjA0k9aPcaZhpb6
         y7aubQdcA1hOF+prU7MV4INRcsW50wzU/NH4vLto1h6zfauBk3hk7zP/Qh2XBzWmwkfj
         SICHIBhi3h7modIvCb5+B2pcJI3x/gAtZTJUjtwSe5mhpfSeJC8Fb3mYOXFNVkmLMSjj
         fk4+MputGHuGOUei5kMeR13P2ysJF0mVfmZU7tJXeNy122RPR1az6FzLrUehusjtt60C
         N55Q==
X-Gm-Message-State: APjAAAWcz4fN6eEexxq9usSUddy1j6XbdQO8OLPEvqsOwucE7YcnkNFA
        iG4Wfo/k/ZyAUTuQHYTCO8WcSpeGs7nwko92p/g=
X-Google-Smtp-Source: APXvYqwRyrE54nY+kwt4UiuoCMCzXBm8jYAWy1KsPKPMXz5cfHmtvjL/eGu2uDHFOUNKZdXFe4OjjMdOrSUhCAsBBSs=
X-Received: by 2002:a6b:7316:: with SMTP id e22mr10353173ioh.205.1578852244861;
 Sun, 12 Jan 2020 10:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20200107171741.10856-1-l.stach@pengutronix.de>
In-Reply-To: <20200107171741.10856-1-l.stach@pengutronix.de>
From:   Chris Healy <cphealy@gmail.com>
Date:   Sun, 12 Jan 2020 10:03:54 -0800
Message-ID: <CAFXsbZokgHT0WFEGUtW6HQuMGeGXqbJQKcvx47N+3hQuOz3_Gw@mail.gmail.com>
Subject: Re: [PATCH 1/4] Input: exc3000: split MT event handling from IRQ handler
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On both ARMv7 and ARMv8 platforms, full series is:

Tested-by: Chris Healy <cphealy@gmail.com>

On Tue, Jan 7, 2020 at 9:17 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Split out the multitouch event handling into its own function to allow other
> events to be handled in the IRQ handler without disturbing the MT handling.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/touchscreen/exc3000.c | 92 +++++++++++++++++------------
>  1 file changed, 54 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index e007e2e8f626..3458d02310dd 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -58,6 +58,11 @@ static void exc3000_timer(struct timer_list *t)
>         input_sync(data->input);
>  }
>
> +static inline void exc3000_schedule_timer(struct exc3000_data *data)
> +{
> +       mod_timer(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
> +}
> +
>  static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>  {
>         int ret;
> @@ -76,54 +81,35 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>         if (ret != EXC3000_LEN_FRAME)
>                 return -EIO;
>
> -       if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
> -                       buf[2] != EXC3000_MT_EVENT)
> +       if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
>                 return -EINVAL;
>
>         return 0;
>  }
>
> -static int exc3000_read_data(struct i2c_client *client,
> -                            u8 *buf, int *n_slots)
> +static int exc3000_handle_mt_event(struct exc3000_data *data)
>  {
> -       int error;
> -
> -       error = exc3000_read_frame(client, buf);
> -       if (error)
> -               return error;
> +       struct input_dev *input = data->input;
> +       int ret, total_slots;
> +       u8 *buf = data->buf;
>
> -       *n_slots = buf[3];
> -       if (!*n_slots || *n_slots > EXC3000_NUM_SLOTS)
> -               return -EINVAL;
> +       total_slots = buf[3];
> +       if (!total_slots || total_slots > EXC3000_NUM_SLOTS) {
> +               ret = -EINVAL;
> +               goto out_fail;
> +       }
>
> -       if (*n_slots > EXC3000_SLOTS_PER_FRAME) {
> +       if (total_slots > EXC3000_SLOTS_PER_FRAME) {
>                 /* Read 2nd frame to get the rest of the contacts. */
> -               error = exc3000_read_frame(client, buf + EXC3000_LEN_FRAME);
> -               if (error)
> -                       return error;
> +               ret = exc3000_read_frame(data->client, buf + EXC3000_LEN_FRAME);
> +               if (ret)
> +                       goto out_fail;
>
>                 /* 2nd chunk must have number of contacts set to 0. */
> -               if (buf[EXC3000_LEN_FRAME + 3] != 0)
> -                       return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
> -static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> -{
> -       struct exc3000_data *data = dev_id;
> -       struct input_dev *input = data->input;
> -       u8 *buf = data->buf;
> -       int slots, total_slots;
> -       int error;
> -
> -       error = exc3000_read_data(data->client, buf, &total_slots);
> -       if (error) {
> -               /* Schedule a timer to release "stuck" contacts */
> -               mod_timer(&data->timer,
> -                         jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
> -               goto out;
> +               if (buf[EXC3000_LEN_FRAME + 3] != 0) {
> +                       ret = -EINVAL;
> +                       goto out_fail;
> +               }
>         }
>
>         /*
> @@ -132,7 +118,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>         del_timer_sync(&data->timer);
>
>         while (total_slots > 0) {
> -               slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
> +               int slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
>                 exc3000_report_slots(input, &data->prop, buf + 4, slots);
>                 total_slots -= slots;
>                 buf += EXC3000_LEN_FRAME;
> @@ -141,6 +127,36 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>         input_mt_sync_frame(input);
>         input_sync(input);
>
> +       return 0;
> +
> +out_fail:
> +       /* Schedule a timer to release "stuck" contacts */
> +       exc3000_schedule_timer(data);
> +
> +       return ret;
> +}
> +
> +static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> +{
> +       struct exc3000_data *data = dev_id;
> +       u8 *buf = data->buf;
> +       int ret;
> +
> +       ret = exc3000_read_frame(data->client, buf);
> +       if (ret) {
> +               /* Schedule a timer to release "stuck" contacts */
> +               exc3000_schedule_timer(data);
> +               goto out;
> +       }
> +
> +       switch (buf[2]) {
> +               case EXC3000_MT_EVENT:
> +                       exc3000_handle_mt_event(data);
> +                       break;
> +               default:
> +                       break;
> +       }
> +
>  out:
>         return IRQ_HANDLED;
>  }
> --
> 2.20.1
>
