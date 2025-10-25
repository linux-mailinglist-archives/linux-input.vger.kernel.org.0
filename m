Return-Path: <linux-input+bounces-15715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED0C086BC
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 02:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CBB402137
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85668125B2;
	Sat, 25 Oct 2025 00:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq2IDoK0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420614D29B
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351944; cv=none; b=GJs3KIqEN8mGWUKrwQw0/UegmtuKGqG3E/nMK++f9G+LQTso/VFNixWwy08HdBXrJJ8i2/V8/JbCjmi1ffRCI7s74oaiUqoF5u3u/9auD+wnDeZAaf+HOLU0JWV93N01QsEXJC9Hr1Wwj8AqjFQPPFtxqVJVzvzBuj7AEjgbkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351944; c=relaxed/simple;
	bh=Jp/X4h/fhqkiR40VPrDp4Sc6frpyMoA1B2YPx3MetPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyAne1ACWF0zw/AljVaKaKWkOE3IY6e4m+OvuQKccYIHjDtZe1dQbJawbSfI5XEaldROMNkUg7ro8TkAPeij4+f+ueNUctPeoJ4tE+Y6RyfxwUQPC7E3JLMxQfSM3yYTqyC18AYZrTjUH1laEHyYOPRF9CSsA3So0WL1tMm8G0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq2IDoK0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eec33b737so37921155ad.1
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 17:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351940; x=1761956740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98Z6Y2DLvkYEdEhSPHKjG6k/fltdgY1Gg5/1IUmFZa8=;
        b=Jq2IDoK0tDw7VwXkCdkddLbWeb1nwJsgVv9AI0y0owTecGtJCVeoTxamuNe+9bbVKn
         XLd+4Dl7ULJjh5jm5KiGqS9j1b0ekB3qjY1PsalnMlE8pD1IC+a1Ucierb/B1tGCIT8k
         Bb65s8af+d3WFek1Xr6o5N5JjsO3pw+U1550fLNE5x8NAddiyqkunng3imddFtR0+f4U
         3vPjgtpgpigiNpo/YxNaAajGn1Db06m0vrcddjBLXHhPkl+FCcPXZjOBuPYnPvMhYcql
         yWyKvUhYVkeCmVICXWvlpuntGBBRAmA8DronQAthW0JFyfNmQjKgm5tj8W/HCwqK031G
         VK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351940; x=1761956740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98Z6Y2DLvkYEdEhSPHKjG6k/fltdgY1Gg5/1IUmFZa8=;
        b=K3GZyuoWPSPPi2K8Mtxqt0XeCGxL3W6gYAmfMebsdICp7e/V7a7UdbCl/+kcD4ae+z
         b5QoxkiG1vF/lT0fqahjKW3GMGYmUmdXbeyBF7Y7cCW++1Yrf3Oeq3aOPfw2t5tiyuk5
         Fe1IXSpLoknFmXy0j2BAViLfNxigbxQ35MIkMdrCt+jcoUzl+2kwGoGC8QejanDfSBvp
         Jt4EaPsnnN0itwn3UmHZdavRxAL16gZRkw/KMGaoZ3ziOvmpu3GVGHZ2oKp2055w+E4b
         gwZwR8t1JCgt7DWmVG5oimRFjwV9SqVxJBzFJwxLe+u7J/BplLeRfJFDnb+aBtAtj2GI
         gr8A==
X-Forwarded-Encrypted: i=1; AJvYcCWuPWqegMffIVroeN4KDWAi716oqOpjN2UPhOJuf4pKosHs8YbKDO186kjt5udHZ/w8df55nG2C9OTg1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcS8M40RwxGrYk1OIKfE/Z+sonFKohUhev87/40efLrmBXvhW9
	7ehlLECGZ+hn62pi2DKZRz57fQsMaNyJnIrkGhjveyua8RXgYA88ESh2
