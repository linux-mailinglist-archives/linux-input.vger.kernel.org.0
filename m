Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E0B3CF55
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 16:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403908AbfFKOmu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 10:42:50 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40612 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403888AbfFKOmt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 10:42:49 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so14804482qtn.7
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 07:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ar4hb3yiBL9RLGyl8brQ12ttcv1qOaVZT7c8EOl9hRY=;
        b=VxKe4nwoe4AaxhNZ/ZK2G79GHKT0yPezmlUgDZV7HVSfuOx1onU1u30rjqVUujReUH
         j6rC+IXKrh0+SAq7XykR0efR9uv49/kmN7DSRuEsq/065Wq7ilzaM7rZDfZeOkws1CJG
         MYPcFAn2tSPPc9enAtaE2l+M+J0aRPu34FlOPl3T75/RxS0l7uJwGhxWLQDBv1rXfm1t
         67B/hqZoz0CehUvPhVe58EX4r0lvHpO50GBCpdR9u6vRGUV0q1Up3LePKbuaZTnce1Y5
         DUFHAWdf97qc6K7R2l6GVvpCJwzlXDkwc6+lb9w3OWqk2SAq+4i/vfUvIISGI5WfMnnI
         ASeQ==
X-Gm-Message-State: APjAAAWiPZw692seNHCwSq0+lvpGRdu7YIK+7yESc68rAVgC4lKfZhN5
        a1RA5+z2d15Mv6KW/mP3jk/jUMKI/OZfTKafgP1gIg==
X-Google-Smtp-Source: APXvYqx+e0j+9TvMtZ1S6dn1CUFHTzijZXmMUOFHUJY7jKJ01Cg5Mu3nt3LdRprALCiQ/us3xKAiFbVRnd7QTMEtSiU=
X-Received: by 2002:ac8:2998:: with SMTP id 24mr62504198qts.31.1560264169050;
 Tue, 11 Jun 2019 07:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
In-Reply-To: <20190611121320.30267-1-nsaenzjulienne@suse.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 16:42:37 +0200
Message-ID: <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, wbauer@tmo.at,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 11, 2019 at 2:13 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Some a4tech mice use the 'GenericDesktop.00b8' usage to inform whether
> the previous wheel report was horizontal or vertical. Before
> c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
> usage was being mapped to 'Relative.Misc'. After the patch it's simply
> ignored (usage->type == 0 & usage->code == 0). Which ultimately makes
> hid-a4tech ignore the WHEEL/HWHEEL selection event, as it has no
> usage->type.
>
> We shouldn't rely on a mapping for that usage as it's nonstandard and
> doesn't really map to an input event. So we bypass the mapping and make
> sure the custom event handling properly handles both reports.
>
> Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---

Yep, I like this one much better.

>
> NOTE: I CC'd Wolfgang as he's the one who can test this.

I'll wait for Wolfram to confirm that the patch works before pushing then.

>
> Changes since v1:
>   - new approach, moved fix into hid-a4tech
>
>  drivers/hid/hid-a4tech.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
> index 98bf694626f7..3a8c4a5971f7 100644
> --- a/drivers/hid/hid-a4tech.c
> +++ b/drivers/hid/hid-a4tech.c
> @@ -23,12 +23,36 @@
>  #define A4_2WHEEL_MOUSE_HACK_7 0x01
>  #define A4_2WHEEL_MOUSE_HACK_B8        0x02
>
> +#define A4_WHEEL_ORIENTATION   (HID_UP_GENDESK | 0x000000b8)
> +
>  struct a4tech_sc {
>         unsigned long quirks;
>         unsigned int hw_wheel;
>         __s32 delayed_value;
>  };
>
> +static int a4_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> +                           struct hid_field *field, struct hid_usage *usage,
> +                           unsigned long **bit, int *max)
> +{
> +       struct a4tech_sc *a4 = hid_get_drvdata(hdev);
> +
> +       if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8 &&
> +           usage->hid == A4_WHEEL_ORIENTATION) {
> +               /*
> +                * We do not want to have this usage mapped to anything as it's
> +                * nonstandard and doesn't really behave like an HID report.
> +                * It's only selecting the orientation (vertical/horizontal) of
> +                * the previous mouse wheel report. The input_events will be
> +                * generated once both reports are recorded in a4_event().
> +                */
> +               return -1;

You seem to be extra precocious here. This is basically what the
current hid-input.c mapping does. But I think it is for the best,
given that this time you are locking the behavior of this reserved
usage.

Cheers,
Benjamin

> +       }
> +
> +       return 0;
> +
> +}
> +
>  static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>                 struct hid_field *field, struct hid_usage *usage,
>                 unsigned long **bit, int *max)
> @@ -52,8 +76,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>         struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>         struct input_dev *input;
>
> -       if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput ||
> -                       !usage->type)
> +       if (!(hdev->claimed & HID_CLAIMED_INPUT) || !field->hidinput)
>                 return 0;
>
>         input = field->hidinput->input;
> @@ -64,7 +87,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>                         return 1;
>                 }
>
> -               if (usage->hid == 0x000100b8) {
> +               if (usage->hid == A4_WHEEL_ORIENTATION) {
>                         input_event(input, EV_REL, value ? REL_HWHEEL :
>                                         REL_WHEEL, a4->delayed_value);
>                         input_event(input, EV_REL, value ? REL_HWHEEL_HI_RES :
> @@ -131,6 +154,7 @@ MODULE_DEVICE_TABLE(hid, a4_devices);
>  static struct hid_driver a4_driver = {
>         .name = "a4tech",
>         .id_table = a4_devices,
> +       .input_mapping = a4_input_mapping,
>         .input_mapped = a4_input_mapped,
>         .event = a4_event,
>         .probe = a4_probe,
> --
> 2.21.0
>
