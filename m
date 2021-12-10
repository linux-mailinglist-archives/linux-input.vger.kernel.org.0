Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E035346F924
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 03:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbhLJCaq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 21:30:46 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158]:59289 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235984AbhLJCap (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 21:30:45 -0500
Date:   Fri, 10 Dec 2021 02:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1639103225;
        bh=miUQ7SIddNTA0+GWmuxIEq4ecrwNVflFYB52/V1OkrI=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=SNcK+w/a+wT4aII1rhA3iQ238o22jcsVmwvVqmZIsxGamiUFhMtXNHfd9Rk0FBRse
         Prqx6M3cuedvxwPY+YyaoyFK0pd59GYG55uLL/Zqb6x/AIDLZG1DEyRjf2R4sFdmNp
         L3b1MP5XuvuNBrgZYaL2Pfoccim6uki2Gsqfvdy8=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v4 2/6] input: add Qualcomm SPMI haptics driver
Message-ID: <20211210022639.2779173-3-caleb@connolly.tech>
In-Reply-To: <20211210022639.2779173-1-caleb@connolly.tech>
References: <20211210022639.2779173-1-caleb@connolly.tech>
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

Add support for the haptics found in pmi8998 and related PMICs.
Based on the ff-memless interface. Currently this driver provides
a partial implementation of hardware features.

This driver only supports LRAs (Linear Resonant Actuators) in the "buffer"
mode with a single wave pattern.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/input/misc/Kconfig             |  12 +
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/qcom-spmi-haptics.c | 977 +++++++++++++++++++++++++
 3 files changed, 990 insertions(+)
 create mode 100644 drivers/input/misc/qcom-spmi-haptics.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index dd5227cf8696..b759d9719695 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -186,6 +186,18 @@ config INPUT_PMIC8XXX_PWRKEY
 =09  To compile this driver as a module, choose M here: the
 =09  module will be called pmic8xxx-pwrkey.

+config INPUT_QCOM_SPMI_HAPTICS
+=09tristate "Qualcomm SPMI HAPTICS"
+=09depends on ARCH_QCOM
+=09depends on SPMI
+=09select INPUT_FF_MEMLESS
+=09help
+=09  This option enables support for the haptics found in pmi8998 and
+=09  related PMICs. Based on the ff-memless interface.
+
+=09  To compile this driver as module, choose M here: the
+=09  module will be called qcom_spmi_haptics.
+
 config INPUT_SPARCSPKR
 =09tristate "SPARC Speaker support"
 =09depends on PCI && SPARC64
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index b92c53a6b5ae..e58110893e56 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)=09+=3D pmic8xxx-pwrke=
y.o
 obj-$(CONFIG_INPUT_POWERMATE)=09=09+=3D powermate.o
 obj-$(CONFIG_INPUT_PWM_BEEPER)=09=09+=3D pwm-beeper.o
 obj-$(CONFIG_INPUT_PWM_VIBRA)=09=09+=3D pwm-vibra.o
+obj-$(CONFIG_INPUT_QCOM_SPMI_HAPTICS)=09+=3D qcom-spmi-haptics.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)=09+=3D rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)=09+=3D rb532_button.o
 obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)=09+=3D regulator-haptic.o
