Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D1C73191C
	for <lists+linux-input@lfdr.de>; Thu, 15 Jun 2023 14:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbjFOMmM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jun 2023 08:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjFOMmL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jun 2023 08:42:11 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76C11FE5
        for <linux-input@vger.kernel.org>; Thu, 15 Jun 2023 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1686832914; x=1687437714; i=friedrich.vock@gmx.de;
 bh=VrEfMYGBGkBh8y/CHjNS0TT21pkH/4OY2GU5JQYMWag=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=eigUgnR5Ja7amxgxuo7UDgvVmHZcRtoY+pXBnkknCpaLoDY8aRyb1AXDkbuevPRjzovrIF3
 kKf8Pa+STpY1bQFtU5U2P3a4Kww3Q6fNECdPhQrS3WUqUap2NKfJnJW2dWdueJcEU0WYgVUS1
 LY/u+ZsM22rVBWnderv5jcc0qJB+yImaRGNWkhWTNLXg+gEmKezDvdcYLqqODUZFdyN21LAze
 BI/D0VEhwVE6FZs0cvfth9q/1yf3CnEQdQUuIwbwsQfySakvj641aQ8Sz8Dy+JJIVgAABredQ
 QOkmiXSs9J02K/A4xqcQrTITTVS98dLUdosxK1uxqDrCMmV+6A7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.115.159]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1q5MR90M2T-014Vqj; Thu, 15
 Jun 2023 14:41:54 +0200
Message-ID: <7b2ec797-2fdd-9707-7f53-d0a24ed036fc@gmx.de>
Date:   Thu, 15 Jun 2023 14:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        linux-input@vger.kernel.org,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20230530154058.17594-1-friedrich.vock@gmx.de>
 <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
From:   Friedrich Vock <friedrich.vock@gmx.de>
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
In-Reply-To: <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mc4sfQUSmBteZvZvmwguxhXn1VYqPCM8XTHI3Zod4fSBoU2ZGuC
 sTJGE2ARCdZRez800HjFUppHSTiRwF1jsLXUbPbBHBhXlS9zmIktvmKH1xSJjYDwexfUoB0
 AphvihvzhAr8qZ+NNQFkc0SBCncZRJUTwZmm4+gKGVoMLGWrgdiqPkZLPRzYdXYMM0r9t7X
 w77VkfupefGKMR10awKRg==
UI-OutboundReport: notjunk:1;M01:P0:kabzqCykW5c=;zOD9jAjBvpGZpEGOg5QLtl0Q58g
 iWeYvr0KU5qXOu63oNTV/hv3EVxmRv/TmLyrKqG+3nNBFxmR082t6HNFxjbuUB7NiwPllzS9v
 q2ywcG8vMVlgV1Vw4zHIHFWbbmHLTMJu1UaTm2dqTTVEyRjpDCpG8Mdld2kDOSJcn0EcLzrxy
 JU6mpRrxbGAJO6XIYINWvvq+YcCwiCdMmOM26p/cPKPG22e7RMqJe7Q7q4V5cVqZhf7R7/772
 XLUikhx8OMPSta79JI1SXdfnfx+jFJ8pdsjOsB30Xi4zRxQf/LNDVYC7qrwbqIW512pAdWvr6
 VSWJxcXglSfF2ZnpczjIujs5olNbTt+bY2tH2QF+sLu0AZ4SJxDVoN+NiHPIW347OfriqlYBA
 l7mEMXt+eblcuFtthy4qPizCryAE6NmWCQMugijjXe0c5Sliyu5vufCfhY/8EdRnvemeeWSz/
 usk7o8Byw6A5VE2V/vw91qbh1yGQ+9mF2Dvv3OVbSBxMrt4By2cKjqLwbJUgSbbYDTTmrC3lV
 PkN71ITpb7XLu8ey2DdAMryN447rCSI0IXW2uyvQsLvtS7oNsGvFVuK9LKzMi1weKkKw6no0g
 yCOhgq7zbxySCD30qplW5avFuCxk3Iir6ZmklfABvzxUDX8m2doVxJgY+BVAopDamxCbxL5TY
 5xR4iUNCUpLKNf2vTqwSW9kKJ2dHCL0KXLtRVXtLpPTUt3DMPYeoEar6ZsurRgjbcHYYEbS3P
 Dcxv1K9mWG0loHM6+R0t36GbV6hLIB16qcuXbxcwboBGIt4E63ClzzgUQsgnq3wtUS5udkB1u
 AtGkwVcu/oQHxpW9vu9gK1YFluCiPufeeugnbof8zTo67OJvjBHXZj5H06lGPS3Cu9G48QAwB
 eFp/Rb3dssIXIGEHDXMQAqoicm+0Ub+11nDOqX+o3bxmujt1u+YjAJkdtAsaeiGAz0Rir8VEp
 L2/+EQffR+zySY9f/uFaEomscPU=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

sorry for taking so long to reply.

