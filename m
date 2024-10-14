Return-Path: <linux-input+bounces-7381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECA99BF37
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 06:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C40B21898
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 04:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC0D49620;
	Mon, 14 Oct 2024 04:54:15 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F53D4A1C;
	Mon, 14 Oct 2024 04:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881655; cv=none; b=PDemHl7SR3+1YnWEv2/dZHmtClE6lG6JqnUNpRG74D1EpfVugbKwM7UMFNUITK95ltn22f3kY4DgEGXy4nrEx4dMPeUZ84+Om/owEcOnc53WJSmc8K2uXyAq6qYvzVM//IN4MfSCNm6cWvazrgCeIAUyLsFnmjulKXQH37ZCEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881655; c=relaxed/simple;
	bh=WTSxNEFV87UUOCvE3AFLbbV3O/wp3BlqSEnenjaV7xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hi/3JVcmTHr5QvN9yAQ9v2ofsJoupm0HV53S8i/vzs3PdRppk7+eHbv4qZZ4eLJbD76oiVMZrx8Q3rrBV/9+L5QxoMnqT1S17PuvM0piiDNm4RbVwLBuQ6avvIAgwc4q8q+ADXjuQLNupmvHSSJm7waYL9IOdzbbdyD+2PBsqls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 5FB2E275BF53;
	Sun, 13 Oct 2024 21:47:38 -0700 (PDT)
Message-ID: <234020be-e030-4271-9cc1-a1f6d04eeeed@cosmicgizmosystems.com>
Date: Sun, 13 Oct 2024 21:47:37 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
To: "Wang, Wade" <wade.wang@hp.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
 <EA2PR84MB37807C9F2191AFE41F9372328B6A2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378022DD0D3D06901404BEDB8B792@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <EA2PR84MB378022DD0D3D06901404BEDB8B792@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wade,

Short answer is no, not until some fix is put into the kernel or user 
space so the majority of Plantronics/Poly/HP headsets bind to the mixer 
so the host feeds back settings on the audio control interface for the 
volume level and mute state. The problem is in the names that the kernel 
creates for the various controls.

After a couple of weeks torture and two days to repair/recover my system 
after following Ubuntu's instructions on building and installing the 
kernel, I was able to test the behavior with a modified hid-plantronics 
driver. I removed all the quirks that have been added since I retired 
and just added allowing the telephony mute event to be mapped by the core.

The quirks, by the way, are just masking the as designed behavior of the 
headsets. Both the repeated *same* volume event and the *opposite* 
volume event can occur depending on feedback (or lack of feedback) from 
the host on the audio control interface. Blame Windows...

I don't have many headsets around to test with but I'll describe the 
mute behavior with a DA80. It's PID is AF01 but I would expect all AFxx 
and 43xx PID devices would do the same as the control names are the same 
for all.

1. Plug in the headset.
2. Open Ubuntu Settings menu and select Sound.
3. Select the headset as the output and input devices.
4. Mute the Input Volume by clicking on the microphone icon.
5. Start pressing the mute button on the headset.

Note that the mute state in the mixer is now out of synchronization with 
the headset. Every time you press the headset mute button they both 
toggle so one or the other is always muted and the microphone is useless.

Also, if you unplug the headset when the mixer is muted but the headset 
is unmuted, when you plug it in again the mixer is still muted. So the 
microphone is still useless. You have to go back to the Sound Settings 
dialog and set the mute to match the headset state to resynchronize them.

I also tested a BT600 Bluetooth dongle which binds to the mixer volume 
and mute controls. Mute synchronization works as expected.

So before we uncork the telephony mute event and hope user space will 
fix something in the future, let's fix it so the headsets all bind to 
the mixer and things just work before we pull the cork. The issue is in 
the names...

Of the headsets I have these are the names that don't bind.

Control: name="Headset Earphone Playback Volume"
Control: name="Headset Microphone Capture Switch"
Control: name="Receive Playback Volume"
Control: name="Transmit Capture Switch"

These are the names that do bind.

Control: name="Headset Capture Switch"
Control: name="PCM Playback Volume"

These names are created by the kernel in:

sound/usb/mixer.c function __build_feature_ctl

I have a patch I am trying to test that will clean up the names only for 
VID=047F (Plantronics) devices so the broken names will come out as 
"Headset Capture Switch" and "Headset Playback Volume". I was able to 
modprobe the hid_plantronics module into the running kernel to test it 
but modprobe fails loading the snd_usb_audio module (which contains the 
patch) so I will have to install the full kernel. The last time I tried 
that it broke the kernel. I think some of the packages that the build 
created are not supposed to be installed? Not sure which ones to install 
and in what order.

Here's what a full build

fakeroot debian/rules binary

created:

linux-buildinfo-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-cloud-tools-6.8.0-45_6.8.0-45.45+test1_amd64.deb
linux-cloud-tools-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-cloud-tools-common_6.8.0-45.45+test1_all.deb
linux-doc_6.8.0-45.45+test1_all.deb
linux-headers-6.8.0-45_6.8.0-45.45+test1_all.deb
linux-headers-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-image-unsigned-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-libc-dev_6.8.0-45.45+test1_amd64.deb
linux-lib-rust-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-modules-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-modules-extra-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-modules-ipu6-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-modules-iwlwifi-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-modules-usbio-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-source-6.8.0_6.8.0-45.45+test1_all.deb
linux-tools-6.8.0-45_6.8.0-45.45+test1_amd64.deb
linux-tools-6.8.0-45-generic_6.8.0-45.45+test1_amd64.deb
linux-tools-common_6.8.0-45.45+test1_all.deb
linux-tools-host_6.8.0-45.45+test1_all.deb

