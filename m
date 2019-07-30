Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F247A408
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 11:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731024AbfG3JZx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 05:25:53 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:33884 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728824AbfG3JZx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 05:25:53 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id AC3D9A032B;
        Tue, 30 Jul 2019 11:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1564478749;
        bh=HkjoLCTjtuSvqIjB9cid7yZHT71pFrpnBbJeOrHKMpk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jzDybORPa1y0ZAwlMTe1f4Rosu/nt2ti+ir9cU7eJEbuRKN+Lmkg8FAlt/T88wFlx
         u07BezZtDeLMMVO0Nr50Ty+BGDrE8zELxWxWnQicDzGEGaMSTM8zHx6NE2OYFRjJU7
         p00QAz4nlmfi3rn0U57clnx7yjuNnx1hC9CH7QpE=
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
 <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
 <20190725085753.GA26665@penguin>
 <ac436c3c-fa89-f777-85b2-f38adf842e10@ysoft.com>
 <20190725144009.GA27432@penguin>
 <dcee1139-c53f-5ea0-f387-a3aa5a9bf39f@ysoft.com>
 <20190727073156.GA795@penguin>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <f06a913e-09aa-3225-a495-bb290ee2bb6f@ysoft.com>
Date:   Tue, 30 Jul 2019 11:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190727073156.GA795@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27. 07. 19 9:31, Dmitry Torokhov wrote:
> On Fri, Jul 26, 2019 at 01:31:31PM +0200, Michal Vokáč wrote:
>> On 25. 07. 19 16:40, Dmitry Torokhov wrote:
>>> On Thu, Jul 25, 2019 at 02:58:02PM +0200, Michal Vokáč wrote:
>>>> On 25. 07. 19 10:57, Dmitry Torokhov wrote:
>>>>> Hi Michal,
>>>>>
>>>>> On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
>>>>>> On 21. 05. 19 7:37, Dmitry Torokhov wrote:
>>>>>>> Hi Michal,
>>>>>>>
>>>>>>> On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I have to deal with a situation where we have a custom i.MX6 based
>>>>>>>> platform in production that uses the MPR121 touchkey controller.
>>>>>>>> Unfortunately the chip is connected using only the I2C interface.
>>>>>>>> The interrupt line is not used. Back in 2015 (Linux v3.14), my
>>>>>>>> colleague modded the existing mpr121_touchkey.c driver to use polling
>>>>>>>> instead of interrupt.
>>>>>>>>
>>>>>>>> For quite some time yet I am in a process of updating the product from
>>>>>>>> the ancient Freescale v3.14 kernel to the latest mainline and pushing
>>>>>>>> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
>>>>>>>> already made it into v5.1-rc.
>>>>>>>>
>>>>>>>> I rebased and updated our mpr121 patch to the latest mainline.
>>>>>>>> It is created as a separate driver, similarly to gpio_keys_polled.
>>>>>>>>
>>>>>>>> The I2C device is quite susceptible to ESD. An ESD test quite often
>>>>>>>> causes reset of the chip or some register randomly changes its value.
>>>>>>>> The [PATCH 3/4] adds a write-through register cache. With the cache
>>>>>>>> this state can be detected and the device can be re-initialied.
>>>>>>>>
>>>>>>>> The main question is: Is there any chance that such a polled driver
>>>>>>>> could be accepted? Is it correct to implement it as a separate driver
>>>>>>>> or should it be done as an option in the existing driver? I can not
>>>>>>>> really imagine how I would do that though..
>>>>>>>>
>>>>>>>> There are also certain worries that the MPR121 chip may no longer be
>>>>>>>> available in nonspecifically distant future. In case of EOL I will need
>>>>>>>> to add a polled driver for an other touchkey chip. May it be already
>>>>>>>> in mainline or a completely new one.
>>>>>>>
>>>>>>> I think that my addition of input_polled_dev was ultimately a wrong
>>>>>>> thing to do. I am looking into enabling polling mode for regular input
>>>>>>> devices as we then can enable polling mode in existing drivers.
>>>>>>
>>>>>> OK, that sounds good. Especially when one needs to switch from one chip
>>>>>> to another that is already in tree, the need for a whole new polling
>>>>>> driver is eliminated.
>>>>>
>>>>> Could you please try the patch below and see if it works for your use
>>>>> case? Note that I have not tried running it, but it compiles so it must
>>>>> be good ;)
>>>>
>>>> Hi Dmitry,
>>>> Thank you very much for the patch!
>>>> I gave it a shot and it seems you forgot to add the input-poller.h file
>>>> to the patch.. it does not compile on my side :(
>>>
>>> Oops ;) Please see the updated patch below.
>>
>> Thank you, now it is (almost) good as you said :D
>>
>>>>
>>>>> Input: add support for polling to input devices
>>>>>
>>>>> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>>>
>>>>> Separating "normal" and "polled" input devices was a mistake, as often we want
>>>>> to allow the very same device work on both interrupt-driven and polled mode,
>>>>> depending on the board on which the device is used.
>>>>>
>>>>> This introduces new APIs:
>>>>>
>>>>> - input_setup_polling
>>>>> - input_set_poll_interval
>>>>> - input_set_min_poll_interval
>>>>> - input_set_max_poll_interval
>>>>>
>>>>> These new APIs allow switching an input device into polled mode with sysfs
>>>>> attributes matching drivers using input_polled_dev APIs that will be eventually
>>>>> removed.
>>>>
>>>> After reading this I am not really sure what else needs to be done
>>>> to test/use the poller. I suspect I need to modify the input device
>>>> driver (mpr121_touchkey.c in my case) like this:
>>>>
>>>> If the interrupt gpio is not provided in DT, the device driver probe
>>>> function should:
>>>>    - not request the threaded interrupt
>>>>    - call input_setup_polling and provide it with poll_fn
>>>>      Can the mpr_touchkey_interrupt function be used as is for this
>>>>      purpose? The only problem I see is it returns IRQ_HANDLED.
>>>
>>> I'd factor out code suitable for polling from mpr_touchkey_interrupt()
>>> and then do
>>>
>>> static irqreturn_t mpr_touchkey_interrupt(...)
>>> {
>>> 	mpr_touchkey_report(...);
>>> 	return IRQ_HANDLED;
>>> }
>>>
>>
>> Probably a trivial problem for experienced kernel hacker but I can not
>> wrap my head around this - the interrupt handler takes the mpr121
>> device id as an argument while the poller poll_fn takes struct input_dev.
>>
>> I fail to figure out how to get the device id from the input device.
>>
Thanks for the hints Dmitry. I am trying my best but still have some
issues with the input_set/get_drvdata.