X-Gm-Gg: ASbGnctJ3JQAmBZsmZsj1ZKDn4ttpeMn/QMQ3Gqa58J6CEdCax6CcWHgkcf6r44YxCP
	7BZ9/EuzDpjihIecyMcKNEy0pA6ZQ2VzIL9M0PRuHQPK6tsi2oemYz1sLXoSyBqsS+fmPK1xSaI
	Ko6odsfrPUaton7E+Zn7NPgXGbOvhDZW4e0+OctGab+0ZyVuWWdtGB45eeR5d9g8wONexZk47CM
	2XOn5DuesDeS8NipEyN4UXIC2Jjzfy6DmiuzZYuUEnE+0nZe+f57azpCj5XG6mmYbNubg5fiP9q
	K0eVzAGGFSgvyiPT2eQOl6gscCcVqZ4EBljlpIuBQ4ChraWpGBYhAbeAtBHyR36n50f/icSZdWM
	w1Xd1yyYrmOZBmLcgp2s+3zQiQ9ffg6McpTbt8o2iX8APSaiH6HGurFvM3hbP4l2B1UjEFvZ01Z
	toGzLw4j7W+4PcPjnAHjQfdEAZl0RcmRqNBjd2eq1RbKgP6NsGMXzv8RJ5HDjUFg5sOxRMG9Eo/
	bArZh0WsMmCZV6YLLPmoeGgjd+sz29Gco/eZ2CmpQzD7tXcGAOj0gJzRcQ8/Laz
X-Google-Smtp-Source: AGHT+IGNambLQ3Qbf6pNFcis13dHu6dC75uSLf1afWG2SSeIFLBHshVxqzj6f/XNqtRxFIRxXP4+nA==
X-Received: by 2002:a17:902:8696:b0:290:ab61:6a4a with SMTP id d9443c01a7336-290c9cb6289mr248080405ad.13.1761351940153;
        Fri, 24 Oct 2025 17:25:40 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:37 +1000
