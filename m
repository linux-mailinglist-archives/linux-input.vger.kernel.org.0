Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB539B190B
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 09:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbfIMHj1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Sep 2019 03:39:27 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:42140 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728666AbfIMHj1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Sep 2019 03:39:27 -0400
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
        by sparta (Postfix) with ESMTP id DA51D44A00CB;
        Fri, 13 Sep 2019 09:41:27 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Sep 2019 09:39:26 +0200
From:   robin <robin@protonic.nl>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        RobinGong <yibin.gong@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
In-Reply-To: <20190904065248.4i7q2vuxxt2xdnrr@pengutronix.de>
References: <20190904062329.97520-1-robin@protonic.nl>
 <20190904065248.4i7q2vuxxt2xdnrr@pengutronix.de>
Message-ID: <f12945994b66c5e605c0a121e7ad0526@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019-09-04 08:52, Marco Felsch wrote:
> Hi Robin,
> 
> thanks for the patch it looks quite good, just two minor nitpicks.
> 
> On 19-09-04 06:23, Robin van der Gracht wrote:
>> The first generation i.MX6 processors does not send an interrupt when 
>> the
>> power key is pressed. It sends a power down request interrupt if the 
>> key is
>> released before a hard shutdown (5 second press). This should allow
>> software to bring down the SoC safely.
>> 
>> For this driver to work as a regular power key with the older SoCs, we 
>> need
>> to send a keypress AND release when we get the power down request irq.
>> 
>> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
>> ---
>> 
>> Changes v2 -> v3:
>>  - Drop alt compatible string for identifying first revision snvs 
>> hardware,
>>    read minor revision from register instead.
>>  - Drop imx6qdl.dtsi modification and device-tree binding 
>> documentation.
>>  - Add an additional input_sync() to create 2 seperate input reports 
>> for press
>>    and release.
>> 
>>  drivers/input/keyboard/Kconfig       |  2 +-
>>  drivers/input/keyboard/snvs_pwrkey.c | 28 
>> ++++++++++++++++++++++++++--
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/input/keyboard/Kconfig 
>> b/drivers/input/keyboard/Kconfig
>> index 7c4f19dab34f..937e58da5ce1 100644
>> --- a/drivers/input/keyboard/Kconfig
>> +++ b/drivers/input/keyboard/Kconfig
>> @@ -436,7 +436,7 @@ config KEYBOARD_SNVS_PWRKEY
>>  	depends on OF
>>  	help
>>  	  This is the snvs powerkey driver for the Freescale i.MX 
>> application
>> -	  processors that are newer than i.MX6 SX.
>> +	  processors.
>> 
>>  	  To compile this driver as a module, choose M here; the
>>  	  module will be called snvs_pwrkey.
>> diff --git a/drivers/input/keyboard/snvs_pwrkey.c 
>> b/drivers/input/keyboard/snvs_pwrkey.c
>> index 5342d8d45f81..828580eee0d2 100644
>> --- a/drivers/input/keyboard/snvs_pwrkey.c
>> +++ b/drivers/input/keyboard/snvs_pwrkey.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/mfd/syscon.h>
>>  #include <linux/regmap.h>
>> 
>> +#define SNVS_HPVIDR1_REG 0xF8
>>  #define SNVS_LPSR_REG	0x4C	/* LP Status Register */
>>  #define SNVS_LPCR_REG	0x38	/* LP Control Register */
>>  #define SNVS_HPSR_REG	0x14
>> @@ -37,6 +38,7 @@ struct pwrkey_drv_data {
>>  	int wakeup;
>>  	struct timer_list check_timer;
>>  	struct input_dev *input;
>> +	u8 minor_rev;
>>  };
>> 
>>  static void imx_imx_snvs_check_for_events(struct timer_list *t)
>> @@ -45,6 +47,20 @@ static void imx_imx_snvs_check_for_events(struct 
>> timer_list *t)
>>  	struct input_dev *input = pdata->input;
>>  	u32 state;
>> 
>> +	if (pdata->minor_rev == 0) {
> 
> Should we use a define here and ..
> 
>> +		/*
>> +		 * The first generation i.MX6 SoCs only sends an interrupt on
>> +		 * button release. To mimic power-key usage, we'll prepend a
>> +		 * press event.
>> +		 */
>> +		input_report_key(input, pdata->keycode, 1);
>> +		input_sync(input);
>> +		input_report_key(input, pdata->keycode, 0);
>> +		input_sync(input);
>> +		pm_relax(input->dev.parent);
>> +		return;
>> +	}
>> +
>>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
>>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>> 
>> @@ -67,13 +83,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int 
>> irq, void *dev_id)
>>  {
>>  	struct platform_device *pdev = dev_id;
>>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
>> +	unsigned long expire = jiffies;
>>  	u32 lp_status;
>> 
>>  	pm_wakeup_event(pdata->input->dev.parent, 0);
>> 
>>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
>> -	if (lp_status & SNVS_LPSR_SPO)
>> -		mod_timer(&pdata->check_timer, jiffies + 
>> msecs_to_jiffies(DEBOUNCE_TIME));
>> +	if (lp_status & SNVS_LPSR_SPO) {
>> +		if (pdata->minor_rev > 0)
> 
> here? Just a nitpick, feel free to add/drop it.

Like a Macro?

#define FIRST_HW_REV(pdata)      (pdata->minor_rev == 0)

if (FIRST_HW_REV(pdata) {
         ...
}


or just a define to identify the minor rev used for the first hw 
revision


#define FIRST_HW_MINOR_REV       0

if (pdata->minor_rev == FIRST_HW_MINOR_REV) {
         ...
}

Regards,
Robin van der Gracht