I'm going to git the ALSA branch tomorrow so I can create an actual 
patch. Maybe I can pass it to you to build and test on your machines 
with as many headsets as possible?

Thanks and regards,
Terry

On 10/10/24 9:03 PM, Wang, Wade wrote:
> Hi Terry,
> 
> Is it OK to apply? At least we will have a chance to improve user experience in userspace after apply this patch. Looking forward to your comments. Thanks
> 
> Regards
> Wade
> 
> -----Original Message-----
> From: Wang, Wade
> Sent: Thursday, September 26, 2024 9:58 AM
> To: Terry Junge <linuxhid@cosmicgizmosystems.com>; Benjamin Tissoires <bentiss@kernel.org>
> Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
> 
> Hi Terry,
> 
> 1. Per our testing, Poly headset will maintain Mute status at headset side, whatever host send feedback or not.
> 2. Mute led is off when Poly USB headset connect to host, so host will keep same Mute status with headset because of toggle Mute key event.
> 3. Even Ubuntu and Chromebooks have to feedback Poly headset mute state, it should be done at user space instead of kernel. The precondition is kernel should report Mute key event first, then user space has chance to do this kind of improvement in future
> 
> So following standard HID rule is necessary.
> 
> BTW, on MSFT Windows, After receive mute key, the host switch the mute control status of the audio control interface, whatever mute status in headset FW is correct or not. I think it make sense than LED page mute LED.
> 
> Thanks,
> Wade
> 
> -----Original Message-----
> From: Terry Junge <linuxhid@cosmicgizmosystems.com>
> Sent: Wednesday, September 25, 2024 11:32 AM
> To: Wang, Wade <wade.wang@hp.com>; Benjamin Tissoires <bentiss@kernel.org>
> Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
> 
> CAUTION: External Email
> 
> Hi Wade,
> 
> I retired from Plantronics in 2020. The original driver did not allow mute button to be mapped as there were mute synchronization issues.
> 
> The headset needs to receive some type of feedback from the host when it sends the mute event in order to synchronize with the host, ideally the host setting or clearing the mute control in the audio control interface but setting/clearing the mute LED would also work.
> 
> At the time Ubuntu and Chromebooks did not feedback mute state and it was possible to mute from the headset and then unmute from the mixer or keyboard and the headset would stay muted. The only way to unmute was with the headset button. This was an unacceptable user experience so we blocked mapping.
> 
> If you want to try mapping mute event then you also need to allow mapping the mute LED for possible host feedback.
> 
> (HID_UP_TELEPHONY | 0x2f) is telephony page mute button (HID_UP_LED | 0x09) is LED page mute LED
> 
> Then you need to test more than just the event getting to user space.
> You need to check mute synchronization with the host mixer under all mute/unmute use cases.
> 
> Regards,
> Terry Junge
> 
> 
> On 9/24/24 2:00 AM, Wang, Wade wrote:
>> Hi Benjamin and Greg,
>>
>> May I know the review progress and anything I need to change? Thanks
>>
>> Regards
>> Wade
>>
>> -----Original Message-----
>> From: Wang, Wade
>> Sent: Monday, September 16, 2024 4:13 PM
>> To: Benjamin Tissoires <bentiss@kernel.org>
>> Cc: jikos@kernel.org; linux-input@vger.kernel.org;
>> linux-kernel@vger.kernel.org; stable@vger.kernel.org
>> Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
>>
>> Hi Benjamin,
>>
>> This patch is for all Poly HS devices, and it does not depends on other patches, it can apply directly by " git am -3".
>>
>> With this patch, MicMute button key event will be send to user space, I have tested on the below Poly devices:
>>           Plantronics EncorePro 500 Series
>>           Plantronics Blackwire_3325 Series
>>           Poly Voyager 4320 HS + BT700 Dongle
>>
>> Regards
>> Wade
>>
>> -----Original Message-----
>> From: Benjamin Tissoires <bentiss@kernel.org>
>> Sent: Friday, September 13, 2024 10:04 PM
>> To: Wang, Wade <wade.wang@hp.com>
>> Cc: jikos@kernel.org; linux-input@vger.kernel.org;
>> linux-kernel@vger.kernel.org; stable@vger.kernel.org
>> Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
>>
>> CAUTION: External Email
>>
>> On Sep 13 2024, Wade Wang wrote:
>>> telephony page of Plantronics headset is ignored currently, it caused
>>> micmute button no function, Now follow native HID key mapping for
>>> telephony page map, telephony micmute key is enabled by default
>>
>> For which devices this patch is required? Is it related to the other patch you sent today? If so please make a mention of the concerned devices and make sure both patches are sent in a single v3 series.
>>
>> Also, have you tested this change with other Plantronics headsets? Where there any changes in behavior from them?
>>
>> Cheers,
>> Benjamin
>>
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Wade Wang <wade.wang@hp.com>
>>> ---
>>>    drivers/hid/hid-plantronics.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hid/hid-plantronics.c
>>> b/drivers/hid/hid-plantronics.c index 2a19f3646ecb..2d17534fce61
>>> 100644
>>> --- a/drivers/hid/hid-plantronics.c
>>> +++ b/drivers/hid/hid-plantronics.c
>>> @@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>>>                 }
>>>         }
>>>         /* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
>>> -     /* 'basic telephony compliant' - allow default consumer page map */
>>> +     /* 'basic telephony compliant' - allow default consumer &
>>> + telephony page map */
>>>         else if ((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
>>>                  (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
>>> -             if (PLT_ALLOW_CONSUMER)
>>> +             if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE)
>>> + == HID_UP_TELEPHONY)
>>>                         goto defaulted;
>>>         }
>>>         /* not 'basic telephony' - apply legacy mapping */
>>> --
>>> 2.34.1
>>>
>>
>>
> 