Subject: [PATCH v4 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-6-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=29182;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Jp/X4h/fhqkiR40VPrDp4Sc6frpyMoA1B2YPx3MetPA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM5WlG3MK53/P94rY/Zi61N9j0JmfjyvGG3yy+vUi
 UKjHuVbHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKm2+sjw35WPlS05gYVt6zuVuTWpHM/z7v9Xfs9YXLrq5oH2EsEZ/xkZNvOurnw
 2a8ULOY5Fr52a5hQp/jJ8HHlY79YPvxPJzBLpvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The System Management Controller on Apple Silicon devices is responsible
for integrating and exposing the data reported by the vast array of
hardware monitoring sensors present on these devices. It is also
responsible for fan control, and allows users to manually set fan
speeds if they so desire. Add a hwmon driver to expose current,
power, temperature, and voltage monitoring sensors, as well as
fan speed monitoring and control via the SMC on Apple Silicon devices.

The SMC firmware has no consistency between devices, even when they
share an SoC. The FourCC keys used to access sensors are almost
random. An M1 Mac mini will have different FourCCs for its CPU core
temperature sensors to an M1 MacBook Pro, for example. For this
reason, the valid sensors for a given device are specified in a
child of the SMC Devicetree node. The driver uses this information
to determine which sensors to make available at runtime.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/hwmon/macsmc-hwmon.rst |  71 +++
 MAINTAINERS                          |   2 +
 drivers/hwmon/Kconfig                |  12 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/macsmc-hwmon.c         | 851 +++++++++++++++++++++++++
 5 files changed, 937 insertions(+)

diff --git a/Documentation/hwmon/macsmc-hwmon.rst b/Documentation/hwmon/macsmc-hwmon.rst
new file mode 100644
index 000000000000..6903f76df62b
--- /dev/null
+++ b/Documentation/hwmon/macsmc-hwmon.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver macsmc-hwmon
+==========================
+
+Supported hardware
+
+    * Apple Silicon Macs (M1 and up)
+
+Author: James Calligeros <jcalligeros99@gmail.com>
+
+Description
+-----------
+
+macsmc-hwmon exposes the Apple System Management controller's
+temperature, voltage, current and power sensors, as well as
+fan speed and control capabilities, via hwmon.
+
+Because each Apple Silicon Mac exposes a different set of sensors
+(e.g. the MacBooks expose battery telemetry that is not present on
+the desktop Macs), sensors present on any given machine are described
+via Devicetree. The driver picks these up and registers them with
+hwmon when probed.
+
+Manual fan speed is supported via the fan_control module parameter. This
+is disabled by default and marked as unsafe, as it cannot be proven that
+the system will fail safe if overheating due to manual fan control being
+used.
+
+sysfs interface
+---------------
+
+currX_input
+    Ammeter value
+
+currX_label
+    Ammeter label
+
+fanX_input
+    Current fan speed
+
+fanX_label
+    Fan label
+
+fanX_min
+    Minimum possible fan speed
+
+fanX_max
+    Maximum possible fan speed
+
+fanX_target
+    Current fan setpoint
+
+inX_input
+    Voltmeter value
+
+inX_label
+    Voltmeter label
+
+powerX_input
+    Power meter value
+
+powerX_label
+    Power meter label
+
+tempX_input
+    Temperature sensor value
+
+tempX_label
+    Temperature sensor label
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c6322872dd1..79b9f40224a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2440,12 +2440,14 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+F:	Documentation/hwmon/macsmc-hwmon.rst
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
 F:	drivers/gpio/gpio-macsmc.c
+F:	drivers/hwmon/macsmc-hwmon.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2760feb9f83b..d6e9e39d2762 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1174,6 +1174,18 @@ config SENSORS_LTQ_CPUTEMP
 	  If you say yes here you get support for the temperature
 	  sensor inside your CPU.
 
+config SENSORS_MACSMC_HWMON
+	tristate "Apple SMC (Apple Silicon)"
+	depends on MFD_MACSMC && OF
+	help
+	  This driver enables hwmon support for current, power, temperature,
+	  and voltage sensors, as well as fan speed reporting and control
+	  on Apple Silicon devices. Say Y here if you have an Apple Silicon
+	  device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called macsmc-hwmon.
+
 config SENSORS_MAX1111
 	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
 	depends on SPI_MASTER
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 73b2abdcc6dd..f9c049ce9124 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -148,6 +148,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
 obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
 obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
+obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc-hwmon.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
 obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
new file mode 100644
index 000000000000..1c0bbec7e8eb
--- /dev/null
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC hwmon driver for Apple Silicon platforms
+ *
+ * The System Management Controller on Apple Silicon devices is responsible for
+ * measuring data from sensors across the SoC and machine. These include power,
+ * temperature, voltage and current sensors. Some "sensors" actually expose
+ * derived values. An example of this is the key PHPC, which is an estimate
+ * of the heat energy being dissipated by the SoC.
+ *
+ * While each SoC only has one SMC variant, each platform exposes a different
+ * set of sensors. For example, M1 MacBooks expose battery telemetry sensors
+ * which are not present on the M1 Mac mini. For this reason, the available
+ * sensors for a given platform are described in the device tree in a child
+ * node of the SMC device. We must walk this list of available sensors and
+ * populate the required hwmon data structures at runtime.
+ *
+ * Originally based on a concept by Jean-Francois Bortolotti <jeff@borto.fr>
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitfield.h>
+#include <linux/hwmon.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define MAX_LABEL_LENGTH	32
+
+/* Temperature, voltage, current, power, fan(s) */
+#define NUM_SENSOR_TYPES	5
+
+#define FLT_EXP_BIAS	127
+#define FLT_EXP_MASK	GENMASK(30, 23)
+#define FLT_MANT_BIAS	23
+#define FLT_MANT_MASK	GENMASK(22, 0)
+#define FLT_SIGN_MASK	BIT(31)
+
+static bool fan_control;
+module_param_unsafe(fan_control, bool, 0644);
+MODULE_PARM_DESC(fan_control,
+		 "Override the SMC to set your own fan speeds on supported machines");
+
+struct macsmc_hwmon_sensor {
+	struct apple_smc_key_info info;
+	smc_key macsmc_key;
+	char label[MAX_LABEL_LENGTH];
+	u32 attrs;
+};
+
+struct macsmc_hwmon_fan {
+	struct macsmc_hwmon_sensor now;
+	struct macsmc_hwmon_sensor min;
+	struct macsmc_hwmon_sensor max;
+	struct macsmc_hwmon_sensor set;
+	struct macsmc_hwmon_sensor mode;
+	char label[MAX_LABEL_LENGTH];
+	u32 attrs;
+	bool manual;
+};
+
+struct macsmc_hwmon_sensors {
+	struct hwmon_channel_info channel_info;
+	struct macsmc_hwmon_sensor *sensors;
+	u32 count;
+};
+
+struct macsmc_hwmon_fans {
+	struct hwmon_channel_info channel_info;
+	struct macsmc_hwmon_fan *fans;
+	u32 count;
+};
+
+struct macsmc_hwmon {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct device *hwmon_dev;
+	struct hwmon_chip_info chip_info;
+	/* Chip + sensor types + NULL */
+	const struct hwmon_channel_info *channel_infos[1 + NUM_SENSOR_TYPES + 1];
+	struct macsmc_hwmon_sensors temp;
+	struct macsmc_hwmon_sensors volt;
+	struct macsmc_hwmon_sensors curr;
+	struct macsmc_hwmon_sensors power;
+	struct macsmc_hwmon_fans fan;
+};
+
+static int macsmc_hwmon_read_label(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, const char **str)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		*str = hwmon->temp.sensors[channel].label;
+		break;
+	case hwmon_in:
+		*str = hwmon->volt.sensors[channel].label;
+		break;
+	case hwmon_curr:
+		*str = hwmon->curr.sensors[channel].label;
+		break;
+	case hwmon_power:
+		*str = hwmon->power.sensors[channel].label;
+		break;
+	case hwmon_fan:
+		*str = hwmon->fan.fans[channel].label;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/*
+ * A number of sensors report data in a 48.16 fixed-point decimal format that is
+ * not used by any other function of the SMC.
+ */
+static int macsmc_hwmon_read_ioft_scaled(struct apple_smc *smc, smc_key key,
+					 u64 *p, int scale)
+{
+	u64 val;
+	int ret;
+
+	ret = apple_smc_read_u64(smc, key, &val);
+	if (ret < 0)
+		return ret;
+
+	*p = mult_frac(val, scale, 65536);
+
+	return 0;
+}
+
+/*
+ * Many sensors report their data as IEEE-754 floats. No other SMC function uses
+ * them.
+ */
+static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
+					int *p, int scale)
+{
+	u32 fval;
+	u64 val;
+	int ret, exp;
+
+	ret = apple_smc_read_u32(smc, key, &fval);
+	if (ret < 0)
+		return ret;
+
+	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
+	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
+
+	/* We never have negatively scaled SMC floats */
+	val *= scale;
+
+	if (exp > 63)
+		val = U64_MAX;
+	else if (exp < -63)
+		val = 0;
+	else if (exp < 0)
+		val >>= -exp;
+	else if (exp != 0 && (val & ~((1UL << (64 - exp)) - 1))) /* overflow */
+		val = U64_MAX;
+	else
+		val <<= exp;
+
+	if (fval & FLT_SIGN_MASK) {
+		if (val > (-(s64)INT_MIN))
+			*p = INT_MIN;
+		else
+			*p = -val;
+	} else {
+		if (val > INT_MAX)
+			*p = INT_MAX;
+		else
+			*p = val;
+	}
+
+	return 0;
+}
+
+/*
+ * The SMC has keys of multiple types, denoted by a FourCC of the same format
+ * as the key ID. We don't know what data type a key encodes until we poke at it.
+ */
+static int macsmc_hwmon_read_key(struct apple_smc *smc,
+				 struct macsmc_hwmon_sensor *sensor, int scale,
+				 long *val)
+{
+	int ret;
+
+	switch (sensor->info.type_code) {
+	/* 32-bit IEEE 754 float */
+	case __SMC_KEY('f', 'l', 't', ' '): {
+		u32 flt_ = 0;
+
+		ret = macsmc_hwmon_read_f32_scaled(smc, sensor->macsmc_key,
+						   &flt_, scale);
+		if (ret)
+			return ret;
+
+		*val = flt_;
+		break;
+	}
+	/* 48.16 fixed point decimal */
+	case __SMC_KEY('i', 'o', 'f', 't'): {
+		u64 ioft = 0;
+
+		ret = macsmc_hwmon_read_ioft_scaled(smc, sensor->macsmc_key,
+						    &ioft, scale);
+		if (ret)
+			return ret;
+
+		*val = (long)ioft;
+		break;
+	}
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
+{
+	u64 val;
+	u32 fval = 0;
+	int exp = 0, neg;
+
+	val = abs(value);
+	neg = val != value;
+
+	if (val) {
+		int msb = __fls(val) - exp;
+
+		if (msb > 23) {
+			val >>= msb - FLT_MANT_BIAS;
+			exp -= msb - FLT_MANT_BIAS;
+		} else if (msb < 23) {
+			val <<= FLT_MANT_BIAS - msb;
+			exp += msb;
+		}
+
+		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
+		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
+		       FIELD_PREP(FLT_MANT_MASK, val);
+	}
+
+	return apple_smc_write_u32(smc, key, fval);
+}
+
+static int macsmc_hwmon_write_key(struct apple_smc *smc,
+				  struct macsmc_hwmon_sensor *sensor, long val)
+{
+	switch (sensor->info.type_code) {
+	/* 32-bit IEEE 754 float */
+	case __SMC_KEY('f', 'l', 't', ' '):
+		return macsmc_hwmon_write_f32(smc, sensor->macsmc_key, val);
+	/* unsigned 8-bit integer */
+	case __SMC_KEY('u', 'i', '8', ' '):
+		return apple_smc_write_u8(smc, sensor->macsmc_key, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int macsmc_hwmon_read_fan(struct macsmc_hwmon *hwmon, u32 attr, int chan,
+				 long *val)
+{
+	switch (attr) {
+	case hwmon_fan_input:
+		return macsmc_hwmon_read_key(hwmon->smc,
+					     &hwmon->fan.fans[chan].now, 1, val);
+	case hwmon_fan_min:
+		return macsmc_hwmon_read_key(hwmon->smc,
+					     &hwmon->fan.fans[chan].min, 1, val);
+	case hwmon_fan_max:
+		return macsmc_hwmon_read_key(hwmon->smc,
+					     &hwmon->fan.fans[chan].max, 1, val);
+	case hwmon_fan_target:
+		return macsmc_hwmon_read_key(hwmon->smc,
+					     &hwmon->fan.fans[chan].set, 1, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int macsmc_hwmon_write_fan(struct device *dev, u32 attr, int channel,
+				  long val)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+	long min, max;
+	int ret;
+
+	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
+		return -EOPNOTSUPP;
+
+	/*
+	 * The SMC does no sanity checks on requested fan speeds, so we need to.
+	 */
+	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].min,
+				    1, &min);
+	if (ret)
+		return ret;
+
+	ret = macsmc_hwmon_read_key(hwmon->smc, &hwmon->fan.fans[channel].max,
+				    1, &max);
+	if (ret)
+		return ret;
+
+	if (val >= min && val <= max) {
+		if (!hwmon->fan.fans[channel].manual) {
+			/* Write 1 to mode key for manual control */
+			ret = macsmc_hwmon_write_key(hwmon->smc,
+						     &hwmon->fan.fans[channel].mode, 1);
+			if (ret < 0)
+				return ret;
+
+			hwmon->fan.fans[channel].manual = true;
+		}
+		return macsmc_hwmon_write_key(hwmon->smc,
+					      &hwmon->fan.fans[channel].set, val);
+	} else if (!val) {
+		if (hwmon->fan.fans[channel].manual) {
+			ret = macsmc_hwmon_write_key(hwmon->smc,
+						     &hwmon->fan.fans[channel].mode, 0);
+			if (ret < 0)
+				return ret;
+
+			hwmon->fan.fans[channel].manual = false;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int macsmc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct macsmc_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret = 0;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = macsmc_hwmon_read_key(hwmon->smc,
+					    &hwmon->temp.sensors[channel], 1000, val);
+		break;
+	case hwmon_in:
+		ret = macsmc_hwmon_read_key(hwmon->smc,
+					    &hwmon->volt.sensors[channel], 1000, val);
+		break;
+	case hwmon_curr:
+		ret = macsmc_hwmon_read_key(hwmon->smc,
+					    &hwmon->curr.sensors[channel], 1000, val);
+		break;
+	case hwmon_power:
+		/* SMC returns power in Watts with acceptable precision to scale to uW */
+		ret = macsmc_hwmon_read_key(hwmon->smc,
+					    &hwmon->power.sensors[channel],
+					    1000000, val);
+		break;
+	case hwmon_fan:
+		ret = macsmc_hwmon_read_fan(hwmon, attr, channel, val);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int macsmc_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_fan:
+		return macsmc_hwmon_write_fan(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t macsmc_hwmon_fan_is_visible(const struct macsmc_hwmon_fan *fan,
+					   u32 attr)
+{
+	if (fan->attrs & BIT(attr)) {
+		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
+			return 0644;
+
+		return 0444;
+	}
+
+	return 0;
+}
+
+static umode_t macsmc_hwmon_is_visible(const void *data,
+				       enum hwmon_sensor_types type, u32 attr,
+				       int channel)
+{
+	const struct macsmc_hwmon *hwmon = data;
+	struct macsmc_hwmon_sensor *sensor;
+
+	switch (type) {
+	case hwmon_in:
+		sensor = &hwmon->volt.sensors[channel];
+		break;
+	case hwmon_curr:
+		sensor = &hwmon->curr.sensors[channel];
+		break;
+	case hwmon_power:
+		sensor = &hwmon->power.sensors[channel];
+		break;
+	case hwmon_temp:
+		sensor = &hwmon->temp.sensors[channel];
+		break;
+	case hwmon_fan:
+		return macsmc_hwmon_fan_is_visible(&hwmon->fan.fans[channel], attr);
+	default:
+		return 0;
+	}
+
+	/* Sensors only register ro attributes */
+	if (sensor->attrs & BIT(attr))
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_ops macsmc_hwmon_ops = {
+	.is_visible = macsmc_hwmon_is_visible,
+	.read = macsmc_hwmon_read,
+	.read_string = macsmc_hwmon_read_label,
+	.write = macsmc_hwmon_write,
+};
+
+/*
+ * Get the key metadata, including key data type, from the SMC.
+ */
+static int macsmc_hwmon_parse_key(struct device *dev, struct apple_smc *smc,
+				  struct macsmc_hwmon_sensor *sensor,
+				  const char *key)
+{
+	int ret;
+
+	ret = apple_smc_get_key_info(smc, _SMC_KEY(key), &sensor->info);
+	if (ret) {
+		dev_dbg(dev, "Failed to retrieve key info for %s\n", key);
+		return ret;
+	}
+
+	sensor->macsmc_key = _SMC_KEY(key);
+
+	return 0;
+}
+
+/*
+ * A sensor is a single key-value pair as made available by the SMC.
+ * The devicetree gives us the SMC key ID and a friendly name where the
+ * purpose of the sensor is known.
+ */
+static int macsmc_hwmon_create_sensor(struct device *dev, struct apple_smc *smc,
+				      struct device_node *sensor_node,
+				      struct macsmc_hwmon_sensor *sensor)
+{
+	const char *key, *label;
+	int ret;
+
+	ret = of_property_read_string(sensor_node, "apple,key-id", &key);
+	if (ret) {
+		dev_dbg(dev, "Could not find apple,key-id in sensor node\n");
+		return ret;
+	}
+
+	ret = macsmc_hwmon_parse_key(dev, smc, sensor, key);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_string(sensor_node, "label", &label);
+	if (ret)
+		dev_dbg(dev, "No label found for sensor %s\n", key);
+	else
+		strscpy_pad(sensor->label, label, sizeof(sensor->label));
+
+	return 0;
+}
+
+/*
+ * Fan data is exposed by the SMC as multiple sensors.
+ *
+ * The devicetree schema reuses apple,key-id for the actual fan speed sensor.
+ * Min, max and target keys do not need labels, so we can reuse label
+ * for naming the entire fan.
+ */
+static int macsmc_hwmon_create_fan(struct device *dev, struct apple_smc *smc,
+				   struct device_node *fan_node,
+				   struct macsmc_hwmon_fan *fan)
+{
+	const char *label, *now, *min, *max, *set, *mode;
+	int ret;
+
+	ret = of_property_read_string(fan_node, "apple,key-id", &now);
+	if (ret) {
+		dev_err(dev, "apple,key-id not found in fan node!\n");
+		return ret;
+	}
+
+	ret = macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
+	if (ret)
+		return ret;
+
+	fan->attrs = HWMON_F_INPUT;
+
+	ret = of_property_read_string(fan_node, "label", &label);
+	if (ret) {
+		dev_dbg(dev, "No label found for fan %s\n", now);
+	} else {
+		strscpy_pad(fan->label, label, sizeof(fan->label));
+		fan->attrs |= HWMON_F_LABEL;
+	}
+
+	/* The following keys are not required to simply monitor fan speed */
+	if (!of_property_read_string(fan_node, "apple,fan-minimum", &min)) {
+		ret = macsmc_hwmon_parse_key(dev, smc, &fan->min, min);
+		if (ret)
+			return ret;
+
+		fan->attrs |= HWMON_F_MIN;
+	}
+
+	if (!of_property_read_string(fan_node, "apple,fan-maximum", &max)) {
+		ret = macsmc_hwmon_parse_key(dev, smc, &fan->max, max);
+		if (ret)
+			return ret;
+
+		fan->attrs |= HWMON_F_MAX;
+	}
+
+	if (!of_property_read_string(fan_node, "apple,fan-target", &set)) {
+		ret = macsmc_hwmon_parse_key(dev, smc, &fan->set, set);
+		if (ret)
+			return ret;
+
+		fan->attrs |= HWMON_F_TARGET;
+	}
+
+	if (!of_property_read_string(fan_node, "apple,fan-mode", &mode)) {
+		ret = macsmc_hwmon_parse_key(dev, smc, &fan->mode, mode);
+		if (ret)
+			return ret;
+	}
+
+	/* Initialise fan control mode to automatic */
+	fan->manual = false;
+
+	return 0;
+}
+
+static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
+					 struct device_node *hwmon_node)
+{
+	struct device_node *key_node __maybe_unused;
+	struct macsmc_hwmon_sensor *sensor;
+	u32 n_current = 0, n_fan = 0, n_power = 0, n_temperature = 0, n_voltage = 0;
+
+	for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
+		n_current++;
+	}
+
+	if (n_current) {
+		hwmon->curr.sensors = devm_kcalloc(hwmon->dev, n_current,
+						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
+		if (!hwmon->curr.sensors)
+			return -ENOMEM;
+
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
+			sensor = &hwmon->curr.sensors[hwmon->curr.count];
+			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
+				sensor->attrs = HWMON_C_INPUT;
+
+				if (*sensor->label)
+					sensor->attrs |= HWMON_C_LABEL;
+
+				hwmon->curr.count++;
+			}
+		}
+	}
+
+	for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
+		n_fan++;
+	}
+
+	if (n_fan) {
+		hwmon->fan.fans = devm_kcalloc(hwmon->dev, n_fan,
+					       sizeof(struct macsmc_hwmon_fan), GFP_KERNEL);
+		if (!hwmon->fan.fans)
+			return -ENOMEM;
+
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
+			if (!macsmc_hwmon_create_fan(hwmon->dev, hwmon->smc, key_node,
+						     &hwmon->fan.fans[hwmon->fan.count]))
+				hwmon->fan.count++;
+		}
+	}
+
+	for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
+		n_power++;
+	}
+
+	if (n_power) {
+		hwmon->power.sensors = devm_kcalloc(hwmon->dev, n_power,
+						    sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
+		if (!hwmon->power.sensors)
+			return -ENOMEM;
+
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
+			sensor = &hwmon->power.sensors[hwmon->power.count];
+			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
+				sensor->attrs = HWMON_P_INPUT;
+
+				if (*sensor->label)
+					sensor->attrs |= HWMON_P_LABEL;
+
+				hwmon->power.count++;
+			}
+		}
+	}
+
+	for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
+		n_temperature++;
+	}
+
+	if (n_temperature) {
+		hwmon->temp.sensors = devm_kcalloc(hwmon->dev, n_temperature,
+						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
+		if (!hwmon->temp.sensors)
+			return -ENOMEM;
+
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
+			sensor = &hwmon->temp.sensors[hwmon->temp.count];
+			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
+				sensor->attrs = HWMON_T_INPUT;
+
+				if (*sensor->label)
+					sensor->attrs |= HWMON_T_LABEL;
+
+				hwmon->temp.count++;
+			}
+		}
+	}
+
+	for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
+		n_voltage++;
+	}
+
+	if (n_voltage) {
+		hwmon->volt.sensors = devm_kcalloc(hwmon->dev, n_voltage,
+						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
+		if (!hwmon->volt.sensors)
+			return -ENOMEM;
+
+		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
+			sensor = &hwmon->temp.sensors[hwmon->temp.count];
+			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
+				sensor->attrs = HWMON_I_INPUT;
+
+				if (*sensor->label)
+					sensor->attrs |= HWMON_I_LABEL;
+
+				hwmon->volt.count++;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/* Create NULL-terminated config arrays */
+static void macsmc_hwmon_populate_configs(u32 *configs, const struct macsmc_hwmon_sensors *sensors)
+{
+	int idx;
+
+	for (idx = 0; idx < sensors->count; idx++)
+		configs[idx] = sensors->sensors[idx].attrs;
+}
+
+static void macsmc_hwmon_populate_fan_configs(u32 *configs, const struct macsmc_hwmon_fans *fans)
+{
+	int idx;
+
+	for (idx = 0; idx < fans->count; idx++)
+		configs[idx] = fans->fans[idx].attrs;
+}
+
+static const struct hwmon_channel_info *const macsmc_chip_channel_info =
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ);
+
+static int macsmc_hwmon_create_infos(struct macsmc_hwmon *hwmon)
+{
+	struct hwmon_channel_info *channel_info;
+	int i = 0;
+
+	/* chip */
+	hwmon->channel_infos[i++] = macsmc_chip_channel_info;
+
+	if (hwmon->curr.count) {
+		channel_info = &hwmon->curr.channel_info;
+		channel_info->type = hwmon_curr;
+		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->curr.count + 1,
+						    sizeof(u32), GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config, &hwmon->curr);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->fan.count) {
+		channel_info = &hwmon->fan.channel_info;
+		channel_info->type = hwmon_fan;
+		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->fan.count + 1,
+						    sizeof(u32), GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_fan_configs((u32 *)channel_info->config, &hwmon->fan);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->power.count) {
+		channel_info = &hwmon->power.channel_info;
+		channel_info->type = hwmon_power;
+		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->power.count + 1,
+						    sizeof(u32), GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config, &hwmon->power);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->temp.count) {
+		channel_info = &hwmon->temp.channel_info;
+		channel_info->type = hwmon_temp;
+		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->temp.count + 1,
+						    sizeof(u32), GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config, &hwmon->temp);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	if (hwmon->volt.count) {
+		channel_info = &hwmon->volt.channel_info;
+		channel_info->type = hwmon_in;
+		channel_info->config = devm_kcalloc(hwmon->dev, hwmon->volt.count + 1,
+						    sizeof(u32), GFP_KERNEL);
+		if (!channel_info->config)
+			return -ENOMEM;
+
+		macsmc_hwmon_populate_configs((u32 *)channel_info->config, &hwmon->volt);
+		hwmon->channel_infos[i++] = channel_info;
+	}
+
+	return 0;
+}
+
+static int macsmc_hwmon_probe(struct platform_device *pdev)
+{
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	struct macsmc_hwmon *hwmon;
+	int ret;
+
+	/*
+	 * The MFD driver will try to probe us unconditionally. Some devices
+	 * with the SMC do not have hwmon capabilities. Only probe if we have
+	 * a hwmon node.
+	 */
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon),
+			     GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->dev = &pdev->dev;
+	hwmon->smc = smc;
+
+	ret = macsmc_hwmon_populate_sensors(hwmon, hwmon->dev->of_node);
+	if (ret) {
+		dev_err(hwmon->dev, "Could not parse sensors\n");
+		return ret;
+	}
+
+	if (!hwmon->curr.count && !hwmon->fan.count &&
+	    !hwmon->power.count && !hwmon->temp.count &&
+	    !hwmon->volt.count) {
+		dev_err(hwmon->dev,
+			"No valid sensors found of any supported type\n");
+		return -ENODEV;
+	}
+
+	ret = macsmc_hwmon_create_infos(hwmon);
+	if (ret)
+		return ret;
+
+	hwmon->chip_info.ops = &macsmc_hwmon_ops;
+	hwmon->chip_info.info =
+		(const struct hwmon_channel_info *const *)&hwmon->channel_infos;
+
+	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+								"macsmc_hwmon", hwmon,
+								&hwmon->chip_info, NULL);
+	if (IS_ERR(hwmon->hwmon_dev))
+		return dev_err_probe(hwmon->dev, PTR_ERR(hwmon->hwmon_dev),
+				     "Probing SMC hwmon device failed\n");
+
+	dev_dbg(hwmon->dev, "Registered SMC hwmon device. Sensors:\n");
+	dev_dbg(hwmon->dev,
+		"Current: %d, Fans: %d, Power: %d, Temperature: %d, Voltage: %d",
+		hwmon->curr.count, hwmon->fan.count,
+		hwmon->power.count, hwmon->temp.count,
+		hwmon->volt.count);
+
+	return 0;
+}
+
+static const struct of_device_id macsmc_hwmon_of_table[] = {
+	{ .compatible = "apple,smc-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, macsmc_hwmon_of_table);
+
+static struct platform_driver macsmc_hwmon_driver = {
+	.probe = macsmc_hwmon_probe,
+	.driver = {
+		.name = "macsmc-hwmon",
+		.of_match_table = macsmc_hwmon_of_table,
+	},
+};
+module_platform_driver(macsmc_hwmon_driver);
+
+MODULE_DESCRIPTION("Apple Silicon SMC hwmon driver");
+MODULE_AUTHOR("James Calligeros <jcalligeros99@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");

-- 
2.51.0


