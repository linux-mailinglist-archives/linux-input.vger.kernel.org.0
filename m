Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5354B3A5990
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 18:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbhFMQ0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 12:26:37 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:48949 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231993AbhFMQ0g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 12:26:36 -0400
Date:   Sun, 13 Jun 2021 16:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623601464;
        bh=hh8FrlBHkO5KeBpU2laheDg8OSWHqDEXbAQqqX+MTqk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MX2m9xGLhpq2fwhoqfFJPGjTFDwMnnFvm+yG8jcmaYH+IWWRt6Sl7fZk8099v1wML
         33z8JnGTbw5skVE1/aGwe+IXfBbR9lQ8QjdTTAuFm2nL3C34eOAb50jp2rrlFqRxs/
         ZqZ8icYiN4c4ldT6wjFX+qmYCu9+fVoAo9l3OF0I=
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/4] input: add Qualcomm QPNP haptics driver
Message-ID: <b821c5d4-f406-f4bf-638b-59fb20bc2f36@connolly.tech>
In-Reply-To: <YMWE+p5zlntC88ti@yoga>
References: <20210612205405.1233588-1-caleb@connolly.tech> <20210612205405.1233588-3-caleb@connolly.tech> <YMWE+p5zlntC88ti@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bjorn,

Thanks a lot for your feedback.

