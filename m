Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1736D291E16
	for <lists+linux-input@lfdr.de>; Sun, 18 Oct 2020 21:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388131AbgJRTuK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Oct 2020 15:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388128AbgJRTuH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Oct 2020 15:50:07 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D03C061755;
        Sun, 18 Oct 2020 12:50:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so9043154wro.8;
        Sun, 18 Oct 2020 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDIU93Cy8OeYg0MbGHEG8NDfs8tNKBHhS+Q+iS7NShU=;
        b=QM624+fuBq5HRpl0egYfbwAkMVhZS8qvl6IcRZuX39FCIr+1Gdqieowg4XwbhZ/da/
         MPI8D2MWDzg5Iu8CNZxNu7+5HU3xutbD7HFSXFGeTKLKBiYqGZ6rQZYZtaMegAG0LJU4
         MU0fIpc+mevYQ6nRP7ySxhDoNDuijsQaddU/HtZsP3fUEDIyhI5ieerLDZInZwDT0liO
         sZ17T2hBIYQZ7pJxnbMpNM4WmDy1Q4iy9/Sk/POWIB6QxLOrzDXwNRzZiVR3jpH4l8Pv
         Oug/QsnPAPdRzvPLlL26nzxa6nDl0PLaOb6rg74FioYkq28BglSWut35hF9CKW8I/eBy
         MCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iDIU93Cy8OeYg0MbGHEG8NDfs8tNKBHhS+Q+iS7NShU=;
        b=LXgqeL+B+2R8j34uP3vY5DAPhhyhTckMNwBAcsrzay2omVZSlIgBpX/rn7GetuwTNP
         3uc+A9MrJddbgmHOSaflOoU6mf4AhJzbU6/JsTsFpqBtPQ4zxHgTWVOkTHk5KlJ2EZBc
         E6ID8V1ZtLpLJCQkDSeYprwee2j/Zr8Muz5THY8xMfnfhf6xUoTy9+YZnDRnp7ojkiF5
         Lq1EGejs4FNtCfiCMltdUuqNlUlppsrJ+7RbLZMXBeAC6QP6RSu9fssN8hGX2Gny4c+P
         9bH1Du3FJGUDRpZjLHz3eGg8oA/ikKBfHzvbIcn60u/+PcP9KW5IHT8sb8aZpKFc9/FQ
         zQjw==
X-Gm-Message-State: AOAM530pc1y9zzxFK3Mk6WZnjV5ElBBdSduEBNQFX/7G3RgwCjwEU718
        M7FQA//F2rwxMZQN52DYwB60sVgVzMAfsCIbPHIY2HH/1DEEaA==
X-Google-Smtp-Source: ABdhPJz602AGaUhxiebuUsJuy2O16O4S59+OYP7nl/7VbOmFQ3MDmO/5qilHzU7TAOpMiGoXbMXO51eYMPPu+YN5fEM=
X-Received: by 2002:a5d:4141:: with SMTP id c1mr15893901wrq.113.1603050605836;
 Sun, 18 Oct 2020 12:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201017190152.12780-1-kholk11@gmail.com> <20201017190152.12780-3-kholk11@gmail.com>
In-Reply-To: <20201017190152.12780-3-kholk11@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 18 Oct 2020 22:49:49 +0300
Message-ID: <CAHp75VeYCOW4QoWUiQ0soYpUSyHsu_jWmuGepckj3QMyi6gzbg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] Input: Add Novatek NT36xxx touchscreen driver
To:     kholk11@gmail.com
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>, priv.luk@gmail.com,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        Martin Botka <martin.botka1@gmail.com>,
        phone-devel@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 18, 2020 at 12:40 AM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This is a driver for the Novatek in-cell touch controller and
