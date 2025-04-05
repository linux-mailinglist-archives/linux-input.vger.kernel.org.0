Return-Path: <linux-input+bounces-11544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C231CA7C7D0
	for <lists+linux-input@lfdr.de>; Sat,  5 Apr 2025 08:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B833B3942
	for <lists+linux-input@lfdr.de>; Sat,  5 Apr 2025 06:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D225569;
	Sat,  5 Apr 2025 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwG8IQfV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD018EB0;
	Sat,  5 Apr 2025 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833627; cv=none; b=Lz7crkYZdMW5UmTguIm2gYmZpliHrKC1IMn1sZ+tZxiUQIcDO9f2cSxkNEduNceEUb+TnL88vr6QwzIJbCS8Vu4+pNcfmO8sIgx2hqH+YpTsqSVMqxz1rhQ/hqDzJuM/zvVPY3NYVGwX/3I5d7GEpWKHhMrKlBlwk8w9cDSuWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833627; c=relaxed/simple;
	bh=56YJfasTV8vnQVogFUmEf7vvczfa3mxItVXwzG9KQbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OM8DObNn7X3319nU/dbmKan1TgLjp2VvgyqDxEiqO8N4jUiwPws6dOoeRYExHVgkIJ0ReljyokuPRWhvm22dr7gRKRo8KFOow6wj2VS/pPptuVrltXXoCTjg41rjjVKabqqB3AQJuthGVjp19Vv6h9ybKBrWhhPghxbLq7pB0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwG8IQfV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b350a22cso2342449b3a.1;
        Fri, 04 Apr 2025 23:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833624; x=1744438424; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euskE8pjAxrzfyE6ym9pPmGxJmax028R61ycUMVQkoU=;
        b=CwG8IQfV72oAwR61nOXTBEgXm7/ltZYswz09iR+61ZSiCkksMt346dHN5dUNNi4m71
         wVfbpzZzC0hbBlxqMnVoJRsRYrcTj5VksBzvRQtHpP9pRAHroHYK1gndIKFUVl0P+4NG
         3f8UJZySE1ZiQ1AGefOX+MDLa++vuRD+dTy6LFag1739bSKU3brLYuqJgfIEae+5+KAS
         41/R5P9Pv42JoEDYTluAjQvXPTnxeoxVojk040hz0GR+IgiesBRSIhxbsFcm1ldZo1kg
         qVBvGVm6o4gweA4/UdIDXPgkP/uIk7tDQEdFhXRo49tgxFX6oUraq/YogPAxz1RbecEp
         49VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833624; x=1744438424;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euskE8pjAxrzfyE6ym9pPmGxJmax028R61ycUMVQkoU=;
        b=OQgYtn8yPICvhZRkkAsCr68z0unoFvMovREmiRXcHf+EVjKS/xd2tXJtByOPGwDOpg
         D9hPCvt8A/Uk6R4tfSRQxa97SdDD42oxv24+FxaB9nUfN4GRlaRBBfIM2lotNJVA3tq+
         bY7+ns2KBJLxZS7UUXLKE3xyJkEUBeNYfo645ZqKK0VZPZWkQyMHhPIHiSYfCaoxdnoP
         aPJgiIcx/FsOMBktWvsTT3paNfwovAmfOJNT4hTRoskvPC5sm2UzF7eyTZ0UHcpQPDXV
         28ykF/G4y1Up8R2s+FCySkbTadYk0gvdhDeE0YKC1L3Z46cWlE1ZApfRk2ZgSutOhmd6
         t7qA==
X-Forwarded-Encrypted: i=1; AJvYcCV9zbE0aWZsCi63qEIe5YdIu2gPcLeAD7bdjI53aE+h0HyY9uq7gKfaET0k3l93FYluoZd8jNRwQwsbsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUEv+RgMGBamUQN23A+7ttyRwyXDeXdr+oGGRxFrazsvAhUiOL
	G4Y3rGToq3PVaV+FL0y/f54ezdumwaR26j+c7qf9gYbw71mEe/Zh
X-Gm-Gg: ASbGncsAJmKUai2q/4aQb0lPrFA+vRX3rJdhZqcxjfS+do/+4vKjuNg3jKHnNJNrNSt
	gIszKyzli/0BSwe+LFnSquLVNVadzk1zz5u7y41wT0QI2Dk6ZD5k3s6Z8sf9h4SxtR1Q6MP4L+e
	9IBRPkBpuMAT3OIow/yClz5C+VQxWue1HgFgmpRZvA7stsChWrR6wE5qzhs5GjIp42J9vTjHbCW
	0/d+wiT3FdDte3xtpBPRO/2LME+Nw7wHLQOqGEhxHVhL+XtD0i/5ykyuZvu8AfG7T9SiZRX/yCT
	Mucq0Vu5Z/oVteXujZdpvR3xbQG1WKd6+H/1WboBJqflcA==
