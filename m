Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB8E14ABEA
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 23:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgA0WH5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 17:07:57 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46721 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgA0WH4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 17:07:56 -0500
Received: by mail-qt1-f193.google.com with SMTP id e25so8680052qtr.13;
        Mon, 27 Jan 2020 14:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEhXtVZE0AuSqumnVxkN7hJVxXzP/8AEyl95D38TJg8=;
        b=sEidMy4ir8xw4LpiMVCv85e1NKww02Hr7Ku8h7JXyDlCEzGx4gMtUdbdRuEg7Xyf6k
         vwiHRiczrVMo6t2CWxhM/gyEFPQ6ilttmVD2Nf5CarkKz4WVxiqw4Ae5mfTIr1KBGhWB
         Gm3AgWFr4jqfOyCuPmMty+Hxt7kIqi3x9Rc2qXB6XqPpBgI8byGLoKpX9xQmTC68O4JC
         3bW5FoZyx7Pkujrv58A7N+v4Y/flo6VGeiwve8AVIB0qBR4klZiVgoy8gsYB2RSFGljF
         TprhF1GHhWOjvdlQ7c5ksLA/l2mA2/WgmblPRH0kXgiTKZSATVE6VzW+EHm6No0dtDN6
         qvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEhXtVZE0AuSqumnVxkN7hJVxXzP/8AEyl95D38TJg8=;
        b=imtlwDqIWDa2WbQf2GsWw8qyUg3VxAu0B1O30s/xjuuskv66jZB4MvrbJDUGCIiRVa
         uVswLqxqDvTaCwM+yKrMPTvQ6igGBxhFZvYbNTk6In9tRwMeVHLIV3MTB2bqu06/Macg
         rKSNroNoasUnna/nujexXO5wvVyeGSUlQ2cgL3725OFeM61JRi3f/QEEHwZ3Rtw27NBw
         e1FgKRi7VHVX6Nuc0E6j2wh09ycrUXmkmQ80OKBOcMDmEODtm7flGw0cImzXgoK7aII9
         kEgxWKFdsR3Dz2ZBb0GSVsgPQDWHFRrWevPfh95M4bycVfZMYkI4rx5957peteqi+M4F
         mk9g==
X-Gm-Message-State: APjAAAUhqVdoSbq9w6n969GaE+vJrPN7YZ8cVKCOMTfmN6PL74bTRk1+
        ilFyzpEbAht0L+quVoRyXnbApLBqtuiOwJl4WSNbirSX
X-Google-Smtp-Source: APXvYqzdNqQlHx2ulKBAe6s92Kv08+Tj31EQgdHzKAtKblPUMo9fLktAfmKGTJg4BR+11zzPLtVPVwkD2CGO/6s6s+I=
X-Received: by 2002:aed:3c44:: with SMTP id u4mr17827389qte.118.1580162874078;
 Mon, 27 Jan 2020 14:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk>
In-Reply-To: <20200126194513.6359-1-martyn@welchs.me.uk>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 27 Jan 2020 14:07:43 -0800
Message-ID: <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Martyn Welch <martyn@welchs.me.uk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Martyn,

Thanks for sharing your patch. Though I must say with my Sony hat on,
I don't really like supporting clone devices (they hijack our device
ids.. etcetera) and we support hid-sony in an official capacity now
across various devices. Though thischange  all relates to PS3
generation, which is not that important anymore so it shouldn't matter
that much.

Thanks,
Roderick