> supports various chips from the NT36xxx family, currently
> including NT36525, NT36672A, NT36676F, NT36772 and NT36870.
>
> Functionality like wake gestures and firmware flashing is not
> included: I am not aware of any of these DrIC+Touch combo
> chips not including a non-volatile memory and it should be
> highly unlikely to find one, since the touch firmware is
> embedded into the DriverIC one, which is obviously necessary
> to drive the display unit.
>
> However, the necessary address for the firmware update
> procedure was included into the address table in this driver
> so, in the event that someone finds the need to implement it
> for a reason or another, it will be pretty straightforward to.
>
> This driver is lightly based on the downstream implementation [1].
> [1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx

...

> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>

> +#include <linux/of_gpio.h>

I haven't found evidence you need this header.
But mod_devicetable.h along with gpio/consumer.h seem missed.

> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/regulator/consumer.h>

...

> +enum nt36xxx_fw_state {
> +       NT36XXX_STATE_INIT = 0xa0,      /* IC reset */
> +       NT36XXX_STATE_REK,              /* ReK baseline */
> +       NT36XXX_STATE_REK_FINISH,       /* Baseline is ready */
> +       NT36XXX_STATE_NORMAL_RUN,       /* Normal run */
> +       NT36XXX_STATE_MAX = 0xaf
> +};

Perhaps kernel doc?

...

> +static int nt36xxx_set_page(struct nt36xxx_i2c *ts, u32 pageaddr)
> +{
> +       u32 data = cpu_to_be32(pageaddr) >> 8;
> +       int ret;
> +
> +       ret = regmap_noinc_write(ts->fw_regmap, NT36XXX_CMD_SET_PAGE,
> +                                &data, sizeof(data));

> +       if (ret == 0)
> +               usleep_range(100, 200);
> +
> +       return ret;

Can you use traditional pattern, i.e.

  if (ret)
    return ret;

  ...
  return 0;

?

> +}
> +
> +static int nt36xxx_sw_reset_idle(struct nt36xxx_i2c *ts)
> +{
> +       int ret;
> +
> +       ret = regmap_write(ts->regmap, ts->hw_client->addr,
> +                          NT36XXX_CMD_SW_RESET);
> +

> +       usleep_range(15000, 16000);

Even in error case? Also, can you explain the value of delay?

> +       return ret;
> +}
> +
> +static int nt36xxx_bootloader_reset(struct nt36xxx_i2c *ts)
> +{
> +       int ret;
> +
> +       ret = regmap_write(ts->regmap, ts->hw_client->addr,
> +                          NT36XXX_CMD_BOOTLOADER_RESET);
> +

> +       msleep(35);

Same as above, esp. taking into account quite a long delay.

> +       return ret;
> +}
> +
> +static int nt36xxx_check_reset_state(struct nt36xxx_i2c *ts,
> +                                    enum nt36xxx_fw_state fw_state)
> +{
> +       u8 buf[2] = { 0 };
> +       int ret, retry = NT36XXX_MAX_FW_RST_RETRY;
> +
> +       do {
> +               ret = regmap_noinc_read(ts->fw_regmap,
> +                                       NT36XXX_EVT_RESET_COMPLETE,
> +                                       buf, sizeof(buf));
> +               if (likely(ret == 0) &&
> +                   (buf[0] >= fw_state) &&
> +                   (buf[0] <= NT36XXX_STATE_MAX)) {
> +                       ret = 0;
> +                       break;
> +               }
> +               usleep_range(10000, 11000);
> +       } while (--retry);
> +
> +       if (!retry) {
> +               dev_err(&ts->hw_client->dev, "Firmware reset failed.\n");
> +               ret = -EBUSY;
> +       }

This sounds like it should be a part of regmap API, such as
regmap_read_poll_timeout().

> +
> +       return ret;
> +}
> +
> +static int nt36xxx_read_pid(struct nt36xxx_i2c *ts)
> +{
> +       u8 buf[2] = { 0 };
> +       int ret = 0;

Redundant assignments.

> +       ret = nt36xxx_set_page(ts, ts->mmap->evtbuf_addr);
> +       if (unlikely(ret < 0))
> +               return ret;
> +
> +       ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_PROJECTID,
> +                               buf, sizeof(buf));
> +       if (unlikely(ret < 0))
> +               return ret;
> +

> +       ts->fw_info.nvt_pid = (buf[1] << 8) + buf[0];

Define buf as __le16 and use le16_to_cpu().

> +
> +       return 0;
> +}
> +
> +static int __nt36xxx_get_fw_info(struct nt36xxx_i2c *ts)
> +{
> +       struct nt36xxx_fw_info *fwi = &ts->fw_info;
> +       u8 buf[11] = { 0 };
> +       int ret = 0;
> +
> +       ret = nt36xxx_set_page(ts, ts->mmap->evtbuf_addr);
> +       if (unlikely(ret < 0))
> +               return ret;
> +
> +       ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_FWINFO,
> +                               buf, sizeof(buf));
> +       if (ret)
> +               return ret;
> +
> +       fwi->fw_ver = buf[0];
> +       fwi->x_num = buf[2];
> +       fwi->y_num = buf[3];
> +       fwi->abs_x_max = (u16)((buf[4] << 8) | buf[5]);
> +       fwi->abs_y_max = (u16)((buf[6] << 8) | buf[7]);

