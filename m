Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51C3214BF6
	for <lists+linux-input@lfdr.de>; Sun,  5 Jul 2020 13:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGELRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jul 2020 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgGELRU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Jul 2020 07:17:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7CFC061794
        for <linux-input@vger.kernel.org>; Sun,  5 Jul 2020 04:17:20 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1js2di-0003OU-Ky; Sun, 05 Jul 2020 13:16:54 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1js2dc-0005lJ-JB; Sun, 05 Jul 2020 13:16:48 +0200
Date:   Sun, 5 Jul 2020 13:16:48 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, corbet@lwn.net,
        marcus.folkesson@gmail.com, rydberg@bitmath.org,
        Henk.Vergonet@gmail.com, andriy.shevchenko@linux.intel.com,
        lee.jones@linaro.org, arnd@arndb.de, krzk@kernel.org,
        ronald@innovation.ch, christophe.jaillet@wanadoo.fr,
        jeff@labundy.com, Anson.Huang@nxp.com, swboyd@chromium.org,
        luzmaximilian@gmail.com, linus.walleij@linaro.org,
        masneyb@onstation.org, ben.dooks@codethink.co.uk,
        megous@megous.com, a.fatoum@pengutronix.de, p.zabel@pengutronix.de,
        mylene.josserand@bootlin.com, oneukum@suse.com,
        james.hilliard1@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, usbb2k-api-dev@nongnu.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: input drivers
Message-ID: <20200705111648.GA9801@pengutronix.de>
References: <20200705074959.22533-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705074959.22533-1-grandmaster@al2klimov.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:15:19 up 134 days, 22:32, 236 users,  load average: 11.83,
 10.21, 9.64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexander,

thanks for the patch.

On 20-07-05 09:49, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

for the "edt-ft5x06":

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de> 

