Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F2C124C3D
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 16:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfLRPwX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 10:52:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32386 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727330AbfLRPwW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 10:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576684340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=THYjZHsfqlcY5XBUJQqb0Qdi/YfwWdOPu9LEwp8yxW0=;
        b=UvxnZYWLFCWftiWi53pq1M4pyFu/pi3gYfxPOmb+spXJDIIXpyjYzIld7ZGh3tQoRCbnsx
        smoJJ18XSj6hlp+UIMN5dvT5mm39Ofaa2nt10OIiT4ZoT/gEpABCYUpYnoLPSuAGrcQQBE
        L9onKCm9WFLDWxG0yeJDqDO9rUy+e04=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-JFmJ36yyOICl-CpyUO8fbA-1; Wed, 18 Dec 2019 10:52:19 -0500
X-MC-Unique: JFmJ36yyOICl-CpyUO8fbA-1
Received: by mail-qv1-f72.google.com with SMTP id r9so1574195qvs.19
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 07:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=THYjZHsfqlcY5XBUJQqb0Qdi/YfwWdOPu9LEwp8yxW0=;
        b=sTkdTdrYiYLBzsmONTSP0hHiA0qBd2ZPJEpcvL5BfIEUG7XDqv9APzycRXJucMvIjE
         qxRd+cBL7b0PL1P42i7ON530Adte3Lawza2kc7kpfxk+R0T6ANEEhdA5FT/NCkwGMRFb
         8y+yNrMhWwanwSXr75e9C5aIDB12QchtEfR5gV/jzbko4UfEaD6aMZ6grvF3FVltW6+F
         1XpNaUOrVsaxLtpItgD+vQ1o9dz7RlbgdwEa137cbNds0G1zSzIKwtyLTKSb9e5ulz0G
         FfQ0br66D6L/4ZKHsSqIuAFjP+E23Vj39Osh8F02JXDanYqFrR98XHDiNBWtnM7YimdQ
         Qs/A==
X-Gm-Message-State: APjAAAUgp4uR6dBPFkr0+RDmxyr3E4KJjJugL70XQ/m+CWapgByaS3UF
        /GSVswmahBCTaLIe2whHJIfZK1hfUcrmfT5Qv8DFAxikY/Qsr1c8DmFIzfUUe/02WYMRA4eTTbP
        1XlHT5Oy3alFjC9gpKadPr+yD8uRszpoPjcQmHQ8=
X-Received: by 2002:a05:620a:11a3:: with SMTP id c3mr3214221qkk.230.1576684338744;
        Wed, 18 Dec 2019 07:52:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2fP1sRiLsu9cEvmPDh/NQ/bdrX1PJuTUOO1rcnSsj7nGBC10sCRPYH4PnhRw8dUhJ4X9vmJVGHVGOBtehVl0=
X-Received: by 2002:a05:620a:11a3:: with SMTP id c3mr3214190qkk.230.1576684338399;
 Wed, 18 Dec 2019 07:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20191026222506.453481-1-pedro@pedrovanzella.com>
In-Reply-To: <20191026222506.453481-1-pedro@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 16:52:06 +0100
Message-ID: <CAO-hwJLjN1UQAXTZbFWchOHGsQ2CqBc+JT6xFd=ZZqNUVDmDGw@mail.gmail.com>
Subject: Re: [PATCH v6] hid-logitech-hidpp: read battery voltage from newer devices
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

On Sun, Oct 27, 2019 at 12:26 AM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> Newer Logitech mice report their battery voltage through feature 0x1001
> instead of the battery levels through feature 0x1000.
>
> When the device is brought up and we try to query the battery, figure
> out if it supports the old or the new feature. If it supports the new
> feature, record the feature index and read the battery voltage and
> its charge status. The device will respond with three bytes: the first
> two are its voltage, and the last one is a bitset, reporting if the
> battery is charging, fast or slow, in critical level or discharging.
>
> If everything went correctly, record the fact that we're capable
> of querying battery voltage.
>
> Note that the protocol only gives us the current voltage in mV.
> We store that as-is, but when queried, we report it in uV as
> expected by sysfs.
>
> Like we do for other ways of interacting with the battery for other
> devices, refresh the battery status and notify the power supply
> subsystem of the changes in voltage and status.
>
> Since there are no known devices which implement both the old and the
> new battery feature, we make sure to try the newer feature first and
> only fall back to the old one if that fails.
>
> Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> ---

Applied to for-5.6/logitech, sorry for the delay.

Cheers,
Benjamin