be16_to_cpu() or get_unaligned_be16(), though here it's aligned.

> +       fwi->max_buttons = buf[10];
> +
> +       /* Check fw info integrity and clear x_num, y_num if broken */
> +       if ((buf[0] + buf[1]) != 0xFF) {
> +               dev_err(&ts->hw_client->dev,
> +                       "FW info is broken! fw_ver=0x%02X, ~fw_ver=0x%02X\n",
> +                       buf[0], buf[1]);
> +               fwi->fw_ver = 0;
> +               fwi->x_num = 18;
> +               fwi->y_num = 32;
> +               fwi->abs_x_max = TOUCH_DEFAULT_MAX_WIDTH;
> +               fwi->abs_y_max = TOUCH_DEFAULT_MAX_HEIGHT;
> +               fwi->max_buttons = 0;
> +               return -EINVAL;
> +       }
> +
> +       /* Get Novatek ProjectID */
> +       return nt36xxx_read_pid(ts);
> +}

...

> +static int nvt_stop_crc_reboot(struct nt36xxx_i2c *ts)
> +{
> +       u8 buf[3] = { 0 };
> +       u8 val;
> +       int ret, retry = NT36XXX_MAX_RETRIES;
> +
> +       /* Read dummy buffer to check CRC fail reboot is happening or not */
> +
> +       /* Change I2C index to prevent getting 0xFF, but not 0xFC */
> +       ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CHIP_INFO);
> +       if (ret) {
> +               dev_dbg(&ts->hw_client->dev,
> +                       "CRC reset failed: Cannot select page.\n");
> +               return ret;
> +       }
> +
> +       /* If ChipID command returns 0xFC or 0xFF, the MCU is in CRC reboot */
> +       ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CHIPID,
> +                               buf, sizeof(buf));
> +       if (ret)
> +               return ret;
> +
> +       if (((buf[0] == 0xFC) && (buf[1] == 0xFC) && (buf[2] == 0xFC)) ||
> +           ((buf[0] == 0xFF) && (buf[1] == 0xFF) && (buf[2] == 0xFF))) {

You may decrese indentation by switching above to be negative conditional.

> +               /* IC is in CRC fail reboot loop, needs to be stopped! */
> +               do {
> +                       /* Special reset-idle sequence for CRC failure */
> +                       ret = regmap_write(ts->regmap, ts->hw_client->addr,
> +                                          NT36XXX_CMD_SW_RESET);

> +                       ret += regmap_write(ts->regmap, ts->hw_client->addr,
> +                                          NT36XXX_CMD_SW_RESET);

It's not good practice to sum error codes.

> +                       if (ret)
> +                               dev_dbg(&ts->hw_client->dev,
> +                                       "SW Reset failed: may not recover\n");
> +                       usleep_range(1000, 1100);
> +
> +                       /* Clear CRC_ERR_FLAG */
> +                       ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CRC);
> +                       if (ret)
> +                               continue;
> +
> +                       val = 0xA5;
> +                       ret = regmap_raw_write(ts->fw_regmap, NT36XXX_EVT_CRC,
> +                                              &val, sizeof(val));
> +                       if (ret)
> +                               continue;
> +
> +                       /* Check CRC_ERR_FLAG */
> +                       ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CRC);
> +                       if (ret)
> +                               continue;
> +
> +                       ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CRC,
> +                                               &buf, sizeof(buf));
> +                       if (ret)
> +                               continue;
> +
> +                       if (buf[0] == 0xA5)
> +                               break;
> +               } while (--retry);
> +
> +               if (retry == 0) {
> +                       dev_err(&ts->hw_client->dev,
> +                               "CRC reset failed: buf=0x%02x%02x\n",
> +                               buf[0], buf[1]);

%2ph

> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int nt36xxx_i2c_chip_version_init(struct nt36xxx_i2c *ts)
> +{
> +       u8 buf[7] = { 0 };
> +       int retry = NT36XXX_MAX_RETRIES;
> +       int sz = sizeof(trim_id_table) / sizeof(struct nt36xxx_trim_table);
> +       int i, list, mapid, ret;
> +
> +       ret = nt36xxx_bootloader_reset(ts);
> +       if (ret < 0) {
> +               dev_err(&ts->hw_client->dev, "Can't reset the nvt IC\n");
> +               return ret;
> +       }
> +
> +       do {
> +               ret = nt36xxx_sw_reset_idle(ts);
> +               if (ret < 0)
> +                       continue;
> +
> +               ret = regmap_write(ts->regmap, ts->hw_client->addr, NT36XXX_CMD_UNLOCK);
> +               if (ret)
> +                       continue;
> +               usleep_range(10000, 11000);
> +
> +               ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CHIP_INFO);
> +               if (ret)
> +                       continue;
> +
> +               memset(buf, 0, ARRAY_SIZE(buf));
> +               ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CHIPID,
> +                                       buf, sizeof(buf));
> +               if (ret)
> +                       continue;
> +
> +               /* Compare read chip id with trim list */
> +               for (list = 0; list < sz; list++) {
> +                       /* Compare each not masked byte */
> +                       for (i = 0; i < NT36XXX_ID_LEN_MAX; i++) {
> +                               if (trim_id_table[list].mask[i] &&
> +                                   buf[i] != trim_id_table[list].id[i])
> +                                       break;
> +                       }
> +
> +                       if (i == NT36XXX_ID_LEN_MAX) {
> +                               mapid = trim_id_table[list].mapid;
> +                               ts->mmap = &nt36xxx_memory_maps[mapid];
> +                               return 0;
> +                       }
> +
> +                       ts->mmap = NULL;
> +                       ret = -ENOENT;
> +               }
> +
> +               /* Stop CRC check to prevent IC auto reboot */
> +               if (((buf[1] == 0xFC) && (buf[2] == 0xFC) &&
> +                    (buf[3] == 0xFC)) ||
> +                   ((buf[1] == 0xFF) && (buf[2] == 0xFF) &&
> +                    (buf[3] == 0xFF))) {

You already have the same code above. Perhaps helper is good to have for this.

> +                       ret = nvt_stop_crc_reboot(ts);
> +                       if (ret < 0)
> +                               continue;
> +               }
> +
> +               usleep_range(10000, 11000);
> +       } while (--retry);
> +
> +       return ret;
> +}
> +
> +static const struct regmap_config nt36xxx_i2c_regmap_hw_config = {
> +       .name = "nt36xxx_i2c_hw",
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .cache_type = REGCACHE_NONE,
> +};
> +
> +static const struct regmap_config nt36xxx_i2c_regmap_fw_config = {
> +       .name = "nt36xxx_i2c_fw",
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .cache_type = REGCACHE_NONE,
> +};
> +
> +static void nt36xxx_disable_regulators(void *data)
> +{
> +       struct nt36xxx_i2c *ts = data;
> +
> +       regulator_bulk_disable(NT36XXX_NUM_SUPPLIES, ts->supplies);
> +}
> +
> +static int nt36xxx_i2c_probe(struct i2c_client *hw_client,
> +                            const struct i2c_device_id *id)
> +{
> +       struct nt36xxx_i2c *ts;
> +       struct input_dev *input;
> +       int ret;
> +
> +       if (!i2c_check_functionality(hw_client->adapter, I2C_FUNC_I2C)) {
> +               dev_err(&hw_client->dev, "i2c_check_functionality error\n");
> +               return -EIO;
> +       }
> +
> +       if (!hw_client->irq) {
> +               dev_err(&hw_client->dev, "No irq specified\n");
> +               return -EINVAL;
> +       }
> +
> +       ts = devm_kzalloc(&hw_client->dev, sizeof(struct nt36xxx_i2c), GFP_KERNEL);
> +       if (!ts)
> +               return -ENOMEM;
> +
> +       ts->supplies = devm_kcalloc(&hw_client->dev,
> +                                   NT36XXX_NUM_SUPPLIES,
> +                                   sizeof(struct regulator_bulk_data),
> +                                   GFP_KERNEL);
> +       if (!ts->supplies)
> +               return -ENOMEM;
> +
> +       input = devm_input_allocate_device(&hw_client->dev);
> +       if (!input)
> +               return -ENOMEM;
> +
> +       ts->fw_client = i2c_new_dummy_device(hw_client->adapter,
> +                                            NT36XXX_FW_ADDR);
> +       if (IS_ERR(ts->fw_client)) {
> +               dev_err(&hw_client->dev, "Cannot add FW I2C device\n");
> +               return PTR_ERR(ts->fw_client);
> +       }
> +
> +       ts->hw_client = hw_client;
> +       ts->input = input;
> +       i2c_set_clientdata(ts->hw_client, ts);
> +       i2c_set_clientdata(ts->fw_client, ts);
> +
> +       ts->reset_gpio = devm_gpiod_get_optional(&hw_client->dev, "reset",
> +                                                GPIOD_OUT_HIGH);
> +       if (IS_ERR(ts->reset_gpio))
> +               return PTR_ERR(ts->reset_gpio);

> +       if (ts->reset_gpio)

Redundant. If you mark GPIO as optional all those checks should not be here.

> +               gpiod_set_consumer_name(ts->reset_gpio, "nt36xxx reset");
> +
> +       /* These supplies are optional */
> +       ts->supplies[0].supply = "vdd";
> +       ts->supplies[1].supply = "vio";
> +       ret = devm_regulator_bulk_get(&hw_client->dev,
> +                                     NT36XXX_NUM_SUPPLIES,
> +                                     ts->supplies);
> +       if (ret != 0) {

if (ret)

> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&hw_client->dev,
> +                               "Cannot get supplies: %d\n", ret);
> +               return ret;

I think there is no return dev_err_probe() here b/c Dmitry is against it?

> +       }
> +
> +       ts->regmap = devm_regmap_init_i2c(ts->hw_client,
> +                                         &nt36xxx_i2c_regmap_hw_config);
> +       if (IS_ERR(ts->regmap)) {
> +               dev_err(&hw_client->dev, "regmap (hw-addr) init failed\n");
> +               return PTR_ERR(ts->regmap);
> +       }
> +
> +       ts->fw_regmap = devm_regmap_init_i2c(ts->fw_client,
> +                                            &nt36xxx_i2c_regmap_fw_config);
> +       if (IS_ERR(ts->fw_regmap)) {
> +               dev_err(&hw_client->dev, "regmap (fw-addr) init failed\n");
> +               return PTR_ERR(ts->fw_regmap);
> +       }
> +
> +       ret = regulator_bulk_enable(NT36XXX_NUM_SUPPLIES, ts->supplies);
> +       if (ret)
> +               return ret;