diff --git a/drivers/input/misc/qcom-spmi-haptics.c b/drivers/input/misc/qc=
om-spmi-haptics.c
new file mode 100644
index 000000000000..0e2244e5c38c
--- /dev/null
+++ b/drivers/input/misc/qcom-spmi-haptics.c
@@ -0,0 +1,977 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Caleb Connolly <caleb@connolly.tech>
+ * Qualcomm QPMI haptics driver for pmi8998 and related PMICs.
+ */
+
+#include <dt-bindings/input/qcom,spmi-haptics.h>
+
+#include <linux/atomic.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/log2.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+
+#define HAP_STATUS_1_REG=09=090x0A
+#define HAP_BUSY_BIT=09=09=09BIT(1)
+#define SC_FLAG_BIT=09=09=09BIT(3)
+#define AUTO_RES_ERROR_BIT=09=09BIT(4)
+
+#define HAP_LRA_AUTO_RES_LO_REG=09=090x0B
+#define HAP_LRA_AUTO_RES_HI_REG=09=090x0C
+
+#define HAP_EN_CTL_REG=09=09=090x46
+#define HAP_EN_BIT=09=09=09BIT(7)
+
+#define HAP_EN_CTL2_REG=09=09=090x48
+#define BRAKE_EN_BIT=09=09=09BIT(0)
+
+#define HAP_AUTO_RES_CTRL_REG=09=090x4B
+#define AUTO_RES_EN_BIT=09=09=09BIT(7)
+#define AUTO_RES_ERR_RECOVERY_BIT=09BIT(3)
+#define AUTO_RES_EN_FLAG_BIT=09=09BIT(0)
+
+#define HAP_CFG1_REG=09=09=090x4C
+#define HAP_ACT_TYPE_MASK=09=09BIT(0)
+
+#define HAP_CFG2_REG=09=09=090x4D
+#define HAP_LRA_RES_TYPE_MASK=09=09BIT(0)
+
+#define HAP_SEL_REG=09=09=090x4E
+#define HAP_WF_SOURCE_MASK=09=09GENMASK(5, 4)
+#define HAP_WF_SOURCE_SHIFT=09=094
+
+#define HAP_LRA_AUTO_RES_REG=09=090x4F
+#define LRA_AUTO_RES_MODE_MASK=09=09GENMASK(6, 4)
+#define LRA_AUTO_RES_MODE_SHIFT=09=094
+#define LRA_HIGH_Z_MASK=09=09=09GENMASK(3, 2)
+#define LRA_HIGH_Z_SHIFT=09=092
+#define LRA_RES_CAL_MASK=09=09GENMASK(1, 0)
+#define HAP_RES_CAL_PERIOD_MIN=09=094
+#define HAP_RES_CAL_PERIOD_MAX=09=0932
+
+#define HAP_VMAX_CFG_REG=09=090x51
+#define HAP_VMAX_OVD_BIT=09=09BIT(6)
+#define HAP_VMAX_MASK=09=09=09GENMASK(5, 1)
+#define HAP_VMAX_SHIFT=09=09=091
+
+#define HAP_ILIM_CFG_REG=09=090x52
+#define HAP_ILIM_SEL_MASK=09=09BIT(0)
+#define HAP_ILIM_400_MA=09=09=090
+#define HAP_ILIM_800_MA=09=09=091
+
+#define HAP_SC_DEB_REG=09=09=090x53
+#define HAP_SC_DEB_MASK=09=09=09GENMASK(2, 0)
+#define HAP_SC_DEB_CYCLES_MIN=09=090
+#define HAP_DEF_SC_DEB_CYCLES=09=098
+#define HAP_SC_DEB_CYCLES_MAX=09=0932
+
+#define HAP_RATE_CFG1_REG=09=090x54
+#define HAP_RATE_CFG1_MASK=09=09GENMASK(7, 0)
+#define HAP_RATE_CFG2_SHIFT=09=098
+
+#define HAP_RATE_CFG2_REG=09=090x55
+#define HAP_RATE_CFG2_MASK=09=09GENMASK(3, 0)
+
+#define HAP_SC_CLR_REG=09=09=090x59
+#define SC_CLR_BIT=09=09=09BIT(0)
+
+#define HAP_BRAKE_REG=09=09=090x5C
+#define HAP_BRAKE_PAT_MASK=09=090x3
+
+#define HAP_WF_REPEAT_REG=09=090x5E
+#define WF_REPEAT_MASK=09=09=09GENMASK(6, 4)
+#define WF_REPEAT_SHIFT=09=09=094
+#define WF_REPEAT_MIN=09=09=091
+#define WF_REPEAT_MAX=09=09=09128
+#define WF_S_REPEAT_MASK=09=09GENMASK(1, 0)
+#define WF_S_REPEAT_MIN=09=09=091
+#define WF_S_REPEAT_MAX=09=09=098
+
+#define HAP_WF_S1_REG=09=09=090x60
+#define HAP_WF_SIGN_BIT=09=09=09BIT(7)
+#define HAP_WF_OVD_BIT=09=09=09BIT(6)
+#define HAP_WF_SAMP_MAX=09=09=09GENMASK(5, 1)
+#define HAP_WF_SAMPLE_LEN=09=098
+
+#define HAP_PLAY_REG=09=09=090x70
+#define HAP_PLAY_BIT=09=09=09BIT(7)
+#define HAP_PAUSE_BIT=09=09=09BIT(0)
+
+#define HAP_SEC_ACCESS_REG=09=090xD0
+#define HAP_SEC_ACCESS_UNLOCK=09=090xA5
+
+#define HAP_TEST2_REG=09=09=090xE3
+
+
+#define HAP_VMAX_MIN_MV=09=09=09116
+#define HAP_VMAX_MAX_MV=09=09=093596
+#define HAP_VMAX_MAX_MV_STRONG=09=093596
+
+#define HAP_WAVE_PLAY_RATE_MIN_US=090
+#define HAP_WAVE_PLAY_RATE_MAX_US=0920475
+#define HAP_WAVE_PLAY_TIME_MAX_MS=0915000
+
+#define AUTO_RES_ERR_POLL_TIME_NS=09(20 * NSEC_PER_MSEC)
+#define HAPTICS_BACK_EMF_DELAY_US=0920000
+
+#define HAP_BRAKE_PAT_LEN=09=094
+#define HAP_WAVE_SAMP_LEN=09=098
+#define NUM_WF_SET=09=09=094
+#define HAP_WAVE_SAMP_SET_LEN=09=09(HAP_WAVE_SAMP_LEN * NUM_WF_SET)
+#define HAP_RATE_CFG_STEP_US=09=095
+
+#define SC_MAX_COUNT=09=09=095
+#define SC_COUNT_RST_DELAY_US=09=091000000
+
+enum hap_play_control {
+=09HAP_STOP,
+=09HAP_PAUSE,
+=09HAP_PLAY,
+};
+
+/**
+ * struct spmi_haptics - struct for spmi haptics data.
+ *
+ * @dev: Our device parent.
+ * @regmap: Register map for the hardware block.
+ * @haptics_input_dev: The input device used to receive events.
+ * @work: Work struct to play effects.
+ * @base: Base address of the regmap.
+ * @active: Atomic value used to track if haptics are currently playing.
+ * @play_irq: Fired to load the next wave pattern.
+ * @sc_irq: Short circuit irq.
+ * @last_sc_time: Time since the short circuit IRQ last fired.
+ * @sc_count: Number of times the short circuit IRQ has fired in this inte=
rval.
+ * @actuator_type: The type of actuator in use.
+ * @wave_shape: The shape of the waves to use (sine or square).
+ * @play_mode: The play mode to use (direct, buffer, pwm, audio).
+ * @magnitude: The strength we should be playing at.
+ * @vmax: Max voltage to use when playing.
+ * @current_limit: The current limit for this hardware (400mA or 800mA).
+ * @play_wave_rate: The wave rate to use for this hardware.
+ * @wave_samp: The array of wave samples to write for buffer mode.
+ * @brake_pat: The pattern to apply when braking.
+ * @play_lock: Lock to be held when updating the hardware state.
+ */
+struct spmi_haptics {
+=09struct device *dev;
+=09struct regmap *regmap;
+=09struct input_dev *haptics_input_dev;
+=09struct work_struct work;
+=09u32 base;
+
+=09atomic_t active;
+
+=09int play_irq;
+=09int sc_irq;
+=09ktime_t last_sc_time;
+=09u8 sc_count;
+
+=09u8 actuator_type;
+=09u8 wave_shape;
+=09u8 play_mode;
+=09int magnitude;
+=09u32 vmax;
+=09u32 current_limit;
+=09u32 play_wave_rate;
+
+=09u32 wave_samp[HAP_WAVE_SAMP_SET_LEN];
+=09u8 brake_pat[HAP_BRAKE_PAT_LEN];
+
+=09struct mutex play_lock;
+};
+
+static inline bool is_secure_addr(u16 addr)
+{
+=09return (addr & 0xFF) > 0xD0;
+}
+
+static int spmi_haptics_read(struct spmi_haptics *haptics,
+=09u16 addr, u8 *val, int len)
+{
+=09int ret;
+
+=09ret =3D regmap_bulk_read(haptics->regmap, addr, val, len);
+=09if (ret < 0)
+=09=09dev_err(haptics->dev, "Error reading address: 0x%x, ret %d\n", addr,=
 ret);
+
+=09return ret;
+}
+
+static int spmi_haptics_write(struct spmi_haptics *haptics,
+=09=09=09      u16 addr, u8 *val, int len)
+{
+=09int ret, i;
+
+=09if (is_secure_addr(addr)) {
+=09=09for (i =3D 0; i < len; i++) {
+=09=09=09dev_dbg(haptics->dev, "%s: unlocking for addr: 0x%x, val: 0x%x", =
__func__,
+=09=09=09=09addr, val[i]);
+=09=09=09ret =3D regmap_write(haptics->regmap,
+=09=09=09=09haptics->base + HAP_SEC_ACCESS_REG, HAP_SEC_ACCESS_UNLOCK);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(haptics->dev, "Error writing unlock code, ret %d\n",
+=09=09=09=09=09ret);
+=09=09=09=09return ret;
+=09=09=09}
+
+=09=09=09ret =3D regmap_write(haptics->regmap, addr + i, val[i]);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(haptics->dev, "Error writing address 0x%x, ret %d\n",
+=09=09=09=09=09addr + i, ret);
+=09=09=09=09return ret;
+=09=09=09}
+=09=09}
+=09} else {
+=09=09if (len > 1)
+=09=09=09ret =3D regmap_bulk_write(haptics->regmap, addr, val, len);
+=09=09else
+=09=09=09ret =3D regmap_write(haptics->regmap, addr, *val);
+=09}
+
+=09if (ret < 0)
+=09=09dev_err(haptics->dev, "%s: Error writing address: 0x%x, ret %d\n",
+=09=09=09__func__, addr, ret);
+
+=09return ret;
+}
+
+static int spmi_haptics_write_masked(struct spmi_haptics *haptics,
+=09u16 addr, u8 mask, u8 val)
+{
+=09int ret;
+
+=09if (is_secure_addr(addr)) {
+=09=09ret =3D regmap_write(haptics->regmap,
+=09=09=09haptics->base + HAP_SEC_ACCESS_REG, HAP_SEC_ACCESS_UNLOCK);
+=09=09if (ret < 0) {
+=09=09=09dev_err(haptics->dev, "Error writing unlock code - ret %d\n", ret=
);
+=09=09=09return ret;
+=09=09}
+=09}
+
+=09ret =3D regmap_update_bits(haptics->regmap, addr, mask, val);
+=09if (ret < 0)
+=09=09dev_err(haptics->dev, "Error writing address: 0x%x - ret %d\n", addr=
, ret);
+
+=09return ret;
+}
+
+static bool is_haptics_idle(struct spmi_haptics *haptics)
+{
+=09int ret;
+=09u8 val;
+
+=09if (haptics->play_mode =3D=3D HAP_PLAY_DIRECT ||
+=09=09=09haptics->play_mode =3D=3D HAP_PLAY_PWM)
+=09=09return true;
+
+=09ret =3D spmi_haptics_read(haptics, haptics->base + HAP_STATUS_1_REG, &v=
al, 1);
+=09if (ret < 0 || (val & HAP_BUSY_BIT))
+=09=09return false;
+
+=09return true;
+}
+
+static int spmi_haptics_module_enable(struct spmi_haptics *haptics, bool e=
nable)
+{
+=09u8 val;
+
+=09dev_dbg(haptics->dev, "Setting module enable: %d", enable);
+
+=09val =3D enable ? HAP_EN_BIT : 0;
+=09return spmi_haptics_write(haptics, haptics->base + HAP_EN_CTL_REG, &val=
, 1);
+}
+
+static int spmi_haptics_write_vmax(struct spmi_haptics *haptics)
+{
+=09u8 val =3D 0;
+=09u32 vmax_mv =3D haptics->vmax;
+
+=09vmax_mv =3D clamp_t(u32, vmax_mv, HAP_VMAX_MIN_MV, HAP_VMAX_MAX_MV);
+
+=09dev_dbg(haptics->dev, "Setting vmax to: %d", vmax_mv);
+
+=09val =3D DIV_ROUND_CLOSEST(vmax_mv, HAP_VMAX_MIN_MV);
+=09val =3D FIELD_PREP(HAP_VMAX_MASK, val);
+
+=09// TODO: pm660 can enable overdrive here
+
+=09return spmi_haptics_write_masked(haptics, haptics->base + HAP_VMAX_CFG_=
REG,
+=09=09=09=09=09 HAP_VMAX_MASK | HAP_WF_OVD_BIT, val);
+}
+
+static int spmi_haptics_write_current_limit(struct spmi_haptics *haptics)
+{
+=09haptics->current_limit =3D clamp_t(u32, haptics->current_limit,
+=09=09=09=09=09 HAP_ILIM_400_MA, HAP_ILIM_800_MA);
+
+=09dev_dbg(haptics->dev, "Setting current_limit to: 0x%x", haptics->curren=
t_limit);
+
+=09return spmi_haptics_write_masked(haptics, haptics->base + HAP_ILIM_CFG_=
REG,
+=09=09=09HAP_ILIM_SEL_MASK, haptics->current_limit);
+}
+
+static int spmi_haptics_write_play_mode(struct spmi_haptics *haptics)
+{
+=09u8 val =3D 0;
+
+=09if (!is_haptics_idle(haptics))
+=09=09return -EBUSY;
+
+=09dev_dbg(haptics->dev, "Setting play_mode to: 0x%x", haptics->play_mode)=
;
+
+=09val =3D FIELD_PREP(HAP_WF_SOURCE_MASK, haptics->play_mode);
+=09return spmi_haptics_write_masked(haptics, haptics->base + HAP_SEL_REG,
+=09=09=09=09=09 HAP_WF_SOURCE_MASK, val);
+
+}
+
+static int spmi_haptics_write_play_rate(struct spmi_haptics *haptics, u16 =
play_rate)
+{
+=09u8 val[2];
+
+=09dev_dbg(haptics->dev, "Setting play_rate to: %d", play_rate);
+
+=09val[0] =3D FIELD_PREP(HAP_RATE_CFG1_MASK, play_rate);
+=09val[1] =3D FIELD_PREP(HAP_RATE_CFG2_MASK, play_rate >> HAP_RATE_CFG2_SH=
IFT);
+=09return spmi_haptics_write(haptics, haptics->base + HAP_RATE_CFG1_REG, v=
al, 2);
+}
+
+/*
+ * spmi_haptics_set_auto_res() - Auto resonance
+ * allows the haptics to automatically adjust the
+ * speed of the oscillation in order to maintain
+ * the resonant frequency.
+ */
+static int spmi_haptics_set_auto_res(struct spmi_haptics *haptics, bool en=
able)
+{
+=09u8 val;
+
+=09// LRAs are the only type to support auto res
+=09if (haptics->actuator_type !=3D HAP_TYPE_LRA)
+=09=09return 0;
+
+=09val =3D enable ? AUTO_RES_EN_BIT : 0;
+
+=09return spmi_haptics_write_masked(haptics, haptics->base + HAP_TEST2_REG=
,
+=09=09=09=09       AUTO_RES_EN_BIT, val);
+}
+
+static int spmi_haptics_write_brake(struct spmi_haptics *haptics)
+{
+=09int ret, i;
+=09u8 val;
+
+=09dev_dbg(haptics->dev, "Configuring brake pattern");
+
+=09ret =3D spmi_haptics_write_masked(haptics, haptics->base + HAP_EN_CTL2_=
REG,
+=09=09=09=09=09BRAKE_EN_BIT, 1);
+=09if (ret < 0)
+=09=09return ret;
+
+=09for (i =3D HAP_BRAKE_PAT_LEN - 1, val =3D 0; i >=3D 0; i--) {
+=09=09u8 p =3D haptics->brake_pat[i] & HAP_BRAKE_PAT_MASK;
+
+=09=09val |=3D p << (i * 2);
+=09}
+
+=09return spmi_haptics_write(haptics, haptics->base + HAP_BRAKE_REG, &val,=
 1);
+}
+
+static int spmi_haptics_write_buffer_config(struct spmi_haptics *haptics)
+{
+=09u8 buf[HAP_WAVE_SAMP_LEN];
+=09int i;
+
+=09dev_dbg(haptics->dev, "Writing buffer config");
+
+=09for (i =3D 0; i < HAP_WAVE_SAMP_LEN; i++)
+=09=09buf[i] =3D haptics->wave_samp[i];
+
+=09return spmi_haptics_write(haptics, haptics->base + HAP_WF_S1_REG, buf,
+=09=09=09=09  HAP_WAVE_SAMP_LEN);
+}
+
+static int spmi_haptics_write_wave_repeat(struct spmi_haptics *haptics)
+{
+=09u8 val, mask;
+
+=09/* The number of times to repeat each wave */
+=09mask =3D WF_REPEAT_MASK | WF_S_REPEAT_MASK;
+=09val =3D FIELD_PREP(WF_REPEAT_MASK, 0) |
+=09      FIELD_PREP(WF_S_REPEAT_MASK, 0);
+
+=09return spmi_haptics_write_masked(haptics, haptics->base + HAP_WF_REPEAT=
_REG,
+=09=09=09=09=09 mask, val);
+}
+
+static int spmi_haptics_write_play_control(struct spmi_haptics *haptics,
+=09=09=09=09=09=09enum hap_play_control ctrl)
+{
+=09u8 val;
+
+=09switch (ctrl) {
+=09case HAP_STOP:
+=09=09val =3D 0;
+=09=09break;
+=09case HAP_PAUSE:
+=09=09val =3D HAP_PAUSE_BIT;
+=09=09break;
+=09case HAP_PLAY:
+=09=09val =3D HAP_PLAY_BIT;
+=09=09break;
+=09default:
+=09=09return 0;
+=09}
+
+=09dev_dbg(haptics->dev, "haptics play ctrl: %d\n", ctrl);
+=09return spmi_haptics_write(haptics, haptics->base + HAP_PLAY_REG, &val, =
1);
+}
+
+/*
+ * This IRQ is fired to tell us to load the next wave sample set.
+ * As we only currently support a single sample set, it's unused.
+ */
+static irqreturn_t spmi_haptics_play_irq_handler(int irq, void *data)
+{
+=09struct spmi_haptics *haptics =3D data;
+
+=09dev_dbg(haptics->dev, "play_irq triggered");
+
+=09return IRQ_HANDLED;
+}
+
+/**
+ * spmi_haptics_sc_irq_handler() - short circuit irq handler
+ * Fires every ~50ms whilst the haptics are active.
+ * If the SC_FLAG_BIT is set then that means there isn't a short circuit
+ * and we just need to clear the IRQ to indicate that the device should
+ * keep vibrating.
+ *
+ * Otherwise, it means a short circuit situation has occurred.
+ *
+ * @irq: irq number
+ * @data: haptics data
+ * Returns: IRQ_HANDLED
+ */
+static irqreturn_t spmi_haptics_sc_irq_handler(int irq, void *data)
+{
+=09struct spmi_haptics *haptics =3D data;
+=09int ret;
+=09u8 val;
+=09s64 sc_delta_time_us;
+=09ktime_t temp;
+
+=09ret =3D spmi_haptics_read(haptics, haptics->base + HAP_STATUS_1_REG, &v=
al, 1);
+=09if (ret < 0)
+=09=09return IRQ_HANDLED;
+
+=09if (!(val & SC_FLAG_BIT)) {
+=09=09haptics->sc_count =3D 0;
+=09=09return IRQ_HANDLED;
+=09}
+
+=09temp =3D ktime_get();
+=09sc_delta_time_us =3D ktime_us_delta(temp, haptics->last_sc_time);
+=09haptics->last_sc_time =3D temp;
+
+=09if (sc_delta_time_us > SC_COUNT_RST_DELAY_US)
+=09=09haptics->sc_count =3D 0;
+=09else
+=09=09haptics->sc_count++;
+
+=09// Clear the interrupt flag
+=09val =3D SC_CLR_BIT;
+=09ret =3D spmi_haptics_write(haptics, haptics->base + HAP_SC_CLR_REG, &va=
l, 1);
+=09if (ret < 0)
+=09=09return IRQ_HANDLED;
+
+=09if (haptics->sc_count > SC_MAX_COUNT) {
+=09=09dev_err(haptics->dev, "Short circuit persists, disabling haptics\n")=
;
+=09=09ret =3D spmi_haptics_module_enable(haptics, false);
+=09=09if (ret < 0)
+=09=09=09dev_err(haptics->dev, "Error disabling module, rc=3D%d\n", ret);
+=09}
+
+=09return IRQ_HANDLED;
+}
+
+
+/**
+ * spmi_haptics_init() - Initialise haptics hardware for use
+ * @haptics: haptics device
+ * Returns: 0 on success, < 0 on error
+ */
+static int spmi_haptics_init(struct spmi_haptics *haptics)
+{
+=09int ret;
+=09u8 val, mask;
+=09u16 play_rate;
+
+=09ret =3D spmi_haptics_write_masked(haptics, haptics->base + HAP_CFG1_REG=
,
+=09=09HAP_ACT_TYPE_MASK, haptics->actuator_type);
+=09if (ret < 0)
+=09=09return ret;
+
+=09/*
+=09 * Configure auto resonance
+=09 * see spmi_haptics_lra_auto_res_config downstream
+=09 * This is greatly simplified.
+=09 */
+=09val =3D FIELD_PREP(LRA_RES_CAL_MASK, ilog2(32 / HAP_RES_CAL_PERIOD_MIN)=
) |
+=09      FIELD_PREP(LRA_AUTO_RES_MODE_MASK, HAP_AUTO_RES_ZXD_EOP) |
+=09      FIELD_PREP(LRA_HIGH_Z_MASK, 1);
+
+=09mask =3D LRA_AUTO_RES_MODE_MASK | LRA_HIGH_Z_MASK | LRA_RES_CAL_MASK;
+
+=09ret =3D spmi_haptics_write_masked(haptics, haptics->base + HAP_LRA_AUTO=
_RES_REG,
+=09=09=09mask, val);
+
+=09/* Configure the PLAY MODE register */
+=09ret =3D spmi_haptics_write_play_mode(haptics);
+=09if (ret < 0)
+=09=09return ret;
+
+=09ret =3D spmi_haptics_write_vmax(haptics);
+=09if (ret < 0)
+=09=09return ret;
+
+=09/* Configure the ILIM register */
+=09ret =3D spmi_haptics_write_current_limit(haptics);
+=09if (ret < 0)
+=09=09return ret;
+
+=09// Configure the debounce for short-circuit detection.
+=09ret =3D spmi_haptics_write_masked(haptics, haptics->base + HAP_SC_DEB_R=
EG,
+=09=09=09HAP_SC_DEB_MASK, HAP_SC_DEB_CYCLES_MAX);
+=09if (ret < 0)
+=09=09return ret;
+
+=09// write the wave shape
+=09ret =3D spmi_haptics_write_masked(haptics, haptics->base + HAP_CFG2_REG=
,
+=09=09=09HAP_LRA_RES_TYPE_MASK, haptics->wave_shape);
+=09if (ret < 0)
+=09=09return ret;
+
+=09play_rate =3D haptics->play_wave_rate / HAP_RATE_CFG_STEP_US;
+
+=09/*
+=09 * Configure RATE_CFG1 and RATE_CFG2 registers.
+=09 * Note: For ERM these registers act as play rate and
+=09 * for LRA these represent resonance period
+=09 */
+=09ret =3D spmi_haptics_write_play_rate(haptics, play_rate);
+=09if (ret < 0)
+=09=09return ret;
+
+=09ret =3D spmi_haptics_write_brake(haptics);
+=09if (ret < 0)
+=09=09return ret;
+
+=09if (haptics->play_mode =3D=3D HAP_PLAY_BUFFER) {
+=09=09ret =3D spmi_haptics_write_wave_repeat(haptics);
+=09=09if (ret < 0)
+=09=09=09return ret;
+
+=09=09ret =3D spmi_haptics_write_buffer_config(haptics);
+=09=09if (ret < 0)
+=09=09=09return ret;
+=09}
+
+=09dev_dbg(haptics->dev, "%s: Requesting play IRQ, irq: %d", __func__,
+=09=09haptics->play_irq);
+=09ret =3D devm_request_threaded_irq(haptics->dev, haptics->play_irq,
+=09=09NULL, spmi_haptics_play_irq_handler, IRQF_ONESHOT,
+=09=09"haptics_play_irq", haptics);
+
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Unable to request play IRQ ret=3D%d\n", ret);
+=09=09return ret;
+=09}
+
+=09/* use play_irq only for buffer mode */
+=09if (haptics->play_mode !=3D HAP_PLAY_BUFFER)
+=09=09disable_irq(haptics->play_irq);
+
+=09dev_dbg(haptics->dev, "%s: Requesting play IRQ, irq: %d", __func__,
+=09=09haptics->play_irq);
+=09ret =3D devm_request_threaded_irq(haptics->dev, haptics->sc_irq,
+=09=09NULL, spmi_haptics_sc_irq_handler, IRQF_ONESHOT,
+=09=09"haptics_sc_irq", haptics);
+
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Unable to request sc IRQ ret=3D%d\n", ret);
+=09=09return ret;
+=09}
+
+=09return 0;
+}
+
+/**
+ * spmi_haptics_enable - handler to start/stop vibration
+ * @haptics: pointer to haptics struct
+ * Returns: 0 on success, < 0 on failure
+ */
+static int spmi_haptics_enable(struct spmi_haptics *haptics)
+{
+=09int ret;
+
+=09mutex_lock(&haptics->play_lock);
+=09if (haptics->sc_count > SC_MAX_COUNT) {
+=09=09dev_err(haptics->dev, "Can't play while in short circuit");
+=09=09ret =3D -1;
+=09=09goto out;
+=09}
+=09ret =3D spmi_haptics_set_auto_res(haptics, false);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error disabling auto_res, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+=09ret =3D spmi_haptics_module_enable(haptics, true);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error enabling module, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+=09ret =3D spmi_haptics_write_play_control(haptics, HAP_PLAY);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error enabling play, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+=09ret =3D spmi_haptics_set_auto_res(haptics, true);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error enabling auto_res, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+out:
+=09mutex_unlock(&haptics->play_lock);
+=09return ret;
+}
+
+/**
+ * spmi_haptics_enable - handler to start/stop vibration
+ * @haptics: pointer to haptics struct
+ * Returns: 0 on success, < 0 on failure
+ */
+static int spmi_haptics_disable(struct spmi_haptics *haptics)
+{
+=09int ret;
+
+=09mutex_lock(&haptics->play_lock);
+
+=09ret =3D spmi_haptics_write_play_control(haptics, HAP_STOP);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error disabling play, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+=09ret =3D spmi_haptics_module_enable(haptics, false);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Error disabling module, ret=3D%d\n", ret);
+=09=09goto out;
+=09}
+
+out:
+=09mutex_unlock(&haptics->play_lock);
+=09return ret;
+}
+
+/*
+ * Threaded function to update the haptics state.
+ */
+static void spmi_haptics_work(struct work_struct *work)
+{
+=09struct spmi_haptics *haptics =3D container_of(work, struct spmi_haptics=
, work);
+
+=09int ret;
+=09bool enable;
+
+=09enable =3D atomic_read(&haptics->active);
+=09dev_dbg(haptics->dev, "%s: state: %d\n", __func__, enable);
+
+=09if (enable)
+=09=09ret =3D spmi_haptics_enable(haptics);
+=09else
+=09=09ret =3D spmi_haptics_disable(haptics);
+=09if (ret < 0)
+=09=09dev_err(haptics->dev, "Error setting haptics, ret=3D%d", ret);
+}
+
+/**
+ * spmi_haptics_close - callback for input device close
+ * @dev: input device pointer
+ *
+ * Turns off the vibrator.
+ */
+static void spmi_haptics_close(struct input_dev *dev)
+{
+=09struct spmi_haptics *haptics =3D input_get_drvdata(dev);
+
+=09cancel_work_sync(&haptics->work);
+=09if (atomic_read(&haptics->active)) {
+=09=09atomic_set(&haptics->active, 0);
+=09=09schedule_work(&haptics->work);
+=09}
+}
+
+/**
+ * spmi_haptics_play_effect - play haptics effects
+ * @dev: input device pointer
+ * @data: data of effect
+ * @effect: effect to play
+ */
+static int spmi_haptics_play_effect(struct input_dev *dev, void *data,
+=09=09=09=09=09struct ff_effect *effect)
+{
+=09struct spmi_haptics *haptics =3D input_get_drvdata(dev);
+
+=09dev_dbg(haptics->dev, "%s: Rumbling with strong: %d and weak: %d", __fu=
nc__,
+=09=09effect->u.rumble.strong_magnitude, effect->u.rumble.weak_magnitude);
+
+=09haptics->magnitude =3D effect->u.rumble.strong_magnitude >> 8;
+=09if (!haptics->magnitude)
+=09=09haptics->magnitude =3D effect->u.rumble.weak_magnitude >> 10;
+
+=09if (!haptics->magnitude) {
+=09=09atomic_set(&haptics->active, 0);
+=09=09goto end;
+=09}
+
+=09atomic_set(&haptics->active, 1);
+
+=09haptics->vmax =3D ((HAP_VMAX_MAX_MV - HAP_VMAX_MIN_MV) * haptics->magni=
tude) / 100 +
+=09=09=09=09=09HAP_VMAX_MIN_MV;
+
+=09dev_dbg(haptics->dev, "%s: magnitude: %d, vmax: %d", __func__,
+=09=09haptics->magnitude, haptics->vmax);
+
+=09spmi_haptics_write_vmax(haptics);
+
+end:
+=09schedule_work(&haptics->work);
+
+=09return 0;
+}
+
+static int spmi_haptics_probe(struct platform_device *pdev)
+{
+=09struct spmi_haptics *haptics;
+=09struct device_node *node;
+=09struct input_dev *input_dev;
+=09int ret;
+=09u32 val;
+=09int i;
+
+=09haptics =3D devm_kzalloc(&pdev->dev, sizeof(*haptics), GFP_KERNEL);
+=09if (!haptics)
+=09=09return -ENOMEM;
+
+=09haptics->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+=09if (!haptics->regmap)
+=09=09return -ENODEV;
+
+=09node =3D pdev->dev.of_node;
+
+=09haptics->dev =3D &pdev->dev;
+
+=09ret =3D of_property_read_u32(node, "reg", &haptics->base);
+=09if (ret < 0) {
+=09=09dev_err(haptics->dev, "Couldn't find reg in node =3D %s ret =3D %d\n=
",
+=09=09=09node->full_name, ret);
+=09=09return ret;
+=09}
+
+=09haptics->play_irq =3D platform_get_irq_byname(pdev, "play");
+=09if (haptics->play_irq < 0) {
+=09=09dev_err(&pdev->dev, "Unable to get play irq\n");
+=09=09ret =3D haptics->play_irq;
+=09=09goto register_fail;
+=09}
+
+=09haptics->sc_irq =3D platform_get_irq_byname(pdev, "short");
+=09if (haptics->sc_irq < 0) {
+=09=09dev_err(&pdev->dev, "Unable to get sc irq\n");
+=09=09ret =3D haptics->sc_irq;
+=09=09goto register_fail;
+=09}
+
+=09// We only support LRAs for now
+=09haptics->actuator_type =3D HAP_TYPE_LRA;
+=09ret =3D of_property_read_u32(node, "qcom,actuator-type", &val);
+=09if (!ret) {
+=09=09if (val !=3D HAP_TYPE_LRA) {
+=09=09=09dev_err(&pdev->dev, "qcom,actuator-type (%d) isn't supported\n", =
val);
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto register_fail;
+=09=09}
+=09=09haptics->actuator_type =3D val;
+=09}
+
+=09// Only buffer mode is currently supported
+=09haptics->play_mode =3D HAP_PLAY_BUFFER;
+=09ret =3D of_property_read_u32(node, "qcom,play-mode", &val);
+=09if (!ret) {
+=09=09if (val !=3D HAP_PLAY_BUFFER) {
+=09=09=09dev_err(&pdev->dev, "qcom,play-mode (%d) isn't supported\n", val)=
;
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto register_fail;
+=09=09}
+=09=09haptics->play_mode =3D val;
+=09}
+
+=09ret =3D of_property_read_u32(node, "qcom,wave-play-rate-us", &val);
+=09if (!ret) {
+=09=09haptics->play_wave_rate =3D val;
+=09} else if (ret !=3D -EINVAL) {
+=09=09dev_err(haptics->dev, "Unable to read play rate ret=3D%d\n", ret);
+=09=09goto register_fail;
+=09}
+
+=09haptics->play_wave_rate =3D
+=09=09clamp_t(u32, haptics->play_wave_rate,
+=09=09=09HAP_WAVE_PLAY_RATE_MIN_US, HAP_WAVE_PLAY_RATE_MAX_US);
+
+=09haptics->wave_shape =3D HAP_WAVE_SINE;
+=09ret =3D of_property_read_u32(node, "qcom,wave-shape", &val);
+=09if (!ret) {
+=09=09if (val !=3D HAP_WAVE_SINE && val !=3D HAP_WAVE_SQUARE) {
+=09=09=09dev_err(&pdev->dev, "qcom,wave-shape is invalid: %d\n", val);
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto register_fail;
+=09=09}
+=09=09haptics->wave_shape =3D val;
+=09}
+
+=09haptics->brake_pat[0] =3D 0x3;
+=09haptics->brake_pat[1] =3D 0x3;
+=09haptics->brake_pat[2] =3D 0x2;
+=09haptics->brake_pat[3] =3D 0x1;
+
+=09ret =3D of_property_read_u8_array(node, "qcom,brake-pattern", haptics->=
brake_pat, 4);
+=09if (ret < 0 && ret !=3D -EINVAL) {
+=09=09dev_err(&pdev->dev, "qcom,brake-pattern is invalid, ret =3D %d\n", r=
et);
+=09=09goto register_fail;
+=09}
+
+=09haptics->current_limit =3D HAP_ILIM_400_MA;
+
+=09for (i =3D 0; i < HAP_WAVE_SAMP_LEN; i++)
+=09=09haptics->wave_samp[i] =3D HAP_WF_SAMP_MAX;
+
+=09ret =3D spmi_haptics_init(haptics);
+=09if (ret < 0) {
+=09=09dev_err(&pdev->dev, "Error initialising haptics, ret=3D%d\n",
+=09=09=09ret);
+=09=09goto register_fail;
+=09}
+
+=09platform_set_drvdata(pdev, haptics);
+
+=09input_dev =3D devm_input_allocate_device(&pdev->dev);
+=09if (!input_dev)
+=09=09return -ENOMEM;
+
+=09INIT_WORK(&haptics->work, spmi_haptics_work);
+=09haptics->haptics_input_dev =3D input_dev;
+
+=09input_dev->name =3D "spmi_haptics";
+=09input_dev->id.version =3D 1;
+=09input_dev->close =3D spmi_haptics_close;
+=09input_set_drvdata(input_dev, haptics);
+=09// Figure out how to make this FF_PERIODIC
+=09input_set_capability(haptics->haptics_input_dev, EV_FF, FF_RUMBLE);
+
+=09ret =3D input_ff_create_memless(input_dev, NULL,
+=09=09=09=09=09spmi_haptics_play_effect);
+=09if (ret) {
+=09=09dev_err(&pdev->dev,
+=09=09=09"couldn't register vibrator as FF device\n");
+=09=09goto register_fail;
+=09}
+
+=09ret =3D input_register_device(input_dev);
+=09if (ret) {
+=09=09dev_err(&pdev->dev, "couldn't register input device\n");
+=09=09goto register_fail;
+=09}
+
+=09return 0;
+
+register_fail:
+=09cancel_work_sync(&haptics->work);
+=09mutex_destroy(&haptics->play_lock);
+
+=09return ret;
+}
+
+static int __maybe_unused spmi_haptics_suspend(struct device *dev)
+{
+=09struct spmi_haptics *haptics =3D dev_get_drvdata(dev);
+
+=09cancel_work_sync(&haptics->work);
+=09spmi_haptics_disable(haptics);
+
+=09return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(spmi_haptics_pm_ops, spmi_haptics_suspend, NULL);
+
+static int spmi_haptics_remove(struct platform_device *pdev)
+{
+=09struct spmi_haptics *haptics =3D dev_get_drvdata(&pdev->dev);
+
+=09cancel_work_sync(&haptics->work);
+=09mutex_destroy(&haptics->play_lock);
+=09input_unregister_device(haptics->haptics_input_dev);
+
+=09return 0;
+}
+
+static void spmi_haptics_shutdown(struct platform_device *pdev)
+{
+=09struct spmi_haptics *haptics =3D dev_get_drvdata(&pdev->dev);
+
+=09cancel_work_sync(&haptics->work);
+
+=09spmi_haptics_disable(haptics);
+}
+
+static const struct of_device_id spmi_haptics_match_table[] =3D {
+=09{ .compatible =3D "qcom,spmi-haptics" },
+=09{ }
+};
+MODULE_DEVICE_TABLE(of, spmi_haptics_match_table);
+
+static struct platform_driver spmi_haptics_driver =3D {
+=09.probe=09=09=3D spmi_haptics_probe,
+=09.remove=09=09=3D spmi_haptics_remove,
+=09.shutdown=09=3D spmi_haptics_shutdown,
+=09.driver=09=09=3D {
+=09=09.name=09=3D "spmi-haptics",
+=09=09.pm=09=3D &spmi_haptics_pm_ops,
+=09=09.of_match_table =3D spmi_haptics_match_table,
+=09},
+};
+module_platform_driver(spmi_haptics_driver);
+
+MODULE_DESCRIPTION("spmi haptics driver using ff-memless framework");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Caleb Connolly <caleb@connolly.tech>");
--
2.34.1