On 02.06.23 20:43, Limonciello, Mario wrote:
> + some AMD guys
>
> On 5/30/2023 10:40 AM, Friedrich Vock wrote:
>> On these laptops, there seems to be a device that, when probed by
>> i2c-hid, constantly sends bogus interrupts and interferes with the
>> keyboard controller. When the device is enabled, it takes the keyboard
>> around 8 seconds to register that keys are being pressed or released.
>
> Do you know what interrupt is firing constantly?
> Presumably it is the GPIO controller master interrupt, right?
> And it's for GPIO 7 (guessed from acpidump on one of the bug
> reports).
>
> To confirm check /proc/interrupts.
Seems likely that you guessed correctly. The corresponsing line in
/proc/interrupts (with the interrupts counts omitted):
71:=C2=A0=C2=A0 amd_gpio=C2=A0=C2=A0=C2=A0 7=C2=A0 ITE5570:00
>
> If it's not obvious which GPIO is firing there is also a dynamic
> debug statement in pinctrl-amd.c that may be helpful to figure
> this out.
>
> I would also suspect in Windows this doesn't happen.=C2=A0 If possible
> can you confirm that? Check in Device Manager what driver is bound
> to this device. Is it "inbox" from Microsoft or is it an ASUS
> specific driver?
>
> I wonder if the GPIO controller got programmed differently in
> Windows for some reason. We may want to confirm the values for
> GPIO registers from /sys/kernel/debug/gpio in Linux against those
> that are programmed in Windows.
>
> This can be accomplished using R/W everything in Windows.

Unfortunately I don't have Windows installed on this system. I know some
people with the Ryzen 9 7940HS model which might, I'll ask them if they
can give me the configuration on Windows and Linux.

>
>>
>> Nothing I tried seemed to make the device work, and preventing the
>> device from being probed doesn't seem to break any functionality of
>> the laptop.
>>
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>
> There are a few bug reports that popped up around this issue that should
> probably also be tagged.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217336
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217493
>
>> ---
>> =C2=A0 drivers/hid/i2c-hid/i2c-hid-core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +++
>> =C2=A0 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48 ++++++++++++++++++=
++++++
>> =C2=A0 drivers/hid/i2c-hid/i2c-hid.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>> =C2=A0 3 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
>> b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index efbba0465eef..5f0686d058df 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client
>> *client, struct i2chid_ops *ops,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ihid->quirks =3D i2c_hid_lookup_quirk(hi=
d->vendor, hid->product);
>>
>> +=C2=A0=C2=A0=C2=A0 if (i2c_hid_device_blocked(hid->vendor, hid->produc=
t)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENODEV;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_irq;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
> The thing I worry about here is that an unserviced interrupt can
> prevent the
> hardware from going into proper low power states; particularly at
> runtime.
>
> I think we should better understand what's going on before going down
> this
> path of just ignoring it.
Yeah, I guess I should've searched more for a proper explanation/fix
before submitting hacks like this. Let's see if this can be fixed in a
cleaner manner than preemptively disabling parts of the system.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hid_add_device(hid);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D -EN=
ODEV)
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>> b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>> index 210f17c3a0be..d2c2806b64b4 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>> @@ -440,6 +440,38 @@ static const struct dmi_system_id
>> i2c_hid_dmi_quirk_table[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { }=C2=A0=C2=A0=C2=A0 /* Terminate list =
*/
>> =C2=A0 };
>>
>> +static const struct hid_device_id i2c_hid_blocked_ite_device =3D {
>> +=C2=A0=C2=A0=C2=A0 HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_I=
D_ITE, 0x8051)
>> +};
>> +
>> +/*
>> + * This list contains devices that can't be activated at all, for
>> example
>> + * because activating them breaks other important parts of the system.
>> + */
>> +static const struct dmi_system_id i2c_hid_dmi_block_table[] =3D {
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * On ASUS TUF Gaming A16 laptops, there is a =
device that will
>> make the
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * keyboard controller stop working correctly =
and flood the CPU
>> with bogus
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * interrupts.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "ASUS TUF Gaming=
 A16 (Ryzen 7 7735HS)",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)&i=
2c_hid_blocked_ite_device,
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "ASUS TUF Gaming=
 A16 (Ryzen 9 7940HS)",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)&i=
2c_hid_blocked_ite_device,
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 { }=C2=A0=C2=A0=C2=A0 /* Terminate list */
> If this *does* end up being the best solution, I think it's better
> to patch in the DMI to gpiolib-acpi.c similar to other quirks for
> floating
> GPIOs.=C2=A0 Example:
>
> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.=
c#L1654
>
>
>> +};
>>
>> =C2=A0 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8=
_t
>> *i2c_name)
>> =C2=A0 {
>> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor,
>> const u16 product)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return quirks;
>> =C2=A0 }
>> +
>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
>> +{
>> +=C2=A0=C2=A0=C2=A0 const struct dmi_system_id *system_id =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dmi=
_first_match(i2c_hid_dmi_block_table);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (system_id) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct hid_device_id =
*device_id =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (struct hid_device_id *)(system_id->driver_data);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (device_id && device_id-=
>vendor =3D=3D vendor &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
ice_id->product =3D=3D product)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn true;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 return false;
>> +}
>> diff --git a/drivers/hid/i2c-hid/i2c-hid.h
>> b/drivers/hid/i2c-hid/i2c-hid.h
>> index 2c7b66d5caa0..e17bdd758f39 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid.h
>> +++ b/drivers/hid/i2c-hid/i2c-hid.h
>> @@ -10,6 +10,7 @@ struct i2c_hid_desc
>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>> =C2=A0 char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *size);
>> =C2=A0 u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>> =C2=A0 #else
>> =C2=A0 static inline struct i2c_hid_desc
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>> @@ -19,6 +20,8 @@ static inline char
>> *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>> =C2=A0 { return NULL; }
>> =C2=A0 static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const
>> u16 product)
>> =C2=A0 { return 0; }
>> +static inline bool i2c_hid_device_blocked(const u16 vendor, const
>> u16 product)
>> +{ return false; }
>> =C2=A0 #endif
>>
>> =C2=A0 /**
>> --
>> 2.40.1
>>
>>