> +       usleep_range(10000, 11000);

Why?

> +       ret = devm_add_action_or_reset(&hw_client->dev,
> +                                      nt36xxx_disable_regulators, ts);
> +       if (ret)
> +               return ret;
> +
> +       mutex_init(&ts->lock);
> +
> +       /* Set memory maps for the specific chip version */
> +       ret = nt36xxx_i2c_chip_version_init(ts);
> +       if (ret) {
> +               dev_err(&hw_client->dev, "Failed to check chip version\n");
> +               return ret;
> +       }
> +
> +       /* Reset the MCU */
> +       ret = nt36xxx_bootloader_reset(ts);

> +       if (unlikely(ret < 0))

All these unlikely() calls are unlikely needed. Please, drop them for
the sake of readability.

> +               return ret;
> +
> +       /* Check and eventually wait until the MCU goes in reset state */
> +       ret = nt36xxx_check_reset_state(ts, NT36XXX_STATE_INIT);
> +       if (unlikely(ret < 0))
> +               return ret;
> +
> +       /* Get informations from the TS firmware */
> +       ret = nt36xxx_get_fw_info(ts);
> +       if (unlikely(ret < 0))
> +               return ret;
> +
> +       input->phys = devm_kasprintf(&hw_client->dev, GFP_KERNEL,
> +                                    "%s/input0", dev_name(&hw_client->dev));
> +
> +       input->name = "Novatek NT36XXX Touchscreen";
> +       input->id.bustype = BUS_I2C;
> +       input->dev.parent = &hw_client->dev;
> +
> +       __set_bit(EV_KEY, input->evbit);
> +       __set_bit(EV_ABS, input->evbit);
> +       input_set_capability(input, EV_KEY, BTN_TOUCH);
> +
> +       ret = input_mt_init_slots(input, TOUCH_MAX_FINGER_NUM,
> +                                 INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> +       if (ret) {
> +               dev_err(&hw_client->dev, "Cannot init MT slots (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       input_set_abs_params(input, ABS_MT_PRESSURE, 0,
> +                            TOUCH_MAX_PRESSURE, 0, 0);
> +       input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> +
> +       input_set_abs_params(input, ABS_MT_POSITION_X, 0,
> +                            ts->fw_info.abs_x_max - 1, 0, 0);
> +       input_set_abs_params(input, ABS_MT_POSITION_Y, 0,
> +                            ts->fw_info.abs_y_max - 1, 0, 0);
> +
> +       /* Override the firmware defaults, if needed */
> +       touchscreen_parse_properties(input, true, &ts->prop);
> +
> +       input_set_drvdata(input, ts);
> +
> +       ret = input_register_device(ts->input);
> +       if (ret) {
> +               dev_err(&hw_client->dev, "Failed to register input device: %d\n",
> +                       ret);
> +               return ret;
> +       }
> +
> +       ret = devm_request_threaded_irq(&hw_client->dev, hw_client->irq, NULL,
> +                                       nt36xxx_i2c_irq_handler, IRQF_ONESHOT,
> +                                       hw_client->name, ts);
> +       if (ret) {
> +               dev_err(&hw_client->dev, "request irq failed: %d\n", ret);

> +               return ret;
> +       }
> +
> +       return 0;

return ret; ?

> +}
> +
> +static int __maybe_unused nt36xxx_i2c_suspend(struct device *dev)
> +{
> +       struct nt36xxx_i2c *ts = i2c_get_clientdata(to_i2c_client(dev));
> +       int ret;
> +
> +       disable_irq(ts->hw_client->irq);
> +
> +       ret = regmap_write(ts->fw_regmap, NT36XXX_EVT_HOST_CMD,
> +                          NT36XXX_CMD_ENTER_SLEEP);
> +       if (unlikely(ret)) {
> +               dev_err(&ts->hw_client->dev, "Cannot enter suspend!!\n");
> +               return ret;
> +       }

> +       if (ts->reset_gpio)

Redundant.

> +               gpiod_set_value(ts->reset_gpio, 1);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused nt36xxx_i2c_resume(struct device *dev)
> +{
> +       struct nt36xxx_i2c *ts = i2c_get_clientdata(to_i2c_client(dev));
> +       int ret;
> +
> +       mutex_lock(&ts->lock);

> +       if (ts->reset_gpio)

Redundant.

> +               gpiod_set_value(ts->reset_gpio, 0);

> +       /* Reboot the MCU (also recalibrates the TS) */
> +       ret = nt36xxx_bootloader_reset(ts);
> +       if (ret < 0)
> +               goto end;
> +
> +       ret = nt36xxx_check_reset_state(ts, NT36XXX_STATE_REK);
> +       if (ret < 0)
> +               goto end;
> +
> +       enable_irq(ts->hw_client->irq);
> +end:
> +       mutex_unlock(&ts->lock);
> +       return ret;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(nt36xxx_i2c_pm,
> +                        nt36xxx_i2c_suspend, nt36xxx_i2c_resume);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nt36xxx_of_match[] = {
> +       { .compatible = "novatek,nt36525" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, nt36xxx_of_match);
> +#endif
> +
> +static const struct i2c_device_id nt36xxx_i2c_ts_id[] = {
> +       { "NVT-ts", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, nt36xxx_i2c_ts_id);
> +
> +static struct i2c_driver nt36xxx_i2c_ts_driver = {
> +       .driver = {
> +               .name   = "nt36xxx_ts",
> +               .pm     = &nt36xxx_i2c_pm,

> +               .of_match_table = of_match_ptr(nt36xxx_of_match),

You may do a good job by dropping these of_match_ptr() along with ugly
ifdeffery above. It will allow to use it on ACPI-enabled platforms.

> +       },


--
With Best Regards,
Andy Shevchenko
