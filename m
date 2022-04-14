Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F433501DDD
	for <lists+linux-input@lfdr.de>; Fri, 15 Apr 2022 00:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbiDNWCO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Apr 2022 18:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237476AbiDNWCO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Apr 2022 18:02:14 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34927220E4
        for <linux-input@vger.kernel.org>; Thu, 14 Apr 2022 14:59:46 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id e194so2420982iof.11
        for <linux-input@vger.kernel.org>; Thu, 14 Apr 2022 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1GICvYP5Cs+YPqVvcUezu41YOPdZ5+Yr5PEhT/G0Zm0=;
        b=eFhLL1yAUYYT3MoXtvvFvDTLojjWgIa2x+y9FpMbMF6XREBA4aPfmbFBOq3PC3gW6G
         1RytG3X99psfiAzcWFGVnihAnwx14pZFunksKOl/oyD1SMTSwCmF3EcR3iyAxa2SIpdT
         59cElkOPYQXJ8umTkDCbf1WERtSh7e/GJ27jWcjQnmbCCulY/bnJOv/qQjcfIHy4aPSG
         Y2Z1Akh4KRELWiJKaZFsAMvowDOpiRdgUJwO1M83arhNH2xFt1juloKdYK8rzdJCurl8
         GHHtUZ8zFEiV6Owc8RELj5Lph16ZoPs21JVGnl9m3eNKr3w9pYnjOdRZ/TrDQ77BxAg/
         gtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GICvYP5Cs+YPqVvcUezu41YOPdZ5+Yr5PEhT/G0Zm0=;
        b=pttRYBTvDT0lOzXA2RLtqmw2BN2ewW3Uia3iI+do0mTh3ibkp7hVaIZ11YcfZK74Rs
         eRmlW6wE4Cw0wc4qd3b0xLST6MfqIEHZxaB9gbUnKPCYxdHDpH1Zw8q1qQH0E4hg327q
         aMkWmGSSH4VjvZLW+LDPYA1mNfWuACSJ6v5WsMUbBx2Wuuqjyz3ctwslPDMxv1Tm0iWn
         oC8GsZBu5zRqWf2bbZcufUkbrvqTYJKDoelRBqgevKDCj0+UgXtfRQSDS5bSt9Mkc4tP
         N5xx9wodyqQdgbqTOpQxXyBD6l5kSIIa/mt85dtmPvoeH1+WsPJCBdDoMF5gE5cM9m03
         JSVQ==
X-Gm-Message-State: AOAM531kk62M6yMYyQevShr/8kQQni/pPqZPQq/+AReAUidGOFifK7m/
        mqH7GEqMXVvyDgDiuetlOvqCz/JIvnLTJBex4Oo=
X-Google-Smtp-Source: ABdhPJwTkUIzXSsRbZ0FBM/g4mcazcL/17GfcKGRnTOEKs0al9Ac9crcpL8R4jMuIC7X4poucpoifgLPctUhnXGgoQQ=
X-Received: by 2002:a5d:8450:0:b0:64c:cc87:c5fc with SMTP id
 w16-20020a5d8450000000b0064ccc87c5fcmr1940384ior.190.1649973585380; Thu, 14
 Apr 2022 14:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220322213316.101787-1-Joshua@Joshua-Dickens.com>
In-Reply-To: <20220322213316.101787-1-Joshua@Joshua-Dickens.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Thu, 14 Apr 2022 14:59:40 -0700
Message-ID: <CAF8JNhLorhuS1fpKfLD-GmYo4gCZrdCSTEpWvsiTgqp=UPufNw@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Adding Support for new usages
To:     Joshua Dickens <Joshua@joshua-dickens.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <Jason.Gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

In case you were wondering why we started to report those usages. The
usages have been in our firmware. HID_DG_SCANTIME was reported quite a
while ago. We didn't report it from our driver since our X driver
doesn't need it. But, we realized that other userland clients may use
it. The other two usages are Wacom specific. There are no standard
usages for them. So, they are only for custom features. The patch
itself should explain the usages well, I think.

Let me know if you have questions about the patch or the usages. Hope
the patch can be merged soon...

Thank you,
Ping