X-Google-Smtp-Source: AGHT+IF0682hI7oeSNEVYzp4EjWzOxCGfPpQ6cOGwF74lif+2StyXJR40MDTMeaRpTP1xQSkoW0y7w==
X-Received: by 2002:a05:6a20:2585:b0:1f5:87ea:2a10 with SMTP id adf61e73a8af0-2010447bd76mr9132772637.9.1743833624239;
        Fri, 04 Apr 2025 23:13:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8e71:597c:7192:29ce])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35137csm3785702a12.44.2025.04.04.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:13:43 -0700 (PDT)
Date: Fri, 4 Apr 2025 23:13:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.15-rc0
Message-ID: <Z_DKFUmQJg8idRsZ@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc0

to receive updates for the input subsystem. You will get:

- a brand new driver for touchpads and touchbars in newer Apple devices

- support for Berlin-A series in goodix-berlin touchscreen driver

- improvements to matrix_keypad driver to better handle GPIOs toggling

- assorted small cleanups in other input drivers.

Changelog:
---------

Arnd Bergmann (1):
      Input: synaptics - hide unused smbus_pnp_ids[] array

Dmitry Antipov (1):
      Input: pm8941-pwrkey - fix dev_dbg() output in pm8941_pwrkey_irq()

Dmitry Torokhov (1):
      dt-bindings: input: matrix_keypad - add wakeup-source property

Hans Verkuil (1):
      Input: drop vb2_ops_wait_prepare/finish

Jens Reidel (2):
      dt-bindings: input: goodix,gt9916: Document gt9897 compatible
      Input: goodix_berlin - add support for Berlin-A series

Krzysztof Kozlowski (1):
      dt-bindings: input: Correct indentation and style in DTS example

Markus Burri (5):
      dt-bindings: input: matrix_keypad: convert to YAML
      dt-bindings: input: matrix_keypad: add settle time after enabling all columns
      Input: matrix_keypad - add settle time after enabling all columns
      Input: matrix_keypad - use fsleep for delays after activating columns
      dt-bindings: input: matrix_keypad - add missing property

Nam Cao (1):
      Input: Switch to use hrtimer_setup()

Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      Input: apple_z2 - add a driver for Apple Z2 touchscreens
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver
      Input: apple_z2 - fix potential confusion in Kconfig

Diffstat:
--------

 .../bindings/input/gpio-matrix-keypad.txt          |  49 ---
 .../bindings/input/gpio-matrix-keypad.yaml         | 103 +++++
 .../bindings/input/qcom,pm8921-keypad.yaml         |  46 +-
 .../bindings/input/qcom,pm8921-pwrkey.yaml         |  36 +-
 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 +++
 .../bindings/input/touchscreen/goodix,gt9916.yaml  |   1 +
 .../bindings/input/touchscreen/ti,ads7843.yaml     |  32 +-
 .../devicetree/bindings/power/wakeup-source.txt    |   2 +-
 MAINTAINERS                                        |   2 +
 drivers/input/joystick/walkera0701.c               |   3 +-
 drivers/input/keyboard/gpio_keys.c                 |  10 +-
 drivers/input/keyboard/matrix_keypad.c             |   8 +-
 drivers/input/misc/pm8941-pwrkey.c                 |   4 +-
 drivers/input/mouse/synaptics.c                    |   2 +
 drivers/input/rmi4/rmi_f54.c                       |   2 -
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 477 +++++++++++++++++++++
 drivers/input/touchscreen/atmel_mxt_ts.c           |   2 -
 drivers/input/touchscreen/goodix_berlin.h          |  16 +-
 drivers/input/touchscreen/goodix_berlin_core.c     |  21 +-
 drivers/input/touchscreen/goodix_berlin_i2c.c      |  14 +-
 drivers/input/touchscreen/goodix_berlin_spi.c      |  48 ++-
 drivers/input/touchscreen/sur40.c                  |   2 -
 24 files changed, 814 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 create mode 100644 drivers/input/touchscreen/apple_z2.c

Thanks.


-- 
Dmitry