The kernel Oopses on NULL pointer dereference in mpr_touchkey_report.
Here is the backtrace:

[    2.916960] 8<--- cut here ---
[    2.920022] Unable to handle kernel NULL pointer dereference at virtual address 000001d0
[    2.928138] pgd = (ptrval)
[    2.930851] [000001d0] *pgd=00000000
[    2.934439] Internal error: Oops: 5 [#1] SMP ARM
[    2.939065] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc1-00001-g7278b7c3986c-dirty #2
[    2.947503] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    2.954044] PC is at mpr_touchkey_report+0x18/0x1bc
[    2.958932] LR is at input_dev_poller_start+0x30/0x3c
[    2.963987] pc : [<80728c50>]    lr : [<8071f444>]    psr: 20000013
[    2.970255] sp : e8131c10  ip : e8131c68  fp : e8131c64
[    2.975480] r10: 000000c9  r9 : 8108339c  r8 : 81083340
[    2.980707] r7 : 00000000  r6 : e86cf574  r5 : e86b8480  r4 : e86b8040
[    2.987236] r3 : 80728c38  r2 : e8128000  r1 : 00000000  r0 : 00000000
[    2.993767] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    3.000906] Control: 10c5387d  Table: 1000404a  DAC: 00000051
[    3.006656] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    3.012667] Stack: (0xe8131c10 to 0xe8132000)
[    3.017033] 1c00:                                     60000013 8017f290 e8131c64 e8131c28
[    3.025219] 1c20: 8017f290 8017f098 80e7eb04 e8131cd4 0000013d 00000000 80bc6ba4 e86b8040
[    3.033403] 1c40: e86b8480 e86cf574 00000000 81083340 8108339c 000000c9 e8131c7c e8131c68
[    3.041587] 1c60: 8071f444 80728c44 e86cf400 e86b8480 e8131c9c e8131c80 8071d230 8071f420
[    3.049769] 1c80: e86b8480 00000000 e86cf400 8106baa4 e8131cbc e8131ca0 80591b00 8071d1a0
[    3.057951] 1ca0: 80c567c4 e86cf400 8106baa4 8106baa4 e8131cdc e8131cc0 8071d75c 80591a98
[    3.066136] 1cc0: e86cf400 00000000 e86ba1c0 8106baa4 e8131d04 e8131ce0 8071df50 8071d6cc
[    3.074320] 1ce0: 00000000 e834a400 e86cf400 e86ba0c0 e834a420 51eb851f e8131d54 e8131d08
[    3.082502] 1d00: 807291c4 8071dbc0 00000000 00000000 00000000 0d3abafe 00325aa0 81006548
[    3.090686] 1d20: 000003e8 0d3abafe 8063907c e834a420 80728e34 81083950 e834a400 00000000
[    3.098867] 1d40: 00000000 00000000 e8131d7c e8131d58 80747410 80728e40 81123a00 e834a420
[    3.107051] 1d60: 81123b0c 00000000 81083950 00000000 e8131dac e8131d80 8061f684 807471c4
[    3.115233] 1d80: 00000000 e834a420 81083950 81083950 81006548 00000000 80f8c83c 80f008ac
[    3.123415] 1da0: e8131de4 e8131db0 8061fca8 8061f590 e8131dcc e8131dc0 8080e234 8061ed70
[    3.131599] 1dc0: e834a420 00000000 81083950 81006548 00000000 80f8c83c e8131e04 e8131de8
[    3.139784] 1de0: 8061ffcc 8061fc44 81083950 e834a420 8061ffd4 81006548 e8131e24 e8131e08
[    3.147969] 1e00: 80620040 8061ff70 00000000 81083950 8061ffd4 81006548 e8131e54 e8131e28
[    3.156151] 1e20: 8061d974 8061ffe0 e8131e60 e821b758 e83413b4 0d3abafe 81083950 e8697f00
[    3.164333] 1e40: 81084b4c 00000000 e8131e64 e8131e58 806200e0 8061d8fc e8131e8c e8131e68
[    3.172517] 1e60: 8061e314 806200c0 80e7f9a0 e8131e78 81083950 81006548 80f4a898 ffffe000
[    3.180699] 1e80: e8131ea4 e8131e90 80620ce4 8061e1b8 81083934 81006548 e8131ebc e8131ea8
[    3.188882] 1ea0: 80748e18 80620c64 810c0660 81006548 e8131ecc e8131ec0 80f4a8bc 80748dd8
[    3.197065] 1ec0: e8131f44 e8131ed0 80f01330 80f4a8a4 00000000 80e12924 80e12904 80e12900
[    3.205250] 1ee0: 80e24610 81006548 00000000 80e128dc 00000006 00000006 00000000 80f008ac
[    3.213433] 1f00: 80e7eac0 80ee9234 8016f4d4 ebfffb37 ebfffb3f 0d3abafe e8131f44 0d3abafe
[    3.220284] g_ether gadget: high-speed config #1: CDC Ethernet (ECM)
[    3.221616] 1f20: 810c0660 00000007 810c0660 80fc21f0 810c5980 810c5980 e8131f94 e8131f48
[    3.236147] 1f40: 80f0174c 80f01274 00000006 00000006 00000000 80f008ac 801346cc 80133d54
[    3.244330] 1f60: 80ee9234 00000154 e8131f8c 00000000 80bdb670 00000000 00000000 00000000
[    3.252512] 1f80: 00000000 00000000 e8131fac e8131f98 80bdb688 80f0146c 00000000 80bdb670
[    3.260695] 1fa0: 00000000 e8131fb0 801010e8 80bdb67c 00000000 00000000 00000000 00000000
[    3.268878] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.277061] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    3.285237] Backtrace:
[    3.287699] [<80728c38>] (mpr_touchkey_report) from [<8071f444>] (input_dev_poller_start+0x30/0x3c)
[    3.296753]  r10:000000c9 r9:8108339c r8:81083340 r7:00000000 r6:e86cf574 r5:e86b8480
[    3.304584]  r4:e86b8040
[    3.307128] [<8071f414>] (input_dev_poller_start) from [<8071d230>] (input_open_device+0x9c/0xc4)
[    3.316002]  r5:e86b8480 r4:e86cf400
[    3.319590] [<8071d194>] (input_open_device) from [<80591b00>] (kbd_connect+0x74/0x90)
[    3.327510]  r7:8106baa4 r6:e86cf400 r5:00000000 r4:e86b8480
[    3.333180] [<80591a8c>] (kbd_connect) from [<8071d75c>] (input_attach_handler+0x9c/0xd0)
[    3.341361]  r7:8106baa4 r6:8106baa4 r5:e86cf400 r4:80c567c4
[    3.347029] [<8071d6c0>] (input_attach_handler) from [<8071df50>] (input_register_device+0x39c/0x40c)
[    3.356251]  r7:8106baa4 r6:e86ba1c0 r5:00000000 r4:e86cf400
[    3.361923] [<8071dbb4>] (input_register_device) from [<807291c4>] (mpr_touchkey_probe+0x390/0x4d4)
[    3.370974]  r9:51eb851f r8:e834a420 r7:e86ba0c0 r6:e86cf400 r5:e834a400 r4:00000000
[    3.378727] [<80728e34>] (mpr_touchkey_probe) from [<80747410>] (i2c_device_probe+0x258/0x27c)
[    3.387344]  r10:00000000 r9:00000000 r8:00000000 r7:e834a400 r6:81083950 r5:80728e34
[    3.395174]  r4:e834a420
[    3.397715] [<807471b8>] (i2c_device_probe) from [<8061f684>] (really_probe+0x100/0x2d8)
[    3.405810]  r9:00000000 r8:81083950 r7:00000000 r6:81123b0c r5:e834a420 r4:81123a00
[    3.413562] [<8061f584>] (really_probe) from [<8061fca8>] (driver_probe_device+0x70/0x180)
[    3.421832]  r10:80f008ac r9:80f8c83c r8:00000000 r7:81006548 r6:81083950 r5:81083950
[    3.429662]  r4:e834a420 r3:00000000
[    3.433245] [<8061fc38>] (driver_probe_device) from [<8061ffcc>] (device_driver_attach+0x68/0x70)
[    3.442121]  r9:80f8c83c r8:00000000 r7:81006548 r6:81083950 r5:00000000 r4:e834a420
[    3.449872] [<8061ff64>] (device_driver_attach) from [<80620040>] (__driver_attach+0x6c/0xe0)
[    3.458399]  r7:81006548 r6:8061ffd4 r5:e834a420 r4:81083950
[    3.464071] [<8061ffd4>] (__driver_attach) from [<8061d974>] (bus_for_each_dev+0x84/0xc4)
[    3.472251]  r7:81006548 r6:8061ffd4 r5:81083950 r4:00000000
[    3.477920] [<8061d8f0>] (bus_for_each_dev) from [<806200e0>] (driver_attach+0x2c/0x30)
[    3.485926]  r7:00000000 r6:81084b4c r5:e8697f00 r4:81083950
[    3.491594] [<806200b4>] (driver_attach) from [<8061e314>] (bus_add_driver+0x168/0x1ec)
[    3.499604] [<8061e1ac>] (bus_add_driver) from [<80620ce4>] (driver_register+0x8c/0x124)
[    3.507697]  r7:ffffe000 r6:80f4a898 r5:81006548 r4:81083950
[    3.513366] [<80620c58>] (driver_register) from [<80748e18>] (i2c_register_driver+0x4c/0x8c)
[    3.521804]  r5:81006548 r4:81083934
[    3.525394] [<80748dcc>] (i2c_register_driver) from [<80f4a8bc>] (mpr_touchkey_driver_init+0x24/0x28)
[    3.534616]  r5:81006548 r4:810c0660
[    3.538203] [<80f4a898>] (mpr_touchkey_driver_init) from [<80f01330>] (do_one_initcall+0xc8/0x1f8)
[    3.547169] [<80f01268>] (do_one_initcall) from [<80f0174c>] (kernel_init_freeable+0x2ec/0x380)
[    3.555872]  r8:810c5980 r7:810c5980 r6:80fc21f0 r5:810c0660 r4:00000007
[    3.562587] [<80f01460>] (kernel_init_freeable) from [<80bdb688>] (kernel_init+0x18/0x120)
[    3.570856]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80bdb670
[    3.578685]  r4:00000000
[    3.581230] [<80bdb670>] (kernel_init) from [<801010e8>] (ret_from_fork+0x14/0x2c)
[    3.588802] Exception stack(0xe8131fb0 to 0xe8131ff8)
[    3.593859] 1fa0:                                     00000000 00000000 00000000 00000000
[    3.602042] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.610222] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.616839]  r5:80bdb670 r4:00000000
[    3.620422] Code: e24cb004 e24dd02c e52de004 e8bd4000 (e59051d0)
[    3.626572] ---[ end trace eb840c8cb957e159 ]---

