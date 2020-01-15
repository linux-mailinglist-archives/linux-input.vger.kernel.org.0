Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6680F13B8B0
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 05:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgAOE3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 23:29:44 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33049 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728882AbgAOE3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 23:29:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CCACC22101;
        Tue, 14 Jan 2020 23:29:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 14 Jan 2020 23:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=z
        Jo93Ij4/xqrfSwqp8hiO0mLdtr6PM8tbY7VqeJqHzM=; b=OIlTnab2dr4vk/KtD
        wfcKRCrHv57sOobDA+mEaSxwXD0a54CEE+rjzH3I2T9sa8hGX0TKEhLF6+rayy3A
        M6ollw3QGAcqnTMCLD7HIKCZZW8cm6HSeKjmIbOXfzaCbiMNs0Hh/8CnpgZMSwlm
        mQp7O1ixuMORm8dcWaiJ3cULS1Es5cE8Tl7TbpUZ7vfocwkdAj5UeBEYpn45OZf0
        qsAqiCpeVavhP5z+eXqS0G7TDGAWpd3dU2+1w4xxB7n/uTPfZ+JxuzO05O6cinXa
        FCqt4WjxOPSXVGaD49V+68AXHCiZvJju+0qZNrHWeE4QM/gByYx/3s8hl9S66vGD
        Co39A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=zJo93Ij4/xqrfSwqp8hiO0mLdtr6PM8tbY7VqeJqH
        zM=; b=CWeWVYNvwJxXsNlSLKcBKTj9c/5x+QTrDauxj4nPoJ8SyQJ//yKK4K3oV
        lTNHusm0jwMlrx4Eamten3G28VW99smaC2s9d1Ow4qo3UIfwconJ6PixpIV2sxxm
        bDIeDKoYTW8PMAp3rYlQ7M+QXo9Ixocq1k9Mp0VX1Qgm15fkjsCdOzecVYWb5GRU
        MU+gUL6yvrvmqd4PygRWkTY/5pzzjC8U+3Pp0jfnTNsOCOeEyCjT35iNUS91U/HT
        IVty+SNkUYS5XeYarnxPi9fB5UKICJgDLHoevFFxW+iMK75zQEfytVpbsRA4WW8e
        xP9Vup29spnOZtq2JrC+SZ70SCTow==
X-ME-Sender: <xms:NpUeXsOj6BVDoOIugKB7gZrCLMvLSV7FgHs8rfN1a9FYkEBKfDAOMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
    epjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
    uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:NpUeXmzAp7A7UTq88h5xplf3DPmADVNWYxBZtohpXKA7EhadSsBbMg>
    <xmx:NpUeXsVVK0yp4wN9k2vUMq7UZtGkDDLjecI7nS_80IBa_s8pGcSCAw>
    <xmx:NpUeXoPe-LjPOpuE3qXF2Os0v9xYt7ELUrI222urufvucUbYYmlotw>
    <xmx:NpUeXgT7ZRT4_M8V0vm3OMIp1Fe8q8IWKr0VD5ULSnipZ4oHL1MvJA>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE87B8005A;
        Tue, 14 Jan 2020 23:29:41 -0500 (EST)
Subject: Re: [linux-sunxi] Re: [PATCH 1/3] Input: axp20x-pek - Remove unique
 wakeup event handling
To:     hdegoede@redhat.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20200113032032.38709-1-samuel@sholland.org>
 <6c876812-6ec1-cf28-8ce4-7732c5cf67da@redhat.com>
 <22828711-7e60-a0cb-4ac9-e7c6d6aff080@redhat.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <a22fd3c2-bad7-dc22-42cb-24f4faae4db2@sholland.org>
Date:   Tue, 14 Jan 2020 22:29:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <22828711-7e60-a0cb-4ac9-e7c6d6aff080@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hans,

Thank you for the detailed explanation! This is exactly the background I needed,
and it clears up my confusion.

