Return-Path: <linux-input+bounces-6060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC606968F84
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0121C2258C
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D33618858F;
	Mon,  2 Sep 2024 22:28:40 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D2188581
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316120; cv=none; b=qyRa4MLHtbnqNpejX70A2qQ+KZEcQD/X84E+Mc3e5X9Kidmz8+v6ieH7dIv4u32Dp0dE0HUlNRmnLxNlTrCUz5zgtZHKm1V/1uCCEexHSLVBLLTNN8VQPW+TUCoVI96vBltD4cqYpty3RzOb1oIM7MPtow6YRkyu2MBnFlCnlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316120; c=relaxed/simple;
	bh=h/Tc5Jonr5mhfATTRiYj4QzNBRxFdOcYM0UuTjM6PEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKueK8i1KgyHY4mxcf3IUbWlbM1GDwCv5FmyTLBaQ7NiOVP3YCXTTFTkHIDdVJAc5eDWoZHXd98d0JPzFkABs9VLItfHLjD0dibXYPLP6BzJz0lG5lUitBcY6XetZ3lbozR6ac+UXotjgkE7CJEbuLW7dTvwinRdIPrhvlmJjcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id abfcba88-697a-11ef-8256-005056bdfda7;
	Tue, 03 Sep 2024 01:28:26 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 00/22] iio: use dev_get_platdata() to access platform_data
Date: Tue,  3 Sep 2024 01:16:45 +0300
Message-ID: <20240902222824.1145571-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify how IIO drivers access platform_data field of struct device.
In simple and straightforward cases constify the local variables.

(Not tested)

Andy Shevchenko (22):
  iio: accel: hid-sensor-accel-3d: Get platform data via
    dev_get_platdata()
  iio: adc: ad7266: Get platform data via dev_get_platdata()
  iio: adc: ad7791: Get platform data via dev_get_platdata()
  iio: adc: ad7887: Get platform data via dev_get_platdata()
  iio: adc: ad7793: Get platform data via dev_get_platdata()
  iio: adc: ltc2497: Get platform data via dev_get_platdata()
  iio: dac: ad5504: Get platform data via dev_get_platdata()
  iio: dac: ad5791: Get platform data via dev_get_platdata()
  iio: dac: m62332: Get platform data via dev_get_platdata()
  iio: dac: max517: Get platform data via dev_get_platdata()
  iio: frequency: ad9523: Get platform data via dev_get_platdata()
  iio: frequency: adf4350: Get platform data via dev_get_platdata()
  iio: gyro: hid-sensor-gyro-3d: Get platform data via
    dev_get_platdata()
  iio: imu: st_lsm6dsx: Get platform data via dev_get_platdata()
  iio: light: hid-sensor-als: Get platform data via dev_get_platdata()
  iio: light: hid-sensor-prox: Get platform data via dev_get_platdata()
  iio: light: lm3533-als: Get platform data via dev_get_platdata()
  iio: magnetometer: hid-sensor-magn-3d: Get platform data via
    dev_get_platdata()
  iio: orientation: hid-sensor-incl-3d: Get platform data via
    dev_get_platdata()
  iio: orientation: hid-sensor-rotation: Get platform data via
    dev_get_platdata()
  iio: position: hid-sensor-custom-intel-hinge: Get platform data via
    dev_get_platdata()
  iio: pressure: hid-sensor-press: Get platform data via
    dev_get_platdata()

 drivers/iio/accel/hid-sensor-accel-3d.c           |  5 ++---
 drivers/iio/adc/ad7266.c                          |  2 +-
 drivers/iio/adc/ad7791.c                          |  4 ++--
 drivers/iio/adc/ad7793.c                          |  2 +-
 drivers/iio/adc/ad7887.c                          |  2 +-
 drivers/iio/adc/ltc2497-core.c                    | 15 +++++----------
 drivers/iio/dac/ad5504.c                          |  2 +-
 drivers/iio/dac/ad5791.c                          |  2 +-
 drivers/iio/dac/m62332.c                          |  2 +-
 drivers/iio/dac/max517.c                          |  4 ++--
 drivers/iio/frequency/ad9523.c                    |  2 +-
 drivers/iio/frequency/adf4350.c                   |  2 +-
 drivers/iio/gyro/hid-sensor-gyro-3d.c             |  4 ++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c      | 15 +++++----------
 drivers/iio/light/hid-sensor-als.c                |  4 ++--
 drivers/iio/light/hid-sensor-prox.c               |  4 ++--
 drivers/iio/light/lm3533-als.c                    |  6 +++---
 drivers/iio/magnetometer/hid-sensor-magn-3d.c     |  4 ++--
 drivers/iio/orientation/hid-sensor-incl-3d.c      |  4 ++--
 drivers/iio/orientation/hid-sensor-rotation.c     |  4 ++--
 .../iio/position/hid-sensor-custom-intel-hinge.c  |  4 ++--
 drivers/iio/pressure/hid-sensor-press.c           |  4 ++--
 22 files changed, 43 insertions(+), 54 deletions(-)

-- 
2.46.0


