Return-Path: <linux-input+bounces-13707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD910B148D8
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 09:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A391773C6
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 07:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814282609C5;
	Tue, 29 Jul 2025 06:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="aIjsvwdc"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AC625FA3B;
	Tue, 29 Jul 2025 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772375; cv=none; b=L4Y6ytbwMgtCIO98epGzC4YZ/6ovOULcl6ZOs3z8S7N/d8J3EYGjQ+pkfjPD/M/xwKMMFZUtObggpB6FStUIJCsW/GqAqw+ZPjK4mnJjRZntDw7sbWcuGExBYEoHyUjgrD3JlygcanAtrnntCnyTp4xLFEjx+x0dsiSqzMZQNNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772375; c=relaxed/simple;
	bh=WEOqr16sN9e6HRIuTCf+ERPONNBlWmnB0ePJkFlAgso=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=s5zwxWueng86N3ecxwb5g7oAVxaBsahfsmaI/jHB4NNkYBtF7oTFHZr1Q24x85rI6+2y7KcnBH+K+PWgjFiPA9K0uGIy/qu8hNYQi0UaAvq8zpX0sZeX/eSsJ5KWbCaQWBb7kU7HUKPiC2xUDRXPcOEIxm0N/KfT3E3teptPnW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=aIjsvwdc; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=QGi7+DNLazKOUrsGPzNpTheJk2j2X0jZgoyM7g6naBI=;
	b=aIjsvwdcFvHb8EX1FtDfrGXVWE81tfmxa9Fqisyq7dQGSrYBln2DCQN/WYfHx8
	uh+lC+wIHFH+BHXWAWW6s2AHhJhXpNJHXbsxhDwyr09/yLLSYUsVF98HFv9YG1Mi
	fexaCrDy0lIBzU1H+nwJ1i1xtRr2q7ZSWg1xeeHqjXtM4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgCnjwClbYhou7D5Ag--.23794S4;
	Tue, 29 Jul 2025 14:43:51 +0800 (CST)
From: marlonwu@126.com
To: robh@kernel.org,
	dmitry.torokhov@gmail.com,
	krzk+dt@kernel.org
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	marlonwu@126.com,
	MenglongWoo@aliyun.com
Subject: [PATCH 0/2] Register virtual GPIO keys for VNC
Date: Tue, 29 Jul 2025 14:43:44 +0800
Message-Id: <20250729064346.22834-1-marlonwu@126.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCkvCgCnjwClbYhou7D5Ag--.23794S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjYFCUUUUU
X-CM-SenderInfo: xpduz0xqzxqiyswou0bp/1tbiJxeZDWiIYmE+QQABs5

From: Menglong Wu <marlonwu@126.com>

Test platform
-------------
Kernel: 4.14.98
Rootfs: BusyBox 1.29
QT: 4.7
x11vnc: 0.9.16

Purpose
-------------

To emulate a full ANSI keyboard on embedded devices without physical 
keyboards.
The server responds to key events via x11vnc.
This resolves the limitation where embedded systems only register a few 
GPIO keys, making them unable to process full keyboard inputs.

documented in Documentation/devicetree/bindings/input/vnc-virtual-input.yaml

Scenario
-------------

- /dev/input/event1: Physical GPIO buttons

- /dev/input/event2: Physical touchscreen

Assume my-pcb.dts defines two GPIO-based hardware keys (A and B).
When the VNC server x11vnc is started, a remote PC connects via a VNC 
client and attempts to send key inputs.
Since the Linux kernel only recognizes two keys, the UI on the embedded 
device only responds to ‘A’ and ‘B’.

Start x11vnc server:

```
    x11vnc -noipv6 -rawfb /dev/fb0 -forever -clip 640x480+0+0 \
      -pipeinput UINPUT:touch,tslib_cal=/etc/pointercal,\
      direct_key=/dev/input/event1,\
      direct_abs=/dev/input/event2
```

Monitor key events:

```
    hexdump /dev/input/event1
```

Original my-pcb.dts:


```
    gpio_keys {
        compatible = "gpio-keys";
        pinctrl-0 = <&pinctrl_gpio_keys>;

        key-a {
            label = "btn-key-a";
            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
            linux,code = <KEY_A>;
        };
        key-b {
            label = "btn-key-b";
            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
            linux,code = <KEY_A>;
        };
    };
```


Solution
-------------

Modify my-pcb.dts to support a virtual ANSI keyboard:

```
    #include "vnc-virtual-input.dtsi"

    // Originally, the DTS relied on physical GPIO keys
    gpio_keys {
        // Disable the original physical key node
        status = "disable";
    };

    // The virtual GPIO DTS node now integrates physical GPIO
    vnc_key {
        compatible = "gpio-keys";
        pinctrl-0 = <&pinctrl_gpio_keys>;
        
        key-a {
            label = "btn-key-a";
            gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
            linux,code = <KEY_A>;
        };
        key-b {
            label = "btn-key-b";
            gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
            linux,code = <KEY_A>;
        };
    }
```
Menglong Wu (2):
  dt-bindings vnc virtual input
  ARM: dts: Add virtual GPIO input for VNC keyboard

 .../bindings/input/vnc-virtual-input.txt      | 153 +++++
 .../bindings/input/vnc-virtual-input.yaml     |  86 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/vnc-virtual-input.dtsi      | 569 ++++++++++++++++++
 4 files changed, 816 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.txt
 create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
 create mode 100644 arch/arm/boot/dts/vnc-virtual-input.dtsi

-- 
2.39.5