On 1/13/20 4:58 AM, Hans de Goede wrote:
> On 13-01-2020 11:41, Hans de Goede wrote:
>> Hi,
>>
>> On 13-01-2020 04:20, Samuel Holland wrote:
>>> This driver attempts to avoid reporting wakeup events to userspace by
>>> clearing a possible pending IRQ before IRQs are enabled during resume.
>>> The assumption seems to be that userspace cannot cope with a KEY_POWER
>>> press during resume. However, no other input driver does this, so it
>>> would be a bug that such events are missing with this driver.
>>>
>>> Furthermore, for PMICs connected via I2C or RSB, it is not possible to
>>> update the regmap during the noirq resume phase, because the bus
>>> controller drivers require IRQs to perform bus transactions. And the
>>> resume hook cannot move to a later phase, because then it would race
>>> with the power key IRQ handler.
>>>
>>> So the best solution seems to be simply removing the hook.
>>
>> Hmm, I'm not sure this is a good idea, let me give you some background
>> info on this:
>>
>> This hook was handled because on X86 systems/laptops when waking
>> them up typically the power-button does not send a KEY_POWER press event
>> when the system was woken up through the power-button.
>>
>> So normal (e.g. Debian, Fedora) userspace does not expect this event
>> and will directly go to sleep again because that is the default behavior
>> on a KEY_POWER event.
> 
> p.s.
> 
> The main reason why typical userspace does not expect the KEY_POWER
> event is because most of the devices which run mainline and have
> suspend/resume working and are using the ACPI button driver for
> the power-button: drivers/acpi/button.c, which has:

Ah, that explains why I didn't see this driver: I was only looking in
drivers/input. I was surprised to find none of the other drivers having similar
hooks.

>                         acpi_pm_wakeup_event(&device->dev);
>                         if (button->suspended)
>                                 break;
> 
>                         keycode = test_bit(KEY_SLEEP, input->keybit) ?
>                                                 KEY_SLEEP : KEY_POWER;
>                         input_report_key(input, keycode, 1);
>                         input_sync(input);
>                         input_report_key(input, keycode, 0);
>                         input_sync(input);
> 
> And:
> 
> static int acpi_button_suspend(struct device *dev)
> {
>         struct acpi_device *device = to_acpi_device(dev);
>         struct acpi_button *button = acpi_driver_data(device);
> 
>         button->suspended = true;
>         return 0;
> }
> 
> static int acpi_button_resume(struct device *dev)
> {
>         struct acpi_device *device = to_acpi_device(dev);
>         struct acpi_button *button = acpi_driver_data(device);
> 
>         button->suspended = false;
>         return 0;
> }
> 
> So when the ACPI notify for the button runs on resume, suspended is
> still true; and no KEY_POWER event is send...

I tried to implement this same kind of logic for axp20x-pek, but I dropped it
because it's racy in my situation. regmap-irq uses a threaded IRQ, and the
RSB/I2C bus controllers use interrupts and completions. So if the ->resume()
hook gets called before we can read 3 IRQ status registers from the PMIC, we'd
get a spurious KEY_POWER event.

> Arguably to be consistent we should fix drivers/acpi/button.c to
> send KEY_POWER on wakeup too, but that will break things for many
> users with a likelyhood of breakage approaching 100%.
> 
> Note I'm not telling this to argue against your change, just as
> background for why I added this behavior to the axp20x-pek code.
> 
> Oh and taking a second look, I see that the hook is already
> written so as to only execute on the AXP288 PMIC, which means
> it should effectively already only influence X86 machines.

I wasn't sure if AXP288 was x86-only. Thanks for confirming this.

> So are you trying to get the KEY_POWER event after wakeup
> by power-button to work on a X86 device ?  In that case please
> be aware of the drivers/acpi/button.c issue...
> 
> I have the feeling that we may need a Kconfig option to configure
> whether or not to send KEY_POWER on wakeup by power-button, because
> as discussed in my previous mail Android wants this, KDE/MATE/GNOME
> not so much...

I'm working on the Allwinner sunxi platform (arm64) using AXP8xx. Specifically,
though, I'm working with the PinePhone, which is designed to run mainline Linux
and non-Android userspace, such as GNOME derivatives or KDE Plasma Mobile. Those
GUI environments might be expecting the x86 behavior.