I can confirm the poller mechanism works fine if I leave the
mpr_touchkey_report function empty and just return.

I can also confirm the interrupt mechanism works as fine if I bodge
a wire from some available GPIO (commented lines in dtsi).

Here is my code:

diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
index e8d800fec637..7516da441915 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
@@ -4,6 +4,7 @@
  
  #include <dt-bindings/gpio/gpio.h>
  #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
  #include <dt-bindings/pwm/pwm.h>
  
  / {
@@ -330,6 +331,21 @@
  		vcc-supply = <&sw2_reg>;
  		status = "disabled";
  	};
+
+	touchkeys: keys@5a {
+		compatible = "fsl,mpr121-touchkey";
+		//pinctrl-0 = <&pinctrl_key_irq>;
+		reg = <0x5a>;
+		vdd-supply = <&sw2_reg>;
+		autorepeat;
+		linux,keycodes = <KEY_1>, <KEY_2>, <KEY_3>, <KEY_4>, <KEY_5>,
+				<KEY_6>, <KEY_7>, <KEY_8>, <KEY_9>,
+				<KEY_BACKSPACE>, <KEY_0>, <KEY_ENTER>;
+		linux,poll-interval = <50>;
+		//interrupt-parent = <&gpio1>;
+		//interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+		status = "disabled";
+	};
  };
  
  &iomuxc {
@@ -433,6 +449,12 @@
  		>;
  	};
  
