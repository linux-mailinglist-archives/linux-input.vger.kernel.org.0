Return-Path: <linux-input+bounces-16573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D48CBD3C9
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0355B3060F1A
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C9432B99F;
	Mon, 15 Dec 2025 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7EjZTY+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE732B99A
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791555; cv=none; b=RIsjgY8GtlxBSGB4mZhk5TdR1yOjvbI5Hgo5nZq0g7r4q3xCD+uj2WRvwoROeAI5pkxSwsSL9WPIpmyj3qyLVVXx2FMJ6fqWX1pZIUajyiuSskCzMCXkp2WYmNnUvD8etTIJBd7jyy/vPM5Uq21g/PyglWgfk6/rGKI2N3dl/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791555; c=relaxed/simple;
	bh=I/L7r59w5k2aU/ZQyuS0zNrmK3O5J0tVycY6kgw6r9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6UaY2PboxMhYDd+RyNMDKQX1DzF3PvI9wMiASgY0vjwCJksBw/Nia1u/f2tz9MNvcnlH3LruFZ2BZabOwxks06LcPYqvMSe46MiBrgEnAtBQ+GfvuxRchlCdwiOI8VaWxKtgnOaKDjqHLvc4eV/Q7fFioqcbqQb0BOPaMaRv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7EjZTY+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d52768ccso11602165ad.1
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791550; x=1766396350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCqu8r0CbeFTNPLuen2UFB2zkwpTubmnQXzTm3hV0tY=;
        b=h7EjZTY+jdtlKMdmHqOoSqOmJbs6mWN5IDCXKr4CK0q+XKlQo5QPRgw5rdqnLykBla
         azT9AW/Wh+AS7gAgzvee8pDYjMzpOcrKU/wOqB6roivJyH4Ml8JcJ0wlkpHEgDfwAfqU
         GOzIhPyiLJpp6kR56IG83Y71LpG472kceYxVopwFpcdbradkGbBAfVEwkcywZiEOcR0u
         I9wQ3myVy1mKBIZSeKKMYVbzO+hHLcNDMXzY+pZgyvJUu6gAIeybCG1eTlFYNmHHamib
         BAcveOmhnQHAdoSbu1hxg8vQfAsniKL88d6fdVg1rfHUif6JccEifraUW2njqAwF1wyx
         XV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791550; x=1766396350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCqu8r0CbeFTNPLuen2UFB2zkwpTubmnQXzTm3hV0tY=;
        b=suTeyJdZcvo6AHl9kNN5CoC7AIlr9YEDwUOpZT97ZKuq1v9asl1PYlkzSn2wkg7fpW
         qWpNyVcQXWIGQccx3t2hHQHUO2uUAme1nbcoddMmLUld1NnN5SmL/KujXXPmrX4IdP2j
         RiHhz/fCNCsecAUtGtwKe9I2BYehp0kYq8Lrg+6uSPZdr1tPOuCCFGYbUJzwrddrEqGr
         a7dF2L5V+TC/GijhY4vYuB+flv7b7D738MYgsZoSHotqfePftwKInQ0qk7aDix3nhnCS
         dHGaXHbTMqF1MWbXPMryS0k/SPhSBukMe1CRyEwWJSsh84TNXyEj38tPja8MH0GczZ2b
         fq6w==
X-Forwarded-Encrypted: i=1; AJvYcCWMT0nmtL5Ni/c4mYiwWiVXHkDANvDMsFn+hBeXrTQ0faA8VLPQ8HRogPvARDQvIsHVY6L9IPWc2l8J3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Z1pK/cF8W2xmEEjkLxApSLmLsjb5UlZJz0bnCuUcYZkQ7WiW
	ybsrPrC1j2VriLJvclgjXgXz5t1rjQH4y/w2wiDwN3KDRgL1DiB+ymJ1