> ---
>  Continuing my work started at 93431e0607e5.
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See https://lkml.org/lkml/2020/6/26/837
> 
>  .../devicetree/bindings/input/ps2keyb-mouse-apbps2.txt        | 2 +-
>  .../devicetree/bindings/input/rmi4/rmi_2d_sensor.txt          | 2 +-
>  Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt      | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv260x.txt        | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv2665.txt        | 2 +-
>  Documentation/devicetree/bindings/input/ti,drv2667.txt        | 2 +-
>  Documentation/input/devices/appletouch.rst                    | 2 +-
>  Documentation/input/devices/bcm5974.rst                       | 4 ++--
>  Documentation/input/devices/iforce-protocol.rst               | 2 +-
>  Documentation/input/devices/joystick-parport.rst              | 2 +-
>  Documentation/input/devices/ntrig.rst                         | 2 +-
>  Documentation/input/devices/pxrc.rst                          | 2 +-
>  Documentation/input/multi-touch-protocol.rst                  | 2 +-
>  drivers/input/keyboard/Kconfig                                | 2 +-
>  drivers/input/keyboard/lkkbd.c                                | 2 +-
>  drivers/input/keyboard/opencores-kbd.c                        | 2 +-
>  drivers/input/keyboard/tca8418_keypad.c                       | 2 +-
>  drivers/input/misc/Kconfig                                    | 2 +-
>  drivers/input/misc/cm109.c                                    | 2 +-
>  drivers/input/misc/gpio_decoder.c                             | 2 +-
>  drivers/input/misc/palmas-pwrbutton.c                         | 2 +-
>  drivers/input/misc/powermate.c                                | 2 +-
>  drivers/input/misc/tps65218-pwrbutton.c                       | 2 +-
>  drivers/input/misc/yealink.c                                  | 2 +-
>  drivers/input/mouse/vsxxxaa.c                                 | 2 +-
>  drivers/input/serio/apbps2.c                                  | 2 +-
>  drivers/input/touchscreen/edt-ft5x06.c                        | 2 +-
>  drivers/input/touchscreen/iqs5xx.c                            | 2 +-
>  drivers/input/touchscreen/mc13783_ts.c                        | 2 +-
>  drivers/input/touchscreen/ti_am335x_tsc.c                     | 2 +-
>  drivers/input/touchscreen/usbtouchscreen.c                    | 2 +-
>  include/uapi/linux/input-event-codes.h                        | 2 +-
>  32 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/ps2keyb-mouse-apbps2.txt b/Documentation/devicetree/bindings/input/ps2keyb-mouse-apbps2.txt
> index 3029c5694cf6..4606b07317ff 100644
> --- a/Documentation/devicetree/bindings/input/ps2keyb-mouse-apbps2.txt
> +++ b/Documentation/devicetree/bindings/input/ps2keyb-mouse-apbps2.txt
> @@ -13,4 +13,4 @@ Required properties:
>  - interrupts : Interrupt numbers for this device
>  
>  For further information look in the documentation for the GLIB IP core library:
> -http://www.gaisler.com/products/grlib/grip.pdf
> +https://www.gaisler.com/products/grlib/grip.pdf
> diff --git a/Documentation/devicetree/bindings/input/rmi4/rmi_2d_sensor.txt b/Documentation/devicetree/bindings/input/rmi4/rmi_2d_sensor.txt
> index 9afffbdf6e28..f0906e90cb35 100644
> --- a/Documentation/devicetree/bindings/input/rmi4/rmi_2d_sensor.txt
> +++ b/Documentation/devicetree/bindings/input/rmi4/rmi_2d_sensor.txt
> @@ -9,7 +9,7 @@ Documentation/devicetree/bindings/input/rmi4.
>  
>  RMI4 Function 11 and Function 12 are for 2D touch position sensing.
>  Additional documentation for F11 can be found at:
> -http://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Interfacing-Guide.pdf
> +https://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Interfacing-Guide.pdf
>  
>  Optional Touch Properties:
>  Description in Documentation/devicetree/bindings/input/touchscreen
> diff --git a/Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt b/Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt
> index 079cad2b6843..23186fce40a1 100644
> --- a/Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt
> +++ b/Documentation/devicetree/bindings/input/rmi4/rmi_f01.txt
> @@ -7,7 +7,7 @@ for transports and other functions can be found in:
>  Documentation/devicetree/bindings/input/rmi4.
>  
>  Additional documentation for F01 can be found at:
> -http://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Interfacing-Guide.pdf
> +https://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Interfacing-Guide.pdf
>  
>  Optional Properties:
>  - syna,nosleep-mode: If set the device will run at full power without sleeping.
> diff --git a/Documentation/devicetree/bindings/input/ti,drv260x.txt b/Documentation/devicetree/bindings/input/ti,drv260x.txt
> index 4c5312eaaa85..5dd745946b22 100644
> --- a/Documentation/devicetree/bindings/input/ti,drv260x.txt
> +++ b/Documentation/devicetree/bindings/input/ti,drv260x.txt
> @@ -47,4 +47,4 @@ haptics: haptics@5a {
>  }
>  
>  For more product information please see the link below:
> -http://www.ti.com/product/drv2605
> +https://www.ti.com/product/drv2605
> diff --git a/Documentation/devicetree/bindings/input/ti,drv2665.txt b/Documentation/devicetree/bindings/input/ti,drv2665.txt
> index 1ba97ac04305..5bc229895626 100644
> --- a/Documentation/devicetree/bindings/input/ti,drv2665.txt
> +++ b/Documentation/devicetree/bindings/input/ti,drv2665.txt
> @@ -14,4 +14,4 @@ haptics: haptics@59 {
>  };
>  
>  For more product information please see the link below:
> -http://www.ti.com/product/drv2665
> +https://www.ti.com/product/drv2665
> diff --git a/Documentation/devicetree/bindings/input/ti,drv2667.txt b/Documentation/devicetree/bindings/input/ti,drv2667.txt
> index 996382cf994a..b1d1308a14c0 100644
> --- a/Documentation/devicetree/bindings/input/ti,drv2667.txt
> +++ b/Documentation/devicetree/bindings/input/ti,drv2667.txt
> @@ -14,4 +14,4 @@ haptics: haptics@59 {
>  };
>  
>  For more product information please see the link below:
> -http://www.ti.com/product/drv2667
> +https://www.ti.com/product/drv2667
> diff --git a/Documentation/input/devices/appletouch.rst b/Documentation/input/devices/appletouch.rst
> index c94470e66533..b0f84700141d 100644
> --- a/Documentation/input/devices/appletouch.rst
> +++ b/Documentation/input/devices/appletouch.rst
> @@ -89,6 +89,6 @@ or::
>  
>  .. Links:
>  
> -.. [#f1] http://johannes.sipsolutions.net/PowerBook/touchpad/
> +.. [#f1] https://johannes.sipsolutions.net/PowerBook/touchpad/
>  
>  .. [#f2] `<http://web.archive.org/web/*/http://web.telia.com/~u89404340/touchpad/index.html>`_
> diff --git a/Documentation/input/devices/bcm5974.rst b/Documentation/input/devices/bcm5974.rst
> index 4aca199b0aa6..22cc112819f0 100644
> --- a/Documentation/input/devices/bcm5974.rst
> +++ b/Documentation/input/devices/bcm5974.rst
> @@ -66,5 +66,5 @@ a more permanent home at bitmath.org [#f2]_.
>  
>  .. Links
>  
> -.. [#f1] http://ubuntuforums.org/showthread.php?t=840040
> -.. [#f2] http://bitmath.org/code/
> +.. [#f1] https://ubuntuforums.org/showthread.php?t=840040
> +.. [#f2] https://bitmath.org/code/
> diff --git a/Documentation/input/devices/iforce-protocol.rst b/Documentation/input/devices/iforce-protocol.rst
> index 8634beac3fdb..c4b3c13e593b 100644
> --- a/Documentation/input/devices/iforce-protocol.rst
> +++ b/Documentation/input/devices/iforce-protocol.rst
> @@ -375,7 +375,7 @@ URLS
>  ====
>  
>  Check http://www.immerse.com for Immersion Studio,
> -and http://www.fcoder.com for ComPortSpy.
> +and https://www.fcoder.com for ComPortSpy.
>  
>  
>  I-Force is trademark of Immersion Corp.
> diff --git a/Documentation/input/devices/joystick-parport.rst b/Documentation/input/devices/joystick-parport.rst
> index e8ce16ee799a..e4b50a0a8ecb 100644
> --- a/Documentation/input/devices/joystick-parport.rst
> +++ b/Documentation/input/devices/joystick-parport.rst
> @@ -324,7 +324,7 @@ since this doesn't work reliably on all parallel ports, the turbografx.c driver
>  supports only one button per joystick. For more information on how to build the
>  interface, see:
>  
> -	http://www2.burg-halle.de/~schwenke/parport.html
> +	https://www2.burg-halle.de/~schwenke/parport.html
>  
>  Sony Playstation
>  ----------------
> diff --git a/Documentation/input/devices/ntrig.rst b/Documentation/input/devices/ntrig.rst
> index a6b22ce6c61c..85c98ba1c31b 100644
> --- a/Documentation/input/devices/ntrig.rst
> +++ b/Documentation/input/devices/ntrig.rst
> @@ -127,7 +127,7 @@ Calibration
>  The N-Trig windows tools provide calibration and testing routines.  Also an
>  unofficial unsupported set of user space tools including a calibrator is
>  available at:
> -http://code.launchpad.net/~rafi-seas/+junk/ntrig_calib
> +https://code.launchpad.net/~rafi-seas/+junk/ntrig_calib
>  
>  
>  Tracking
> diff --git a/Documentation/input/devices/pxrc.rst b/Documentation/input/devices/pxrc.rst
> index ca11f646bae8..b8ab08ffae8c 100644
> --- a/Documentation/input/devices/pxrc.rst
> +++ b/Documentation/input/devices/pxrc.rst
> @@ -53,5 +53,5 @@ To print all input events from input `devnr`.
>  References
>  ==========
>  
> -.. [1] http://www.phoenix-sim.com/
> +.. [1] https://www.phoenix-sim.com/
>  .. [2] https://www.kraxel.org/cgit/input/
> diff --git a/Documentation/input/multi-touch-protocol.rst b/Documentation/input/multi-touch-protocol.rst
> index 307fe22d9668..db83ca3b44cf 100644
> --- a/Documentation/input/multi-touch-protocol.rst
> +++ b/Documentation/input/multi-touch-protocol.rst
> @@ -406,6 +406,6 @@ subsequent events of the same type refer to different fingers.
>  
>  .. [#f1] Also, the difference (TOOL_X - POSITION_X) can be used to model tilt.
>  .. [#f2] The list can of course be extended.
> -.. [#f3] The mtdev project: http://bitmath.org/code/mtdev/.
> +.. [#f3] The mtdev project: https://bitmath.org/code/mtdev/.
>  .. [#f4] See the section on event computation.
>  .. [#f5] See the section on finger tracking.
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 793ecbbda32c..c88576c2b2bc 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -521,7 +521,7 @@ config KEYBOARD_OPENCORES
>  	depends on HAS_IOMEM
>  	help
>  	  Say Y here if you want to use the OpenCores Keyboard Controller
> -	  http://www.opencores.org/project,keyboardcontroller
> +	  https://www.opencores.org/project,keyboardcontroller
>  
>  	  To compile this driver as a module, choose M here; the
>  	  module will be called opencores-kbd.
> diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
> index e4a1839ca934..92fe4cbafcd4 100644
> --- a/drivers/input/keyboard/lkkbd.c
> +++ b/drivers/input/keyboard/lkkbd.c
> @@ -43,7 +43,7 @@
>   * has. These need to be switched on with the LK_CMD_ENABLE_LK401
>   * command. You'll find this document (scanned .pdf file) on MANX,
>   * a search engine specific to DEC documentation. Try
> - * http://www.vt100.net/manx/details?pn=EK-104AA-TM-001;id=21;cp=1
> + * https://www.vt100.net/manx/details?pn=EK-104AA-TM-001;id=21;cp=1
>   */
>  
>  /*
> diff --git a/drivers/input/keyboard/opencores-kbd.c b/drivers/input/keyboard/opencores-kbd.c
> index b0ea387414c1..692b4afba7b1 100644
> --- a/drivers/input/keyboard/opencores-kbd.c
> +++ b/drivers/input/keyboard/opencores-kbd.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * OpenCores Keyboard Controller Driver
> - * http://www.opencores.org/project,keyboardcontroller
> + * https://www.opencores.org/project,keyboardcontroller
>   *
>   * Copyright 2007-2009 HV Sistemas S.L.
>   */
> diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
> index 3bbd7e652533..58ae9744e321 100644
> --- a/drivers/input/keyboard/tca8418_keypad.c
> +++ b/drivers/input/keyboard/tca8418_keypad.c
> @@ -20,7 +20,7 @@
>   * Boston, MA 021110-1307, USA.
>   *
>   * If you can't comply with GPLv2, alternative licensing terms may be
> - * arranged. Please contact Fuel7, Inc. (http://fuel7.com/) for proprietary
> + * arranged. Please contact Fuel7, Inc. (https://fuel7.com/) for proprietary
>   * alternative licensing inquiries.
>   */
>  
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 362e8a01980c..9c0c95398ba2 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -394,7 +394,7 @@ config INPUT_POWERMATE
>  	  which can be instructed to pulse or to switch to a particular intensity.
>  
>  	  You can download userspace tools from
> -	  <http://sowerbutts.com/powermate/>.
> +	  <https://sowerbutts.com/powermate/>.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called powermate.
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index c09b9628ad34..60aed8a36f8a 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -258,7 +258,7 @@ static unsigned short keymap_usbph01(int scancode)
>   * Keymap for ATCom AU-100
>   * http://www.atcom.cn/products.html 
>   * http://www.packetizer.com/products/au100/
> - * http://www.voip-info.org/wiki/view/AU-100
> + * https://www.voip-info.org/wiki/view/AU-100
>   *
>   * Contributed by daniel@gimpelevich.san-francisco.ca.us
>   */
> diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
> index 145826a1a9a1..b77bffd6fdd2 100644
> --- a/drivers/input/misc/gpio_decoder.c
> +++ b/drivers/input/misc/gpio_decoder.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
> index 1e1baed63929..2a624f091546 100644
> --- a/drivers/input/misc/palmas-pwrbutton.c
> +++ b/drivers/input/misc/palmas-pwrbutton.c
> @@ -1,7 +1,7 @@
>  /*
>   * Texas Instruments' Palmas Power Button Input Driver
>   *
> - * Copyright (C) 2012-2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2012-2014 Texas Instruments Incorporated - https://www.ti.com/
>   *	Girish S Ghongdemath
>   *	Nishanth Menon
>   *
> diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
> index c4e0e1886061..8d88a528eed9 100644
> --- a/drivers/input/misc/powermate.c
> +++ b/drivers/input/misc/powermate.c
> @@ -25,7 +25,7 @@
>   *
>   * Griffin were very happy to provide documentation and free hardware for development.
>   *
> - * Some userspace tools are available on the web: http://sowerbutts.com/powermate/
> + * Some userspace tools are available on the web: https://sowerbutts.com/powermate/
>   *
>   */
>  
> diff --git a/drivers/input/misc/tps65218-pwrbutton.c b/drivers/input/misc/tps65218-pwrbutton.c
> index f011447c44fb..9aa948614c92 100644
> --- a/drivers/input/misc/tps65218-pwrbutton.c
> +++ b/drivers/input/misc/tps65218-pwrbutton.c
> @@ -1,7 +1,7 @@
>  /*
>   * Texas Instruments' TPS65217 and TPS65218 Power Button Input Driver
>   *
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Felipe Balbi <balbi@ti.com>
>   * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
>   *
> diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
> index 8ab01c7601b1..71e393b85939 100644
> --- a/drivers/input/misc/yealink.c
> +++ b/drivers/input/misc/yealink.c
> @@ -14,7 +14,7 @@
>   *	- ...
>   *
>   * This driver is based on:
> - *   - the usbb2k-api	http://savannah.nongnu.org/projects/usbb2k-api/
> + *   - the usbb2k-api	https://savannah.nongnu.org/projects/usbb2k-api/
>   *   - information from	http://memeteau.free.fr/usbb2k
>   *   - the xpad-driver	drivers/input/joystick/xpad.c
>   *
> diff --git a/drivers/input/mouse/vsxxxaa.c b/drivers/input/mouse/vsxxxaa.c
> index bd415f4b574e..8836c31bd50e 100644
> --- a/drivers/input/mouse/vsxxxaa.c
> +++ b/drivers/input/mouse/vsxxxaa.c
> @@ -61,7 +61,7 @@
>   * The mice and tablet are described in "VCB02 Video Subsystem - Technical
>   * Manual", DEC EK-104AA-TM-001. You'll find it at MANX, a search engine
>   * specific for DEC documentation. Try
> - * http://www.vt100.net/manx/details?pn=EK-104AA-TM-001;id=21;cp=1
> + * https://www.vt100.net/manx/details?pn=EK-104AA-TM-001;id=21;cp=1
>   */
>  
>  #include <linux/delay.h>
> diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
> index 594ac4e6f8ea..e45a4b5e651b 100644
> --- a/drivers/input/serio/apbps2.c
> +++ b/drivers/input/serio/apbps2.c
> @@ -6,7 +6,7 @@
>   * VHDL IP core library.
>   *
>   * Full documentation of the APBPS2 core can be found here:
> - * http://www.gaisler.com/products/grlib/grip.pdf
> + * https://www.gaisler.com/products/grlib/grip.pdf
>   *
>   * See "Documentation/devicetree/bindings/input/ps2keyb-mouse-apbps2.txt" for
>   * information on open firmware properties.
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 3a4f18d3450d..ea0c78bff74b 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -10,7 +10,7 @@
>   * based on the FocalTech FT5x06 line of chips.
>   *
>   * Development of this driver has been sponsored by Glyn:
> - *    http://www.glyn.com/Products/Displays
> + *    https://www.glyn.com/Products/Displays
>   */
>  
>  #include <linux/debugfs.h>
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index 5875bb1099a8..515218c3ac00 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -9,7 +9,7 @@
>   * made available by the vendor. Firmware files may be pushed to the device's
>   * nonvolatile memory by writing the filename to the 'fw_file' sysfs control.
>   *
> - * Link to PC-based configuration tool and data sheet: http://www.azoteq.com/
> + * Link to PC-based configuration tool and data sheet: https://www.azoteq.com/
>   */
>  
>  #include <linux/delay.h>
> diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
> index ae0d978c83bf..c422af33d2fb 100644
> --- a/drivers/input/touchscreen/mc13783_ts.c
> +++ b/drivers/input/touchscreen/mc13783_ts.c
> @@ -6,7 +6,7 @@
>   * Copyright (C) 2009 Sascha Hauer, Pengutronix
>   *
>   * Initial development of this code was funded by
> - * Phytec Messtechnik GmbH, http://www.phytec.de/
> + * Phytec Messtechnik GmbH, https://www.phytec.de/
>   */
>  #include <linux/platform_device.h>
>  #include <linux/mfd/mc13783.h>
> diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
> index 83e685557a19..25173d729b13 100644
> --- a/drivers/input/touchscreen/ti_am335x_tsc.c
> +++ b/drivers/input/touchscreen/ti_am335x_tsc.c
> @@ -1,7 +1,7 @@
>  /*
>   * TI Touch Screen driver
>   *
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 397cb1d3f481..5c55e18f0d3d 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -665,7 +665,7 @@ static int gunze_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
>   *
>   * Documentation about the controller and it's protocol can be found at
>   *   http://www.dmccoltd.com/files/controler/tsc10usb_pi_e.pdf
> - *   http://www.dmccoltd.com/files/controler/tsc25_usb_e.pdf
> + *   https://www.dmccoltd.com/files/controler/tsc25_usb_e.pdf
>   */
>  #ifdef CONFIG_TOUCHSCREEN_USB_DMC_TSC10
>  
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index b6a835d37826..4e62d4941ea7 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -65,7 +65,7 @@
>   * Keys and buttons
>   *
>   * Most of the keys/buttons are modeled after USB HUT 1.12
> - * (see http://www.usb.org/developers/hidpage).
> + * (see https://www.usb.org/developers/hidpage).
>   * Abbreviations in the comments:
>   * AC - Application Control
>   * AL - Application Launch Button
> -- 
> 2.27.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