On 13/06/2021 5:09 am, Bjorn Andersson wrote:
> On Sat 12 Jun 15:54 CDT 2021, Caleb Connolly wrote:
>
>> Add support for the haptics found in pmi8998 and related PMICs.
>> Based on the ff-memless interface. Currently this driver provides
>> a partial implementation of hardware features.
>>
>> This driver only supports LRAs (Linear Resonant Actuators) in the "buffe=
r"
>> mode with a single wave pattern.
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>
> Please use a cover letter when posting multiple patches.
I'm not sure why the cover letter didn't make it to your inbox, here's a
link:
https://lore.kernel.org/linux-arm-msm/20210612205405.1233588-1-caleb@connol=
ly.tech/
>
>> ---
>>  drivers/input/misc/Kconfig        |   11 +
>>  drivers/input/misc/Makefile       |    1 +
>>  drivers/input/misc/qpnp-haptics.c | 1022 +++++++++++++++++++++++++++++
>>  3 files changed, 1034 insertions(+)
>>  create mode 100644 drivers/input/misc/qpnp-haptics.c
>>
>> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
>> index 498cde376981..b5ba03e6cf58 100644
>> --- a/drivers/input/misc/Kconfig
>> +++ b/drivers/input/misc/Kconfig
>> @@ -186,6 +186,17 @@ config INPUT_PMIC8XXX_PWRKEY
>>  =09  To compile this driver as a module, choose M here: the
>>  =09  module will be called pmic8xxx-pwrkey.
>>
>> +config INPUT_QPNP_HAPTICS
>
> No-one knows what "QPNP" really is, so please name this
> "INPUT_QCOM_SPMI_HAPTICS"
>
>> +=09tristate "Qualcomm QPNP HAPTICS"
>> +=09depends on ARCH_QCOM
>
> "depends on SPMI" makes sense here.
>
>> +=09select INPUT_FF_MEMLESS
>> +=09help
>> +=09  This option enables support for the haptics found in pmi8998 and
>> +=09  related PMICs. Based on the ff-memless interface.
>> +
>> +=09  To compile this driver as module, choose M here: the
>> +=09  module will be called qpnp-haptics.
>> +
>>  config INPUT_SPARCSPKR
>>  =09tristate "SPARC Speaker support"
>>  =09depends on PCI && SPARC64
>> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
>> index f593beed7e05..c43290163db0 100644
>> --- a/drivers/input/misc/Makefile
>> +++ b/drivers/input/misc/Makefile
>> @@ -65,6 +65,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)=09+=3D pmic8xxx-pw=
rkey.o
>>  obj-$(CONFIG_INPUT_POWERMATE)=09=09+=3D powermate.o
>>  obj-$(CONFIG_INPUT_PWM_BEEPER)=09=09+=3D pwm-beeper.o
>>  obj-$(CONFIG_INPUT_PWM_VIBRA)=09=09+=3D pwm-vibra.o
>> +obj-$(CONFIG_INPUT_QPNP_HAPTICS)=09+=3D qpnp-haptics.o
>>  obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)=09+=3D rave-sp-pwrbutton.o
>>  obj-$(CONFIG_INPUT_RB532_BUTTON)=09+=3D rb532_button.o
>>  obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)=09+=3D regulator-haptic.o
>> diff --git a/drivers/input/misc/qpnp-haptics.c b/drivers/input/misc/qpnp=
-haptics.c
>
> Again, qcom-spmi-haptics.c
>
>> new file mode 100644
>> index 000000000000..daa7a18ffc7d
>> --- /dev/null
>> +++ b/drivers/input/misc/qpnp-haptics.c
>> @@ -0,0 +1,1022 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, Caleb Connolly <caleb@connolly.tech>
>> + * Qualcomm Plug and Play haptics driver for pmi8998 and related PMICs.
>> + * Based on ./pm8xxx-vibrator.c
>
> Enough "based on" to warrant carrying some copyrights?
Hmm, I only stole the input device parts, so perhaps not.
>
>> + */
>> +
>> +#include <dt-bindings/input/qcom,qpnp-haptics.h>
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/bits.h>
>> +#include <linux/errno.h>
>> +#include <linux/input.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/log2.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/time.h>
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Register and bit definitions
>> + */
>
> This comment doesn't add much value.
>
>> +
>> +#define HAP_STATUS_1_REG(chip)=09=09(chip->base + 0x0A)
>
> This style is somewhat unusual, please define the offset here and do the
> math in qpnp_haptics_read() et al.
>
>> +#define HAP_BUSY_BIT=09=09=09BIT(1)
>> +#define SC_FLAG_BIT=09=09=09BIT(3)
>> +#define AUTO_RES_ERROR_BIT=09=09BIT(4)
>> +
>> +#define HAP_LRA_AUTO_RES_LO_REG(chip)=09(chip->base + 0x0B)
>> +#define HAP_LRA_AUTO_RES_HI_REG(chip)=09(chip->base + 0x0C)
>> +
>> +#define HAP_EN_CTL_REG(chip)=09=09(chip->base + 0x46)
>> +#define HAP_EN_BIT=09=09=09BIT(7)
>> +
>> +#define HAP_EN_CTL2_REG(chip)=09=09(chip->base + 0x48)
>> +#define BRAKE_EN_BIT=09=09=09BIT(0)
>> +
>> +#define HAP_AUTO_RES_CTRL_REG(chip)=09(chip->base + 0x4B)
>> +#define AUTO_RES_EN_BIT=09=09=09BIT(7)
>> +#define AUTO_RES_ERR_RECOVERY_BIT=09BIT(3)
>> +#define AUTO_RES_EN_FLAG_BIT=09BIT(0)
>> +
>> +#define HAP_CFG1_REG(chip)=09=09(chip->base + 0x4C)
>> +#define HAP_ACT_TYPE_MASK=09=09BIT(0)
>> +
>> +#define HAP_CFG2_REG(chip)=09=09(chip->base + 0x4D)
>> +#define HAP_LRA_RES_TYPE_MASK=09=09BIT(0)
>> +
>> +#define HAP_SEL_REG(chip)=09=09(chip->base + 0x4E)
>> +#define HAP_WF_SOURCE_MASK=09=09GENMASK(5, 4)
>> +#define HAP_WF_SOURCE_SHIFT=09=094
>> +
>> +#define HAP_LRA_AUTO_RES_REG(chip)=09(chip->base + 0x4F)
>> +#define LRA_AUTO_RES_MODE_MASK=09=09GENMASK(6, 4)
>> +#define LRA_AUTO_RES_MODE_SHIFT=09=094
>> +#define LRA_HIGH_Z_MASK=09=09=09GENMASK(3, 2)
>> +#define LRA_HIGH_Z_SHIFT=09=092
>> +#define LRA_RES_CAL_MASK=09=09GENMASK(1, 0)
>> +#define HAP_RES_CAL_PERIOD_MIN=09=094
>> +#define HAP_RES_CAL_PERIOD_MAX=09=0932
>> +
>> +#define HAP_VMAX_CFG_REG(chip)=09=09(chip->base + 0x51)
>> +#define HAP_VMAX_OVD_BIT=09=09BIT(6)
>> +#define HAP_VMAX_MASK=09=09=09GENMASK(5, 1)
>> +#define HAP_VMAX_SHIFT=09=09=091
>> +
>> +#define HAP_ILIM_CFG_REG(chip)=09=09(chip->base + 0x52)
>> +#define HAP_ILIM_SEL_MASK=09=09BIT(0)
>> +#define HAP_ILIM_400_MA=09=09=090
>> +#define HAP_ILIM_800_MA=09=09=091
>> +
>> +#define HAP_SC_DEB_REG(chip)=09=09(chip->base + 0x53)
>> +#define HAP_SC_DEB_MASK=09=09=09GENMASK(2, 0)
>> +#define HAP_SC_DEB_CYCLES_MIN=09=090
>> +#define HAP_DEF_SC_DEB_CYCLES=09=098
>> +#define HAP_SC_DEB_CYCLES_MAX=09=0932
>> +
>> +#define HAP_RATE_CFG1_REG(chip)=09=09(chip->base + 0x54)
>> +#define HAP_RATE_CFG1_MASK=09=09GENMASK(7, 0)
>> +#define HAP_RATE_CFG2_SHIFT=09=098 // As CFG2 is the most significant b=
yte
>> +
>> +#define HAP_RATE_CFG2_REG(chip)=09=09(chip->base + 0x55)
>> +#define HAP_RATE_CFG2_MASK=09=09GENMASK(3, 0)
>> +
>> +#define HAP_SC_CLR_REG(chip)=09=09(chip->base + 0x59)
>> +#define SC_CLR_BIT=09=09=09BIT(0)
>> +
>> +#define HAP_BRAKE_REG(chip)=09=09(chip->base + 0x5C)
>> +#define HAP_BRAKE_PAT_MASK=09=090x3
>> +
>> +#define HAP_WF_REPEAT_REG(chip)=09=09(chip->base + 0x5E)
>> +#define WF_REPEAT_MASK=09=09=09GENMASK(6, 4)
>> +#define WF_REPEAT_SHIFT=09=09=094
>> +#define WF_REPEAT_MIN=09=09=091
>> +#define WF_REPEAT_MAX=09=09=09128
>> +#define WF_S_REPEAT_MASK=09=09GENMASK(1, 0)
>> +#define WF_S_REPEAT_MIN=09=09=091
>> +#define WF_S_REPEAT_MAX=09=09=098
>> +
>> +#define HAP_WF_S1_REG(chip)=09=09(chip->base + 0x60)
>> +#define HAP_WF_SIGN_BIT=09=09=09BIT(7)
>> +#define HAP_WF_OVD_BIT=09=09=09BIT(6)
>> +#define HAP_WF_SAMP_MAX=09=09=09GENMASK(5, 1)
>> +#define HAP_WF_SAMPLE_LEN=09=098
>> +
>> +#define HAP_PLAY_REG(chip)=09=09(chip->base + 0x70)
>> +#define HAP_PLAY_BIT=09=09=09BIT(7)
>> +#define HAP_PAUSE_BIT=09=09=09BIT(0)
>> +
>> +#define HAP_SEC_ACCESS_REG(chip)=09(chip->base + 0xD0)
>> +#define HAP_SEC_ACCESS_UNLOCK=09=090xA5
>> +
>> +#define HAP_TEST2_REG(chip)=09=09(chip->base + 0xE3)
>> +
>> +// Values
>> +#define HAP_VMAX_MIN_MV=09=09=09116
>> +#define HAP_VMAX_MAX_MV=09=09=093596
>> +#define HAP_VMAX_MAX_MV_STRONG=09=093596
>> +
>> +#define HAP_WAVE_PLAY_RATE_MIN_US=090
>> +#define HAP_WAVE_PLAY_RATE_MAX_US=0920475
>> +#define HAP_WAVE_PLAY_TIME_MAX_MS=0915000
>> +
>> +#define AUTO_RES_ERR_POLL_TIME_NS=09(20 * NSEC_PER_MSEC)
>> +#define HAPTICS_BACK_EMF_DELAY_US=0920000
>> +
>> +#define HAP_BRAKE_PAT_LEN=09=094
>> +#define HAP_WAVE_SAMP_LEN=09=098
>> +#define NUM_WF_SET=09=09=094
>> +#define HAP_WAVE_SAMP_SET_LEN=09=09(HAP_WAVE_SAMP_LEN * NUM_WF_SET)
>> +#define HAP_RATE_CFG_STEP_US=09=095
>> +
>> +#define SC_MAX_COUNT=09=09=095
>> +#define SC_COUNT_RST_DELAY_US=09=091000000
>> +
>> +enum hap_play_control {
>> +=09HAP_STOP,
>> +=09HAP_PAUSE,
>> +=09HAP_PLAY,
>> +};
>> +
>> +/**
>> + * struct qpnp_haptics - struct for qpnp haptics data.
>> + *
>> + * @pdev: The platform device responsible for the haptics.
>> + * @regmap: Register map for the hardware block.
>> + * @input_dev: The input device used to receive events.
>> + * @work: Work struct to play effects.
>> + * @base: Base address of the regmap.
>> + * @active: Atomic value used to track if haptics are currently playing=
.
>> + * @play_irq: Fired to load the next wave pattern.
>> + * @sc_irq: Short circuit irq.
>> + * @last_sc_time: Time since the short circuit IRQ last fired.
>> + * @sc_count: Number of times the short circuit IRQ has fired in this i=
nterval.
>> + * @actuator_type: The type of actuator in use.
>> + * @wave_shape: The shape of the waves to use (sine or square).
>> + * @play_mode: The play mode to use (direct, buffer, pwm, audio).
>> + * @magnitude: The strength we should be playing at.
>> + * @vmax: Max voltage to use when playing.
>> + * @current_limit: The current limit for this hardware (400mA or 800mA)=
.
>> + * @play_wave_rate: The wave rate to use for this hardware.
>> + * @wave_samp: The array of wave samples to write for buffer mode.
>> + * @brake_pat: The pattern to apply when braking.
>> + * @play_lock: Lock to be held when updating the hardware state.
>> + */
>> +struct qpnp_haptics {
>> +=09struct platform_device *pdev;
>
> You only ever use this to get to &pdev->dev, so why not store that
> instead?
>
>> +=09struct regmap *regmap;
>> +=09struct input_dev *haptics_input_dev;
>> +=09struct work_struct work;
>> +=09u32 base;
>> +
>> +=09atomic_t active;
>> +
>> +=09int play_irq;
>> +=09int sc_irq;
>> +=09ktime_t last_sc_time;
>> +=09u8 sc_count;
>> +
>> +=09u8 actuator_type;
>> +=09u8 wave_shape;
>> +=09u8 play_mode;
>> +=09int magnitude;
>> +=09u32 vmax;
>> +=09u32 current_limit;
>> +=09u32 play_wave_rate;
>> +
>> +=09u32 wave_samp[HAP_WAVE_SAMP_SET_LEN];
>> +=09u8 brake_pat[HAP_BRAKE_PAT_LEN];
>> +
>> +=09struct mutex play_lock;
>> +};
>> +
>> +static inline bool is_secure_addr(u16 addr)
>> +{
>> +=09return (addr & 0xFF) > 0xD0;
>> +}
>> +
>> +static int qpnp_haptics_read(struct qpnp_haptics *haptics,
>> +=09u16 addr, u8 *val, int len)
>> +{
>> +=09int ret;
>> +
>> +=09ret =3D regmap_bulk_read(haptics->regmap, addr, val, len);
>> +=09if (ret < 0)
>> +=09=09pr_err("Error reading address: 0x%x, ret %d\n", addr, ret);
>
> dev_err()
>
>> +
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write(struct qpnp_haptics *haptics,
>> +=09u16 addr, u8 *val, int len)
>> +{
>> +=09int ret, i;
>> +
>> +=09if (is_secure_addr(addr)) {
>> +=09=09for (i =3D 0; i < len; i++) {
>> +=09=09=09pr_info("%s: unlocking for addr: 0x%x, val: 0x%x", __func__,
>> +=09=09=09=09addr, val[i]);
>
> This is more of a "debug print", so dev_dbg() would be better.
>
>> +=09=09=09ret =3D regmap_write(haptics->regmap,
>> +=09=09=09=09HAP_SEC_ACCESS_REG(haptics), HAP_SEC_ACCESS_UNLOCK);
>> +=09=09=09if (ret < 0) {
>> +=09=09=09=09pr_err("Error writing unlock code, ret %d\n",
>> +=09=09=09=09=09ret);
>
> dev_err()
>
>> +=09=09=09=09return ret;
>> +=09=09=09}
>> +
>> +=09=09=09ret =3D regmap_write(haptics->regmap, addr + i, val[i]);
>> +=09=09=09if (ret < 0) {
>> +=09=09=09=09pr_err("Error writing address 0x%x, ret %d\n",
>> +=09=09=09=09=09addr + i, ret);
>> +=09=09=09=09return ret;
>> +=09=09=09}
>> +=09=09}
>> +=09} else {
>> +=09=09if (len > 1)
>> +=09=09=09ret =3D regmap_bulk_write(haptics->regmap, addr, val, len);
>> +=09=09else
>> +=09=09=09ret =3D regmap_write(haptics->regmap, addr, *val);
>> +=09}
>> +
>> +=09if (ret < 0)
>> +=09=09pr_err("%s: Error writing address: 0x%x, ret %d\n", __func__, add=
r, ret);
>> +
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write_masked(struct qpnp_haptics *haptics,
>> +=09u16 addr, u8 mask, u8 val)
>> +{
>> +=09int ret;
>> +
>> +=09if (is_secure_addr(addr)) {
>> +=09=09ret =3D regmap_write(haptics->regmap,
>> +=09=09=09HAP_SEC_ACCESS_REG(haptics), HAP_SEC_ACCESS_UNLOCK);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error writing unlock code - ret %d\n", ret);
>> +=09=09=09return ret;
>> +=09=09}
>> +=09}
>> +
>> +=09ret =3D regmap_update_bits(haptics->regmap, addr, mask, val);
>> +=09if (ret < 0)
>> +=09=09pr_err("Error writing address: 0x%x - ret %d\n", addr, ret);
>> +
>> +=09return ret;
>> +}
>> +
>> +static bool is_haptics_idle(struct qpnp_haptics *haptics)
>> +{
>> +=09int ret;
>> +=09u8 val;
>> +
>> +=09if (haptics->play_mode =3D=3D HAP_PLAY_DIRECT ||
>> +=09=09=09haptics->play_mode =3D=3D HAP_PLAY_PWM)
>> +=09=09return true;
>> +
>> +=09ret =3D qpnp_haptics_read(haptics, HAP_STATUS_1_REG(haptics), &val, =
1);
>> +=09if (ret < 0 || (val & HAP_BUSY_BIT))
>> +=09=09return false;
>> +
>> +=09return true;
>> +}
>> +
>> +static int qpnp_haptics_module_enable(struct qpnp_haptics *haptics, boo=
l enable)
>> +{
>> +=09u8 val;
>> +=09int rc;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Setting module enable: %d", enable);
>> +
>> +=09val =3D enable ? HAP_EN_BIT : 0;
>> +=09rc =3D qpnp_haptics_write(haptics, HAP_EN_CTL_REG(haptics), &val, 1)=
;
>
> rc will either be < 0 or 0, so you can just do:
> =09return qpnp_haptics_write();
>
>> +=09if (rc < 0)
>> +=09=09return rc;
>> +
>> +=09return 0;
>> +}
>> +
>> +static int qpnp_haptics_write_vmax(struct qpnp_haptics *haptics)
>> +{
>> +=09u8 val =3D 0;
>> +=09int ret;
>> +=09u32 vmax_mv =3D haptics->vmax;
>> +
>> +=09vmax_mv =3D clamp_t(u32, vmax_mv, HAP_VMAX_MIN_MV, HAP_VMAX_MAX_MV);
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Setting vmax to: %d", vmax_mv);
>> +
>> +=09val =3D DIV_ROUND_CLOSEST(vmax_mv, HAP_VMAX_MIN_MV);
>> +=09val <<=3D HAP_VMAX_SHIFT;
>> +=09// overdrive is only supported on pm660
>
> Good to know...so what should I do with that information?
>
>> +=09val &=3D ~HAP_VMAX_OVD_BIT;
>
> The only way I can see this bit being set is somehow vmax_mv turnes out
> to be more than 5 bits, but then you have a problem.
>
> Consider using FIELD_PREP to stuff the result in the bits and skip this.
>
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_VMAX_CFG_REG(haptics)=
,
>> +=09=09=09HAP_VMAX_MASK | HAP_VMAX_OVD_BIT, val);
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write_current_limit(struct qpnp_haptics *haptic=
s)
>> +{
>> +=09int ret;
>> +
>> +=09haptics->current_limit =3D clamp_t(u32, haptics->current_limit,
>> +=09=09=09=09=09 HAP_ILIM_400_MA, HAP_ILIM_800_MA);
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Setting current_limit to: 0x%x", hapti=
cs->current_limit);
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_ILIM_CFG_REG(haptics)=
,
>> +=09=09=09HAP_ILIM_SEL_MASK, haptics->current_limit);
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write_play_mode(struct qpnp_haptics *haptics)
>> +{
>> +=09u8 val =3D 0;
>> +=09int ret;
>> +
>> +=09if (!is_haptics_idle(haptics))
>> +=09=09return -EBUSY;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Setting play_mode to: 0x%x", haptics->=
play_mode);
>> +
>> +=09val =3D haptics->play_mode << HAP_WF_SOURCE_SHIFT;
>
> How about:
> =09val =3D FIELD_PREP(HAP_WF_SOURCE_MASK, haptics->play_mode);
>
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_SEL_REG(haptics),
>> +=09=09=09HAP_WF_SOURCE_MASK, val);
>
> return qpnp_haptics_write_masked()
>
>> +
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write_play_rate(struct qpnp_haptics *haptics, u=
16 play_rate)
>> +{
>> +=09int rc;
>> +=09u8 val[2];
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Setting play_rate to: %d", play_rate);
>> +
>> +=09val[0] =3D play_rate & HAP_RATE_CFG1_MASK;
>> +=09val[1] =3D (play_rate >> HAP_RATE_CFG2_SHIFT) & HAP_RATE_CFG2_MASK;
>
> Make val a u16 and FIELD_PREP() the bits in there, will be easier to
> reason about.
>
>> +=09rc =3D qpnp_haptics_write(haptics, HAP_RATE_CFG1_REG(haptics), val, =
2);
>> +=09if (rc < 0)
>> +=09=09return rc;
>> +
>> +=09return 0;
>> +}
>> +
>> +/*
>> + * qpnp_haptics_set_auto_res() - Auto resonance
>> + * allows the haptics to automatically adjust the
>> + * speed of the oscillation in order to maintain
>> + * the resonant frequency.
>> + */
>> +static int qpnp_haptics_set_auto_res(struct qpnp_haptics *haptics, bool=
 enable)