X-Gm-Gg: AY/fxX5hOd/mqMP71hDdNrMJVw37msbOIHZiiYZC+5dJTbUSiggTk6rF+2sDhQpIjpR
	4YPBHRjynnIQFvI9duNMmHgf3ut/ML0n2/9ZJwSgZHYPQtyrfEIqOf3jPwuY7DnqSEUJP1LsUD9
	54dcEcnyPWfLtinKumr1zZugiPzz5U277dJDZWQDEVZKQ9G0OgBzKdQ0uaVu3+nWCYt0AKxM4GY
	5RAHlDZQF1mmUtFOmnjueBVmw7DbtgclQF9yel/HcugdbiTC7CtOrBXM4LABtFkE8nMHhR5n4gE
	L2AbFTbDiD88eJ9+CRUZA/LAxhDQSZ+7KHZ+rk8W4PHbFlt98RaKTf0Xeim6UuS+YsSlsKLonuO
	I7t48avDR4sx4tHTIyuf7zh+nIgDP6mB3iHzfvX4gc4kOVGSyDiBf8F2xnwfJj7oOB+CE8cQseA
	sfV2iPkCjK/MUP34AM3si2P1ktcBDyp+vNszNczD3WHMupakGYrcZbr7kGX4Ta0Hn9i721wmkkU
	0OtRVkQO/ic+IKsEcl67CpdEWTAC7N3e7TmT4Wd4Qgd7W8vaPeiL4WMQliLE62Z4V+aReyvbF8z
	09QATmfUoM9uJ9xAgqiewL5Zzrt99WNfrdyyxRqdrfMDb44moNLffMBQgjEr4w==
X-Google-Smtp-Source: AGHT+IENGKA6ttYiVSzTZiZopnM0MK0vu/VuTSeOYgYDQUJXX/Vi9BRGghQaxgAgfIzyI5XkyRK2GQ==
X-Received: by 2002:a17:902:d4cb:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a0b467ac9amr53044365ad.0.1765791550341;
        Mon, 15 Dec 2025 01:39:10 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:51 +1000
Subject: [PATCH v6 7/7] arm64: dts: apple: t8103, t8112, t60xx: Add hwmon
 SMC subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-7-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12033;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=I/L7r59w5k2aU/ZQyuS0zNrmK3O5J0tVycY6kgw6r9E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211nKFkfLL7/7Yp7X/pMLu9OjDaYLOExbFq4RsLjAc
 X3d6kn6HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKl2rGD4H+mU6Mf3tIDvzIx0j7U6ayyUzdju7Mne9IGB//mhMwsaDRkZdoa/3iz
 u+lP3I39d/AE5gWLj+ujJXgmr7f2LCxYyt9/jAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple's System Management Controller integrates numerous sensors
that can be exposed via hwmon. Add the subdevice, compatible,
and some common sensors that are exposed on every currently
supported device as a starting point.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 22 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 17 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 15 +++++++++++
 .../arm64/boot/dts/apple/t6001-j375c.dts |  2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi     |  2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  2 ++
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  4 +++
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  3 +++
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  4 +++
 arch/arm64/boot/dts/apple/t8103-j274.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts |  3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi     |  5 ++++
 arch/arm64/boot/dts/apple/t8112-j413.dts |  2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |  2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts |  3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi     |  5 ++++
 21 files changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..b87021855fdf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..3eef0721bcca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..fba9faf38f4b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..0c4666282a5c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot Temperature";
+	};
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temperature";
+	};
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 000000000000..f32627336ae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index ffbe823b71bc..264df90f07d8 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -66,3 +66,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 2b7f80119618..d12c0ae418f7 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -56,3 +56,5 @@ &bluetooth0 {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..e6647c1a9173 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -37,6 +37,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae..127814a9dfa4 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -131,3 +131,6 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..680c103c1c0f 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -114,6 +114,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46..f5b8cc087882 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6..abb88391635f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca..491ead016b21 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4..c2ec6fbb633c 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55..aeaab2482d54 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -56,3 +56,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 59f2678639cf..f1820bdc0910 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -909,6 +909,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
@@ -1141,3 +1145,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf..500dcdf2d4b5 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be..11db6a92493f 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a..a0da02c00f15 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 6bc3f58b06f7..c4d1e5ffaee9 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -912,6 +912,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
@@ -1180,3 +1184,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.52.0


