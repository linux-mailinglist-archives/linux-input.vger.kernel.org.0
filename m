Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5F73D823
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 08:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFZG6A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 02:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjFZG55 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 02:57:57 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D8BAC
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 23:57:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa798cf204so48970265e9.0
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687762670; x=1690354670;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dtivi7hjlOmL2ewulHuBv1rqAxWzqhAIroGpZjq/TeA=;
        b=pU0rGTSIXRKXVgnGANpP/ctU2iBPH1Zvu+XMf08H3YkYcIJKt/fh1uaUIzSgaVOlqq
         r7HFf/EKBCJYGlNoZivEFUnkod1yFJoDGLRNql4wfrQ0wU5RliyzOA/bvzffOgCQ/FPE
         NOaaMwx3JHp1sWGKakqMLsAbQen/+vQrLY5lKByhUIHnPTnL80ZXxYxkUHYJUFVj0nad
         /NVbqvKujxzPNvPAJowtUBhi/HTDIvJfSAoWFwiwO+OKzv+BpbA4dY/HMtq3MQ3KZL4Y
         I35fCejDrh+XTs7YuhA3YvGAA/qsGf59jOuCBvgcGW14CT41emwh6h3UC4sLNmZx0kb1
         8ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687762671; x=1690354671;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dtivi7hjlOmL2ewulHuBv1rqAxWzqhAIroGpZjq/TeA=;
        b=QCUasuesNG/KsPXy4iTz41y59K2LmLjOe4B+ems11pZoKOwZ3NYiJWijmCeuy1QRIu
         V0Zl7m4OeM1AOlliyMlniX2sUGQLUaKkp/S0CyyLc/QYlLpPZ7SB55bHldOCqQcf0BdJ
         1N5vt2m8+ZJk2+l0eJUPJThfNJbNUhnXiq0aGqedfeNiyZQkSdWHb0gi0NlteDlafU8s
         1ne/39qESEmrSUNzSTfCCoyUMkUzW8wGRbwBUBP85+Bgpsgj9z9oTJ9a40qHX/siZ9t6
         T17WtdRToKp6pAHx386XheAzonQGqnFA9p7exOJIXF2PlFDrGyGH39s/+IK2FMuv27hw
         esZw==
X-Gm-Message-State: AC+VfDwLOFZ4QBckxSE7Ezz3Mxt667fuZfqecIJkBspoBMqnA01Ugv/m
        Cd3YV4Ft8gud+MoX9b7FNtC07w==
X-Google-Smtp-Source: ACHHUZ7UKLdEO/l5A/8x/bt0QsYrMHtPVhvs1tLHmpKpR/CnIFd2/FHQZV0w6M3CqaOPtigQfcAPww==
X-Received: by 2002:a05:600c:2944:b0:3fa:48cb:9038 with SMTP id n4-20020a05600c294400b003fa48cb9038mr14801427wmd.31.1687762670531;
        Sun, 25 Jun 2023 23:57:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9a76:3d38:5d1f:60c? ([2a01:e0a:982:cbb0:9a76:3d38:5d1f:60c])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c020e00b003f8d6647661sm9564172wmi.15.2023.06.25.23.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 23:57:50 -0700 (PDT)
Message-ID: <530a97bf-762d-2976-0b99-eab867fd09be@linaro.org>
Date:   Mon, 26 Jun 2023 08:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/4] input: touchscreen: add core support for Goodix
 Berlin Touchscreen IC
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606-topic-goodix-berlin-upstream-initial-v3-0-f0577cead709@linaro.org>
 <20230606-topic-goodix-berlin-upstream-initial-v3-2-f0577cead709@linaro.org>
 <ZJiSIyt1sg8NnPI9@nixie71>
