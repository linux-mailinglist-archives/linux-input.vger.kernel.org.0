Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FCD3A562C
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 06:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhFMEMF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 00:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhFMEMF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 00:12:05 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C60C061574
        for <linux-input@vger.kernel.org>; Sat, 12 Jun 2021 21:10:04 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w127so10564122oig.12
        for <linux-input@vger.kernel.org>; Sat, 12 Jun 2021 21:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7AjpArJmafuo/WbaTFrIoo5Vo/CnilVWNwka0tZyvcM=;
        b=MKtqYxYkE7XaUeOiZUbMbmRNQ2bLlfcMMWHQqclhSD8RbQVXloT+hWh6EBVZ89Cllb
         S9DdyDkvZ6SPXTJ7hRKW2yRSUGn9lz4b1ZxFubp0dpeHq58rt8XNf+jp/PLwBS3DRgye
         fsz8sYOinYC61J/EfCra4/gLvCPPd3bQrPxMp2e9Abf58Kyy6qADOVCgRc72a5TQd7eo
         ZRcuuHwhaz1BwmW/vIF142Iday9R9bZI2UClc1lCNMYfpZT0y+Gc236El+1ILkE1TJCp
         Gr4lM8zt06gm0dfXvrbjY7uOewMQJMclq2/jQ0E8SZJ7IQ9jjDrc/+CSlP6FERRmlS6C
         rvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7AjpArJmafuo/WbaTFrIoo5Vo/CnilVWNwka0tZyvcM=;
        b=awwvo16VT8YnAwZkpsRy6WwPUMB+Pouf65QVIsb4eMwRpP1DFsX2d2D+Al63+JijTQ
         UREq3zBLXrnYQf3C0eo81aabCdh3TMwPpEDKWCg4uCDN3t3t1dpodtV05UVf6XaajvoE
         wKVK10odHpEarhxiuTihr5S+aUw1NBv8jgsPV19FLczn0t2YhJ/F56ELsbPE0AGcjbTy
         uKqDk3AcXmVRiQLNHqQh0qwvdogEaLM/xTVAHpq1bsbck0cae0lWCO8+LE3ae4D+4qhd
         EzHTnwbj6b76aKh5A0NOT5ngqmbUHsDY8I2HrZKw56fa6mOTlxYfDSeHEUfPgbG0IXXF
         ryRA==
X-Gm-Message-State: AOAM530fMqh1LHQV8QQOLXjG47/7X5NSJPgMUMqkzZy3BAKYynFBPw+t
        4o2qo7zUU8Ke79PsEM2Y2p6wCw==
X-Google-Smtp-Source: ABdhPJyV42dSEBbUBr7ctGpAI2IR4v2UIaWw3oX8eMZp08TD5LYNnjdDzTNyIFOd4vDR90tSBoRz2Q==
X-Received: by 2002:aca:d485:: with SMTP id l127mr7035969oig.106.1623557399454;
        Sat, 12 Jun 2021 21:09:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m66sm2132435oia.28.2021.06.12.21.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 21:09:58 -0700 (PDT)
Date:   Sat, 12 Jun 2021 23:09:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] input: add Qualcomm QPNP haptics driver
Message-ID: <YMWE+p5zlntC88ti@yoga>
References: <20210612205405.1233588-1-caleb@connolly.tech>
 <20210612205405.1233588-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612205405.1233588-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat 12 Jun 15:54 CDT 2021, Caleb Connolly wrote:

> Add support for the haptics found in pmi8998 and related PMICs.
> Based on the ff-memless interface. Currently this driver provides
> a partial implementation of hardware features.
> 
> This driver only supports LRAs (Linear Resonant Actuators) in the "buffer"
> mode with a single wave pattern.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Please use a cover letter when posting multiple patches.

> ---
>  drivers/input/misc/Kconfig        |   11 +
>  drivers/input/misc/Makefile       |    1 +
>  drivers/input/misc/qpnp-haptics.c | 1022 +++++++++++++++++++++++++++++
>  3 files changed, 1034 insertions(+)
>  create mode 100644 drivers/input/misc/qpnp-haptics.c
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 498cde376981..b5ba03e6cf58 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -186,6 +186,17 @@ config INPUT_PMIC8XXX_PWRKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pmic8xxx-pwrkey.
> 
> +config INPUT_QPNP_HAPTICS

No-one knows what "QPNP" really is, so please name this
"INPUT_QCOM_SPMI_HAPTICS"

> +	tristate "Qualcomm QPNP HAPTICS"
> +	depends on ARCH_QCOM

"depends on SPMI" makes sense here.

> +	select INPUT_FF_MEMLESS
> +	help
> +	  This option enables support for the haptics found in pmi8998 and
> +	  related PMICs. Based on the ff-memless interface.
> +
> +	  To compile this driver as module, choose M here: the
> +	  module will be called qpnp-haptics.
> +
>  config INPUT_SPARCSPKR
>  	tristate "SPARC Speaker support"
>  	depends on PCI && SPARC64
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index f593beed7e05..c43290163db0 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -65,6 +65,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
>  obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
>  obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
>  obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
> +obj-$(CONFIG_INPUT_QPNP_HAPTICS)	+= qpnp-haptics.o
>  obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
>  obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
>  obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
> diff --git a/drivers/input/misc/qpnp-haptics.c b/drivers/input/misc/qpnp-haptics.c

Again, qcom-spmi-haptics.c

> new file mode 100644
> index 000000000000..daa7a18ffc7d
> --- /dev/null
> +++ b/drivers/input/misc/qpnp-haptics.c
> @@ -0,0 +1,1022 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, Caleb Connolly <caleb@connolly.tech>
> + * Qualcomm Plug and Play haptics driver for pmi8998 and related PMICs.
> + * Based on ./pm8xxx-vibrator.c

Enough "based on" to warrant carrying some copyrights?