>> +{
>> +=09int rc =3D 0;
>> +=09u8 val;
>> +
>> +=09// LRAs are the only type to support auto res
>> +=09if (haptics->actuator_type !=3D HAP_TYPE_LRA)
>> +=09=09return 0;
>> +
>> +=09val =3D enable ? AUTO_RES_EN_BIT : 0;
>> +
>> +=09rc =3D qpnp_haptics_write_masked(haptics, HAP_TEST2_REG(haptics),
>> +=09=09=09AUTO_RES_EN_BIT, val);
>
> return qpnp_haptics_write_masked();
>
>> +=09if (rc < 0)
>> +=09=09return rc;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Auto resonance enabled: %d", enable);
>> +=09return rc;
>> +}
>> +
>> +static int qpnp_haptics_write_brake(struct qpnp_haptics *haptics)
>> +{
>> +=09int ret, i;
>> +=09u32 temp;
>> +=09u8 val;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Configuring brake pattern");
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_EN_CTL2_REG(haptics),
>> +=09=09=09BRAKE_EN_BIT, 1);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09for (i =3D HAP_BRAKE_PAT_LEN - 1, val =3D 0; i >=3D 0; i--) {
>> +=09=09u8 p =3D haptics->brake_pat[i] & HAP_BRAKE_PAT_MASK;
>> +
>> +=09=09temp =3D i << 1;
>> +=09=09val |=3D p << temp;
>
> =09=09val |=3D p << (i * 2);
>
> Would make this trivial to understand. The temp variable and the extra
> bitshifting is confusing, and the compiler will help you with the
> optimization.
>
>> +=09}
>> +
>> +=09ret =3D qpnp_haptics_write(haptics, HAP_BRAKE_REG(haptics), &val, 1)=
;
>
> return qpnp_haptics_write();
>
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09return 0;
>> +}
>> +
>> +static int qpnp_haptics_write_buffer_config(struct qpnp_haptics *haptic=
s)
>> +{
>> +=09u8 buf[HAP_WAVE_SAMP_LEN];
>> +=09int rc, i;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "Writing buffer config");
>> +
>> +=09for (i =3D 0; i < HAP_WAVE_SAMP_LEN; i++)
>> +=09=09buf[i] =3D haptics->wave_samp[i];
>> +
>> +=09rc =3D qpnp_haptics_write(haptics, HAP_WF_S1_REG(haptics), buf,
>> +=09=09=09HAP_WAVE_SAMP_LEN);
>
> return qpnp_haptics_write();
>
>> +
>> +=09return rc;
>> +}
>> +
>> +/**
>> + * qpnp_haptics_write_wave_repeat() - write wave repeat values.
>
> This kernel-doc is incomplete. Either define it fully or drop one of the
> '*'
>
>> + */
>> +static int qpnp_haptics_write_wave_repeat(struct qpnp_haptics *haptics)
>> +{
>> +=09int ret;
>> +=09u8 val =3D 0, mask =3D 0;
>
> No need to zero-initialize these.
>
>> +
>> +=09// The number of times to repeat each wave
>
> /* Comments */
>
>> +=09mask =3D WF_REPEAT_MASK;
>> +=09val =3D ilog2(1) << WF_REPEAT_SHIFT; // Currently hard coded to defa=
ult of 1
>
> So how about val =3D 0; ?
>
> If you want to leave some of this code around as a todo, perhaps write
> it as:
>
> =09mask =3D WF_REPEAT_MASK | WF_S_REPEAT_MASK;
> =09val =3D FIELD_PREP(WF_REPEAT_MASK, 0) |
> =09      FIELD_PREP(WF_S_REPEAT_MASK, 0);
>
> =09return qpnp_haptics_write_masked();
>
>> +
>> +=09// the number of times to repeat each wave sample (group of waves)
>> +=09mask |=3D WF_S_REPEAT_MASK;
>> +=09val |=3D ilog2(1);
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_WF_REPEAT_REG(haptics=
),
>> +=09=09=09mask, val);
>> +=09return ret;
>> +}
>> +
>> +static int qpnp_haptics_write_play_control(struct qpnp_haptics *haptics=
,
>> +=09=09=09=09=09=09enum hap_play_control ctrl)
>> +{
>> +=09u8 val;
>> +=09int rc;
>> +
>> +=09switch (ctrl) {
>> +=09case HAP_STOP:
>> +=09=09val =3D 0;
>> +=09=09break;
>> +=09case HAP_PAUSE:
>> +=09=09val =3D HAP_PAUSE_BIT;
>> +=09=09break;
>> +=09case HAP_PLAY:
>> +=09=09val =3D HAP_PLAY_BIT;
>> +=09=09break;
>> +=09default:
>> +=09=09return 0;
>> +=09}
>> +
>> +=09rc =3D qpnp_haptics_write(haptics, HAP_PLAY_REG(haptics), &val, 1);
>> +=09if (rc < 0) {
>> +=09=09pr_err("Error writing to PLAY_REG, rc=3D%d\n", rc);
>
> You already printed in all possible code paths through
> qpnp_haptics_write()
>
>
> Move the dev_dbg below up above the write and you can simply:
>
> =09return qpnp_haptics_write();
>
>> +=09=09return rc;
>> +=09}
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "haptics play ctrl: %d\n", ctrl);
>> +=09return rc;
>> +}
>> +
>> +/*
>> + * This IRQ is fired to tell us to load the next wave sample set.
>> + * As we only currently support a single sample set, it's unused.
>> + */
>> +static irqreturn_t qpnp_haptics_play_irq_handler(int irq, void *data)
>> +{
>> +=09struct qpnp_haptics *haptics =3D data;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "play_irq triggered");
>> +
>> +=09return IRQ_HANDLED;
>> +}
>> +
>> +/*
>> + * Fires every ~50ms whilst the haptics are active.
>> + * If the SC_FLAG_BIT is set then that means there isn't a short circui=
t
>> + * and we just need to clear the IRQ to indicate that the device should
>> + * keep vibrating.
>> + *
>> + * Otherwise, it means a short circuit situation has occurred.
>> + */
>> +static irqreturn_t qpnp_haptics_sc_irq_handler(int irq, void *data)
>> +{
>> +=09struct qpnp_haptics *haptics =3D data;
>> +=09int ret;
>> +=09u8 val;
>> +=09s64 sc_delta_time_us;
>> +=09ktime_t temp;
>> +
>> +=09ret =3D qpnp_haptics_read(haptics, HAP_STATUS_1_REG(haptics), &val, =
1);
>> +=09if (ret < 0)
>> +=09=09return IRQ_HANDLED;
>> +
>> +=09if (!(val & SC_FLAG_BIT)) {
>> +=09=09haptics->sc_count =3D 0;
>> +=09=09return IRQ_HANDLED;
>> +=09}
>> +
>> +=09temp =3D ktime_get();
>> +=09sc_delta_time_us =3D ktime_us_delta(temp, haptics->last_sc_time);
>> +=09haptics->last_sc_time =3D temp;
>> +
>> +=09if (sc_delta_time_us > SC_COUNT_RST_DELAY_US)
>> +=09=09haptics->sc_count =3D 0;
>> +=09else
>> +=09=09haptics->sc_count++;
>> +
>> +=09// Clear the interrupt flag
>> +=09val =3D SC_CLR_BIT;
>> +=09ret =3D qpnp_haptics_write(haptics, HAP_SC_CLR_REG(haptics), &val, 1=
);
>> +=09if (ret < 0) {
>> +=09=09pr_err("Error writing to SC_CLR_REG, rc=3D%d\n", ret);
>
> You already printed in qpnp_haptics_write()
>
>> +=09=09return IRQ_HANDLED;
>> +=09}
>> +
>> +=09if (haptics->sc_count > SC_MAX_COUNT) {
>> +=09=09pr_crit("Short circuit persists, disabling haptics\n");
>
> dev_crit()?
>
>> +=09=09ret =3D qpnp_haptics_module_enable(haptics, false);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error disabling module, rc=3D%d\n", ret);
>
> dev_err(), and qpnp_haptics_module_enable() already printed an error.
>
> That said, these error messages are more useful, so perhaps it's worth
> deciding to move it out to the callers?
>
>> +=09=09=09return IRQ_HANDLED;
>
> You can just fall down do the return below...
>
>> +=09=09}
>> +=09}
>> +
>> +=09return IRQ_HANDLED;
>> +}
>> +
>> +
>> +/**
>> + * qpnp_haptics_init() - Initialise haptics hardware for use
>> + * @haptics: haptics device
>
> Missing "Returns:"
>
>> + */
>> +static int qpnp_haptics_init(struct qpnp_haptics *haptics)
>> +{
>> +=09int ret;
>> +=09u8 val, mask;
>> +=09u16 auto_res_mode;
>> +=09u16 play_rate =3D 0;
>
> First use is an assignment, no need to zero-initialize.
>
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_CFG1_REG(haptics),
>> +=09=09HAP_ACT_TYPE_MASK, haptics->actuator_type);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09// Configure auto resonance
>
> /*
>  * Multi-line comment.
>  */
>
>> +=09// see qpnp_haptics_lra_auto_res_config downstream
>> +=09// This is greatly simplified.
>> +=09auto_res_mode =3D HAP_AUTO_RES_ZXD_EOP << LRA_AUTO_RES_MODE_SHIFT;
>> +
>> +=09//Default LRA calibration period
>> +=09val =3D ilog2(32 / HAP_RES_CAL_PERIOD_MIN);
>> +
>> +=09val |=3D (auto_res_mode << LRA_AUTO_RES_MODE_SHIFT);
>
> You shift HAP_AUTO_RES_ZXD_EOP twice here.
>
>> +=09// The 1 here is for OPT2 "High Z configuration", there are 3
>> +=09// options and no documentation indicating the difference
>> +=09val |=3D (1 << LRA_HIGH_Z_SHIFT);
>
> Consider writing this as:
>
> =09val =3D FIELD_PREP(LRA_RES_CAL_MASK, ilog2(32 / HAP_RES_CAL_PERIOD_MIN=
) |
> =09      FIELD_PREP(LRA_AUTO_RES_MODE_MASK, HAP_AUTO_RES_ZXD_EOP) |
> =09      FIELD_PREP(LRA_HIGH_Z_MASK, 1);
>
>> +=09mask =3D LRA_AUTO_RES_MODE_MASK | LRA_HIGH_Z_MASK | LRA_RES_CAL_MASK=
;
>> +
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_LRA_AUTO_RES_REG(hapt=
ics),
>> +=09=09=09mask, val);
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "%s: auto_res_mode: %d\n", __func__,
>> +=09=09auto_res_mode);
>> +
>> +=09/* Configure the PLAY MODE register */
>> +=09ret =3D qpnp_haptics_write_play_mode(haptics);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09ret =3D qpnp_haptics_write_vmax(haptics);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09/* Configure the ILIM register */
>> +=09ret =3D qpnp_haptics_write_current_limit(haptics);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09// Configure the debounce for short-circuit detection.
>> +=09val =3D HAP_SC_DEB_CYCLES_MAX;
>
> This val is unused.
>
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_SC_DEB_REG(haptics),
>> +=09=09=09HAP_SC_DEB_MASK, HAP_SC_DEB_CYCLES_MAX);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09// write the wave shape
>> +=09ret =3D qpnp_haptics_write_masked(haptics, HAP_CFG2_REG(haptics),
>> +=09=09=09HAP_LRA_RES_TYPE_MASK, haptics->wave_shape);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09play_rate =3D haptics->play_wave_rate / HAP_RATE_CFG_STEP_US;
>> +
>> +=09/*
>> +=09 * Configure RATE_CFG1 and RATE_CFG2 registers.
>> +=09 * Note: For ERM these registers act as play rate and
>> +=09 * for LRA these represent resonance period
>> +=09 */
>> +=09ret =3D qpnp_haptics_write_play_rate(haptics, play_rate);
>
> You don't check this ret.
>
>> +
>> +=09ret =3D qpnp_haptics_write_brake(haptics);
>> +=09if (ret < 0)
>> +=09=09return ret;
>> +
>> +=09if (haptics->play_mode =3D=3D HAP_PLAY_BUFFER) {
>> +=09=09ret =3D qpnp_haptics_write_wave_repeat(haptics);
>> +=09=09if (ret < 0)
>> +=09=09=09return ret;
>> +
>> +=09=09ret =3D qpnp_haptics_write_buffer_config(haptics);
>> +=09}
>> +
>> +=09if (haptics->play_irq >=3D 0) {
>
> Afaict, you won't leave probe successfully with this < 0.
>
>> +=09=09dev_dbg(&haptics->pdev->dev, "%s: Requesting play IRQ, irq: %d", =
__func__,
>> +=09=09=09haptics->play_irq);
>> +=09=09ret =3D devm_request_threaded_irq(&haptics->pdev->dev, haptics->p=
lay_irq,
>> +=09=09=09NULL, qpnp_haptics_play_irq_handler, IRQF_ONESHOT,
>> +=09=09=09"haptics_play_irq", haptics);
>> +
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Unable to request play IRQ ret=3D%d\n", ret);
>> +=09=09=09return ret;
>> +=09=09}
>> +
>> +=09=09/* use play_irq only for buffer mode */
>> +=09=09if (haptics->play_mode !=3D HAP_PLAY_BUFFER)
>> +=09=09=09disable_irq(haptics->play_irq);
>> +=09}
>> +
>> +=09if (haptics->sc_irq >=3D 0) {
>
> Same here.
>
>> +=09=09dev_dbg(&haptics->pdev->dev, "%s: Requesting play IRQ, irq: %d", =
__func__,
>> +=09=09=09haptics->play_irq);
>> +=09=09ret =3D devm_request_threaded_irq(&haptics->pdev->dev, haptics->s=
c_irq,
>> +=09=09=09NULL, qpnp_haptics_sc_irq_handler, IRQF_ONESHOT,
>> +=09=09=09"haptics_sc_irq", haptics);
>> +
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Unable to request sc IRQ ret=3D%d\n", ret);
>> +=09=09=09return ret;
>> +=09=09}
>> +=09}
>> +
>> +=09return ret;
>
> ret is 0 when you get here.
>
>> +}
>> +
>> +/**
>> + * qpnp_haptics_set - handler to start/stop vibration
>> + * @haptics: pointer to haptics struct
>> + * @enable: state to set
>
>   * Returns:
>
>> + */
>> +static int qpnp_haptics_set(struct qpnp_haptics *haptics, bool enable)
>
> Consider splitting this into haptics_enable() and haptics_disable(), as
> this really just is two separate functions squashed into one.
>
>> +{
>> +=09int ret;
>> +
>> +=09mutex_lock(&haptics->play_lock);
>> +
>> +=09if (enable) {
>> +=09=09if (haptics->sc_count > SC_MAX_COUNT) {
>> +=09=09=09pr_err("Can't play while in short circuit");
>> +=09=09=09ret =3D -1;
>> +=09=09=09goto out;
>> +=09=09}
>> +=09=09ret =3D qpnp_haptics_set_auto_res(haptics, false);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error disabling auto_res, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +
>> +=09=09ret =3D qpnp_haptics_module_enable(haptics, true);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error enabling module, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +
>> +=09=09ret =3D qpnp_haptics_write_play_control(haptics, HAP_PLAY);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error enabling play, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +
>> +=09=09ret =3D qpnp_haptics_set_auto_res(haptics, true);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error enabling auto_res, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +=09} else {
>> +=09=09ret =3D qpnp_haptics_write_play_control(haptics, HAP_STOP);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error disabling play, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +
>> +=09=09ret =3D qpnp_haptics_module_enable(haptics, false);
>> +=09=09if (ret < 0) {
>> +=09=09=09pr_err("Error disabling module, ret=3D%d\n", ret);
>> +=09=09=09goto out;
>> +=09=09}
>> +=09}
>> +
>> +out:
>> +=09mutex_unlock(&haptics->play_lock);
>> +=09return ret;
>> +}
>> +
>> +/*
>> + * Threaded function to update the haptics state.
>> + */
>> +static void qpnp_haptics_work(struct work_struct *work)
>> +{
>> +=09struct qpnp_haptics *haptics =3D container_of(work, struct qpnp_hapt=
ics, work);
>> +
>> +=09int ret;
>> +=09bool enable;
>> +
>> +=09enable =3D atomic_read(&haptics->active);
>> +=09dev_dbg(&haptics->pdev->dev, "%s: state: %d\n", __func__, enable);
>> +
>> +=09ret =3D qpnp_haptics_set(haptics, enable);
>> +=09if (ret < 0)
>> +=09=09pr_err("Error setting haptics, ret=3D%d", ret);
>> +}
>> +
>> +/**
>> + * qpnp_haptics_close - callback for input device close
>> + * @dev: input device pointer
>> + *
>> + * Turns off the vibrator.
>> + */
>> +static void qpnp_haptics_close(struct input_dev *dev)
>> +{
>> +=09struct qpnp_haptics *haptics =3D input_get_drvdata(dev);
>> +
>> +=09cancel_work_sync(&haptics->work);
>> +=09if (atomic_read(&haptics->active)) {
>> +=09=09atomic_set(&haptics->active, 0);
>> +=09=09schedule_work(&haptics->work);
>> +=09}
>> +}
>> +
>> +/**
>> + * qpnp_haptics_play_effect - play haptics effects
>> + * @dev: input device pointer
>> + * @data: data of effect
>> + * @effect: effect to play
>> + */
>> +static int qpnp_haptics_play_effect(struct input_dev *dev, void *data,
>> +=09=09=09=09=09struct ff_effect *effect)
>> +{
>> +=09struct qpnp_haptics *haptics =3D input_get_drvdata(dev);
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "%s: Rumbling with strong: %d and weak:=
 %d", __func__,
>> +=09=09effect->u.rumble.strong_magnitude, effect->u.rumble.weak_magnitud=
e);
>> +
>> +=09haptics->magnitude =3D effect->u.rumble.strong_magnitude >> 8;
>> +=09if (!haptics->magnitude)
>> +=09=09haptics->magnitude =3D effect->u.rumble.weak_magnitude >> 10;
>> +
>> +=09if (!haptics->magnitude) {
>> +=09=09atomic_set(&haptics->active, 0);
>> +=09=09goto end;
>> +=09}
>> +
>> +=09atomic_set(&haptics->active, 1);
>> +
>> +=09haptics->vmax =3D ((HAP_VMAX_MAX_MV - HAP_VMAX_MIN_MV) * haptics->ma=
gnitude) / 100 +
>> +=09=09=09=09=09HAP_VMAX_MIN_MV;
>> +
>> +=09dev_dbg(&haptics->pdev->dev, "%s: magnitude: %d, vmax: %d", __func__=
,
>> +=09=09haptics->magnitude, haptics->vmax);
>> +
>> +=09qpnp_haptics_write_vmax(haptics);
>> +
>> +end:
>> +=09schedule_work(&haptics->work);
>> +
>> +=09return 0;
>> +}
>> +
>> +static int qpnp_haptics_probe(struct platform_device *pdev)
>> +{
>> +=09struct qpnp_haptics *haptics;
>> +=09struct device_node *node;
>> +=09struct input_dev *input_dev;
>> +=09int ret;
>> +=09u32 val;
>> +=09int i;
>> +
>> +=09haptics =3D devm_kzalloc(&pdev->dev, sizeof(*haptics), GFP_KERNEL);
>> +=09if (!haptics)
>> +=09=09return -ENOMEM;
>> +
>> +=09haptics->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
>> +=09if (!haptics->regmap)
>> +=09=09return -ENODEV;
>> +
>> +=09node =3D pdev->dev.of_node;
>> +
>> +=09haptics->pdev =3D pdev;
>> +
>> +=09ret =3D of_property_read_u32(node, "reg", &haptics->base);
>> +=09if (ret < 0) {
>> +=09=09pr_err("Couldn't find reg in node =3D %s ret =3D %d\n",
>
> dev_err()
>
>> +=09=09=09node->full_name, ret);
>> +=09=09return ret;
>> +=09}
>> +
>> +=09if (haptics->base <=3D 0) {
>> +=09=09pr_err("Invalid base address: 0x%x\n", haptics->base);
>
> dev_err() but how could it be <=3D 0 if the read returned ok?
>
>> +=09=09return -EINVAL;
>> +=09}
>> +
>> +=09haptics->play_irq =3D platform_get_irq_byname(pdev, "play");
>> +=09if (haptics->play_irq < 0) {
>> +=09=09dev_err(&pdev->dev, "Unable to get play irq\n");
>> +=09=09ret =3D haptics->play_irq;
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09haptics->sc_irq =3D platform_get_irq_byname(pdev, "short");
>> +=09if (haptics->sc_irq < 0) {
>> +=09=09dev_err(&pdev->dev, "Unable to get sc irq\n");
>> +=09=09ret =3D haptics->sc_irq;
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09// We only support LRAs for now
>> +=09haptics->actuator_type =3D HAP_TYPE_LRA;
>> +=09ret =3D of_property_read_u32(node, "qcom,actuator-type", &val);
>> +=09if (!ret) {
>> +=09=09if (val !=3D HAP_TYPE_LRA) {
>> +=09=09=09dev_err(&pdev->dev, "qcom,actuator-type (%d) isn't supported\n=
", val);
>> +=09=09=09ret =3D -EINVAL;
>> +=09=09=09goto register_fail;
>> +=09=09}
>> +=09=09haptics->actuator_type =3D val;
>> +=09}
>> +
>> +=09// Only buffer mode is currently supported
>> +=09haptics->play_mode =3D HAP_PLAY_BUFFER;
>> +=09ret =3D of_property_read_u32(node, "qcom,play-mode", &val);
>> +=09if (!ret) {
>> +=09=09if (val !=3D HAP_PLAY_BUFFER) {
>> +=09=09=09dev_err(&pdev->dev, "qcom,play-mode (%d) isn't supported\n", v=
al);
>> +=09=09=09ret =3D -EINVAL;
>> +=09=09=09goto register_fail;
>> +=09=09}
>> +=09=09haptics->play_mode =3D val;
>> +=09}
>> +
>> +=09ret =3D of_property_read_u32(node,
>> +=09=09=09"qcom,wave-play-rate-us", &val);
>
> Unwrap this line.
>
>> +=09if (!ret) {
>> +=09=09haptics->play_wave_rate =3D val;
>> +=09} else if (ret !=3D -EINVAL) {
>> +=09=09pr_err("Unable to read play rate ret=3D%d\n", ret);
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09haptics->wave_shape =3D HAP_WAVE_SINE;
>> +=09ret =3D of_property_read_u32(node, "qcom,wave-shape", &val);
>> +=09if (!ret) {
>> +=09=09if (val !=3D HAP_WAVE_SINE && val !=3D HAP_WAVE_SQUARE) {
>> +=09=09=09dev_err(&pdev->dev, "qcom,wave-shape is invalid: %d\n", val);
>> +=09=09=09ret =3D -EINVAL;
>> +=09=09=09goto register_fail;
>> +=09=09}
>> +=09=09haptics->wave_shape =3D val;
>> +=09}
>> +
>> +=09ret =3D of_property_read_u8_array(node, "qcom,brake-pattern", haptic=
s->brake_pat, 4);
>> +=09// Default if not set
>> +=09if (ret =3D=3D -EINVAL) {
>> +=09=09haptics->brake_pat[0] =3D 0x3;
>> +=09=09haptics->brake_pat[1] =3D 0x3;
>> +=09=09haptics->brake_pat[2] =3D 0x2;
>> +=09=09haptics->brake_pat[3] =3D 0x1;
>
> You could rely on the fact that these operations doesn't touch the
> buffer if the read is going to fail and do:
>
> =09haptics->brake_pat[0] =3D 0x3;
> =09...
> =09ret =3D of_property_read_u8_array();
> =09if (ret < 0 && ret !=3D -EINVAL)
> =09=09fail;
>
> As that will either have the default values (-EINVAL) or the newly
> populated values (0).
>
>> +=09} else if (ret) {
>> +=09=09dev_err(&pdev->dev, "qcom,brake-pattern is invalid, ret =3D %d\n"=
, ret);
>
> So a qcom,brake-pattern was defined in DT, but it's format is invalid
> for some reason. I think it would be better to help the developer find
> this by failing the probe here. Otherwise they will have to rely on
> someone detecting that line in the kernel log, or some tester noticing
> that the behavior is slightly off.
>
>> +=09}
>> +
>> +=09haptics->current_limit =3D HAP_ILIM_400_MA;
>> +
>> +=09for (i =3D 0; i < HAP_WAVE_SAMP_LEN; i++)
>> +=09=09haptics->wave_samp[i] =3D HAP_WF_SAMP_MAX;
>> +
>> +=09haptics->play_wave_rate =3D
>
> Perhaps move this up to the place where you assigned play_wave_rate?
>
>> +=09=09clamp_t(u32, haptics->play_wave_rate,
>> +=09=09HAP_WAVE_PLAY_RATE_MIN_US, HAP_WAVE_PLAY_RATE_MAX_US);
>> +
>> +=09ret =3D qpnp_haptics_init(haptics);
>> +=09if (ret < 0) {
>> +=09=09dev_err(&pdev->dev, "Error initialising haptics, ret=3D%d\n",
>> +=09=09=09ret);
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09platform_set_drvdata(pdev, haptics);
>> +
>> +=09input_dev =3D devm_input_allocate_device(&pdev->dev);
>> +=09if (!input_dev)
>> +=09=09return -ENOMEM;
>> +
>> +=09INIT_WORK(&haptics->work, qpnp_haptics_work);
>> +=09haptics->haptics_input_dev =3D input_dev;
>> +
>> +=09input_dev->name =3D "qpnp_haptics";
>> +=09input_dev->id.version =3D 3;
>> +=09input_dev->close =3D qpnp_haptics_close;
>> +=09input_set_drvdata(input_dev, haptics);
>> +=09// Figure out how to make this FF_PERIODIC
>> +=09input_set_capability(haptics->haptics_input_dev, EV_FF, FF_RUMBLE);
>> +
>> +=09ret =3D input_ff_create_memless(input_dev, NULL,
>> +=09=09=09=09=09qpnp_haptics_play_effect);
>> +=09if (ret) {
>> +=09=09dev_err(&pdev->dev,
>> +=09=09=09"couldn't register vibrator as FF device\n");
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09ret =3D input_register_device(input_dev);
>> +=09if (ret) {
>> +=09=09dev_err(&pdev->dev, "couldn't register input device\n");
>> +=09=09goto register_fail;
>> +=09}
>> +
>> +=09return 0;
>> +
>> +register_fail:
>> +=09cancel_work_sync(&haptics->work);
>> +=09mutex_destroy(&haptics->play_lock);
>> +
>> +=09return ret;
>> +}
>> +
>> +static int __maybe_unused qpnp_haptics_suspend(struct device *dev)
>> +{
>> +=09struct qpnp_haptics *haptics =3D dev_get_drvdata(dev);
>> +
>> +=09cancel_work_sync(&haptics->work);
>> +=09qpnp_haptics_set(haptics, false);
>> +
>> +=09return 0;
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(qpnp_haptics_pm_ops, qpnp_haptics_suspend, NUL=
L);
>> +
>> +static int qpnp_haptics_remove(struct platform_device *pdev)
>> +{
>> +=09struct qpnp_haptics *haptics =3D dev_get_drvdata(&pdev->dev);
>> +
>
> Don't you need a input_unregister_device() here?
>
>> +=09cancel_work_sync(&haptics->work);
>> +=09mutex_destroy(&haptics->play_lock);
>> +=09dev_set_drvdata(&pdev->dev, NULL);
>
> I don't see a reason for you to clear the drvdata here.
>
>> +
>> +=09return 0;
>> +}
>> +
>> +static void qpnp_haptics_shutdown(struct platform_device *pdev)
>> +{
>> +=09struct qpnp_haptics *haptics =3D dev_get_drvdata(&pdev->dev);
>> +
>> +=09cancel_work_sync(&haptics->work);
>> +
>> +=09qpnp_haptics_set(haptics, false);
>> +}
>> +
>> +static const struct of_device_id qpnp_haptics_match_table[] =3D {
>> +=09{ .compatible =3D "qcom,qpnp-haptics" },
>
> "qcom,spmi-haptics"
>
>> +=09{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qpnp_haptics_match_table);
>> +
>> +static struct platform_driver qpnp_haptics_driver =3D {
>> +=09.probe=09=09=3D qpnp_haptics_probe,
>> +=09.remove=09=09=3D qpnp_haptics_remove,
>> +=09.shutdown=09=3D qpnp_haptics_shutdown,
>> +=09.driver=09=09=3D {
>> +=09=09.name=09=3D "qpnp-haptics",
>> +=09=09.pm=09=3D &qpnp_haptics_pm_ops,
>> +=09=09.of_match_table =3D qpnp_haptics_match_table,
>> +=09},
>> +};
>> +module_platform_driver(qpnp_haptics_driver);
>> +
>> +MODULE_ALIAS("platform:qpnp_haptics");
>
> Nothing is going to trigger autoloading of a platform driver with the
> alias "qpnp_haptics". Please skip this.
>
> Regards,
> Bjorn
>
>> +MODULE_DESCRIPTION("QPNP haptics driver using ff-memless framework");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
>> --
>> 2.31.1
>>
>>

--
Kind Regards,
Caleb