+	pinctrl_key_irq: keyirq {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__GPIO1_IO18	0x1b098
+		>;
+	};
+
  	pinctrl_touch: touchgrp {
  		fsl,pins = <
  			MX6QDL_PAD_GPIO_19__GPIO4_IO05	0x1b098
diff --git a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
index f97927064750..84c275bfdd38 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
+++ b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
@@ -45,6 +45,10 @@
  	status = "okay";
  };
  
+&touchkeys {
+	status = "okay";
+};
+
  &usdhc3 {
  	status = "okay";
  };
diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index e9ceaa16b46a..d6b9f6acddca 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -7,7 +7,7 @@
   *
   * Based on mcs_touchkey.c
   */
-
+#define DEBUG
  #include <linux/bitops.h>
  #include <linux/delay.h>
  #include <linux/i2c.h>
@@ -54,6 +54,9 @@
  /* MPR121 has 12 keys */
  #define MPR121_MAX_KEY_COUNT		12
  
+#define MPR121_MIN_POLL_INTERVAL	10
+#define MPR121_MAX_POLL_INTERVAL	2000
+
  struct mpr121_touchkey {
  	struct i2c_client	*client;
  	struct input_dev	*input_dev;
@@ -115,11 +118,11 @@ static struct regulator *mpr121_vdd_supply_init(struct device *dev)
  	return vdd_supply;
  }
  