> Regards,
> 
> Hans
> 
> 
> 
>>
>> On x86 axp20x-pek is only used for the power-button on Bay Trail devices
>> with a AXP288 PMIC. On Cherry Trail devices with an AXP288 PMIC the
>> power-button is also connected directly to a GPIO on the SoC and that
>> is used (also see the axp20x_pek_should_register_input function).
>>
>> So after writing this patch, when doing hw-enablement for the power-button
>> on the Cherry Trail devices I learned that the gpio_keys driver does
>> send userspace a KEY_POWER event when woken up with the power-button.
>>
>> I wrote a patch for gpio-keys to not do this, as that is what normal
>> Linux userspace expects, but that was nacked, because under e.g.
>> Android the KEY_POWER event is actually desirable / necessary to avoid
>> Android immediately re-suspending the system again. Since my "fix" to
>> the gpio-keys devices was nacked I have instead wroked around this in
>> userspace, but *only* for the GNOME3 desktop environment, by teaching
>> GNOME3 to ignore KEY_POWER events for the first couple of seconds after
>> a resume.
>>
>> So your suggested change, which will cause KEY_POWER to be send on
>> Bay Trail devices after a wake-up by the power button, should be
>> fine for recent GNOME3 versions, but for other desktop environments
>> this may cause a regression where they respond to the new KEY_POWER
>> event by immediately going back to sleep again.
>>
>> As for this not working with the i2c bus, it does on X86 because
>> the PMIC is also directly accessed by the power-management HW of
>> the SoC and to make this work the i2c-controller is never suspended
>> and its irq is marked IRQF_NO_SUSPEND. But this is X86 special
>> sauce.
>>
>> Summarizing:
>>
>> I'm personally fine with remove the magic I added to suppress
>> the KEY_POWER press reporting as in hindsight given the gpio-keys
>> story I should have never added it. But I'm worried about this
>> causing regressions for some Bay Trail users. OTOH making this
>> change would be good for Android X86 users.
>>
>> Another IMHO better fix would be to drop the __maybe_unused and
>> instead wrap both the axp20x_pek_resume_noirq function and the
>> init of the  .resume_noirq struct member with:
>>
>> #if defined X86 && defined CONFIG_PM_SLEEP
>>
>> This keeps the current behavior on Bay Trail machines, while
>> I assume it should also fix the issues this was causing for
>> your setup.

I think just dropping this patch will have the same effect, and it's what I plan
to do for v2. As you mentioned, AXP288 is x86 only, and the code works with the
i2c controller there. So as long as the hook applies only to AXP288, it should
be fine.

If receiving KEY_POWER during resume turns out to be an issue on other PMIC
variants, I'll look for a more generic solution then. Maybe the input core can
be taught to drop the first KEY_POWER event received during system resume.

Thanks again!
Samuel

>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>
>>
>>
>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>>> ---
>>>   drivers/input/misc/axp20x-pek.c | 25 -------------------------
>>>   1 file changed, 25 deletions(-)
>>>
>>> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
>>> index 17c1cca74498..7d0ee5bececb 100644
>>> --- a/drivers/input/misc/axp20x-pek.c
>>> +++ b/drivers/input/misc/axp20x-pek.c
>>> @@ -352,30 +352,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
>>>       return 0;
>>>   }
>>> -static int __maybe_unused axp20x_pek_resume_noirq(struct device *dev)
>>> -{
>>> -    struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
>>> -
>>> -    if (axp20x_pek->axp20x->variant != AXP288_ID)
>>> -        return 0;
>>> -
>>> -    /*
>>> -     * Clear interrupts from button presses during suspend, to avoid
>>> -     * a wakeup power-button press getting reported to userspace.
>>> -     */
>>> -    regmap_write(axp20x_pek->axp20x->regmap,
>>> -             AXP20X_IRQ1_STATE + AXP288_IRQ_POKN / 8,
>>> -             BIT(AXP288_IRQ_POKN % 8));
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -static const struct dev_pm_ops axp20x_pek_pm_ops = {
>>> -#ifdef CONFIG_PM_SLEEP
>>> -    .resume_noirq = axp20x_pek_resume_noirq,
>>> -#endif
>>> -};
>>> -
>>>   static const struct platform_device_id axp_pek_id_match[] = {
>>>       {
>>>           .name = "axp20x-pek",
>>> @@ -394,7 +370,6 @@ static struct platform_driver axp20x_pek_driver = {
>>>       .id_table    = axp_pek_id_match,
>>>       .driver        = {
>>>           .name        = "axp20x-pek",
>>> -        .pm        = &axp20x_pek_pm_ops,
>>>           .dev_groups    = axp20x_groups,
>>>       },
>>>   };
>>>
> 

