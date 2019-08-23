Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88A29B45C
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 18:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388422AbfHWQP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 12:15:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45104 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388596AbfHWQP2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 12:15:28 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1A486C014166
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 16:15:27 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id e32so10344978qtc.7
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6ETTYX6ip+erbXyYpA48Veha/WJGB1BE30pKgns3G0=;
        b=fuzwUuyg9KonRueUR6HRCvVcy1sGOpmh7Xn/AY0n4eN6/V7r6ra23g1IFrgdwLg/4l
         hWfPGF9wW5lDaUsMQYUx/DU7uYc9FgZ+uYD0qDmTMxWtRspF438vBYLg/HqGAOIiG+UD
         0gQt38wA5M+xnqzpBzPuSyUt683uEKH575kXVP+GR+FmnAmrP5LftIrllNA6LEvzVF58
         YIPxKvd6Opp4iPKBdW22DC1Aw1kWwtFbyGehv8g7JbzkIFuWzE2DWxDkRXs3k0hRyGvk
         UhRoj5m3805EoX7rRecl1IAlgzQCisVyv85rzSeuYcF0fuJ6uPKGFGgsHY0ZUYupiuEv
         338w==
X-Gm-Message-State: APjAAAXnOKwQcYqH/4tvgyMtvmpnTroZVbdeJ3H8TPT8SvcfH5VPyub1
        ztI2YPviWshauzSnMT1HwbZ0qPTdeaauaChI9JYod+H+aAkqTs6inlm3bwpQGBA9upG/R6Pfyjz
        KHa46R3DQMJsMnt8ea5p08szQUWTTfrWatuXMk9c=
X-Received: by 2002:ac8:4910:: with SMTP id e16mr5451678qtq.260.1566576926116;
        Fri, 23 Aug 2019 09:15:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyk+uRiU80Ym7tTYoC7S6dHv1/Uo9TOwxoJAkusf7n1VEQsAI/IGVm/Fyaj7j64A0A+qi69cv19hXHqv4DZGk=
X-Received: by 2002:ac8:4910:: with SMTP id e16mr5451652qtq.260.1566576925851;
 Fri, 23 Aug 2019 09:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190823154952.7525-1-pedro@pedrovanzella.com>
In-Reply-To: <20190823154952.7525-1-pedro@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 18:15:13 +0200
Message-ID: <CAO-hwJJPDQ0JcLTOca0E3oKQfYV6BHbm4u4xcx4rYoVcC28Ctw@mail.gmail.com>
Subject: Re: [PATCH v4] hid-logitech-hidpp: read battery voltage from newer devices
To:     Pedro Vanzella <pedro@pedrovanzella.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pedro,

On Fri, Aug 23, 2019 at 5:51 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> Newer Logitech mice report their battery voltage through feature 0x1001
> instead of the battery levels through feature 0x1000.
>
> When the device is brought up and we try to query the battery, figure
> out if it supports the old or the new feature. If it supports the new
> feature, record the feature index and read the battery voltage and
> its status.
>
> If everything went correctly, record the fact that we're capable
> of querying battery voltage.
>
> Note that the protocol only gives us the current voltage in millivolts.
>
> Like we do for other ways of interacting with the battery for other
> devices, refresh the battery status and notify the power supply
> subsystem of the changes in voltage and status.
>
> Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>

I still have comments, please see inline:

> ---
>  drivers/hid/hid-logitech-hidpp.c | 140 ++++++++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 0179f7ed77e5..5c9c3133d2ae 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -87,6 +87,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_CAPABILITY_HIDPP20_BATTERY       BIT(1)
>  #define HIDPP_CAPABILITY_BATTERY_MILEAGE       BIT(2)
>  #define HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS  BIT(3)
> +#define HIDPP_CAPABILITY_BATTERY_VOLTAGE       BIT(4)
>
>  /*
>   * There are two hidpp protocols in use, the first version hidpp10 is known
> @@ -135,12 +136,14 @@ struct hidpp_report {
>  struct hidpp_battery {
>         u8 feature_index;
>         u8 solar_feature_index;
> +       u8 voltage_feature_index;
>         struct power_supply_desc desc;
>         struct power_supply *ps;
>         char name[64];
>         int status;
>         int capacity;
>         int level;
> +       int voltage; /* in millivolts */
>         bool online;
>  };
>
> @@ -1219,6 +1222,122 @@ static int hidpp20_battery_event(struct hidpp_device *hidpp,
>         return 0;
>  }
>
> +/* -------------------------------------------------------------------------- */
> +/* 0x1001: Battery voltage                                                    */
> +/* -------------------------------------------------------------------------- */
> +
> +#define HIDPP_PAGE_BATTERY_VOLTAGE 0x1001
> +
> +#define CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE 0x00
> +
> +static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage)
> +{
> +       int status;
> +
> +       switch (data[2]) {
> +       case 0x00: /* discharging */
> +               status = POWER_SUPPLY_STATUS_DISCHARGING;
> +               break;
> +       case 0x10: /* wireless charging */
> +       case 0x80: /* charging */
> +               status = POWER_SUPPLY_STATUS_CHARGING;
> +               break;
> +       case 0x81: /* fully charged */
> +               status = POWER_SUPPLY_STATUS_FULL;
> +               break;
> +       default:
> +               status = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +       }
> +
> +       *voltage = (data[0] << 8) + data[1];

If I am not wrong, you can use get_unaligned_be16 here instead

> +
> +       return status;
> +}
> +
> +static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
> +                                              u8 feature_index,
> +                                              int *status, int *voltage)
> +{
> +       struct hidpp_report response;
> +       int ret;
> +       u8 *params = (u8 *)response.fap.params;
> +
> +       ret = hidpp_send_fap_command_sync(hidpp, feature_index,
> +                                         CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE,
> +                                         NULL, 0, &response);
> +
> +       if (ret > 0) {
> +               hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
> +                       __func__, ret);
> +               return -EPROTO;
> +       }
> +       if (ret)
> +               return ret;
> +
> +       hidpp->capabilities |= HIDPP_CAPABILITY_BATTERY_VOLTAGE;
> +
> +       *status = hidpp20_battery_map_status_voltage(params, voltage);
> +
> +       return 0;
> +}
> +
> +static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
> +{
> +       u8 feature_type;
> +       int ret;
> +       int status, voltage;
> +
> +       if (hidpp->battery.voltage_feature_index == 0xff) {
> +               ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_BATTERY_VOLTAGE,
> +                                            &hidpp->battery.voltage_feature_index,
> +                                            &feature_type);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = hidpp20_battery_get_battery_voltage(hidpp,
> +                                                 hidpp->battery.voltage_feature_index,
> +                                                 &status, &voltage);
> +
> +       if (ret)
> +               return ret;
> +
> +       hidpp->battery.status = status;
> +       hidpp->battery.voltage = voltage;
> +       hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +       return 0;
> +}
> +
> +static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
> +                                        u8 *data, int size)
> +{
> +       struct hidpp_report *report = (struct hidpp_report *)data;
> +       int status, voltage;
> +       bool changed;
> +
> +       if (report->fap.feature_index != hidpp->battery.voltage_feature_index ||
> +           report->fap.funcindex_clientid !=
> +                   EVENT_BATTERY_LEVEL_STATUS_BROADCAST)

this should probably be defined in 0x1001 as
EVENT_BATTERY_VOLTAGE_STATUS_BROADCAST

> +               return 0;
> +
> +       status = hidpp20_battery_map_status_voltage(report->fap.params,
> +                                                   &voltage);
> +
> +       hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +       changed = voltage != hidpp->battery.voltage ||
> +                 status != hidpp->battery.status;
> +
> +       if (changed) {

There is no point in using an extra `changed` variable here, just
unwind the boolean operation above here.

> +               hidpp->battery.voltage = voltage;
> +               hidpp->battery.status = status;
> +               if (hidpp->battery.ps)
> +                       power_supply_changed(hidpp->battery.ps);
> +       }
> +       return 0;
> +}
> +
>  static enum power_supply_property hidpp_battery_props[] = {
>         POWER_SUPPLY_PROP_ONLINE,
>         POWER_SUPPLY_PROP_STATUS,
> @@ -1228,6 +1347,7 @@ static enum power_supply_property hidpp_battery_props[] = {
>         POWER_SUPPLY_PROP_SERIAL_NUMBER,
>         0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
>         0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
> +       0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
>  };
>
>  static int hidpp_battery_get_property(struct power_supply *psy,
> @@ -1265,6 +1385,9 @@ static int hidpp_battery_get_property(struct power_supply *psy,
>                 case POWER_SUPPLY_PROP_SERIAL_NUMBER:
>                         val->strval = hidpp->hid_dev->uniq;
>                         break;
> +               case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +                       val->intval = hidpp->battery.voltage;
> +                       break;
>                 default:
>                         ret = -EINVAL;
>                         break;
> @@ -3083,6 +3206,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
>                 ret = hidpp_solar_battery_event(hidpp, data, size);
>                 if (ret != 0)
>                         return ret;
> +               ret = hidpp20_battery_voltage_event(hidpp, data, size);
> +               if (ret != 0)
> +                       return ret;
>         }
>
>         if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
> @@ -3204,12 +3330,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
>
>         hidpp->battery.feature_index = 0xff;
>         hidpp->battery.solar_feature_index = 0xff;
> +       hidpp->battery.voltage_feature_index = 0xff;
>
>         if (hidpp->protocol_major >= 2) {
>                 if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
>                         ret = hidpp_solar_request_battery_event(hidpp);
> -               else
> +               else {
>                         ret = hidpp20_query_battery_info(hidpp);
> +                       if (ret)
> +                               ret = hidpp20_query_battery_voltage_info(hidpp);
> +               }

we should probably do the other way around: first test
hidpp20_query_battery_voltage_info and then go for the generic one, so
that the error returned will be the one from the most common feature,
and you will keep existing behaviour.

>
>                 if (ret)
>                         return ret;
> @@ -3234,7 +3364,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
>         if (!battery_props)
>                 return -ENOMEM;
>
> -       num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 2;
> +       num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
>
>         if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
>                 battery_props[num_battery_props++] =
> @@ -3244,6 +3374,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
>                 battery_props[num_battery_props++] =
>                                 POWER_SUPPLY_PROP_CAPACITY_LEVEL;
>
> +       if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
> +               battery_props[num_battery_props++] =
> +                       POWER_SUPPLY_PROP_VOLTAGE_NOW;
> +
>         battery = &hidpp->battery;
>
>         n = atomic_inc_return(&battery_no) - 1;
> @@ -3408,6 +3542,8 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>                         hidpp10_query_battery_status(hidpp);
>         } else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
>                 hidpp20_query_battery_info(hidpp);
> +               if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
> +                       hidpp20_query_battery_voltage_info(hidpp);

I'd put the test above `hidpp20_query_battery_info(hidpp);` and would
add an else statement to fetch the battery info

>         }
>         if (hidpp->battery.ps)
>                 power_supply_changed(hidpp->battery.ps);
> --
> 2.23.0
>

Cheers,
Benjamin