-static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+static void mpr_touchkey_report(struct input_dev *dev)
  {
-	struct mpr121_touchkey *mpr121 = dev_id;
-	struct i2c_client *client = mpr121->client;
+	struct mpr121_touchkey *mpr121 = input_get_drvdata(dev);
  	struct input_dev *input = mpr121->input_dev;
+	struct i2c_client *client = mpr121->client;
  	unsigned long bit_changed;
  	unsigned int key_num;
  	int reg;
@@ -127,14 +130,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
  	reg = i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_1_ADDR);
  	if (reg < 0) {
  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
  	}
  
  	reg <<= 8;
  	reg |= i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_0_ADDR);
  	if (reg < 0) {
  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
  	}
  
  	reg &= TOUCH_STATUS_MASK;
@@ -155,8 +158,13 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
  
  	}
  	input_sync(input);
+}
+
+static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+{
+	struct mpr121_touchkey *mpr121 = dev_id;
+	mpr_touchkey_report(mpr121->input_dev);
  
-out:
  	return IRQ_HANDLED;
  }
  
@@ -229,13 +237,10 @@ static int mpr_touchkey_probe(struct i2c_client *client,
  	int vdd_uv;
  	struct mpr121_touchkey *mpr121;
  	struct input_dev *input_dev;
+	u32 poll_interval = 0;
  	int error;
  	int i;
  
-	if (!client->irq) {
-		dev_err(dev, "irq number should not be zero\n");
-		return -EINVAL;
-	}
  
  	vdd_supply = mpr121_vdd_supply_init(dev);
  	if (IS_ERR(vdd_supply))
@@ -275,11 +280,13 @@ static int mpr_touchkey_probe(struct i2c_client *client,
  	if (device_property_read_bool(dev, "autorepeat"))
  		__set_bit(EV_REP, input_dev->evbit);
  	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+	input_set_drvdata(input_dev, mpr121);
  
  	input_dev->keycode = mpr121->keycodes;
  	input_dev->keycodesize = sizeof(mpr121->keycodes[0]);
  	input_dev->keycodemax = mpr121->keycount;
  
+
  	for (i = 0; i < mpr121->keycount; i++)
  		input_set_capability(input_dev, EV_KEY, mpr121->keycodes[i]);
  
@@ -289,13 +296,34 @@ static int mpr_touchkey_probe(struct i2c_client *client,
  		return error;
  	}
  
-	error = devm_request_threaded_irq(dev, client->irq, NULL,
-					  mpr_touchkey_interrupt,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					  dev->driver->name, mpr121);
-	if (error) {
-		dev_err(dev, "Failed to register interrupt\n");
-		return error;
+	device_property_read_u32(dev, "linux,poll-interval", &poll_interval);
+
+	if (client->irq) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL,
+						  mpr_touchkey_interrupt,
+						  IRQF_TRIGGER_FALLING |
+						  IRQF_ONESHOT,
+						  dev->driver->name, mpr121);
+		if (error) {
+			dev_err(dev, "Failed to register interrupt\n");
+			return error;
+		}
+	} else if (poll_interval > 0) {
+		error = input_setup_polling(input_dev, mpr_touchkey_report);
+		if (error) {
+			dev_err(dev, "Failed to setup polling\n");
+			return error;
+		}
+
+		input_set_poll_interval(input_dev, poll_interval);
+		input_set_min_poll_interval(input_dev,
+					    MPR121_MIN_POLL_INTERVAL);
+		input_set_max_poll_interval(input_dev,
+					    MPR121_MAX_POLL_INTERVAL);
+	} else {
+		dev_err(dev,
+			"invalid IRQ number and polling not configured\n");
+		return -EINVAL;
  	}
  
  	error = input_register_device(input_dev);
--