Organization: Linaro Developer Services
In-Reply-To: <ZJiSIyt1sg8NnPI9@nixie71>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/06/2023 21:14, Jeff LaBundy wrote:
> Hi Neil,
> 
> On Thu, Jun 22, 2023 at 04:29:00PM +0200, Neil Armstrong wrote:
>> Add initial support for the new Goodix "Berlin" touchscreen ICs.
>>
>> These touchscreen ICs support SPI, I2C and I3C interface, up to
>> 10 finger touch, stylus and gestures events.
>>
>> This initial driver is derived from the Goodix goodix_ts_berlin
>> available at [1] and [2] and only supports the GT9916 IC
>> present on the Qualcomm SM8550 MTP & QRD touch panel.
>>
>> The current implementation only supports BerlinD, aka GT9916.
>>
>> Support for advanced features like:
>> - Firmware & config update
>> - Stylus events
>> - Gestures events
>> - Previous revisions support (BerlinA or BerlinB)
>> is not included in current version.
>>
>> The current support will work with currently flashed firmware
>> and config, and bail out if firmware or config aren't flashed yet.
>>
>> [1] https://github.com/goodix/goodix_ts_berlin
>> [2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> Great work; thank you for the productive discussion. I only had some
> minor cosmetic comments this last time; once those are addressed, feel
> free to add:
> 
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Thanks a lot for you reviews!

> 
>>   drivers/input/touchscreen/Kconfig              |   5 +
>>   drivers/input/touchscreen/Makefile             |   1 +
>>   drivers/input/touchscreen/goodix_berlin.h      | 159 +++++++
>>   drivers/input/touchscreen/goodix_berlin_core.c | 584 +++++++++++++++++++++++++
>>   4 files changed, 749 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
>> index c2cbd332af1d..1a6f6f6da991 100644
>> --- a/drivers/input/touchscreen/Kconfig
>> +++ b/drivers/input/touchscreen/Kconfig
>> @@ -416,6 +416,11 @@ config TOUCHSCREEN_GOODIX
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called goodix.
>>   
>> +config TOUCHSCREEN_GOODIX_BERLIN_CORE
>> +	depends on GPIOLIB || COMPILE_TEST
> 
> My comment seems to have been missed; this driver does not actually depend
> on GPIOLIB and the dependency here can be dropped. However, this would leave
> the driver to be built only if COMPILE_TEST is set which is obviously not
> what we want. Therefore, this line can simply be dropped entirely.


Indeed, I forgot to change this thx for the reminder.

> 
>> +	depends on REGMAP
> 
> Rather than depending on REGMAP here, you should simply select the appropriate
> transport from the I2C or SPI driver (which seems to have been missed in those
> patches as well; I will follow up there). In the meantime, this line can just
> be dropped.
> 
> MFD has several examples of dual I2C/SPI devices that demonstrate the correct
> pattern; see any of those for reference.

Ack, I'll update this and the i2c/spi entries aswell as you pointed.

> 
>> +	tristate
>> +
>>   config TOUCHSCREEN_HIDEEP
>>   	tristate "HiDeep Touch IC"
>>   	depends on I2C
>> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
>> index 159cd5136fdb..29cdb042e104 100644
>> --- a/drivers/input/touchscreen/Makefile
>> +++ b/drivers/input/touchscreen/Makefile
>> @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
>>   obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
>>   obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
>>   obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
>> +obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
>>   obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
>>   obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>>   obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
>> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
>> new file mode 100644
>> index 000000000000..235f44947a28
>> --- /dev/null
>> +++ b/drivers/input/touchscreen/goodix_berlin.h
>> @@ -0,0 +1,159 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Goodix Touchscreen Driver
>> + * Copyright (C) 2020 - 2021 Goodix, Inc.
>> + * Copyright (C) 2023 Linaro Ltd.
>> + *
>> + * Based on goodix_berlin_berlin driver.
>> + */
>> +
>> +#ifndef __GOODIX_BERLIN_H_
>> +#define __GOODIX_BERLIN_H_
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/input.h>
>> +#include <linux/input/touchscreen.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/sizes.h>
>> +
>> +#define GOODIX_BERLIN_MAX_TOUCH			10
>> +
>> +#define GOODIX_BERLIN_NORMAL_RESET_DELAY_MS	100
>> +
>> +#define GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN	8
>> +#define GOODIX_BERLIN_STATUS_OFFSET		0
>> +#define GOODIX_BERLIN_REQUEST_TYPE_OFFSET	2
>> +
>> +#define GOODIX_BERLIN_BYTES_PER_POINT		8
>> +#define GOODIX_BERLIN_COOR_DATA_CHECKSUM_SIZE	2
>> +#define GOODIX_BERLIN_COOR_DATA_CHECKSUM_MASK	GENMASK(15, 0)
>> +
>> +/* Read n finger events */
>> +#define GOODIX_BERLIN_IRQ_READ_LEN(n)		(GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN + \
>> +						 (GOODIX_BERLIN_BYTES_PER_POINT * (n)) + \
>> +						 GOODIX_BERLIN_COOR_DATA_CHECKSUM_SIZE)
>> +
>> +#define GOODIX_BERLIN_TOUCH_EVENT		BIT(7)
>> +#define GOODIX_BERLIN_REQUEST_EVENT		BIT(6)
>> +#define GOODIX_BERLIN_TOUCH_COUNT_MASK		GENMASK(3, 0)
>> +
>> +#define GOODIX_BERLIN_REQUEST_CODE_RESET	3
>> +
>> +#define GOODIX_BERLIN_POINT_TYPE_MASK		GENMASK(3, 0)
>> +#define GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER	1
>> +#define GOODIX_BERLIN_POINT_TYPE_STYLUS		3
>> +
>> +#define GOODIX_BERLIN_TOUCH_ID_MASK		GENMASK(7, 4)
>> +
>> +#define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
>> +#define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
>> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
>> +
>> +#define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
>> +#define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
>> +
>> +struct goodix_berlin_fw_version {
>> +	u8 rom_pid[6];
>> +	u8 rom_vid[3];
>> +	u8 rom_vid_reserved;
>> +	u8 patch_pid[8];
>> +	u8 patch_vid[4];
>> +	u8 patch_vid_reserved;
>> +	u8 sensor_id;
>> +	u8 reserved[2];
>> +	__le16 checksum;
>> +} __packed;
>> +
>> +struct goodix_berlin_ic_info_version {
>> +	u8 info_customer_id;
>> +	u8 info_version_id;
>> +	u8 ic_die_id;
>> +	u8 ic_version_id;
>> +	__le32 config_id;
>> +	u8 config_version;
>> +	u8 frame_data_customer_id;
>> +	u8 frame_data_version_id;
>> +	u8 touch_data_customer_id;
>> +	u8 touch_data_version_id;
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +struct goodix_berlin_ic_info_feature {
>> +	__le16 freqhop_feature;
>> +	__le16 calibration_feature;
>> +	__le16 gesture_feature;
>> +	__le16 side_touch_feature;
>> +	__le16 stylus_feature;
>> +} __packed;
>> +
>> +struct goodix_berlin_ic_info_misc {
>> +	__le32 cmd_addr;
>> +	__le16 cmd_max_len;
>> +	__le32 cmd_reply_addr;
>> +	__le16 cmd_reply_len;
>> +	__le32 fw_state_addr;
>> +	__le16 fw_state_len;
>> +	__le32 fw_buffer_addr;
>> +	__le16 fw_buffer_max_len;
>> +	__le32 frame_data_addr;
>> +	__le16 frame_data_head_len;
>> +	__le16 fw_attr_len;
>> +	__le16 fw_log_len;
>> +	u8 pack_max_num;
>> +	u8 pack_compress_version;
>> +	__le16 stylus_struct_len;
>> +	__le16 mutual_struct_len;
>> +	__le16 self_struct_len;
>> +	__le16 noise_struct_len;
>> +	__le32 touch_data_addr;
>> +	__le16 touch_data_head_len;
>> +	__le16 point_struct_len;
>> +	__le16 reserved1;
>> +	__le16 reserved2;
>> +	__le32 mutual_rawdata_addr;
>> +	__le32 mutual_diffdata_addr;
>> +	__le32 mutual_refdata_addr;
>> +	__le32 self_rawdata_addr;
>> +	__le32 self_diffdata_addr;
>> +	__le32 self_refdata_addr;
>> +	__le32 iq_rawdata_addr;
>> +	__le32 iq_refdata_addr;
>> +	__le32 im_rawdata_addr;
>> +	__le16 im_readata_len;
>> +	__le32 noise_rawdata_addr;
>> +	__le16 noise_rawdata_len;
>> +	__le32 stylus_rawdata_addr;
>> +	__le16 stylus_rawdata_len;
>> +	__le32 noise_data_addr;
>> +	__le32 esd_addr;
>> +} __packed;
>> +
>> +struct goodix_berlin_touch_data {
>> +	u8 id;
>> +	u8 unused;
>> +	__le16 x;
>> +	__le16 y;
>> +	__le16 w;
>> +} __packed;
>> +
>> +struct goodix_berlin_core {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct regulator *avdd;
>> +	struct regulator *iovdd;
>> +	struct gpio_desc *reset_gpio;
>> +	struct touchscreen_properties props;
>> +	struct goodix_berlin_fw_version fw_version;
>> +	struct input_dev *input_dev;
>> +	int irq;
>> +
>> +	/* Runtime parameters extracted from IC_INFO buffer  */
>> +	u32 touch_data_addr;
>> +};
>> +
>> +int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>> +			struct regmap *regmap);
>> +
>> +extern const struct dev_pm_ops goodix_berlin_pm_ops;
>> +
>> +#endif
>> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
>> new file mode 100644
>> index 000000000000..af3e73bbb3ec
>> --- /dev/null
>> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
>> @@ -0,0 +1,584 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Goodix Touchscreen Driver
>> + * Copyright (C) 2020 - 2021 Goodix, Inc.
>> + * Copyright (C) 2023 Linaro Ltd.
>> + *
>> + * Based on goodix_ts_berlin driver.
>> + */
>> +#include <asm/unaligned.h>
>> +#include <linux/input/mt.h>
>> +#include <linux/input/touchscreen.h>
>> +#include <linux/regmap.h>
>> +
>> +#include "goodix_berlin.h"
>> +
>> +/*
>> + * Goodix "Berlin" Touchscreen ID driver
>> + *
>> + * This driver is distinct from goodix.c since hardware interface
>> + * is different enough to require a new driver.
>> + * None of the register address or data structure are close enough
>> + * to the previous generations.
>> + *
>> + * Currently only handles Multitouch events with already
>> + * programmed firmware and "config" for "Revision D" Berlin IC.
>> + *
>> + * Support is missing for:
>> + * - ESD Management
>> + * - Firmware update/flashing
>> + * - "Config" update/flashing
>> + * - Stylus Events
>> + * - Gesture Events
>> + * - Support for older revisions (A & B)
>> + */
>> +
>> +static bool goodix_berlin_checksum_valid(const u8 *data, int size)
>> +{
>> +	u32 cal_checksum = 0;
>> +	u16 r_checksum;
>> +	u32 i;
>> +
>> +	if (size < GOODIX_BERLIN_COOR_DATA_CHECKSUM_SIZE)
>> +		return false;
>> +
>> +	for (i = 0; i < size - GOODIX_BERLIN_COOR_DATA_CHECKSUM_SIZE; i++)
>> +		cal_checksum += data[i];
>> +
>> +	r_checksum = get_unaligned_le16(&data[i]);
>> +
>> +	return FIELD_GET(GOODIX_BERLIN_COOR_DATA_CHECKSUM_MASK, cal_checksum) == r_checksum;
>> +}
>> +
>> +static bool goodix_berlin_is_dummy_data(struct goodix_berlin_core *cd,
>> +					const u8 *data, int size)
>> +{
>> +	int i;
>> +
>> +	/*
>> +	 * If the device is missing or doesn't respond the buffer
>> +	 * could be filled with bus default line state, 0x00 or 0xff,
>> +	 * so declare success the first time we encounter neither.
>> +	 */
>> +	for (i = 0; i < size; i++)
>> +		if (data[i] > 0 && data[i] < 0xff)
>> +			return false;
>> +
>> +	return true;
>> +}
>> +
>> +static int goodix_berlin_dev_confirm(struct goodix_berlin_core *cd)
>> +{
>> +	u8 tx_buf[8], rx_buf[8];
>> +	int retry = 3;
>> +	int error;
>> +
>> +	memset(tx_buf, GOODIX_BERLIN_DEV_CONFIRM_VAL, sizeof(tx_buf));
>> +	while (retry--) {
>> +		error = regmap_raw_write(cd->regmap, GOODIX_BERLIN_BOOTOPTION_ADDR, tx_buf,
>> +					 sizeof(tx_buf));
>> +		if (error)
>> +			return error;
>> +
>> +		error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_BOOTOPTION_ADDR, rx_buf,
>> +					sizeof(rx_buf));
>> +		if (error)
>> +			return error;
>> +
>> +		if (!memcmp(tx_buf, rx_buf, sizeof(tx_buf)))
>> +			return 0;
>> +
>> +		usleep_range(5000, 5100);
>> +	}
>> +
>> +	dev_err(cd->dev, "device confirm failed, rx_buf: %*ph\n", 8, rx_buf);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int goodix_berlin_power_on(struct goodix_berlin_core *cd, bool on)
>> +{
>> +	int error = 0;
>> +
>> +	if (on) {
>> +		error = regulator_enable(cd->iovdd);
>> +		if (error) {
>> +			dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
>> +			return error;
>> +		}
>> +
>> +		/* Vendor waits 3ms for IOVDD to settle */
>> +		usleep_range(3000, 3100);
>> +
>> +		error = regulator_enable(cd->avdd);
>> +		if (error) {
>> +			dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
>> +			goto error_avdd_regulator;
>> +		}
>> +
>> +		/* Vendor waits 15ms for IOVDD to settle */
>> +		usleep_range(15000, 15100);
>> +
>> +		gpiod_set_value(cd->reset_gpio, 0);
>> +
>> +		/* Vendor waits 4ms for Firmware to initialize */
>> +		usleep_range(4000, 4100);
>> +
>> +		error = goodix_berlin_dev_confirm(cd);
>> +		if (error)
>> +			goto error_dev_confirm;
>> +
>> +		/* Vendor waits 100ms for Firmware to fully boot */
>> +		msleep(GOODIX_BERLIN_NORMAL_RESET_DELAY_MS);
>> +
>> +		return 0;
>> +	}
>> +
>> +error_dev_confirm:
>> +	gpiod_set_value(cd->reset_gpio, 1);
> 
> These labels are still confusing in my opinion. Rather than name the label
> based on the code that could have gotten us here, it is better for the name
> to reflect the action that follows.
> 
> How about err_dev_reset and err_iovdd_disable?

Ack, I wasn't sure in which way those should be names

>> +
>> +	regulator_disable(cd->avdd);
>> +
>> +error_avdd_regulator:
>> +	regulator_disable(cd->iovdd);
>> +
>> +	return error;
>> +}
>> +
>> +static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
>> +{
>> +	u8 buf[sizeof(struct goodix_berlin_fw_version)];
>> +	int error;
>> +
>> +	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR, buf, sizeof(buf));
>> +	if (error) {
>> +		dev_err(cd->dev, "error reading fw version\n");
> 
> It's handy to print the return value here as you do elsewhere.

Ack

> 
>> +		return error;
>> +	}
>> +
>> +	if (!goodix_berlin_checksum_valid(buf, sizeof(buf))) {
>> +		dev_err(cd->dev, "invalid fw version: checksum error\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	memcpy(&cd->fw_version, buf, sizeof(cd->fw_version));
>> +
>> +	return 0;
>> +}
>> +
>> +/* Only extract necessary data for runtime */
>> +static int goodix_berlin_convert_ic_info(struct goodix_berlin_core *cd,
>> +					 const u8 *data, u16 length)
>> +{
>> +	struct goodix_berlin_ic_info_misc misc;
>> +	unsigned int offset = 0;
>> +	u8 param_num;
>> +
>> +	offset += sizeof(__le16); /* length */
>> +	offset += sizeof(struct goodix_berlin_ic_info_version);
>> +	offset += sizeof(struct goodix_berlin_ic_info_feature);
>> +
>> +	/* IC_INFO Parameters, variable width structure */
>> +	offset += 4 * sizeof(u8); /* drv_num, sen_num, button_num, force_num */
>> +
>> +	if (offset >= length)
>> +		goto invalid_offset;
>> +
>> +	param_num = data[offset++]; /* active_scan_rate_num */
>> +
>> +	offset += param_num * sizeof(__le16);
>> +
>> +	if (offset >= length)
>> +		goto invalid_offset;
>> +
>> +	param_num = data[offset++]; /* mutual_freq_num*/
>> +
>> +	offset += param_num * sizeof(__le16);
>> +
>> +	if (offset >= length)
>> +		goto invalid_offset;
>> +
>> +	param_num = data[offset++]; /* self_tx_freq_num */
>> +
>> +	offset += param_num * sizeof(__le16);
>> +
>> +	if (offset >= length)
>> +		goto invalid_offset;
>> +
>> +	param_num = data[offset++]; /* self_rx_freq_num */
>> +
>> +	offset += param_num * sizeof(__le16);
>> +
>> +	if (offset >= length)
>> +		goto invalid_offset;
>> +
>> +	param_num = data[offset++]; /* stylus_freq_num */
>> +
>> +	offset += param_num * sizeof(__le16);
>> +
>> +	if (offset + sizeof(misc) > length)
>> +		goto invalid_offset;
>> +
>> +	/* goodix_berlin_ic_info_misc */
>> +	memcpy(&misc, &data[offset], sizeof(misc));
>> +
>> +	cd->touch_data_addr = le32_to_cpu(misc.touch_data_addr);
>> +
>> +	return 0;
>> +
>> +invalid_offset:
>> +	dev_err(cd->dev, "ic_info length is invalid (offset %d length %d)\n",
>> +		offset, length);
>> +	return -EINVAL;
>> +}
>> +
>> +static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>> +{
>> +	u8 afe_data[GOODIX_BERLIN_IC_INFO_MAX_LEN];
>> +	__le16 length_raw;
>> +	u16 length;
>> +	int error;
>> +
>> +	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
>> +				&length_raw, sizeof(length_raw));
>> +	if (error) {
>> +		dev_info(cd->dev, "failed get ic info length, %d\n", error);
>> +		return error;
>> +	}
>> +
>> +	length = le16_to_cpu(length_raw);
>> +	if (length >= GOODIX_BERLIN_IC_INFO_MAX_LEN) {
>> +		dev_info(cd->dev, "invalid ic info length %d\n", length);
>> +		return -EINVAL;
>> +	}
>> +
>> +	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
>> +				afe_data, length);
>> +	if (error) {
>> +		dev_info(cd->dev, "failed get ic info data, %d\n", error);
>> +		return error;
>> +	}
>> +
>> +	/* check whether the data is valid (ex. bus default values) */
>> +	if (goodix_berlin_is_dummy_data(cd, (const uint8_t *)afe_data, length)) {
>> +		dev_err(cd->dev, "fw info data invalid\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!goodix_berlin_checksum_valid((const uint8_t *)afe_data, length)) {
>> +		dev_info(cd->dev, "fw info checksum error\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	error = goodix_berlin_convert_ic_info(cd, afe_data, length);
>> +	if (error) {
>> +		dev_err(cd->dev, "error converting ic info\n");
> 
> This function already prints an error message upon failure; consider dropping
> one of the two.

Ack

> 
>> +		return error;
>> +	}
>> +
>> +	/* check some key info */
>> +	if (!cd->touch_data_addr) {
>> +		dev_err(cd->dev, "touch_data_addr is null\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void goodix_berlin_parse_finger(struct goodix_berlin_core *cd,
>> +				       const void *buf, int touch_num)
>> +{
>> +	const struct goodix_berlin_touch_data *touch_data = buf;
>> +	int i;
>> +
>> +	/* Check for data validity */
>> +	for (i = 0; i < touch_num; i++) {
>> +		unsigned int id;
>> +
>> +		id = FIELD_GET(GOODIX_BERLIN_TOUCH_ID_MASK, touch_data[i].id);
>> +
>> +		if (id >= GOODIX_BERLIN_MAX_TOUCH) {
>> +			dev_warn(cd->dev, "invalid finger id %d\n", id);
>> +			return;
>> +		}
>> +	}
>> +
>> +	/* Report finger touches */
>> +	for (i = 0; i < touch_num; i++) {
>> +		input_mt_slot(cd->input_dev,
>> +			      FIELD_GET(GOODIX_BERLIN_TOUCH_ID_MASK,
>> +					touch_data[i].id));
>> +		input_mt_report_slot_state(cd->input_dev, MT_TOOL_FINGER, true);
>> +
>> +		touchscreen_report_pos(cd->input_dev, &cd->props,
>> +				       __le16_to_cpu(touch_data[i].x),
>> +				       __le16_to_cpu(touch_data[i].y),
>> +				       true);
>> +		input_report_abs(cd->input_dev, ABS_MT_TOUCH_MAJOR,
>> +				 __le16_to_cpu(touch_data[i].w));
>> +	}
>> +
>> +	input_mt_sync_frame(cd->input_dev);
>> +	input_sync(cd->input_dev);
>> +}
>> +
>> +static void goodix_berlin_touch_handler(struct goodix_berlin_core *cd,
>> +					const void *pre_buf, u32 pre_buf_len)
>> +{
>> +	static u8 buffer[GOODIX_BERLIN_IRQ_READ_LEN(GOODIX_BERLIN_MAX_TOUCH)];
>> +	u8 point_type = 0;
>> +	u8 touch_num = 0;
>> +	int error = 0;
> 
> Nit: some more unnecessary initializations in here. All of this cleaned up
> quite nicely however.

Ack, forgot those in the refactor

> 
>> +
>> +	/* copy pre-data to buffer */
>> +	memcpy(buffer, pre_buf, pre_buf_len);
>> +
>> +	touch_num = FIELD_GET(GOODIX_BERLIN_TOUCH_COUNT_MASK,
>> +			      buffer[GOODIX_BERLIN_REQUEST_TYPE_OFFSET]);
>> +
>> +	if (touch_num > GOODIX_BERLIN_MAX_TOUCH) {
>> +		dev_warn(cd->dev, "invalid touch num %d\n", touch_num);
>> +		return;
>> +	}
>> +
>> +	if (touch_num) {
>> +		/* read more data if more than 2 touch events */
>> +		if (unlikely(touch_num > 2)) {
>> +			error = regmap_raw_read(cd->regmap,
>> +						cd->touch_data_addr + pre_buf_len,
>> +						&buffer[pre_buf_len],
>> +						(touch_num - 2) * GOODIX_BERLIN_BYTES_PER_POINT);
>> +			if (error) {
>> +				dev_err_ratelimited(cd->dev, "failed get touch data\n");
> 
> failed to get touch data: %d
> 
> (insert the word "to" and print the return value)

Ack

> 
>> +				return;
>> +			}
>> +		}
>> +
>> +		point_type = FIELD_GET(GOODIX_BERLIN_POINT_TYPE_MASK,
>> +				       buffer[GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN]);
>> +
>> +		if (point_type == GOODIX_BERLIN_POINT_TYPE_STYLUS ||
>> +		    point_type == GOODIX_BERLIN_POINT_TYPE_STYLUS_HOVER) {
>> +			dev_warn_once(cd->dev, "Stylus event type not handled\n");
>> +			return;
>> +		}
>> +
>> +		if (!goodix_berlin_checksum_valid(&buffer[GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN],
>> +						  touch_num * GOODIX_BERLIN_BYTES_PER_POINT + 2)) {
>> +			dev_dbg(cd->dev, "touch data checksum error\n");
>> +			dev_dbg(cd->dev, "data: %*ph\n",
>> +				touch_num * GOODIX_BERLIN_BYTES_PER_POINT + 2,
>> +				&buffer[GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN]);
> 
> This case seems worth of a dev_err; the two messages can be combined as well.

Yep

> 
>> +			return;
>> +		}
>> +	}
>> +
>> +	goodix_berlin_parse_finger(cd, &buffer[GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN],
>> +				   touch_num);
>> +}
>> +
>> +static int goodix_berlin_request_handle_reset(struct goodix_berlin_core *cd)
>> +{
>> +	gpiod_set_value(cd->reset_gpio, 1);
>> +	usleep_range(2000, 2100);
>> +	gpiod_set_value(cd->reset_gpio, 0);
>> +
>> +	msleep(GOODIX_BERLIN_NORMAL_RESET_DELAY_MS);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t goodix_berlin_threadirq_func(int irq, void *data)
>> +{
>> +	struct goodix_berlin_core *cd = data;
>> +	u8 buf[GOODIX_BERLIN_IRQ_READ_LEN(2)];
>> +	u8 event_status;
>> +	int error;
>> +
>> +	/* First, read buffer with space for 2 touch events */
>> +	error = regmap_raw_read(cd->regmap, cd->touch_data_addr, buf,
>> +				GOODIX_BERLIN_IRQ_READ_LEN(2));
>> +	if (error) {
>> +		dev_err_ratelimited(cd->dev, "failed get event head data\n");
> 
> failed to get event head data: %d
> 
> (same comment as earlier)
> 

Ack

>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	if (buf[GOODIX_BERLIN_STATUS_OFFSET] == 0)
>> +		return IRQ_HANDLED;
>> +
>> +	if (!goodix_berlin_checksum_valid(buf, GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN)) {
>> +		dev_warn_ratelimited(cd->dev, "touch head checksum err : %*ph\n",
>> +				     GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN, buf);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	event_status = buf[GOODIX_BERLIN_STATUS_OFFSET];
>> +
>> +	if (event_status & GOODIX_BERLIN_TOUCH_EVENT)
>> +		goodix_berlin_touch_handler(cd, buf, GOODIX_BERLIN_IRQ_READ_LEN(2));
>> +
>> +	if (event_status & GOODIX_BERLIN_REQUEST_EVENT) {
>> +		switch (buf[GOODIX_BERLIN_REQUEST_TYPE_OFFSET]) {
>> +		case GOODIX_BERLIN_REQUEST_CODE_RESET:
>> +			goodix_berlin_request_handle_reset(cd);
>> +			break;
>> +
>> +		default:
>> +			dev_warn(cd->dev, "unsupported request code 0x%x\n",
>> +				 buf[GOODIX_BERLIN_REQUEST_TYPE_OFFSET]);
>> +		}
>> +	}
>> +
>> +	/* Clear up status field */
>> +	regmap_write(cd->regmap, cd->touch_data_addr, 0);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
>> +					  const struct input_id *id)
>> +{
>> +	struct input_dev *input_dev;
>> +	int error;
>> +
>> +	input_dev = devm_input_allocate_device(cd->dev);
>> +	if (!input_dev)
>> +		return -ENOMEM;
>> +
>> +	cd->input_dev = input_dev;
>> +	input_set_drvdata(input_dev, cd);
>> +
>> +	input_dev->name = "Goodix Berlin Capacitive TouchScreen";
>> +	input_dev->phys = "input/ts";
>> +
>> +	input_dev->id = *id;
>> +
>> +	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_X, 0, SZ_64K - 1, 0, 0);
>> +	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_Y, 0, SZ_64K - 1, 0, 0);
>> +	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>> +
>> +	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
>> +
>> +	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
>> +				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
>> +	if (error)
>> +		return error;
>> +
>> +	return input_register_device(cd->input_dev);
>> +}
>> +
>> +static int goodix_berlin_pm_suspend(struct device *dev)
>> +{
>> +	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
>> +
>> +	disable_irq(cd->irq);
>> +
>> +	return goodix_berlin_power_on(cd, false);
>> +}
>> +
>> +static int goodix_berlin_pm_resume(struct device *dev)
>> +{
>> +	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
>> +	int error;
>> +
>> +	error = goodix_berlin_power_on(cd, true);
>> +	if (error)
>> +		return error;
>> +
>> +	enable_irq(cd->irq);
>> +
>> +	return 0;
>> +}
>> +
>> +EXPORT_GPL_SIMPLE_DEV_PM_OPS(goodix_berlin_pm_ops,
>> +			     goodix_berlin_pm_suspend,
>> +			     goodix_berlin_pm_resume);
>> +
>> +static void goodix_berlin_power_off(void *data)
>> +{
>> +	struct goodix_berlin_core *cd = data;
>> +
>> +	goodix_berlin_power_on(cd, false);
>> +}
>> +
>> +int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>> +			struct regmap *regmap)
>> +{
>> +	struct goodix_berlin_core *cd;
>> +	int error;
>> +
>> +	if (irq <= 0) {
>> +		dev_err(dev, "Missing interrupt number\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	cd = devm_kzalloc(dev, sizeof(*cd), GFP_KERNEL);
>> +	if (!cd)
>> +		return -ENOMEM;
>> +
>> +	cd->dev = dev;
>> +	cd->regmap = regmap;
>> +	cd->irq = irq;
>> +
>> +	cd->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(cd->reset_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(cd->reset_gpio),
>> +				     "Failed to request reset gpio\n");
>> +
>> +	cd->avdd = devm_regulator_get(dev, "avdd");
>> +	if (IS_ERR(cd->avdd))
>> +		return dev_err_probe(dev, PTR_ERR(cd->avdd),
>> +				     "Failed to request avdd regulator\n");
>> +
>> +	cd->iovdd = devm_regulator_get(dev, "iovdd");
>> +	if (IS_ERR(cd->iovdd))
>> +		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
>> +				     "Failed to request iovdd regulator\n");
>> +
>> +	error = goodix_berlin_power_on(cd, true);
>> +	if (error) {
>> +		dev_err(dev, "failed power on");
>> +		return error;
>> +	}
>> +
>> +	error = devm_add_action_or_reset(dev, goodix_berlin_power_off, cd);
>> +	if (error)
>> +		return error;
>> +
>> +	error = goodix_berlin_read_version(cd);
>> +	if (error) {
>> +		dev_err(dev, "failed to get version info");
>> +		return error;
>> +	}
>> +
>> +	error = goodix_berlin_get_ic_info(cd);
>> +	if (error) {
>> +		dev_err(dev, "invalid ic info, abort");
>> +		return error;
>> +	}
>> +
>> +	error = goodix_berlin_input_dev_config(cd, id);
>> +	if (error) {
>> +		dev_err(dev, "failed set input device");
>> +		return error;
>> +	}
>> +
>> +	error = devm_request_threaded_irq(dev, irq, NULL,
>> +					  goodix_berlin_threadirq_func,
>> +					  IRQF_ONESHOT, "goodix-berlin", cd);
>> +	if (error) {
>> +		dev_err(dev, "request threaded irq failed: %d\n", error);
>> +		return error;
>> +	}
>> +
>> +	dev_set_drvdata(dev, cd);
>> +
>> +	dev_dbg(dev, "Goodix Berlin %s Touchscreen Controller", cd->fw_version.patch_pid);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(goodix_berlin_probe);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Goodix Berlin Core Touchscreen driver");
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>
>> -- 
>> 2.34.1
>>
> 
> Kind regards,
> Jeff LaBundy

Thanks,
Neil

