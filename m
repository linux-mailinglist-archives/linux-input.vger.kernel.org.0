Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E648028D654
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 23:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgJMV7c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 17:59:32 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:23719 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726652AbgJMV7c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 17:59:32 -0400
Received: from [100.112.130.136] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id 14/5C-10948-143268F5; Tue, 13 Oct 2020 21:59:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRWlGSWpSXmKPExsWSLveKXddRuS3
  eoH8Ts8XhRS8YLb5+u81u8eb4dCaLM7cXMlmsWniNzeLmp2+sDmweO2fdZff4tW0Ni0fLkbes
  HssPTmPyeL/vKpvH501yAWxRrJl5SfkVCawZHX2hBds0Kxa8uc3UwHhNsYuRi0NI4D+jxJxjB
  1ghnOeMEi8Wn2fvYuTgEBaIl1jyRKuLkZNDRMBD4s7C/SwgNcwC2xkl1kw/D9Vwk0Xi54RlrC
  BVbALaElu2/GIDaeYVsJVYMzcWJMwioCpx4skhZhBbVCBcouPGDiYQm1dAUOLkzCcsIDangJ3
  E6r6TYHFmAQuJmfPPM0LY4hK3nsyHistLbH87B2yOBJB9bsFBRgg7QWLZyzvMExgFZyEZOwvJ
  qFlIRs1CMmoBI8sqRoukosz0jJLcxMwcXUMDA11DQyNdQ2MDXSNTI73EKt1EvdJi3fLU4hJdI
  Le8WK+4Mjc5J0UvL7VkEyMwolIKmv7sYPz76oPeIUZJDiYlUd6qn63xQnxJ+SmVGYnFGfFFpT
  mpxYcYZTg4lCR4XRTb4oUEi1LTUyvSMnOA0Q2TluDgURLhzVECSvMWFyTmFmemQ6ROMRpznFy
  1ZBEzx+a5SxcxC7Hk5eelSonzTgSZJABSmlGaBzcIlnQuMcpKCfMyMjAwCPEUpBblZpagyr9i
  FOdgVBLm/QEyhSczrwRu3yugU5iATrFf0gJySkkiQkqqgSm2itXOflGP9sYdR3eHR4slMu1dK
  b84ZEHa6X/6dyIV3Humi8XZzP52u1LxT3wa68m8PHPxkKvBW6N4CsOPmosq7e5YVHvLZALf9z
  NnUvkvRcx8mtEovCZ+9ySpZ0KnX96Ki90yyWWR5yeWbR/U5y1hUm3fO3Ud60dGrcKbjVJ/rbd
  rTlgrsk9i6Ql9+XiTDVvYb2763LjYUMlSrjU+81+lddviTT+zriRk7+6qNHu9x6eq4r71xc4d
  c4zyJjkc+Jv1zfho6YvZJxp/bJ2du9n+n+VGIfsffA83SLYsfJ6gcjyJ74xqyWzR4hPbtqgoK
  r5X6tM9W2bB/btOXWppzpzVUu9u8guyVzCa8iR7nlFiKc5INNRiLipOBAA+lHfItQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-29.tower-336.messagelabs.com!1602626366!21078!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32083 invoked from network); 13 Oct 2020 21:59:28 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-29.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Oct 2020 21:59:28 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id B699D55BA66B6F94DAC7;
        Wed, 14 Oct 2020 05:59:24 +0800 (CST)
Received: from localhost.localdomain (10.46.56.85) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Tue, 13 Oct
 2020 14:59:20 -0700
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
To:     Hans de Goede <hdegoede@redhat.com>,
        Jeff LaBundy <jeff@labundy.com>
CC:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        <linux-input@vger.kernel.org>, <dmitry.torokhov@gmail.com>
References: <9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com>
 <5a646527-7a1f-2fb9-7c09-8becdbff417b@lenovo.com>
 <20201007083602.00006b7e@Huawei.com>
 <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
 <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
 <5273a1de9db682cd41e58553fe57707c492a53b7.camel@hadess.net>
 <272074b5-b28e-1b74-8574-3dc2d614269a@redhat.com>
 <20201008001424.GA3713@labundy.com>
 <9893a32c-02c8-f00c-7f00-6287d55043ab@redhat.com>
 <20201009021949.GA3629@labundy.com>
 <961aeee6-22e9-75dc-9fcf-45cee00ab62c@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <075a5f57-3330-78fe-669b-01570d43d9c0@lenovo.com>
