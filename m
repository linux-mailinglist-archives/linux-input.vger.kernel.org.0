Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A53459657
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 22:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239773AbhKVVD5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 16:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbhKVVD4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 16:03:56 -0500
X-Greylist: delayed 235 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Nov 2021 13:00:49 PST
Received: from lithium.sammserver.com (lithium.sammserver.com [IPv6:2a01:4f8:c2c:b7df::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45FAC061574
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 13:00:49 -0800 (PST)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 4B48131108F7;
        Mon, 22 Nov 2021 21:56:53 +0100 (CET)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
        by mail.sammserver.com (Postfix) with ESMTP id E1429144B2;
        Mon, 22 Nov 2021 21:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1637614612; bh=EV6s3ITjLg/0DmuujexvtDLX3wQ4nfOVD1qdOepkkoM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fRgcmHME76fsl0SfFfSIz5SZEZXIOOW0l7BDFfhIxQwtLgtEwa5/fTbrn6pC6cjLH
         41baYXIQCgipoDy+7z94h8LP82OhuUktDPOx30cqYyn7WtwHvKuK8xm4D2p/mSvP7+
         nV1L2NKwrWdsP5MQBmbyRy0BHMZZEg8+ZQzya020=
MIME-Version: 1.0
Date:   Mon, 22 Nov 2021 21:56:52 +0100
From:   =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] Input: i8042 - Add deferred probe support
In-Reply-To: <20211117063757.11380-1-tiwai@suse.de>
References: <20211117063757.11380-1-tiwai@suse.de>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0ffa3c3050c5a27688168702806193f4@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Takashi,

On 2021-11-17 07:37, Takashi Iwai wrote:
> [...]
> The deferred probe mode is enabled either via the new option
> i8042.probe_defer or via the quirk table entry.  As of this patch, the
> quirk table contains only ASUS ZenBook UX425UA.

I own the ASUS ZenBook UX325UA and it has the exact same problem.
Would you add it to the quirk table, or should I just submit another
patch based on this one?

The output of `dmidecode` is as follows:

     Handle 0x0001, DMI type 1, 27 bytes
     System Information
             Manufacturer: ASUSTeK COMPUTER INC.
             Product Name: ZenBook UX325UA_UM325UA

Thank you for tracking down this problem.

> 
> The deferred probe part is based on Fabio's initial work.
> 
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1190256
> Link: https://lore.kernel.org/r/s5ho890n1rh.wl-tiwai@suse.de
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Tested-by: Samuel Čavoj <samuel@cavoj.net>

Regards,
Samuel

> ---
> 
> v1->v2: Fix a typo in MODULE_PARM_DESC()
> 
>  .../admin-guide/kernel-parameters.txt         |  2 +
>  drivers/input/serio/i8042-x86ia64io.h         | 14 +++++
>  drivers/input/serio/i8042.c                   | 54 ++++++++++++-------
>  3 files changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt
> b/Documentation/admin-guide/kernel-parameters.txt
> index 9725c546a0d4..7f09fbd73245 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1689,6 +1689,8 @@
>  			architectures force reset to be always executed
>  	i8042.unlock	[HW] Unlock (ignore) the keylock
>  	i8042.kbdreset	[HW] Reset device connected to KBD port
> +	i8042.probe_defer
> +			[HW] Allow deferred probing upon i8042 probe errors
> 
>  	i810=		[HW,DRM]
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h
> b/drivers/input/serio/i8042-x86ia64io.h
> index aedd05541044..1acc7c844929 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -995,6 +995,17 @@ static const struct dmi_system_id __initconst
> i8042_dmi_kbdreset_table[] = {
>  	{ }
>  };
> 
> +static const struct dmi_system_id i8042_dmi_probe_defer_table[] 
> __initconst = {
> +	{
> +		/* ASUS ZenBook UX425UA */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA"),
> +		},
> +	},
> +	{ }
> +};
> +
>  #endif /* CONFIG_X86 */
> 
>  #ifdef CONFIG_PNP
> @@ -1315,6 +1326,9 @@ static int __init i8042_platform_init(void)
>  	if (dmi_check_system(i8042_dmi_kbdreset_table))
>  		i8042_kbdreset = true;
> 
> +	if (dmi_check_system(i8042_dmi_probe_defer_table))
> +		i8042_probe_defer = true;
> +
>  	/*
>  	 * A20 was already enabled during early kernel init. But some buggy
>  	 * BIOSes (in MSI Laptops) require A20 to be enabled using 8042 to
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 0b9f1d0a8f8b..3fc0a89cc785 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -45,6 +45,10 @@ static bool i8042_unlock;
>  module_param_named(unlock, i8042_unlock, bool, 0);
>  MODULE_PARM_DESC(unlock, "Ignore keyboard lock.");
> 
> +static bool i8042_probe_defer;
> +module_param_named(probe_defer, i8042_probe_defer, bool, 0);
> +MODULE_PARM_DESC(probe_defer, "Allow deferred probing.");
> +
>  enum i8042_controller_reset_mode {
>  	I8042_RESET_NEVER,
>  	I8042_RESET_ALWAYS,
> @@ -711,7 +715,7 @@ static int i8042_set_mux_mode(bool multiplex,
> unsigned char *mux_version)
>   * LCS/Telegraphics.
>   */
> 
> -static int __init i8042_check_mux(void)
> +static int i8042_check_mux(void)
>  {
>  	unsigned char mux_version;
> 
> @@ -740,10 +744,10 @@ static int __init i8042_check_mux(void)
>  /*
>   * The following is used to test AUX IRQ delivery.
>   */
> -static struct completion i8042_aux_irq_delivered __initdata;
> -static bool i8042_irq_being_tested __initdata;
> +static struct completion i8042_aux_irq_delivered;
> +static bool i8042_irq_being_tested;
> 
> -static irqreturn_t __init i8042_aux_test_irq(int irq, void *dev_id)
> +static irqreturn_t i8042_aux_test_irq(int irq, void *dev_id)
>  {
>  	unsigned long flags;
>  	unsigned char str, data;
> @@ -770,7 +774,7 @@ static irqreturn_t __init i8042_aux_test_irq(int
> irq, void *dev_id)
>   * verifies success by readinng CTR. Used when testing for presence of 
> AUX
>   * port.
>   */
> -static int __init i8042_toggle_aux(bool on)
> +static int i8042_toggle_aux(bool on)
>  {
>  	unsigned char param;
>  	int i;
> @@ -798,7 +802,7 @@ static int __init i8042_toggle_aux(bool on)
>   * the presence of an AUX interface.
>   */
> 
> -static int __init i8042_check_aux(void)
> +static int i8042_check_aux(void)
>  {
>  	int retval = -1;
>  	bool irq_registered = false;
> @@ -1005,7 +1009,7 @@ static int i8042_controller_init(void)
> 
>  		if (i8042_command(&ctr[n++ % 2], I8042_CMD_CTL_RCTR)) {
>  			pr_err("Can't read CTR while initializing i8042\n");
> -			return -EIO;
> +			return i8042_probe_defer ? -EPROBE_DEFER : -EIO;
>  		}
> 
>  	} while (n < 2 || ctr[0] != ctr[1]);
> @@ -1320,7 +1324,7 @@ static void i8042_shutdown(struct platform_device 
> *dev)
>  	i8042_controller_reset(false);
>  }
> 
> -static int __init i8042_create_kbd_port(void)
> +static int i8042_create_kbd_port(void)
>  {
>  	struct serio *serio;
>  	struct i8042_port *port = &i8042_ports[I8042_KBD_PORT_NO];
> @@ -1349,7 +1353,7 @@ static int __init i8042_create_kbd_port(void)
>  	return 0;
>  }
> 
> -static int __init i8042_create_aux_port(int idx)
> +static int i8042_create_aux_port(int idx)
>  {
>  	struct serio *serio;
>  	int port_no = idx < 0 ? I8042_AUX_PORT_NO : I8042_MUX_PORT_NO + idx;
> @@ -1386,13 +1390,13 @@ static int __init i8042_create_aux_port(int 
> idx)
>  	return 0;
>  }
> 
> -static void __init i8042_free_kbd_port(void)
> +static void i8042_free_kbd_port(void)
>  {
>  	kfree(i8042_ports[I8042_KBD_PORT_NO].serio);
>  	i8042_ports[I8042_KBD_PORT_NO].serio = NULL;
>  }
> 
> -static void __init i8042_free_aux_ports(void)
> +static void i8042_free_aux_ports(void)
>  {
>  	int i;
> 
> @@ -1402,7 +1406,7 @@ static void __init i8042_free_aux_ports(void)
>  	}
>  }
> 
> -static void __init i8042_register_ports(void)
> +static void i8042_register_ports(void)
>  {
>  	int i;
> 
> @@ -1443,7 +1447,7 @@ static void i8042_free_irqs(void)
>  	i8042_aux_irq_registered = i8042_kbd_irq_registered = false;
>  }
> 
> -static int __init i8042_setup_aux(void)
> +static int i8042_setup_aux(void)
>  {
>  	int (*aux_enable)(void);
>  	int error;
> @@ -1485,7 +1489,7 @@ static int __init i8042_setup_aux(void)
>  	return error;
>  }
> 
> -static int __init i8042_setup_kbd(void)
> +static int i8042_setup_kbd(void)
>  {
>  	int error;
> 
> @@ -1535,7 +1539,7 @@ static int i8042_kbd_bind_notifier(struct
> notifier_block *nb,
>  	return 0;
>  }
> 
> -static int __init i8042_probe(struct platform_device *dev)
> +static int i8042_probe(struct platform_device *dev)
>  {
>  	int error;
> 
> @@ -1600,6 +1604,7 @@ static struct platform_driver i8042_driver = {
>  		.pm	= &i8042_pm_ops,
>  #endif
>  	},
> +	.probe		= i8042_probe,
>  	.remove		= i8042_remove,
>  	.shutdown	= i8042_shutdown,
>  };
> @@ -1610,7 +1615,6 @@ static struct notifier_block
> i8042_kbd_bind_notifier_block = {
> 
>  static int __init i8042_init(void)
>  {
> -	struct platform_device *pdev;
>  	int err;
> 
>  	dbg_init();
> @@ -1626,17 +1630,29 @@ static int __init i8042_init(void)
>  	/* Set this before creating the dev to allow i8042_command to work
> right away */
>  	i8042_present = true;
> 
> -	pdev = platform_create_bundle(&i8042_driver, i8042_probe, NULL, 0, 
> NULL, 0);
> -	if (IS_ERR(pdev)) {
> -		err = PTR_ERR(pdev);
> +	err = platform_driver_register(&i8042_driver);
> +	if (err)
>  		goto err_platform_exit;
> +
> +	i8042_platform_device = platform_device_alloc("i8042", -1);
> +	if (!i8042_platform_device) {
> +		err = -ENOMEM;
> +		goto err_unregister_driver;
>  	}
> 
> +	err = platform_device_add(i8042_platform_device);
> +	if (err)
> +		goto err_free_device;
> +
>  	bus_register_notifier(&serio_bus, &i8042_kbd_bind_notifier_block);
>  	panic_blink = i8042_panic_blink;
> 
>  	return 0;
> 
> +err_free_device:
> +	platform_device_put(i8042_platform_device);
> +err_unregister_driver:
> +	platform_driver_unregister(&i8042_driver);
>   err_platform_exit:
>  	i8042_platform_exit();
>  	return err;
