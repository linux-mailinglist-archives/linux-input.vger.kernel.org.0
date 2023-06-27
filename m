Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF15D73FEA9
	for <lists+linux-input@lfdr.de>; Tue, 27 Jun 2023 16:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjF0OpZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Jun 2023 10:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbjF0Ooy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Jun 2023 10:44:54 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F7530F8
        for <linux-input@vger.kernel.org>; Tue, 27 Jun 2023 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687877058; x=1688481858; i=friedrich.vock@gmx.de;
 bh=NjlHUr6STIKiCOo/McjOkiCakwMwBjFCWHsllLM3Zo8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=htQWcBxXfcYBiFfffDWoWZkWVVKBO6FBIEorrrTg074wEHXptyUWWm0N5Epwd9PqfArySiy
 zVZpNv6V6vUiN7RHpAW3weweeafPwAhM2tq3PowtwJDIA/9rI1ahOLN6BNHY8WQO7Z+lxC/Em
 MsrJj8bGPR6jBHX85lcLxTIvQSPCZWPB/V0UKs3vpbQes5fgZU2plTUqIj+PfX3ZO+9ai33AH
 Shvq5Dc1+AHK+jVSkBo73oHcIjpRAi2XOGm1eZ5YHgxdMfmP71p/dvLiUVPomkwodq47hK6r1
 1gO4hcRZBJX8zVypJosQQVoQcf+qbswEVaheurgm9F7rZ+Tbn1Vw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.115.159]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1q2NXm38OI-012WpL; Tue, 27
 Jun 2023 16:38:40 +0200
Message-ID: <0a9ba51e-0b07-cd9d-32fa-d99596c34183@gmx.de>
Date:   Tue, 27 Jun 2023 16:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
Content-Language: en-US
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        linux-input@vger.kernel.org,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20230530154058.17594-1-friedrich.vock@gmx.de>
 <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
 <7b2ec797-2fdd-9707-7f53-d0a24ed036fc@gmx.de>
 <b067c9a1-cc07-2781-9a9d-71488ec3ddba@amd.com>
 <491ec8a8-efc7-7995-ac82-03a5431f66bd@amd.com>
From:   Friedrich Vock <friedrich.vock@gmx.de>
In-Reply-To: <491ec8a8-efc7-7995-ac82-03a5431f66bd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+TpJqbSZGCm3qL4HjUca90Lty8ST7EndYO37o1cVy/7BBs8EBl9
 WqZfTDO5fDmcyGSNuNt0JoHbxHodujg+LLYY786WloYN9+jvvHxO2u3fcF/Jz/RODBIDXtb
 Hll3aZbcu2Ruj3dMQTdufbxa4lIYUaf/YBpCEjw4WJYPMqWRbvoSQ1cxJxsRzsKRh5j0YFK
 SZ6Uqfhlv/xCncRvJiHPQ==
UI-OutboundReport: notjunk:1;M01:P0:eemO9B4iSIQ=;Xnzh4LTgrdWYhdMMN2ICTIgdlta
 yGEWN36Q+ZpXnte/XFuJYaZjcRpBv2cbUWxmjitp77f5nBLnFLTrR+RI/lnB8qyJO2Xo7HFH2
 zPBrHuRSAxvajFCEwsl5n5yhSCfiizUF4SyQHos1aGGrhWeVHiHm4PcVB5nhgmlS0tKCM7jDJ
 LmEIgqD8K0mlf3MQaGj9FFeB/hSzh5qsotgCk1m6/NF0WW5VDJtmM4dxXMXPzl5twU+aFzrH+
 MBCCbFjvK9m25q5PXGPHT7Lmm0innTi+fKXagJNDFU2Ht7rcxNUPgqGKayNVslXi8ZgpLlsz4
 TEsMPnIb/Ha0CEc/Jq0LQxgEe4NcfZzjScmuzSrRYK8hOhzK3OdnbfPD7m8DSD+Er7Oob61Ey
 /x/4Zde2n4S7lG3PSemsPKr3ZRvTadYPnGL4+FHYnJ//MYvZP4v22ea3Ckqgn1aPn+/q1a7y0
 nF1bNfHYeTM3xGlGgYyf0zl/iGOfLomREt8GTuPsHL4in06dkNwknXVY2lAbZcGsIo/+Xi6UJ
 CS4rnZKLRoiuX1wOBqwosoYlmClzP9PKnkeJmiBYiylumsKB0rHvAY6Va8hi5QYZZpibfSSmu
 Ojtvyg1R5E5nkdZC5tfDmOGmZAYtWkXBysX1Qt6FsiS8Rwr+feJyPeh0tttJl4377Lr/QfXg0
 CX9tK47D3CzVxzlEFtferUnZ15XEGL/UwM5x1oHMHM+jjUaQgPoso3NUaEpxcuyrShqm9lDwr
 Q7zK4aTgIYG88YhS76d3smC8aiN637FwnD6LlfWJNOhiv04yIW4XZFVK5UhlmkEeSi7iAXZZE
 zWASnBI8PVeatMjia/+BTypO7J+/7+ZjfoUP+IBInIOa3Zwm9MKBDlWl1UeuCzblxdw1ekITw
 i91BS3kHn6/qOVml9fIuqdk5ggnE+axd+hDKiEYOQvqb0PmJBj0o5q90FZXhYepPoTvpJu7HW
 48skyXQbSx0P54zAW7+b9iMtBuI=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 26.06.23 17:10, Limonciello, Mario wrote:
>
> On 6/18/2023 10:05 PM, Mario Limonciello wrote:
>> On 6/15/23 07:41, Friedrich Vock wrote:
>>> Hi,
>>>
>>> sorry for taking so long to reply.
>>>
>>> On 02.06.23 20:43, Limonciello, Mario wrote:
>>>> + some AMD guys
>>>>
>>>> On 5/30/2023 10:40 AM, Friedrich Vock wrote:
>>>>> On these laptops, there seems to be a device that, when probed by
>>>>> i2c-hid, constantly sends bogus interrupts and interferes with the
>>>>> keyboard controller. When the device is enabled, it takes the
>>>>> keyboard
>>>>> around 8 seconds to register that keys are being pressed or released=
.
>>>>
>>>> Do you know what interrupt is firing constantly?
>>>> Presumably it is the GPIO controller master interrupt, right?
>>>> And it's for GPIO 7 (guessed from acpidump on one of the bug
>>>> reports).
>>>>
>>>> To confirm check /proc/interrupts.
>>> Seems likely that you guessed correctly. The corresponsing line in
>>> /proc/interrupts (with the interrupts counts omitted):
>>> 71:=C2=A0=C2=A0 amd_gpio=C2=A0=C2=A0=C2=A0 7=C2=A0 ITE5570:00
>>
>> OK.
> I had asked in the past for R/W everything output to compare to
> /sys/kernel/debug/gpio.
>
> I've added more explicit instructions how to get this to
> the kernel bugzilla 217336 =E2=80=93 keyboard not working Asus TUF FA617=
NS
> (kernel.org) <https://bugzilla.kernel.org/show_bug.cgi?id=3D217336#c126>
Thanks for this. R/W everything didn't work for the other people with
the same models, so I spent this day getting Windows and R/W everything
running myself. I managed to make it run and left a comment with the
results in that bugzilla report.
>>
>>>>
>>>> If it's not obvious which GPIO is firing there is also a dynamic
>>>> debug statement in pinctrl-amd.c that may be helpful to figure
>>>> this out.
>>>>
>>>> I would also suspect in Windows this doesn't happen.=C2=A0 If possibl=
e
>>>> can you confirm that? Check in Device Manager what driver is bound
>>>> to this device. Is it "inbox" from Microsoft or is it an ASUS
>>>> specific driver?
>>>>
>>>> I wonder if the GPIO controller got programmed differently in
>>>> Windows for some reason. We may want to confirm the values for
>>>> GPIO registers from /sys/kernel/debug/gpio in Linux against those
>>>> that are programmed in Windows.
>>>>
>>>> This can be accomplished using R/W everything in Windows.
>>>
>>> Unfortunately I don't have Windows installed on this system. I know
>>> some
>>> people with the Ryzen 9 7940HS model which might, I'll ask them if the=
y
>>> can give me the configuration on Windows and Linux.
>>
>> OK, I suggest directing everyone over to the bugs I linked and we
>> should gather the relevant GPIO controller register dumps from
>> Windows and Linux on the same hardware there.
>>
>>>
>>>>
>>>>>
>>>>> Nothing I tried seemed to make the device work, and preventing the
>>>>> device from being probed doesn't seem to break any functionality of
>>>>> the laptop.
>>>>>
>>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>>
>>>> There are a few bug reports that popped up around this issue that
>>>> should
>>>> probably also be tagged.
>>>>
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217336
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217493
>>>>
>>>>> ---
>>>>> =C2=A0 drivers/hid/i2c-hid/i2c-hid-core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++
>>>>> =C2=A0 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48
>>>>> ++++++++++++++++++++++++
>>>>> =C2=A0 drivers/hid/i2c-hid/i2c-hid.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
>>>>> =C2=A0 3 files changed, 56 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> index efbba0465eef..5f0686d058df 100644
>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client
>>>>> *client, struct i2chid_ops *ops,
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ihid->quirks =3D i2c_hid_lookup_quirk=
(hid->vendor, hid->product);
>>>>>
>>>>> +=C2=A0=C2=A0=C2=A0 if (i2c_hid_device_blocked(hid->vendor, hid->pro=
duct)) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENODEV;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_irq;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>> The thing I worry about here is that an unserviced interrupt can
>>>> prevent the
>>>> hardware from going into proper low power states; particularly at
>>>> runtime.
>>>>
>>>> I think we should better understand what's going on before going down
>>>> this
>>>> path of just ignoring it.
>>> Yeah, I guess I should've searched more for a proper explanation/fix
>>> before submitting hacks like this. Let's see if this can be fixed in a
>>> cleaner manner than preemptively disabling parts of the system.
>>
>> Can you please have a try with linux-next or apply this series:
>> https://lore.kernel.org/linux-gpio/20230421120625.3366-1-mario.limoncie=
llo@amd.com/
>>
>>
>> That does change some of the configuration for the GPIO controller
>> registers to align how windows is handling debouncing.
>>
>> I don't think it will change the outcome of your bug, but I'd love
>> to be surprised.
> Any updates for this?
Tried this out today. You won't be surprised, it didn't change anything.
>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hid_add_device(hid);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D =
-ENODEV)
>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>> b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>> index 210f17c3a0be..d2c2806b64b4 100644
>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>> @@ -440,6 +440,38 @@ static const struct dmi_system_id
>>>>> i2c_hid_dmi_quirk_table[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { }=C2=A0=C2=A0=C2=A0 /* Terminate li=
st */
>>>>> =C2=A0 };
>>>>>
>>>>> +static const struct hid_device_id i2c_hid_blocked_ite_device =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDO=
R_ID_ITE,
>>>>> 0x8051)
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * This list contains devices that can't be activated at all, for
>>>>> example
>>>>> + * because activating them breaks other important parts of the
>>>>> system.
>>>>> + */
>>>>> +static const struct dmi_system_id i2c_hid_dmi_block_table[] =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * On ASUS TUF Gaming A16 laptops, there is=
 a device that will