On Sun, Jan 26, 2020 at 12:28 PM Martyn Welch <martyn@welchs.me.uk> wrote:
>
> There seems to be a number of subtly different firmwares for the
> Playstation controllers made by "Gasia Co.,Ltd". Whilst such controllers
> are easily detectable when attached via USB that is not always the case
> via Bluetooth. Some controllers are named "PLAYSTATION(R)3 Controller"
> where as the official Sony controllers are named
> "Sony PLAYSTATION(R)3 Controller", however some versions of firmware use
> the exact name used by the official controllers. The only way I've been
> able to distinguish these versions of the controller (when connected via
> Bluetooth) is that the Bluetooth Class of Device incorrectly reports the
> controller as a keyboard rather than a gamepad. I've so far failed to work
> out how to access this information from a HID driver.
>
> The Gasia controllers need output reports to be configured in the same way
> as the Shanwan controllers. In order to ensure both types of Gasia firmware
> will work, this patch adds a quirk for those devices it can detect and
> reworks `sixaxis_send_output_report()` to attempt `hid_hw_output_report()`
> should `hid_hw_raw_request()` be known to be the wrong option (as is the
> case with the Shanwan controllers) or fails.
>
> This has got all the controllers I have working, with the slight
> anoyance that the Gasia controllers that don't currently get marked with
> a quirk require the call to `hid_hw_raw_request()` to fail before the
> controller finishes initialising (which adds a significant extra delay
> before the controller is ready).
>
> This patch is based on the following patch by Conn O'Griofa:
>
> https://github.com/RetroPie/RetroPie-Setup/pull/2263/commits/017f00f6e15f04b3272ff1abae8742dc4c47b608
>
> Cc: Conn O'Griofa <connogriofa@gmail.com>
> Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
> ---
>  drivers/hid/hid-sony.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 4c6ed6ef31f1..d1088a85cb59 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -56,6 +56,7 @@
>  #define NSG_MR5U_REMOTE_BT        BIT(14)
>  #define NSG_MR7U_REMOTE_BT        BIT(15)
>  #define SHANWAN_GAMEPAD           BIT(16)
> +#define GASIA_GAMEPAD             BIT(17)
>
>  #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
>  #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
> @@ -2067,6 +2068,7 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
>         struct sixaxis_output_report *report =
>                 (struct sixaxis_output_report *)sc->output_report_dmabuf;
>         int n;
> +       int ret = -1;
>
>         /* Initialize the report with default values */
>         memcpy(report, &default_report, sizeof(struct sixaxis_output_report));
> @@ -2101,14 +2103,23 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
>                 }
>         }
>
> -       /* SHANWAN controllers require output reports via intr channel */
> -       if (sc->quirks & SHANWAN_GAMEPAD)
> -               hid_hw_output_report(sc->hdev, (u8 *)report,
> -                               sizeof(struct sixaxis_output_report));
> -       else
> -               hid_hw_raw_request(sc->hdev, report->report_id, (u8 *)report,
> +       /*
> +        * SHANWAN & GASIA controllers require output reports via intr channel.
> +        * Some of the Gasia controllers are basically indistinguishable from
> +        * the official ones and thus try hid_hw_output_report() should
> +        * hid_hw_raw_request() fail.
> +        */
> +       if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD)))
> +               ret = hid_hw_raw_request(sc->hdev, report->report_id,
> +                               (u8 *)report,
>                                 sizeof(struct sixaxis_output_report),
>                                 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> +
> +       if (ret >= 0)
> +               return;

I don't like this pattern so much. We only need this "ret" check for
SHANWAN and GASIA. I would just do:

if (!(sc->quirks & (SHANWAN_GAMEPAD | GASIA_GAMEPAD))) {
    int ret = hid_hw_raw_request(....);
    if (ret >= 0)
       return;
}

hid_hw_output_report(....)

> +
> +       hid_hw_output_report(sc->hdev, (u8 *)report,
> +                       sizeof(struct sixaxis_output_report));
>  }
>
>  static void dualshock4_send_output_report(struct sony_sc *sc)
> @@ -2833,6 +2844,14 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
>                 quirks |= SHANWAN_GAMEPAD;
>
> +       /*
> +        * Some Gasia controllers are named "PLAYSTATION(R)3 Controller"
> +        * where as the official Sony controllers are named
> +        * "Sony PLAYSTATION(R)3 Controller".
> +        */
> +       if (!strcmp(hdev->name, "PLAYSTATION(R)3 Controller"))
> +               quirks |= GASIA_GAMEPAD;
> +
>         sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
>         if (sc == NULL) {
>                 hid_err(hdev, "can't alloc sony descriptor\n");
> --
> 2.20.1
>
