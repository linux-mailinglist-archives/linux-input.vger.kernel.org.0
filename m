Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D27A9DF8C
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 09:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbfH0HzV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 03:55:21 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:51731 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730303AbfH0HzU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 03:55:20 -0400
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
        by sparta (Postfix) with ESMTP id EE15344A009E;
        Tue, 27 Aug 2019 09:57:15 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Aug 2019 09:55:18 +0200
From:   robin <robin@protonic.nl>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] input: keyboard: snvs_pwrkey: Send press and release
 event for i.MX6 S,DL and Q
In-Reply-To: <VE1PR04MB6638754916357F551502102589A00@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190823123002.10448-1-robin@protonic.nl>
 <VE1PR04MB6638754916357F551502102589A00@VE1PR04MB6638.eurprd04.prod.outlook.com>
Message-ID: <83c033a20f5f2e3ce15525a1efd072bb@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019-08-27 08:17, Robin Gong wrote:
> On Fri, Aug 23, 2019 at 02:30:02PM +0200, Robin van der Gracht wrote:>
>> The older generation i.MX6 processors send a powerdown request 
>> interrupt
>> if the powerkey is released before a hard shutdown (5 second press). 
>> This
>> should allow software to bring down the SoC safely.
>> 
>> For this driver to work as a regular powerkey with the older SoCs, we 
>> need to
>> send a keypress AND release when we get the powerdown request 
>> interrupt.
> Please clarify here more clearly that because there is NO press
> interrupt triggered
> but only release interrupt on elder i.mx6 processors and that HW issue
> fixed from
> i.mx6sx.

ACK

>> 
>> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
>> ---
>>  arch/arm/boot/dts/imx6qdl.dtsi       |  2 +-
>>  arch/arm/boot/dts/imx6sll.dtsi       |  2 +-
>>  arch/arm/boot/dts/imx6sx.dtsi        |  2 +-
>>  arch/arm/boot/dts/imx6ul.dtsi        |  2 +-
>>  arch/arm/boot/dts/imx7s.dtsi         |  2 +-
> As Shawn talked, please keep the original "fsl,sec-v4.0-pwrkey", just 
> add
> 'imx6qdl-snvs-pwrkey' for elder i.mx6 processor i.mx6q/dl/sl, thus no 
> need
> to touch other newer processor's dts.

ACK

> 
>> 
>>  static void imx_imx_snvs_check_for_events(struct timer_list *t) @@ 
>> -67,13
>> +85,23 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void
>> *dev_id)  {
>>  	struct platform_device *pdev = dev_id;
>>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
>> +	struct input_dev *input = pdata->input;
>>  	u32 lp_status;
>> 
>> -	pm_wakeup_event(pdata->input->dev.parent, 0);
>> +	pm_wakeup_event(input->dev.parent, 0);
>> 
>>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
>> -	if (lp_status & SNVS_LPSR_SPO)
>> -		mod_timer(&pdata->check_timer, jiffies +
>> msecs_to_jiffies(DEBOUNCE_TIME));
>> +	if (lp_status & SNVS_LPSR_SPO) {
>> +		if (pdata->hwtype == IMX6QDL_SNVS) {
>> +			input_report_key(input, pdata->keycode, 1);
>> +			input_report_key(input, pdata->keycode, 0);
>> +			input_sync(input);
>> +			pm_relax(input->dev.parent);
> Could you move the above input event report steps into
> imx_imx_snvs_check_for_events()
> as before? That make code better to understand and less operation in 
> ISR.

I placed it here to avoid the unnessesairy debounce delay (since thats 
already
implemented in hardware).

I do agree with your arguments so I'll move emitting the events to
imx_imx_snvs_check_for_events().

Is it ok if I keep the conditional, but instead of emitting the events,
schedule imx_imx_snvs_check_for_events() immidiatly to avoid the 
debounce,
or should I choose clarity over the 30 ms delay?

>> +		} else {
>> +			mod_timer(&pdata->check_timer,
>> +				jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
>> +		}
>> +	}
>> 
>>  	/* clear SPO status */
>>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO); @@
>> -88,11 +116,24 @@ static void imx_snvs_pwrkey_act(void *pdata)
>>  	del_timer_sync(&pd->check_timer);
>>  }
>> 
>> +static const struct of_device_id imx_snvs_pwrkey_ids[] = {
>> +	{
>> +		.compatible = "fsl,imx6sx-sec-v4.0-pwrkey",
>> +		.data = &imx_snvs_devtype[IMX6SX_SNVS],
>> +	}, {
>> +		.compatible = "fsl,imx6qdl-sec-v4.0-pwrkey",
>> +		.data = &imx_snvs_devtype[IMX6QDL_SNVS],
> No ' IMX6QDL_SNVS ' defined in your patch or am I missing?

I added an enum 'imx_snvs_hwtype' that defines both IMX6SX_SNVS and 
IMX6QDL_SNVS.

>> +	},
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
>> --
>> 2.20.1