>>>>> make the
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * keyboard controller stop working correct=
ly and flood the CPU
>>>>> with bogus
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * interrupts.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "ASUS TUF Gam=
ing A16 (Ryzen 7 7735HS)",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
>>>>> INC."),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *=
)&i2c_hid_blocked_ite_device,
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "ASUS TUF Gam=
ing A16 (Ryzen 9 7940HS)",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
>>>>> INC."),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *=
)&i2c_hid_blocked_ite_device,
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 { }=C2=A0=C2=A0=C2=A0 /* Terminate list */
>>>> If this *does* end up being the best solution, I think it's better
>>>> to patch in the DMI to gpiolib-acpi.c similar to other quirks for
>>>> floating
>>>> GPIOs.=C2=A0 Example:
>>>>
>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-ac=
pi.c#L1654
>>>>
>>>>
>>>>
>>>>> +};
>>>>>
>>>>> =C2=A0 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(ui=
nt8_t
>>>>> *i2c_name)
>>>>> =C2=A0 {
>>>>> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor,
>>>>> const u16 product)
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return quirks;
>>>>> =C2=A0 }
>>>>> +
>>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 const struct dmi_system_id *system_id =3D
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
dmi_first_match(i2c_hid_dmi_block_table);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (system_id) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct hid_device_=
id *device_id =3D
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (struct hid_device_id *)(system_id->driver_data);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (device_id && device_=
id->vendor =3D=3D vendor &&
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
device_id->product =3D=3D product)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return true;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0 return false;
>>>>> +}
>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid.h
>>>>> b/drivers/hid/i2c-hid/i2c-hid.h
>>>>> index 2c7b66d5caa0..e17bdd758f39 100644
>>>>> --- a/drivers/hid/i2c-hid/i2c-hid.h
>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid.h
>>>>> @@ -10,6 +10,7 @@ struct i2c_hid_desc
>>>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>>>>> =C2=A0 char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_n=
ame,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *size);
>>>>> =C2=A0 u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 produc=
t);
>>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>>>>> =C2=A0 #else
>>>>> =C2=A0 static inline struct i2c_hid_desc
>>>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>>>>> @@ -19,6 +20,8 @@ static inline char
>>>>> *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>>> =C2=A0 { return NULL; }
>>>>> =C2=A0 static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, co=
nst
>>>>> u16 product)
>>>>> =C2=A0 { return 0; }
>>>>> +static inline bool i2c_hid_device_blocked(const u16 vendor, const
>>>>> u16 product)
>>>>> +{ return false; }
>>>>> =C2=A0 #endif
>>>>>
>>>>> =C2=A0 /**
>>>>> --
>>>>> 2.40.1
>>>>>
>>>>>
>>
Thanks,
Friedrich