On Tue, Mar 22, 2022, 2:33 PM Joshua Dickens <joshua@joshua-dickens.com> wrote:
>
> From: Joshua-Dickens <Joshua@Joshua-Dickens.com>
>
> Added support for the following usages:
> * HID_DG_SCANTIME to report the timestamp for pen and touch events.
> * WACOM_HID_WD_BARRELSWITCH3 to support pens with 3 buttons.
> * WACOM_HID_WD_SEQUENCENUMBER to detect and report dropped packets.
>
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 43 +++++++++++++++++++++++++++++++++--------
>  drivers/hid/wacom_wac.h |  5 +++++
>  2 files changed, 40 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index a7176fc0635d..ce3555c54425 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -1811,7 +1811,9 @@ int wacom_equivalent_usage(int usage)
>                     usage == WACOM_HID_WD_TOUCHSTRIP2 ||
>                     usage == WACOM_HID_WD_TOUCHRING ||
>                     usage == WACOM_HID_WD_TOUCHRINGSTATUS ||
> -                   usage == WACOM_HID_WD_REPORT_VALID) {
> +                   usage == WACOM_HID_WD_REPORT_VALID ||
> +                   usage == WACOM_HID_WD_BARRELSWITCH3 ||
> +                   usage == WACOM_HID_WD_SEQUENCENUMBER) {
>                         return usage;
>                 }
>
> @@ -2196,8 +2198,11 @@ static void wacom_set_barrel_switch3_usage(struct wacom_wac *wacom_wac)
>         if (!(features->quirks & WACOM_QUIRK_AESPEN) &&
>             wacom_wac->hid_data.barrelswitch &&
>             wacom_wac->hid_data.barrelswitch2 &&
> -           wacom_wac->hid_data.serialhi)
> +           wacom_wac->hid_data.serialhi &&
> +           !wacom_wac->hid_data.barrelswitch3) {
>                 input_set_capability(input, EV_KEY, BTN_STYLUS3);
> +               features->quirks |= WACOM_QUIRK_PEN_BUTTON3;
> +       }
>  }
>
>  static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
> @@ -2261,6 +2266,9 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
>                 features->quirks |= WACOM_QUIRK_TOOLSERIAL;
>                 wacom_map_usage(input, usage, field, EV_MSC, MSC_SERIAL, 0);
>                 break;
> +       case HID_DG_SCANTIME:
> +               wacom_map_usage(input, usage, field, EV_MSC, MSC_TIMESTAMP, 0);
> +               break;
>         case WACOM_HID_WD_SENSE:
>                 features->quirks |= WACOM_QUIRK_SENSE;
>                 wacom_map_usage(input, usage, field, EV_KEY, BTN_TOOL_PEN, 0);
> @@ -2274,6 +2282,11 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
>                 input_set_capability(input, EV_KEY, BTN_TOOL_AIRBRUSH);
>                 wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
>                 break;
> +       case WACOM_HID_WD_BARRELSWITCH3:
> +               wacom_wac->hid_data.barrelswitch3 = true;
> +               wacom_map_usage(input, usage, field, EV_KEY, BTN_STYLUS3, 0);
> +               features->quirks &= ~WACOM_QUIRK_PEN_BUTTON3;
> +               break;
>         }
>  }
>
> @@ -2390,6 +2403,14 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
>         case WACOM_HID_WD_REPORT_VALID:
>                 wacom_wac->is_invalid_bt_frame = !value;
>                 return;
> +       case WACOM_HID_WD_BARRELSWITCH3:
> +               wacom_wac->hid_data.barrelswitch3 = value;
> +               return;
> +       case WACOM_HID_WD_SEQUENCENUMBER:
> +               if (wacom_wac->hid_data.sequence_number != value)
> +                       hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
> +               wacom_wac->hid_data.sequence_number = value + 1;
> +               return;
>         }
>
>         /* send pen events only when touch is up or forced out
> @@ -2442,12 +2463,15 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
>
>         if (!delay_pen_events(wacom_wac) && wacom_wac->tool[0]) {
>                 int id = wacom_wac->id[0];
> -               int sw_state = wacom_wac->hid_data.barrelswitch |
> -                              (wacom_wac->hid_data.barrelswitch2 << 1);
> -
> -               input_report_key(input, BTN_STYLUS, sw_state == 1);
> -               input_report_key(input, BTN_STYLUS2, sw_state == 2);
> -               input_report_key(input, BTN_STYLUS3, sw_state == 3);
> +               if (wacom_wac->features.quirks & WACOM_QUIRK_PEN_BUTTON3 &&
> +                   wacom_wac->hid_data.barrelswitch & wacom_wac->hid_data.barrelswitch2) {
> +                       wacom_wac->hid_data.barrelswitch = 0;
> +                       wacom_wac->hid_data.barrelswitch2 = 0;
> +                       wacom_wac->hid_data.barrelswitch3 = 1;
> +               }
> +               input_report_key(input, BTN_STYLUS, wacom_wac->hid_data.barrelswitch);
> +               input_report_key(input, BTN_STYLUS2, wacom_wac->hid_data.barrelswitch2);
> +               input_report_key(input, BTN_STYLUS3, wacom_wac->hid_data.barrelswitch3);
>
>                 /*
>                  * Non-USI EMR tools should have their IDs mangled to
> @@ -2529,6 +2553,9 @@ static void wacom_wac_finger_usage_mapping(struct hid_device *hdev,
>                         field->logical_maximum = 255;
>                 }
>                 break;
> +       case HID_DG_SCANTIME:
> +               wacom_map_usage(input, usage, field, EV_MSC, MSC_TIMESTAMP, 0);
> +               break;
>         }
>  }
>
> diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
> index 466b62cc16dc..46c1c761741f 100644
> --- a/drivers/hid/wacom_wac.h
> +++ b/drivers/hid/wacom_wac.h
> @@ -86,6 +86,7 @@
>  #define WACOM_QUIRK_AESPEN             0x0004
>  #define WACOM_QUIRK_BATTERY            0x0008
>  #define WACOM_QUIRK_TOOLSERIAL         0x0010
> +#define WACOM_QUIRK_PEN_BUTTON3        0x0020
>
>  /* device types */
>  #define WACOM_DEVICETYPE_NONE           0x0000
> @@ -108,6 +109,7 @@
>  #define WACOM_HID_WD_DIGITIZERFNKEYS    (WACOM_HID_UP_WACOMDIGITIZER | 0x39)
>  #define WACOM_HID_WD_SERIALNUMBER       (WACOM_HID_UP_WACOMDIGITIZER | 0x5b)
>  #define WACOM_HID_WD_SERIALHI           (WACOM_HID_UP_WACOMDIGITIZER | 0x5c)
> +#define WACOM_HID_WD_BARRELSWITCH3      (WACOM_HID_UP_WACOMDIGITIZER | 0x5d)
>  #define WACOM_HID_WD_TOOLTYPE           (WACOM_HID_UP_WACOMDIGITIZER | 0x77)
>  #define WACOM_HID_WD_DISTANCE           (WACOM_HID_UP_WACOMDIGITIZER | 0x0132)
>  #define WACOM_HID_WD_TOUCHSTRIP         (WACOM_HID_UP_WACOMDIGITIZER | 0x0136)
> @@ -115,6 +117,7 @@
>  #define WACOM_HID_WD_TOUCHRING          (WACOM_HID_UP_WACOMDIGITIZER | 0x0138)
>  #define WACOM_HID_WD_TOUCHRINGSTATUS    (WACOM_HID_UP_WACOMDIGITIZER | 0x0139)
>  #define WACOM_HID_WD_REPORT_VALID       (WACOM_HID_UP_WACOMDIGITIZER | 0x01d0)
> +#define WACOM_HID_WD_SEQUENCENUMBER     (WACOM_HID_UP_WACOMDIGITIZER | 0x0220)
>  #define WACOM_HID_WD_ACCELEROMETER_X    (WACOM_HID_UP_WACOMDIGITIZER | 0x0401)
>  #define WACOM_HID_WD_ACCELEROMETER_Y    (WACOM_HID_UP_WACOMDIGITIZER | 0x0402)
>  #define WACOM_HID_WD_ACCELEROMETER_Z    (WACOM_HID_UP_WACOMDIGITIZER | 0x0403)
> @@ -300,6 +303,7 @@ struct hid_data {
>         bool tipswitch;
>         bool barrelswitch;
>         bool barrelswitch2;
> +       bool barrelswitch3;
>         bool serialhi;
>         bool confidence;
>         int x;
> @@ -320,6 +324,7 @@ struct hid_data {
>         int bat_connected;
>         int ps_connected;
>         bool pad_input_event_flag;
> +       unsigned short sequence_number;
>  };
>
>  struct wacom_remote_data {
> --
> 2.35.1
>