>  drivers/hid/hid-logitech-hidpp.c | 172 ++++++++++++++++++++++++++++++-
>  1 file changed, 168 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 0179f7ed77e5..959586dab535 100644
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
> @@ -135,12 +136,15 @@ struct hidpp_report {
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
> +       int voltage;
> +       int charge_type;
>         bool online;
>  };
>
> @@ -1219,6 +1223,144 @@ static int hidpp20_battery_event(struct hidpp_device *hidpp,
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
> +#define EVENT_BATTERY_VOLTAGE_STATUS_BROADCAST 0x00
> +
> +static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage,
> +                                               int *level, int *charge_type)
> +{
> +       int status;
> +
> +       long charge_sts = (long)data[2];
> +
> +       *level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> +       switch (data[2] & 0xe0) {
> +       case 0x00:
> +               status = POWER_SUPPLY_STATUS_CHARGING;
> +               break;
> +       case 0x20:
> +               status = POWER_SUPPLY_STATUS_FULL;
> +               *level = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> +               break;
> +       case 0x40:
> +               status = POWER_SUPPLY_STATUS_DISCHARGING;
> +               break;
> +       case 0xe0:
> +               status = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +               break;
> +       default:
> +               status = POWER_SUPPLY_STATUS_UNKNOWN;
> +       }
> +
> +       *charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +       if (test_bit(3, &charge_sts)) {
> +               *charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
> +       }
> +       if (test_bit(4, &charge_sts)) {
> +               *charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> +       }
> +
> +       if (test_bit(5, &charge_sts)) {
> +               *level = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> +       }
> +
> +       *voltage = get_unaligned_be16(data);
> +
> +       return status;
> +}
> +
> +static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
> +                                                u8 feature_index,
> +                                                int *status, int *voltage,
> +                                                int *level, int *charge_type)
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
> +       *status = hidpp20_battery_map_status_voltage(params, voltage,
> +                                                    level, charge_type);
> +
> +       return 0;
> +}
> +
> +static int hidpp20_query_battery_voltage_info(struct hidpp_device *hidpp)
> +{
> +       u8 feature_type;
> +       int ret;
> +       int status, voltage, level, charge_type;
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
> +                                                 &status, &voltage, &level, &charge_type);
> +
> +       if (ret)
> +               return ret;
> +
> +       hidpp->battery.status = status;
> +       hidpp->battery.voltage = voltage;
> +       hidpp->battery.level = level;
> +       hidpp->battery.charge_type = charge_type;
> +       hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +       return 0;
> +}
> +
> +static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
> +                                           u8 *data, int size)
> +{
> +       struct hidpp_report *report = (struct hidpp_report *)data;
> +       int status, voltage, level, charge_type;
> +
> +       if (report->fap.feature_index != hidpp->battery.voltage_feature_index ||
> +               report->fap.funcindex_clientid != EVENT_BATTERY_VOLTAGE_STATUS_BROADCAST)
> +               return 0;
> +
> +       status = hidpp20_battery_map_status_voltage(report->fap.params, &voltage,
> +                                                   &level, &charge_type);
> +
> +       hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
> +
> +       if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
> +               hidpp->battery.voltage = voltage;
> +               hidpp->battery.status = status;
> +               hidpp->battery.level = level;
> +               hidpp->battery.charge_type = charge_type;
> +               if (hidpp->battery.ps)
> +                       power_supply_changed(hidpp->battery.ps);
> +       }
> +       return 0;
> +}
> +
>  static enum power_supply_property hidpp_battery_props[] = {
>         POWER_SUPPLY_PROP_ONLINE,
>         POWER_SUPPLY_PROP_STATUS,
> @@ -1228,6 +1370,7 @@ static enum power_supply_property hidpp_battery_props[] = {
>         POWER_SUPPLY_PROP_SERIAL_NUMBER,
>         0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
>         0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
> +       0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
>  };
>
>  static int hidpp_battery_get_property(struct power_supply *psy,
> @@ -1265,6 +1408,13 @@ static int hidpp_battery_get_property(struct power_supply *psy,
>                 case POWER_SUPPLY_PROP_SERIAL_NUMBER:
>                         val->strval = hidpp->hid_dev->uniq;
>                         break;
> +               case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +                       /* hardware reports voltage in in mV. sysfs expects uV */
> +                       val->intval = hidpp->battery.voltage * 1000;
> +                       break;
> +               case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +                       val->intval = hidpp->battery.charge_type;
> +                       break;
>                 default:
>                         ret = -EINVAL;
>                         break;
> @@ -3083,6 +3233,9 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
>                 ret = hidpp_solar_battery_event(hidpp, data, size);
>                 if (ret != 0)
>                         return ret;
> +               ret = hidpp20_battery_voltage_event(hidpp, data, size);
> +               if (ret != 0)
> +                       return ret;
>         }
>
>         if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP10_BATTERY) {
> @@ -3204,12 +3357,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
>
>         hidpp->battery.feature_index = 0xff;
>         hidpp->battery.solar_feature_index = 0xff;
> +       hidpp->battery.voltage_feature_index = 0xff;
>
>         if (hidpp->protocol_major >= 2) {
>                 if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
>                         ret = hidpp_solar_request_battery_event(hidpp);
> -               else
> -                       ret = hidpp20_query_battery_info(hidpp);
> +               else {
> +                       ret = hidpp20_query_battery_voltage_info(hidpp);
> +                       if (ret)
> +                               ret = hidpp20_query_battery_info(hidpp);
> +               }
>
>                 if (ret)
>                         return ret;
> @@ -3234,7 +3391,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
>         if (!battery_props)
>                 return -ENOMEM;
>
> -       num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 2;
> +       num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
>
>         if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE)
>                 battery_props[num_battery_props++] =
> @@ -3244,6 +3401,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
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
> @@ -3407,7 +3568,10 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
>                 else
>                         hidpp10_query_battery_status(hidpp);
>         } else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
> -               hidpp20_query_battery_info(hidpp);
> +               if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
> +                       hidpp20_query_battery_voltage_info(hidpp);
> +               else
> +                       hidpp20_query_battery_info(hidpp);
>         }
>         if (hidpp->battery.ps)
>                 power_supply_changed(hidpp->battery.ps);
> --
> 2.23.0
>