Date:   Tue, 13 Oct 2020 17:59:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <961aeee6-22e9-75dc-9fcf-45cee00ab62c@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.56.85]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On 2020-10-12 8:13 a.m., Hans de Goede wrote:
> Hi,
> 
> On 10/9/20 4:19 AM, Jeff LaBundy wrote:
>> Hi Hans,
>>
<snip>
>>>
>>>> I just wanted to chime in and confirm that we do have at least one
>>>> precedent for these being in input (keyboard/iqs62x-keys) and not
>>>> iio so I agree with Jonathan here. My argument is that we want to
>>>> signal binary events (user grabbed onto or let go of the handset)
>>>> rather than deliver continuous data.
>>>
>>> I was curious what keycode you are using for this, but I see
>>> that the keycodes come from devicetree, so I guess I should
>>> just ask: what keycode are you using for this ?
>>
>> The idea here was that a vendor might implement their own daemon
>> that interprets any keycode of their choice, hence leaving the
>> keycodes assignable via devicetree.
>>
>> This particular device also acts as a capacitive/inductive button
>> sensor, and these applications were the primary motivation for it
>> landing in input with its status bits mapped to keycodes.
>>
>> I don't think there are any keycodes that exist today that would
>> universally work for this application. The couple that seem most
>> closely related (e.g. KEY_WLAN or KEY_RFKILL) are typically used
>> for disabling the adapter entirely or for airplane mode (please
>> correct me if I'm wrong).
> 
> You're right (aka not wrong), KEY_WLAN and KEY_RFKILL are used to
> toggle wireless radios on/off and re-using them for some SAR
> purpose would lead to nothing but confusion. We really need to
> define some standard *new* event-codes for this, such as e.g.
> the proposed SW_LAP_PROXIMITY and SW_PALMREST_PROXIMITY.
> 
>> To that end, I'm keen to see how this interface unfolds because
>> SAR detection tends to be an available mode of operation for
>> several of the capacitive touch devices I've been working with.
> 
> I guess that for touchscreens at least (which are on the front),
> using the existing SW_FRONT_PROXIMITY would make the most sense.
> 

I've been looking at implementing this and I'm missing something - and I 
think it's probably something obvious so hoping someone can short cut me 
to the answer. Hope it's OK to do that in this thread (I removed the 
linux-iio list as I'm assuming they won't be interested)

I've added the new event codes to input-event-codes.h and updated 
mode_devicetable.h

In the thinkpad_acpi.c driver I initialise the device:

    tpacpi_sw_dev = input_allocate_device();
    if (!tpacpi_sw_dev)
            return -ENOMEM;
    tpacpi_sw_dev->name = "Thinkpad proximity switches";
    tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
    tpacpi_sw_dev->id.bustype = BUS_HOST;
    tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
    tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
    tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
    tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;

    if (has_palmsensor) {
       input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
       input_report_switch(tpacpi_sw_dev,SW_PALMREST_PROXIMITY, 
palmsensor_state);
    }

    if (has_lapsensor) {
         input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
         input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, 
lapsensor_state);
    }
    err = input_register_device(tpacpi_sw_dev);

If the sensor triggers I update the inputdevice with:
    input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
    input_sync(tpacpi_sw_dev);
<similar for lapmode>

However I'm not seeing the change when I look under evtest, though I do 
see the new sensors show up:

    [banther@localhost linux]$ sudo evtest
    No device specified, trying to scan all of /dev/input/event*
    Available devices:
    /dev/input/event0:	Sleep Button
    /dev/input/event1:	Lid Switch
    /dev/input/event2:	Power Button
    /dev/input/event3:	AT Translated Set 2 keyboard
    /dev/input/event4:	TPPS/2 Elan TrackPoint
    /dev/input/event5:	SYNA8004:00 06CB:CD8B Mouse
    /dev/input/event6:	SYNA8004:00 06CB:CD8B Touchpad
    /dev/input/event7:	Video Bus
    /dev/input/event8:	Thinkpad proximity switches
    /dev/input/event9:	PC Speaker
    /dev/input/event10:	Integrated Camera: Integrated C
    /dev/input/event11:	sof-hda-dsp Headset Jack
    /dev/input/event12:	sof-hda-dsp Mic
    /dev/input/event13:	sof-hda-dsp Headphone
    /dev/input/event14:	sof-hda-dsp HDMI/DP,pcm=3
    /dev/input/event15:	sof-hda-dsp HDMI/DP,pcm=4
    /dev/input/event16:	sof-hda-dsp HDMI/DP,pcm=5
    /dev/input/event17:	ThinkPad Extra Buttons
    Select the device event number [0-17]: 8
    Input driver version is 1.0.1
    Input device ID: bus 0x19 vendor 0x17aa product 0x5054 version 0x4101
    Input device name: "Thinkpad proximity switches"
    Supported events:
      Event type 0 (EV_SYN)
      Event type 5 (EV_SW)
        Event code 17 (?) state 0
        Event code 18 (?) state 0
    Properties:
    Testing ... (interrupt to exit)

The state for both sensors is supposed to be 1.
I did download and rebuild evtest and fixed the (?), but haven't figured 
out why the state is wrong. It seemed related to the number of keys 
which I found odd.

Any suggestions from what I'm missing, or have done wrong, or where I 
should dig next? What's the recommended way of testing my implementation?

Thanks
Mark

