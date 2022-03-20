Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4944E1DAB
	for <lists+linux-input@lfdr.de>; Sun, 20 Mar 2022 20:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343612AbiCTT74 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Mar 2022 15:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343619AbiCTT7x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Mar 2022 15:59:53 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBEA3632A;
        Sun, 20 Mar 2022 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=vROVO+ZWBaANfJn15veOaP16wW9kTkJdzaKa8pMEZLM=; b=AL5Gue4RQqpA1TTLEP0wQktSLa
        MNJgDt/pUYyDrT2atIh+6pn3HXbDFy0UPJS7TGiDQDcHZ/Q3VKnf9dwmXjifk13BkmlvCIwATyoZM
        TE3GoxUcRtsnByrShKooFEd6PtvCDk5IpZcTxEdinar66xpJnHxcoYuuwZCM8eCl+BYUDx+/NP3SF
        nDVhXnY0wLRMqqHLRWTNcPpr0M+ZfDizt3eOqCREO1nlNNEcfBNaK+DzhodX4qPdrtOoYlNWkWFch
        +KAuIRFXFhfG1ye5QL4WNrjbMGvQN7HdS0kTUL89uaJisW5uC58O6FSrrRIyqc6mGiivCISoAi9sL
        egcSGAtg==;
Received: from [2601:1c0:6280:3f0::6c43]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nW1gy-002tpt-ES; Sun, 20 Mar 2022 19:58:20 +0000
Message-ID: <f9058afc-cbf0-8bea-1191-ed7cc285eaa9@infradead.org>
Date:   Sun, 20 Mar 2022 12:57:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On 3/18/22 01:54, Hans de Goede wrote:
> <attempt 2, fat-fingered send>
> 
> Hi Randy,
> 
> On 3/18/22 01:32, Randy Dunlap wrote:
>> Hi all,
>>
>> I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
>> (which I think of as a nuisance pad).
>> I would like to be able to disable the touchpad easily.
>>
>> Are there any best practices or suggestions for how to do this?
>> (I am using xfce4 as the desktop environment if that matters.)
>>
>>
>> Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
>> the i8042 AUX port, and sometimes it is discovered as this
>> touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
>> "i2c-DELL0B24:00". (The different discoveries might have something
>> to do with my kernel configuration/builds, but I don't know that
>> for sure.)
>>
>> I have some very hackish scripts that I can run to toggle the
>> 'inhibited' flag in sysfs (/sys/class/input/ for the I2C device or
>> or /sys/devices/platform/i8042/ for the i8042 AUX port device),
>> but that requires root (sudo), so that does not qualify as "easily"
>> IMO.
>>
>> E.g.,
>> $ sudo toggle-aux-mouse
>> or
>> $ sudo toggle-i2c-touchpad
>>
>> depending on which configuration the device is in.
> 
> The touchpad is supposed to be always recognized as, well a touchpad,
> so you want it to show up as "DELL0B24:00 04F3:3147 Touchpad", as
> you said this likely depends on your kernel config.
> 
> And then usually the desktop environment will give you an option
> to disable it. At least GNOME offers a clear on/off toggle see e.g. :
> 
> https://blog.separateconcerns.com/img/gnome-touchpad-settings.jpg

OK, I finally found that. and it works.

> Or you could use xinput properties to set the matching xinput
> device, to disabled which you can do by device-name:
> 
> https://linuxhint.com/change_mouse_touchpad_settings_xinput_linux/
> 
> And then change the "Device Enabled" property.

and that also works.

> Regardless of the method, the kernel's responsibility here is
> to make sure the touchpad gets seen as a touchpad and after that
> "disabling" it is a userspace problem.

Sure, I get it.

Thanks for your help.