> + */
> +
> +#include <dt-bindings/input/qcom,qpnp-haptics.h>
> +
> +#include <linux/atomic.h>
> +#include <linux/bits.h>
> +#include <linux/errno.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/log2.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +
> +/*
> + * Register and bit definitions
> + */

This comment doesn't add much value.

> +
> +#define HAP_STATUS_1_REG(chip)		(chip->base + 0x0A)

This style is somewhat unusual, please define the offset here and do the
math in qpnp_haptics_read() et al.

> +#define HAP_BUSY_BIT			BIT(1)
> +#define SC_FLAG_BIT			BIT(3)
> +#define AUTO_RES_ERROR_BIT		BIT(4)
> +
> +#define HAP_LRA_AUTO_RES_LO_REG(chip)	(chip->base + 0x0B)
> +#define HAP_LRA_AUTO_RES_HI_REG(chip)	(chip->base + 0x0C)
> +
> +#define HAP_EN_CTL_REG(chip)		(chip->base + 0x46)
> +#define HAP_EN_BIT			BIT(7)
> +
> +#define HAP_EN_CTL2_REG(chip)		(chip->base + 0x48)
> +#define BRAKE_EN_BIT			BIT(0)
> +
> +#define HAP_AUTO_RES_CTRL_REG(chip)	(chip->base + 0x4B)
> +#define AUTO_RES_EN_BIT			BIT(7)
> +#define AUTO_RES_ERR_RECOVERY_BIT	BIT(3)
> +#define AUTO_RES_EN_FLAG_BIT	BIT(0)
> +
> +#define HAP_CFG1_REG(chip)		(chip->base + 0x4C)
> +#define HAP_ACT_TYPE_MASK		BIT(0)
> +
> +#define HAP_CFG2_REG(chip)		(chip->base + 0x4D)
> +#define HAP_LRA_RES_TYPE_MASK		BIT(0)
> +
> +#define HAP_SEL_REG(chip)		(chip->base + 0x4E)
> +#define HAP_WF_SOURCE_MASK		GENMASK(5, 4)
> +#define HAP_WF_SOURCE_SHIFT		4
> +
> +#define HAP_LRA_AUTO_RES_REG(chip)	(chip->base + 0x4F)
> +#define LRA_AUTO_RES_MODE_MASK		GENMASK(6, 4)
> +#define LRA_AUTO_RES_MODE_SHIFT		4
> +#define LRA_HIGH_Z_MASK			GENMASK(3, 2)
> +#define LRA_HIGH_Z_SHIFT		2
> +#define LRA_RES_CAL_MASK		GENMASK(1, 0)
> +#define HAP_RES_CAL_PERIOD_MIN		4
> +#define HAP_RES_CAL_PERIOD_MAX		32
> +
> +#define HAP_VMAX_CFG_REG(chip)		(chip->base + 0x51)
> +#define HAP_VMAX_OVD_BIT		BIT(6)
> +#define HAP_VMAX_MASK			GENMASK(5, 1)
> +#define HAP_VMAX_SHIFT			1
> +
> +#define HAP_ILIM_CFG_REG(chip)		(chip->base + 0x52)
> +#define HAP_ILIM_SEL_MASK		BIT(0)
> +#define HAP_ILIM_400_MA			0
> +#define HAP_ILIM_800_MA			1
> +
> +#define HAP_SC_DEB_REG(chip)		(chip->base + 0x53)
> +#define HAP_SC_DEB_MASK			GENMASK(2, 0)
> +#define HAP_SC_DEB_CYCLES_MIN		0
> +#define HAP_DEF_SC_DEB_CYCLES		8
> +#define HAP_SC_DEB_CYCLES_MAX		32
> +
> +#define HAP_RATE_CFG1_REG(chip)		(chip->base + 0x54)
> +#define HAP_RATE_CFG1_MASK		GENMASK(7, 0)
> +#define HAP_RATE_CFG2_SHIFT		8 // As CFG2 is the most significant byte
> +
> +#define HAP_RATE_CFG2_REG(chip)		(chip->base + 0x55)
> +#define HAP_RATE_CFG2_MASK		GENMASK(3, 0)
> +
> +#define HAP_SC_CLR_REG(chip)		(chip->base + 0x59)
> +#define SC_CLR_BIT			BIT(0)
> +
> +#define HAP_BRAKE_REG(chip)		(chip->base + 0x5C)
> +#define HAP_BRAKE_PAT_MASK		0x3
> +
> +#define HAP_WF_REPEAT_REG(chip)		(chip->base + 0x5E)
> +#define WF_REPEAT_MASK			GENMASK(6, 4)
> +#define WF_REPEAT_SHIFT			4
> +#define WF_REPEAT_MIN			1
> +#define WF_REPEAT_MAX			128
> +#define WF_S_REPEAT_MASK		GENMASK(1, 0)
> +#define WF_S_REPEAT_MIN			1
> +#define WF_S_REPEAT_MAX			8
> +
> +#define HAP_WF_S1_REG(chip)		(chip->base + 0x60)
> +#define HAP_WF_SIGN_BIT			BIT(7)
> +#define HAP_WF_OVD_BIT			BIT(6)
> +#define HAP_WF_SAMP_MAX			GENMASK(5, 1)
> +#define HAP_WF_SAMPLE_LEN		8
> +
> +#define HAP_PLAY_REG(chip)		(chip->base + 0x70)
> +#define HAP_PLAY_BIT			BIT(7)
> +#define HAP_PAUSE_BIT			BIT(0)
> +
> +#define HAP_SEC_ACCESS_REG(chip)	(chip->base + 0xD0)
> +#define HAP_SEC_ACCESS_UNLOCK		0xA5
> +
> +#define HAP_TEST2_REG(chip)		(chip->base + 0xE3)
> +
> +// Values
> +#define HAP_VMAX_MIN_MV			116
> +#define HAP_VMAX_MAX_MV			3596
> +#define HAP_VMAX_MAX_MV_STRONG		3596
> +
> +#define HAP_WAVE_PLAY_RATE_MIN_US	0
> +#define HAP_WAVE_PLAY_RATE_MAX_US	20475
> +#define HAP_WAVE_PLAY_TIME_MAX_MS	15000
> +
> +#define AUTO_RES_ERR_POLL_TIME_NS	(20 * NSEC_PER_MSEC)
> +#define HAPTICS_BACK_EMF_DELAY_US	20000
> +
> +#define HAP_BRAKE_PAT_LEN		4
> +#define HAP_WAVE_SAMP_LEN		8
> +#define NUM_WF_SET			4
> +#define HAP_WAVE_SAMP_SET_LEN		(HAP_WAVE_SAMP_LEN * NUM_WF_SET)
> +#define HAP_RATE_CFG_STEP_US		5
> +
> +#define SC_MAX_COUNT			5
> +#define SC_COUNT_RST_DELAY_US		1000000
> +
> +enum hap_play_control {
> +	HAP_STOP,
> +	HAP_PAUSE,
> +	HAP_PLAY,
> +};
> +
> +/**
> + * struct qpnp_haptics - struct for qpnp haptics data.
> + *
> + * @pdev: The platform device responsible for the haptics.
> + * @regmap: Register map for the hardware block.
> + * @input_dev: The input device used to receive events.
> + * @work: Work struct to play effects.
> + * @base: Base address of the regmap.
> + * @active: Atomic value used to track if haptics are currently playing.
> + * @play_irq: Fired to load the next wave pattern.
> + * @sc_irq: Short circuit irq.
> + * @last_sc_time: Time since the short circuit IRQ last fired.
> + * @sc_count: Number of times the short circuit IRQ has fired in this interval.
> + * @actuator_type: The type of actuator in use.
> + * @wave_shape: The shape of the waves to use (sine or square).
> + * @play_mode: The play mode to use (direct, buffer, pwm, audio).
> + * @magnitude: The strength we should be playing at.
> + * @vmax: Max voltage to use when playing.
> + * @current_limit: The current limit for this hardware (400mA or 800mA).
> + * @play_wave_rate: The wave rate to use for this hardware.
> + * @wave_samp: The array of wave samples to write for buffer mode.
> + * @brake_pat: The pattern to apply when braking.
> + * @play_lock: Lock to be held when updating the hardware state.
> + */
> +struct qpnp_haptics {
> +	struct platform_device *pdev;

You only ever use this to get to &pdev->dev, so why not store that
instead?

> +	struct regmap *regmap;
> +	struct input_dev *haptics_input_dev;
> +	struct work_struct work;
> +	u32 base;
> +
> +	atomic_t active;
> +
> +	int play_irq;
> +	int sc_irq;
> +	ktime_t last_sc_time;
> +	u8 sc_count;
> +
> +	u8 actuator_type;
> +	u8 wave_shape;
> +	u8 play_mode;
> +	int magnitude;
> +	u32 vmax;
> +	u32 current_limit;
> +	u32 play_wave_rate;
> +
> +	u32 wave_samp[HAP_WAVE_SAMP_SET_LEN];
> +	u8 brake_pat[HAP_BRAKE_PAT_LEN];
> +
> +	struct mutex play_lock;
> +};
> +
> +static inline bool is_secure_addr(u16 addr)
> +{
> +	return (addr & 0xFF) > 0xD0;
> +}
> +
> +static int qpnp_haptics_read(struct qpnp_haptics *haptics,
> +	u16 addr, u8 *val, int len)
> +{
> +	int ret;
> +
> +	ret = regmap_bulk_read(haptics->regmap, addr, val, len);
> +	if (ret < 0)
> +		pr_err("Error reading address: 0x%x, ret %d\n", addr, ret);

dev_err()

> +
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write(struct qpnp_haptics *haptics,
> +	u16 addr, u8 *val, int len)
> +{
> +	int ret, i;
> +
> +	if (is_secure_addr(addr)) {
> +		for (i = 0; i < len; i++) {
> +			pr_info("%s: unlocking for addr: 0x%x, val: 0x%x", __func__,
> +				addr, val[i]);

This is more of a "debug print", so dev_dbg() would be better.

> +			ret = regmap_write(haptics->regmap,
> +				HAP_SEC_ACCESS_REG(haptics), HAP_SEC_ACCESS_UNLOCK);
> +			if (ret < 0) {
> +				pr_err("Error writing unlock code, ret %d\n",
> +					ret);

dev_err()

> +				return ret;
> +			}
> +
> +			ret = regmap_write(haptics->regmap, addr + i, val[i]);
> +			if (ret < 0) {
> +				pr_err("Error writing address 0x%x, ret %d\n",
> +					addr + i, ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		if (len > 1)
> +			ret = regmap_bulk_write(haptics->regmap, addr, val, len);
> +		else
> +			ret = regmap_write(haptics->regmap, addr, *val);
> +	}
> +
> +	if (ret < 0)
> +		pr_err("%s: Error writing address: 0x%x, ret %d\n", __func__, addr, ret);
> +
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write_masked(struct qpnp_haptics *haptics,
> +	u16 addr, u8 mask, u8 val)
> +{
> +	int ret;
> +
> +	if (is_secure_addr(addr)) {
> +		ret = regmap_write(haptics->regmap,
> +			HAP_SEC_ACCESS_REG(haptics), HAP_SEC_ACCESS_UNLOCK);
> +		if (ret < 0) {
> +			pr_err("Error writing unlock code - ret %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = regmap_update_bits(haptics->regmap, addr, mask, val);
> +	if (ret < 0)
> +		pr_err("Error writing address: 0x%x - ret %d\n", addr, ret);
> +
> +	return ret;
> +}
> +
> +static bool is_haptics_idle(struct qpnp_haptics *haptics)
> +{
> +	int ret;
> +	u8 val;
> +
> +	if (haptics->play_mode == HAP_PLAY_DIRECT ||
> +			haptics->play_mode == HAP_PLAY_PWM)
> +		return true;
> +
> +	ret = qpnp_haptics_read(haptics, HAP_STATUS_1_REG(haptics), &val, 1);
> +	if (ret < 0 || (val & HAP_BUSY_BIT))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int qpnp_haptics_module_enable(struct qpnp_haptics *haptics, bool enable)
> +{
> +	u8 val;
> +	int rc;
> +
> +	dev_dbg(&haptics->pdev->dev, "Setting module enable: %d", enable);
> +
> +	val = enable ? HAP_EN_BIT : 0;
> +	rc = qpnp_haptics_write(haptics, HAP_EN_CTL_REG(haptics), &val, 1);

rc will either be < 0 or 0, so you can just do:
	return qpnp_haptics_write();

> +	if (rc < 0)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static int qpnp_haptics_write_vmax(struct qpnp_haptics *haptics)
> +{
> +	u8 val = 0;
> +	int ret;
> +	u32 vmax_mv = haptics->vmax;
> +
> +	vmax_mv = clamp_t(u32, vmax_mv, HAP_VMAX_MIN_MV, HAP_VMAX_MAX_MV);
> +
> +	dev_dbg(&haptics->pdev->dev, "Setting vmax to: %d", vmax_mv);
> +
> +	val = DIV_ROUND_CLOSEST(vmax_mv, HAP_VMAX_MIN_MV);
> +	val <<= HAP_VMAX_SHIFT;
> +	// overdrive is only supported on pm660

Good to know...so what should I do with that information?

> +	val &= ~HAP_VMAX_OVD_BIT;

The only way I can see this bit being set is somehow vmax_mv turnes out
to be more than 5 bits, but then you have a problem.

Consider using FIELD_PREP to stuff the result in the bits and skip this.

> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_VMAX_CFG_REG(haptics),
> +			HAP_VMAX_MASK | HAP_VMAX_OVD_BIT, val);
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write_current_limit(struct qpnp_haptics *haptics)
> +{
> +	int ret;
> +
> +	haptics->current_limit = clamp_t(u32, haptics->current_limit,
> +					 HAP_ILIM_400_MA, HAP_ILIM_800_MA);
> +
> +	dev_dbg(&haptics->pdev->dev, "Setting current_limit to: 0x%x", haptics->current_limit);
> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_ILIM_CFG_REG(haptics),
> +			HAP_ILIM_SEL_MASK, haptics->current_limit);
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write_play_mode(struct qpnp_haptics *haptics)
> +{
> +	u8 val = 0;
> +	int ret;
> +
> +	if (!is_haptics_idle(haptics))
> +		return -EBUSY;
> +
> +	dev_dbg(&haptics->pdev->dev, "Setting play_mode to: 0x%x", haptics->play_mode);
> +
> +	val = haptics->play_mode << HAP_WF_SOURCE_SHIFT;

How about:
	val = FIELD_PREP(HAP_WF_SOURCE_MASK, haptics->play_mode);

> +	ret = qpnp_haptics_write_masked(haptics, HAP_SEL_REG(haptics),
> +			HAP_WF_SOURCE_MASK, val);

return qpnp_haptics_write_masked()

> +
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write_play_rate(struct qpnp_haptics *haptics, u16 play_rate)
> +{
> +	int rc;
> +	u8 val[2];
> +
> +	dev_dbg(&haptics->pdev->dev, "Setting play_rate to: %d", play_rate);
> +
> +	val[0] = play_rate & HAP_RATE_CFG1_MASK;
> +	val[1] = (play_rate >> HAP_RATE_CFG2_SHIFT) & HAP_RATE_CFG2_MASK;

Make val a u16 and FIELD_PREP() the bits in there, will be easier to
reason about.

> +	rc = qpnp_haptics_write(haptics, HAP_RATE_CFG1_REG(haptics), val, 2);
> +	if (rc < 0)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +/*
> + * qpnp_haptics_set_auto_res() - Auto resonance
> + * allows the haptics to automatically adjust the
> + * speed of the oscillation in order to maintain
> + * the resonant frequency.
> + */
> +static int qpnp_haptics_set_auto_res(struct qpnp_haptics *haptics, bool enable)
> +{
> +	int rc = 0;
> +	u8 val;
> +
> +	// LRAs are the only type to support auto res
> +	if (haptics->actuator_type != HAP_TYPE_LRA)
> +		return 0;
> +
> +	val = enable ? AUTO_RES_EN_BIT : 0;
> +
> +	rc = qpnp_haptics_write_masked(haptics, HAP_TEST2_REG(haptics),
> +			AUTO_RES_EN_BIT, val);

return qpnp_haptics_write_masked();

> +	if (rc < 0)
> +		return rc;
> +
> +	dev_dbg(&haptics->pdev->dev, "Auto resonance enabled: %d", enable);
> +	return rc;
> +}
> +
> +static int qpnp_haptics_write_brake(struct qpnp_haptics *haptics)
> +{
> +	int ret, i;
> +	u32 temp;
> +	u8 val;
> +
> +	dev_dbg(&haptics->pdev->dev, "Configuring brake pattern");
> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_EN_CTL2_REG(haptics),
> +			BRAKE_EN_BIT, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = HAP_BRAKE_PAT_LEN - 1, val = 0; i >= 0; i--) {
> +		u8 p = haptics->brake_pat[i] & HAP_BRAKE_PAT_MASK;
> +
> +		temp = i << 1;
> +		val |= p << temp;

		val |= p << (i * 2);

Would make this trivial to understand. The temp variable and the extra
bitshifting is confusing, and the compiler will help you with the
optimization.

> +	}
> +
> +	ret = qpnp_haptics_write(haptics, HAP_BRAKE_REG(haptics), &val, 1);

return qpnp_haptics_write();

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int qpnp_haptics_write_buffer_config(struct qpnp_haptics *haptics)
> +{
> +	u8 buf[HAP_WAVE_SAMP_LEN];
> +	int rc, i;
> +
> +	dev_dbg(&haptics->pdev->dev, "Writing buffer config");
> +
> +	for (i = 0; i < HAP_WAVE_SAMP_LEN; i++)
> +		buf[i] = haptics->wave_samp[i];
> +
> +	rc = qpnp_haptics_write(haptics, HAP_WF_S1_REG(haptics), buf,
> +			HAP_WAVE_SAMP_LEN);

return qpnp_haptics_write();

> +
> +	return rc;
> +}
> +
> +/**
> + * qpnp_haptics_write_wave_repeat() - write wave repeat values.

This kernel-doc is incomplete. Either define it fully or drop one of the
'*'

> + */
> +static int qpnp_haptics_write_wave_repeat(struct qpnp_haptics *haptics)
> +{
> +	int ret;
> +	u8 val = 0, mask = 0;

No need to zero-initialize these.

> +
> +	// The number of times to repeat each wave

/* Comments */

> +	mask = WF_REPEAT_MASK;
> +	val = ilog2(1) << WF_REPEAT_SHIFT; // Currently hard coded to default of 1

So how about val = 0; ?

If you want to leave some of this code around as a todo, perhaps write
it as:

	mask = WF_REPEAT_MASK | WF_S_REPEAT_MASK;
	val = FIELD_PREP(WF_REPEAT_MASK, 0) |
	      FIELD_PREP(WF_S_REPEAT_MASK, 0);

	return qpnp_haptics_write_masked();

> +
> +	// the number of times to repeat each wave sample (group of waves)
> +	mask |= WF_S_REPEAT_MASK;
> +	val |= ilog2(1);
> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_WF_REPEAT_REG(haptics),
> +			mask, val);
> +	return ret;
> +}
> +
> +static int qpnp_haptics_write_play_control(struct qpnp_haptics *haptics,
> +						enum hap_play_control ctrl)
> +{
> +	u8 val;
> +	int rc;
> +
> +	switch (ctrl) {
> +	case HAP_STOP:
> +		val = 0;
> +		break;
> +	case HAP_PAUSE:
> +		val = HAP_PAUSE_BIT;
> +		break;
> +	case HAP_PLAY:
> +		val = HAP_PLAY_BIT;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	rc = qpnp_haptics_write(haptics, HAP_PLAY_REG(haptics), &val, 1);
> +	if (rc < 0) {
> +		pr_err("Error writing to PLAY_REG, rc=%d\n", rc);

You already printed in all possible code paths through
qpnp_haptics_write()


Move the dev_dbg below up above the write and you can simply:

	return qpnp_haptics_write();

> +		return rc;
> +	}
> +
> +	dev_dbg(&haptics->pdev->dev, "haptics play ctrl: %d\n", ctrl);
> +	return rc;
> +}
> +
> +/*
> + * This IRQ is fired to tell us to load the next wave sample set.
> + * As we only currently support a single sample set, it's unused.
> + */
> +static irqreturn_t qpnp_haptics_play_irq_handler(int irq, void *data)
> +{
> +	struct qpnp_haptics *haptics = data;
> +
> +	dev_dbg(&haptics->pdev->dev, "play_irq triggered");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * Fires every ~50ms whilst the haptics are active.
> + * If the SC_FLAG_BIT is set then that means there isn't a short circuit
> + * and we just need to clear the IRQ to indicate that the device should
> + * keep vibrating.
> + *
> + * Otherwise, it means a short circuit situation has occurred.
> + */
> +static irqreturn_t qpnp_haptics_sc_irq_handler(int irq, void *data)
> +{
> +	struct qpnp_haptics *haptics = data;
> +	int ret;
> +	u8 val;
> +	s64 sc_delta_time_us;
> +	ktime_t temp;
> +
> +	ret = qpnp_haptics_read(haptics, HAP_STATUS_1_REG(haptics), &val, 1);
> +	if (ret < 0)
> +		return IRQ_HANDLED;
> +
> +	if (!(val & SC_FLAG_BIT)) {
> +		haptics->sc_count = 0;
> +		return IRQ_HANDLED;
> +	}
> +
> +	temp = ktime_get();
> +	sc_delta_time_us = ktime_us_delta(temp, haptics->last_sc_time);
> +	haptics->last_sc_time = temp;
> +
> +	if (sc_delta_time_us > SC_COUNT_RST_DELAY_US)
> +		haptics->sc_count = 0;
> +	else
> +		haptics->sc_count++;
> +
> +	// Clear the interrupt flag
> +	val = SC_CLR_BIT;
> +	ret = qpnp_haptics_write(haptics, HAP_SC_CLR_REG(haptics), &val, 1);
> +	if (ret < 0) {
> +		pr_err("Error writing to SC_CLR_REG, rc=%d\n", ret);

You already printed in qpnp_haptics_write()

> +		return IRQ_HANDLED;
> +	}
> +
> +	if (haptics->sc_count > SC_MAX_COUNT) {
> +		pr_crit("Short circuit persists, disabling haptics\n");

dev_crit()?

> +		ret = qpnp_haptics_module_enable(haptics, false);
> +		if (ret < 0) {
> +			pr_err("Error disabling module, rc=%d\n", ret);

dev_err(), and qpnp_haptics_module_enable() already printed an error.

That said, these error messages are more useful, so perhaps it's worth
deciding to move it out to the callers?

> +			return IRQ_HANDLED;

You can just fall down do the return below...

> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +
> +/**
> + * qpnp_haptics_init() - Initialise haptics hardware for use
> + * @haptics: haptics device

Missing "Returns:"

> + */
> +static int qpnp_haptics_init(struct qpnp_haptics *haptics)
> +{
> +	int ret;
> +	u8 val, mask;
> +	u16 auto_res_mode;
> +	u16 play_rate = 0;

First use is an assignment, no need to zero-initialize.

> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_CFG1_REG(haptics),
> +		HAP_ACT_TYPE_MASK, haptics->actuator_type);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Configure auto resonance

/*
 * Multi-line comment.
 */

> +	// see qpnp_haptics_lra_auto_res_config downstream
> +	// This is greatly simplified.
> +	auto_res_mode = HAP_AUTO_RES_ZXD_EOP << LRA_AUTO_RES_MODE_SHIFT;
> +
> +	//Default LRA calibration period
> +	val = ilog2(32 / HAP_RES_CAL_PERIOD_MIN);
> +
> +	val |= (auto_res_mode << LRA_AUTO_RES_MODE_SHIFT);

You shift HAP_AUTO_RES_ZXD_EOP twice here.

> +	// The 1 here is for OPT2 "High Z configuration", there are 3
> +	// options and no documentation indicating the difference
> +	val |= (1 << LRA_HIGH_Z_SHIFT);

Consider writing this as:

	val = FIELD_PREP(LRA_RES_CAL_MASK, ilog2(32 / HAP_RES_CAL_PERIOD_MIN) |
	      FIELD_PREP(LRA_AUTO_RES_MODE_MASK, HAP_AUTO_RES_ZXD_EOP) |
	      FIELD_PREP(LRA_HIGH_Z_MASK, 1);

> +	mask = LRA_AUTO_RES_MODE_MASK | LRA_HIGH_Z_MASK | LRA_RES_CAL_MASK;
> +
> +	ret = qpnp_haptics_write_masked(haptics, HAP_LRA_AUTO_RES_REG(haptics),
> +			mask, val);
> +
> +	dev_dbg(&haptics->pdev->dev, "%s: auto_res_mode: %d\n", __func__,
> +		auto_res_mode);
> +
> +	/* Configure the PLAY MODE register */
> +	ret = qpnp_haptics_write_play_mode(haptics);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = qpnp_haptics_write_vmax(haptics);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Configure the ILIM register */
> +	ret = qpnp_haptics_write_current_limit(haptics);
> +	if (ret < 0)
> +		return ret;
> +
> +	// Configure the debounce for short-circuit detection.
> +	val = HAP_SC_DEB_CYCLES_MAX;

This val is unused.

> +	ret = qpnp_haptics_write_masked(haptics, HAP_SC_DEB_REG(haptics),
> +			HAP_SC_DEB_MASK, HAP_SC_DEB_CYCLES_MAX);
> +	if (ret < 0)
> +		return ret;
> +
> +	// write the wave shape
> +	ret = qpnp_haptics_write_masked(haptics, HAP_CFG2_REG(haptics),
> +			HAP_LRA_RES_TYPE_MASK, haptics->wave_shape);
> +	if (ret < 0)
> +		return ret;
> +
> +	play_rate = haptics->play_wave_rate / HAP_RATE_CFG_STEP_US;
> +
> +	/*
> +	 * Configure RATE_CFG1 and RATE_CFG2 registers.
> +	 * Note: For ERM these registers act as play rate and
> +	 * for LRA these represent resonance period
> +	 */
> +	ret = qpnp_haptics_write_play_rate(haptics, play_rate);

You don't check this ret.

> +
> +	ret = qpnp_haptics_write_brake(haptics);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (haptics->play_mode == HAP_PLAY_BUFFER) {
> +		ret = qpnp_haptics_write_wave_repeat(haptics);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = qpnp_haptics_write_buffer_config(haptics);
> +	}
> +
> +	if (haptics->play_irq >= 0) {

Afaict, you won't leave probe successfully with this < 0.

> +		dev_dbg(&haptics->pdev->dev, "%s: Requesting play IRQ, irq: %d", __func__,
> +			haptics->play_irq);
> +		ret = devm_request_threaded_irq(&haptics->pdev->dev, haptics->play_irq,
> +			NULL, qpnp_haptics_play_irq_handler, IRQF_ONESHOT,
> +			"haptics_play_irq", haptics);
> +
> +		if (ret < 0) {
> +			pr_err("Unable to request play IRQ ret=%d\n", ret);
> +			return ret;
> +		}
> +
> +		/* use play_irq only for buffer mode */
> +		if (haptics->play_mode != HAP_PLAY_BUFFER)
> +			disable_irq(haptics->play_irq);
> +	}
> +
> +	if (haptics->sc_irq >= 0) {

Same here.

> +		dev_dbg(&haptics->pdev->dev, "%s: Requesting play IRQ, irq: %d", __func__,
> +			haptics->play_irq);
> +		ret = devm_request_threaded_irq(&haptics->pdev->dev, haptics->sc_irq,
> +			NULL, qpnp_haptics_sc_irq_handler, IRQF_ONESHOT,
> +			"haptics_sc_irq", haptics);
> +
> +		if (ret < 0) {
> +			pr_err("Unable to request sc IRQ ret=%d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return ret;

ret is 0 when you get here.

> +}
> +
> +/**
> + * qpnp_haptics_set - handler to start/stop vibration
> + * @haptics: pointer to haptics struct
> + * @enable: state to set

  * Returns:

> + */
> +static int qpnp_haptics_set(struct qpnp_haptics *haptics, bool enable)

Consider splitting this into haptics_enable() and haptics_disable(), as
this really just is two separate functions squashed into one.

> +{
> +	int ret;
> +
> +	mutex_lock(&haptics->play_lock);
> +
> +	if (enable) {
> +		if (haptics->sc_count > SC_MAX_COUNT) {
> +			pr_err("Can't play while in short circuit");
> +			ret = -1;
> +			goto out;
> +		}
> +		ret = qpnp_haptics_set_auto_res(haptics, false);
> +		if (ret < 0) {
> +			pr_err("Error disabling auto_res, ret=%d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = qpnp_haptics_module_enable(haptics, true);
> +		if (ret < 0) {
> +			pr_err("Error enabling module, ret=%d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = qpnp_haptics_write_play_control(haptics, HAP_PLAY);
> +		if (ret < 0) {
> +			pr_err("Error enabling play, ret=%d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = qpnp_haptics_set_auto_res(haptics, true);
> +		if (ret < 0) {
> +			pr_err("Error enabling auto_res, ret=%d\n", ret);
> +			goto out;
> +		}
> +	} else {
> +		ret = qpnp_haptics_write_play_control(haptics, HAP_STOP);
> +		if (ret < 0) {
> +			pr_err("Error disabling play, ret=%d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = qpnp_haptics_module_enable(haptics, false);
> +		if (ret < 0) {
> +			pr_err("Error disabling module, ret=%d\n", ret);
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	mutex_unlock(&haptics->play_lock);
> +	return ret;
> +}
> +
> +/*
> + * Threaded function to update the haptics state.
> + */
> +static void qpnp_haptics_work(struct work_struct *work)
> +{
> +	struct qpnp_haptics *haptics = container_of(work, struct qpnp_haptics, work);
> +
> +	int ret;
> +	bool enable;
> +
> +	enable = atomic_read(&haptics->active);
> +	dev_dbg(&haptics->pdev->dev, "%s: state: %d\n", __func__, enable);
> +
> +	ret = qpnp_haptics_set(haptics, enable);
> +	if (ret < 0)
> +		pr_err("Error setting haptics, ret=%d", ret);
> +}
> +
> +/**
> + * qpnp_haptics_close - callback for input device close
> + * @dev: input device pointer
> + *
> + * Turns off the vibrator.
> + */
> +static void qpnp_haptics_close(struct input_dev *dev)
> +{
> +	struct qpnp_haptics *haptics = input_get_drvdata(dev);
> +
> +	cancel_work_sync(&haptics->work);
> +	if (atomic_read(&haptics->active)) {
> +		atomic_set(&haptics->active, 0);
> +		schedule_work(&haptics->work);
> +	}
> +}
> +
> +/**
> + * qpnp_haptics_play_effect - play haptics effects
> + * @dev: input device pointer
> + * @data: data of effect
> + * @effect: effect to play
> + */
> +static int qpnp_haptics_play_effect(struct input_dev *dev, void *data,
> +					struct ff_effect *effect)
> +{
> +	struct qpnp_haptics *haptics = input_get_drvdata(dev);
> +
> +	dev_dbg(&haptics->pdev->dev, "%s: Rumbling with strong: %d and weak: %d", __func__,
> +		effect->u.rumble.strong_magnitude, effect->u.rumble.weak_magnitude);
> +
> +	haptics->magnitude = effect->u.rumble.strong_magnitude >> 8;
> +	if (!haptics->magnitude)
> +		haptics->magnitude = effect->u.rumble.weak_magnitude >> 10;
> +
> +	if (!haptics->magnitude) {
> +		atomic_set(&haptics->active, 0);
> +		goto end;
> +	}
> +
> +	atomic_set(&haptics->active, 1);
> +
> +	haptics->vmax = ((HAP_VMAX_MAX_MV - HAP_VMAX_MIN_MV) * haptics->magnitude) / 100 +
> +					HAP_VMAX_MIN_MV;
> +
> +	dev_dbg(&haptics->pdev->dev, "%s: magnitude: %d, vmax: %d", __func__,
> +		haptics->magnitude, haptics->vmax);
> +
> +	qpnp_haptics_write_vmax(haptics);
> +
> +end:
> +	schedule_work(&haptics->work);
> +
> +	return 0;
> +}
> +
> +static int qpnp_haptics_probe(struct platform_device *pdev)
> +{
> +	struct qpnp_haptics *haptics;
> +	struct device_node *node;
> +	struct input_dev *input_dev;
> +	int ret;
> +	u32 val;
> +	int i;
> +
> +	haptics = devm_kzalloc(&pdev->dev, sizeof(*haptics), GFP_KERNEL);
> +	if (!haptics)
> +		return -ENOMEM;
> +
> +	haptics->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!haptics->regmap)
> +		return -ENODEV;
> +
> +	node = pdev->dev.of_node;
> +
> +	haptics->pdev = pdev;
> +
> +	ret = of_property_read_u32(node, "reg", &haptics->base);
> +	if (ret < 0) {
> +		pr_err("Couldn't find reg in node = %s ret = %d\n",

dev_err()

> +			node->full_name, ret);
> +		return ret;
> +	}
> +
> +	if (haptics->base <= 0) {
> +		pr_err("Invalid base address: 0x%x\n", haptics->base);

dev_err() but how could it be <= 0 if the read returned ok?

> +		return -EINVAL;
> +	}
> +
> +	haptics->play_irq = platform_get_irq_byname(pdev, "play");
> +	if (haptics->play_irq < 0) {
> +		dev_err(&pdev->dev, "Unable to get play irq\n");
> +		ret = haptics->play_irq;
> +		goto register_fail;
> +	}
> +
> +	haptics->sc_irq = platform_get_irq_byname(pdev, "short");
> +	if (haptics->sc_irq < 0) {
> +		dev_err(&pdev->dev, "Unable to get sc irq\n");
> +		ret = haptics->sc_irq;
> +		goto register_fail;
> +	}
> +
> +	// We only support LRAs for now
> +	haptics->actuator_type = HAP_TYPE_LRA;
> +	ret = of_property_read_u32(node, "qcom,actuator-type", &val);
> +	if (!ret) {
> +		if (val != HAP_TYPE_LRA) {
> +			dev_err(&pdev->dev, "qcom,actuator-type (%d) isn't supported\n", val);
> +			ret = -EINVAL;
> +			goto register_fail;
> +		}
> +		haptics->actuator_type = val;
> +	}
> +
> +	// Only buffer mode is currently supported
> +	haptics->play_mode = HAP_PLAY_BUFFER;
> +	ret = of_property_read_u32(node, "qcom,play-mode", &val);
> +	if (!ret) {
> +		if (val != HAP_PLAY_BUFFER) {
> +			dev_err(&pdev->dev, "qcom,play-mode (%d) isn't supported\n", val);
> +			ret = -EINVAL;
> +			goto register_fail;
> +		}
> +		haptics->play_mode = val;
> +	}
> +
> +	ret = of_property_read_u32(node,
> +			"qcom,wave-play-rate-us", &val);

Unwrap this line.

> +	if (!ret) {
> +		haptics->play_wave_rate = val;
> +	} else if (ret != -EINVAL) {
> +		pr_err("Unable to read play rate ret=%d\n", ret);
> +		goto register_fail;
> +	}
> +
> +	haptics->wave_shape = HAP_WAVE_SINE;
> +	ret = of_property_read_u32(node, "qcom,wave-shape", &val);
> +	if (!ret) {
> +		if (val != HAP_WAVE_SINE && val != HAP_WAVE_SQUARE) {
> +			dev_err(&pdev->dev, "qcom,wave-shape is invalid: %d\n", val);
> +			ret = -EINVAL;
> +			goto register_fail;
> +		}
> +		haptics->wave_shape = val;
> +	}
> +
> +	ret = of_property_read_u8_array(node, "qcom,brake-pattern", haptics->brake_pat, 4);
> +	// Default if not set
> +	if (ret == -EINVAL) {
> +		haptics->brake_pat[0] = 0x3;
> +		haptics->brake_pat[1] = 0x3;
> +		haptics->brake_pat[2] = 0x2;
> +		haptics->brake_pat[3] = 0x1;

You could rely on the fact that these operations doesn't touch the
buffer if the read is going to fail and do:

	haptics->brake_pat[0] = 0x3;
	...
	ret = of_property_read_u8_array();
	if (ret < 0 && ret != -EINVAL)
		fail;

As that will either have the default values (-EINVAL) or the newly
populated values (0).

> +	} else if (ret) {
> +		dev_err(&pdev->dev, "qcom,brake-pattern is invalid, ret = %d\n", ret);

So a qcom,brake-pattern was defined in DT, but it's format is invalid
for some reason. I think it would be better to help the developer find
this by failing the probe here. Otherwise they will have to rely on
someone detecting that line in the kernel log, or some tester noticing
that the behavior is slightly off.

> +	}
> +
> +	haptics->current_limit = HAP_ILIM_400_MA;
> +
> +	for (i = 0; i < HAP_WAVE_SAMP_LEN; i++)
> +		haptics->wave_samp[i] = HAP_WF_SAMP_MAX;
> +
> +	haptics->play_wave_rate =

Perhaps move this up to the place where you assigned play_wave_rate?

> +		clamp_t(u32, haptics->play_wave_rate,
> +		HAP_WAVE_PLAY_RATE_MIN_US, HAP_WAVE_PLAY_RATE_MAX_US);
> +
> +	ret = qpnp_haptics_init(haptics);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Error initialising haptics, ret=%d\n",
> +			ret);
> +		goto register_fail;
> +	}
> +
> +	platform_set_drvdata(pdev, haptics);
> +
> +	input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&haptics->work, qpnp_haptics_work);
> +	haptics->haptics_input_dev = input_dev;
> +
> +	input_dev->name = "qpnp_haptics";
> +	input_dev->id.version = 3;
> +	input_dev->close = qpnp_haptics_close;
> +	input_set_drvdata(input_dev, haptics);
> +	// Figure out how to make this FF_PERIODIC
> +	input_set_capability(haptics->haptics_input_dev, EV_FF, FF_RUMBLE);
> +
> +	ret = input_ff_create_memless(input_dev, NULL,
> +					qpnp_haptics_play_effect);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"couldn't register vibrator as FF device\n");
> +		goto register_fail;
> +	}
> +
> +	ret = input_register_device(input_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "couldn't register input device\n");
> +		goto register_fail;
> +	}
> +
> +	return 0;
> +
> +register_fail:
> +	cancel_work_sync(&haptics->work);
> +	mutex_destroy(&haptics->play_lock);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused qpnp_haptics_suspend(struct device *dev)
> +{
> +	struct qpnp_haptics *haptics = dev_get_drvdata(dev);
> +
> +	cancel_work_sync(&haptics->work);
> +	qpnp_haptics_set(haptics, false);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(qpnp_haptics_pm_ops, qpnp_haptics_suspend, NULL);
> +
> +static int qpnp_haptics_remove(struct platform_device *pdev)
> +{
> +	struct qpnp_haptics *haptics = dev_get_drvdata(&pdev->dev);
> +

Don't you need a input_unregister_device() here?

> +	cancel_work_sync(&haptics->work);
> +	mutex_destroy(&haptics->play_lock);
> +	dev_set_drvdata(&pdev->dev, NULL);

I don't see a reason for you to clear the drvdata here.

> +
> +	return 0;
> +}
> +
> +static void qpnp_haptics_shutdown(struct platform_device *pdev)
> +{
> +	struct qpnp_haptics *haptics = dev_get_drvdata(&pdev->dev);
> +
> +	cancel_work_sync(&haptics->work);
> +
> +	qpnp_haptics_set(haptics, false);
> +}
> +
> +static const struct of_device_id qpnp_haptics_match_table[] = {
> +	{ .compatible = "qcom,qpnp-haptics" },

"qcom,spmi-haptics"

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qpnp_haptics_match_table);
> +
> +static struct platform_driver qpnp_haptics_driver = {
> +	.probe		= qpnp_haptics_probe,
> +	.remove		= qpnp_haptics_remove,
> +	.shutdown	= qpnp_haptics_shutdown,
> +	.driver		= {
> +		.name	= "qpnp-haptics",
> +		.pm	= &qpnp_haptics_pm_ops,
> +		.of_match_table = qpnp_haptics_match_table,
> +	},
> +};
> +module_platform_driver(qpnp_haptics_driver);
> +
> +MODULE_ALIAS("platform:qpnp_haptics");

Nothing is going to trigger autoloading of a platform driver with the
alias "qpnp_haptics". Please skip this.

Regards,
Bjorn

> +MODULE_DESCRIPTION("QPNP haptics driver using ff-memless framework");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
> --
> 2.31.1
> 
> 
