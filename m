Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A33955B109
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 12:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbiFZKHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 06:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbiFZKHs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 06:07:48 -0400
X-Greylist: delayed 447 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Jun 2022 03:07:44 PDT
Received: from mailgw.flatbooster.com (mailgw.flatbooster.com [62.216.176.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE95F1182B;
        Sun, 26 Jun 2022 03:07:44 -0700 (PDT)
Received: from mailgw.flatbooster.com (localhost.localdomain [127.0.0.1])
        by mailgw.flatbooster.com (Proxmox) with ESMTP id A0982C24CD;
        Sun, 26 Jun 2022 12:00:15 +0200 (CEST)
Received: from rex11.flatbooster.com (rex11.flatbooster.com [10.200.0.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailgw.flatbooster.com (Proxmox) with ESMTPS id 57DEBC254E;
        Sun, 26 Jun 2022 12:00:13 +0200 (CEST)
Received: from [192.168.0.2] (ip-149-172-048-147.um42.pools.vodafone-ip.de [149.172.48.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: web110614p1)
        by rex11.flatbooster.com (Postfix) with ESMTPSA id 44B68C0078;
        Sun, 26 Jun 2022 12:00:13 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------Vn91C2W0gJTI1CRsfRIpcv1v"
Message-ID: <72cdd611-a403-bbd9-9018-36a426ea49f0@bernd-steinhauser.de>
Date:   Sun, 26 Jun 2022 11:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Force Feedback support not recognized on Granite Devices Simucube
Content-Language: en-US
From:   Bernd Steinhauser <linux-ml@bernd-steinhauser.de>
To:     linux-input@vger.kernel.org
Cc:     linux-usb@vger.kernel.org
Reply-To: linux-ml@bernd-steinhauser.de
References: <b4e9f460-ee34-fe8b-4502-e14701f9f03b@bernd-steinhauser.de>
 <0b23bdba-9c00-2a1e-309d-af01fcb60da4@bernd-steinhauser.de>
In-Reply-To: <0b23bdba-9c00-2a1e-309d-af01fcb60da4@bernd-steinhauser.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------Vn91C2W0gJTI1CRsfRIpcv1v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/5/20 19:54, Bernd Steinhauser wrote:
> On 17/06/2019 13:46, Bernd Steinhauser wrote:
>> Resending this message to linux input as suggested.
>>
>> Hi,
>>
>> I own a Granite Devices Simucube force feedback wheel which I'd like to get 
>> working under Linux.
>> The current status is that if I use a tool to check/test the FFB, it tells me 
>> that the device does not support FFB.
>> I'm also using the device under Windows 7 and there it works without any 
>> special driver, so it should work with USB HID FFB.
>> In principle, it supports the following effects (see link below):
>> - constant force
>> - friction
>> - damping
>> - spring
>> - sine wave
>> - square wave
>> - sawtooth
>> - triangle
>>
>> The device advertises as MCS, Granite Devices SimuCUBE with id 16d0:0d5a, 
>> I'll attach lsusb output.
>> Upon connection, the device is recognized and the output is:
>>
>> [ 3271.812807] usb 1-2.4.2: new full-speed USB device number 10 using xhci_hcd
>> [ 3271.921182] usb 1-2.4.2: New USB device found, idVendor=16d0, 
>> idProduct=0d5a, bcdDevice= 2.00
>> [ 3271.921184] usb 1-2.4.2: New USB device strings: Mfr=1, Product=2, 
>> SerialNumber=3
>> [ 3271.921185] usb 1-2.4.2: Product: SimuCUBE
>> [ 3271.921186] usb 1-2.4.2: Manufacturer: Granite Devices
>> [ 3271.921187] usb 1-2.4.2: SerialNumber: 0123456789
>> [ 3281.943990] input: Granite Devices SimuCUBE as 
>> /devices/pci0000:00/0000:00:09.0/0000:04:00.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2:1.0/0003:16D0:0D5A.0016/input/input48
>> [ 3281.944223] hid-generic 0003:16D0:0D5A.0016: unknown set_effect report layout
>> [ 3281.944228] hid-generic 0003:16D0:0D5A.0016: input,hiddev2,hidraw15: USB 
>> HID v1.11 Joystick [Granite Devices SimuCUBE] on usb-0000:04:00.0-2.4.2/input0
>>
>> I spent some time looking at the code and also other ffb code in usbhid, but 
>> since I'm not really familiar with C I have a hard time figuring out why it 
>> doesn't work out of the box and how to fix this, but I'd be happy to help 
>> implementing/debugging it.
>> For a start, it would be really nice to find out what is reported, what the 
>> report should look like and why it doesn't match.
>>
>> Kind Regards,
>> Bernd
>>
>> Links that might or might not be useful for general information:
>> https://granitedevices.com/wiki/SimuCUBE_technical_specifications
>> https://granitedevices.com/wiki/SimuCUBE_Firmware_User_Guide#DirectInput_Effect_Settings_and_Descriptions 
>>
> Hi,
>
> I would to catch up on this, as I found time to investigate this a bit more.
> I also had a chat with one of the devs at GD and he told me that apparently 
> the PID field A7h (Start Delay) is the problematic thing here.
> The hid-pidff.c driver requests this field:
> #define PID_EFFECT_BLOCK_INDEX»·0
>
> #define PID_DURATION»···»···1
> #define PID_GAIN»···»···2
> #define PID_TRIGGER_BUTTON»·3
> #define PID_TRIGGER_REPEAT_INT»·4
> #define PID_DIRECTION_ENABLE»···5
> #define PID_START_DELAY»»···6
> static const u8 pidff_set_effect[] = {
> »···0x22, 0x50, 0x52, 0x53, 0x54, 0x56, 0xa7
> };
>
> but the device does not send it (I attached the descriptor from the device), 
> hence the driver complains about the unknown set_effect layout.
> Now the thing is they tried adding the field, but in that case the Windows HID 
> driver will not recognize the device properly anymore as for some reason it 
> expects that field not to be set.
>
> With that knowledge I tried again with the field 0xa7 removed (and some other 
> references to start delay) and in that case the device was recognized properly 
> and I could run some FFB tests successfully.
> There was a warning about an unknown condition effect layout (as there are 2 
> missing fields in that one as well), but that should be a minor thing for the 
> moment.
>
> I suspect that just removing the 0xa7 field (as I did) is not a proper 
> solution here, but is there an easy way to get this working with a bit of 
> special handling?
>
> Best Regards,
> Bernd

Hi,

I would catch up on this. Removing the field 0xA7 as well as some references 
fixes the issue. I wrote a patch to test that (see attachment) and with that 
applied the FFB works fine on the device.
Now I guess just shipping this patch with the default Linux kernel isn't the way 
to go, but due to my limited knowledge of writing C code, I don't think I can 
write a special driver myself.
Any suggestions on how to properly handle such a case?

GD could in principle provide me with a firmware for the device that adds the 
field 0xA7 and therefore would work with the default pidff driver code, but then 
it would not work on Windows anymore with the default HID driver on Windows. 
(They tried that.)
However, switching firmwares to be able to use it on different operating systems 
shouldn't be necessary, right?

Kind Regards,
Bernd


--------------Vn91C2W0gJTI1CRsfRIpcv1v
Content-Type: text/x-patch; charset=UTF-8; name="sc1-ffb.diff"
Content-Disposition: attachment; filename="sc1-ffb.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQtcGlkZmYuYyBiL2RyaXZlcnMv
aGlkL3VzYmhpZC9oaWQtcGlkZmYuYwppbmRleCBmZGRhYzdjNzJmNjQuLjg2ODQ4MDhjNTk2
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1waWRmZi5jCisrKyBiL2Ry
aXZlcnMvaGlkL3VzYmhpZC9oaWQtcGlkZmYuYwpAQCAtNTcsOSArNTcsOCBAQCB0aGUgb25s
eSBmaWVsZCBpbiB0aGF0IHJlcG9ydCAqLwogI2RlZmluZSBQSURfVFJJR0dFUl9CVVRUT04J
MwogI2RlZmluZSBQSURfVFJJR0dFUl9SRVBFQVRfSU5UCTQKICNkZWZpbmUgUElEX0RJUkVD
VElPTl9FTkFCTEUJNQotI2RlZmluZSBQSURfU1RBUlRfREVMQVkJCTYKIHN0YXRpYyBjb25z
dCB1OCBwaWRmZl9zZXRfZWZmZWN0W10gPSB7Ci0JMHgyMiwgMHg1MCwgMHg1MiwgMHg1Mywg
MHg1NCwgMHg1NiwgMHhhNworCTB4MjIsIDB4NTAsIDB4NTIsIDB4NTMsIDB4NTQsIDB4NTYK
IH07CiAKICNkZWZpbmUgUElEX0FUVEFDS19MRVZFTAkxCkBAIC0zMTEsNyArMzEwLDYgQEAg
c3RhdGljIHZvaWQgcGlkZmZfc2V0X2VmZmVjdF9yZXBvcnQoc3RydWN0IHBpZGZmX2Rldmlj
ZSAqcGlkZmYsCiAJcGlkZmYtPmVmZmVjdF9kaXJlY3Rpb24tPnZhbHVlWzBdID0KIAkJcGlk
ZmZfcmVzY2FsZShlZmZlY3QtPmRpcmVjdGlvbiwgMHhmZmZmLAogCQkJCXBpZGZmLT5lZmZl
Y3RfZGlyZWN0aW9uKTsKLQlwaWRmZi0+c2V0X2VmZmVjdFtQSURfU1RBUlRfREVMQVldLnZh
bHVlWzBdID0gZWZmZWN0LT5yZXBsYXkuZGVsYXk7CiAKIAloaWRfaHdfcmVxdWVzdChwaWRm
Zi0+aGlkLCBwaWRmZi0+cmVwb3J0c1tQSURfU0VUX0VGRkVDVF0sCiAJCQlISURfUkVRX1NF
VF9SRVBPUlQpOwpAQCAtMzI2LDggKzMyNCw3IEBAIHN0YXRpYyBpbnQgcGlkZmZfbmVlZHNf
c2V0X2VmZmVjdChzdHJ1Y3QgZmZfZWZmZWN0ICplZmZlY3QsCiAJcmV0dXJuIGVmZmVjdC0+
cmVwbGF5Lmxlbmd0aCAhPSBvbGQtPnJlcGxheS5sZW5ndGggfHwKIAkgICAgICAgZWZmZWN0
LT50cmlnZ2VyLmludGVydmFsICE9IG9sZC0+dHJpZ2dlci5pbnRlcnZhbCB8fAogCSAgICAg
ICBlZmZlY3QtPnRyaWdnZXIuYnV0dG9uICE9IG9sZC0+dHJpZ2dlci5idXR0b24gfHwKLQkg
ICAgICAgZWZmZWN0LT5kaXJlY3Rpb24gIT0gb2xkLT5kaXJlY3Rpb24gfHwKLQkgICAgICAg
ZWZmZWN0LT5yZXBsYXkuZGVsYXkgIT0gb2xkLT5yZXBsYXkuZGVsYXk7CisJICAgICAgIGVm
ZmVjdC0+ZGlyZWN0aW9uICE9IG9sZC0+ZGlyZWN0aW9uOwogfQogCiAvKgpAQCAtNzM2LDcg
KzczMyw2IEBAIHN0YXRpYyB2b2lkIHBpZGZmX2F1dG9jZW50ZXIoc3RydWN0IHBpZGZmX2Rl
dmljZSAqcGlkZmYsIHUxNiBtYWduaXR1ZGUpCiAJcGlkZmYtPnNldF9lZmZlY3RbUElEX1RS
SUdHRVJfUkVQRUFUX0lOVF0udmFsdWVbMF0gPSAwOwogCXBpZGZmX3NldCgmcGlkZmYtPnNl
dF9lZmZlY3RbUElEX0dBSU5dLCBtYWduaXR1ZGUpOwogCXBpZGZmLT5zZXRfZWZmZWN0W1BJ
RF9ESVJFQ1RJT05fRU5BQkxFXS52YWx1ZVswXSA9IDE7Ci0JcGlkZmYtPnNldF9lZmZlY3Rb
UElEX1NUQVJUX0RFTEFZXS52YWx1ZVswXSA9IDA7CiAKIAloaWRfaHdfcmVxdWVzdChwaWRm
Zi0+aGlkLCBwaWRmZi0+cmVwb3J0c1tQSURfU0VUX0VGRkVDVF0sCiAJCQlISURfUkVRX1NF
VF9SRVBPUlQpOwo=

--------------Vn91C2W0gJTI1CRsfRIpcv1v--

