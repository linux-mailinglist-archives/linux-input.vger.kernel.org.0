Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909EF51755C
	for <lists+linux-input@lfdr.de>; Mon,  2 May 2022 19:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243499AbiEBRJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 May 2022 13:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386636AbiEBRJN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 May 2022 13:09:13 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546985FDB
        for <linux-input@vger.kernel.org>; Mon,  2 May 2022 10:05:29 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id e7-20020a4aaac7000000b00330e3ddfd4bso2685704oon.8
        for <linux-input@vger.kernel.org>; Mon, 02 May 2022 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=YaBhBX3OGz27w8zsFaMQNKZiH1DdTB3XSvpWjXEyZvg=;
        b=dFfgnGylujwSB1M9YZJXsMWtOg7613WkYHHccDKnbCbGnxg06ruwnVbEjSY7XIsdTH
         uFKU6o6/TMsO8C3OjF3ZT3Gbo+SFWZe0rc/8zovu5NOqtMQ8XlS2jZ88CglHSnUx9E/k
         LapMQwwG3sra6kt7tEDhrSDaZ26PZHz4Jj247HXBbnV8kNEAQW34ccowaP8IKpnTvSjJ
         1iJIyO46p8BAyMJebhz5lUE8+e0jXYZfswOagZjqU1x3FkDJjwND9W4ysJOxMulY885s
         mOBjzmHjLcjZclJHU86dN11HScBHNoqNzaGsMrEGhr5kVGf3kRTy5bd5X6leIKxGSb5u
         gYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :subject:references:in-reply-to:content-transfer-encoding;
        bh=YaBhBX3OGz27w8zsFaMQNKZiH1DdTB3XSvpWjXEyZvg=;
        b=QJp3VeryfdC91tPQGD+5ZqaOZtA/e0FH127i/mpTbf1AE6Ox0dq/BSrQguP9xQMF9s
         rzvT7My35HytrSHfM6OnJo0u8OHjR3tklniPaHc80llnxZ/7chY1FKWH63iAkxpa2H5g
         Ln9FKiBx15qJDmJ53nDRkSRzXoA+NQS6idJHHpY03ELOXKD31NlrqMCeHRMFRm/sV668
         /7w7LOOBYsW+lu3DYfGJ7y0i7k1suSFX+K0uALvAftkvvCMBfVO3C5Q56bxkuvvHEB5B
         Y7RUPSmHhVKjDz8VTOeYPt6XOwtk7yIYasISzauwTmUMYlPeTtxhhoM7miSUCYVNc71U
         RF/A==
X-Gm-Message-State: AOAM531V4RpHD0CXOHUJkIF/NP0ph/ZYehpm9F/qCkyFVNyKdFg3tXIr
        jJtMLzm+lbfZzZPJldSt98A=
X-Google-Smtp-Source: ABdhPJzlAckfNPy6APw9T8AVcRUlFtiQBmL4l4XkcaBhluachySt9njkchFug80e1eoIt31CVPIUcw==
X-Received: by 2002:a4a:be8a:0:b0:35e:9d51:2359 with SMTP id o10-20020a4abe8a000000b0035e9d512359mr4363169oop.6.1651511128456;
        Mon, 02 May 2022 10:05:28 -0700 (PDT)
Received: from ?IPV6:2804:d51:4934:ba00:94bc:4f94:65e9:7f9f? ([2804:d51:4934:ba00:94bc:4f94:65e9:7f9f])
        by smtp.gmail.com with ESMTPSA id g2-20020a056870a70200b000e686d1389esm5883068oam.56.2022.05.02.10.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:05:18 -0700 (PDT)
Message-ID: <a397e0bd-43d1-df76-0734-76671670093c@gmail.com>
Date:   Mon, 2 May 2022 14:05:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From:   marcoshalano@gmail.com
To:     Bastien Nocera <hadess@hadess.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        HID CORE LAYER <linux-input@vger.kernel.org>
Subject: Re: Battery indication for Logitech devices
References: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
 <a2ccd37e20b210a1a35188c949d5658314a22c86.camel@archlinux.org>
 <CAE7qMrrOU4-qZZh_YoDXS__Xhh2cCJsnnJ-G245_ENrEEp0e3g@mail.gmail.com>
 <e987204d78c42ab3811d139daef43f9f31e65092.camel@hadess.net>
In-Reply-To: <e987204d78c42ab3811d139daef43f9f31e65092.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04/04/2022 07:12, Bastien Nocera <hadess@hadess.net> wrote:
> On Mon, 2022-04-04 at 09:10 +0200, Nestor Lopez Casado wrote:
> > Hello,
> >
> > I've got this from asking internally:
> >
> > " The information should be accurate in both BAS and HIDPP
> > interfaces.
> > However, today the BAS interface is limited. Version  2.0 will be
> > better but not yet released. As you have access to the HIDPP, I
> > recommend using only this one. Like this, the type of connection can
> > be ignored (BLE or USB dongle) "
> 
> As per the patch I just sent (HID: logitech-hidpp: Add Signature M650),
> it will unfortunately be difficult to disable the battery reporting
> directly from bluetoothd.
> 
> We can detect whether a Bluetooth device supports HID++, as it has a
> GATT attribute with a Logitech specific UUID[1] (more info/specs
> welcome), but not all the HID++ capable Bluetooth devices seem to be
> detected by the kernel and they need to be added to a list.
> 
> Ideally, the kernel could enable HID++ support for all the Bluetooth
> HID++-capable devices, and we could easily block reporting in upower or
> bluetoothd without having to care at runtime about whether there's a
> separate battery reporting interface because we could assume it was
> always there.
> 
> Any ideas on how to do that?

Any ideas, anyone?
> 
> [1]:
> Device DE:1D:F3:3B:E4:B0 (random)
> 	Name: Logi M650
> 	Alias: Logi M650
> 	Appearance: 0x03c2
> 	Icon: input-mouse
> 	Paired: yes
> 	Trusted: yes
> 	Blocked: no
> 	Connected: no
> 	WakeAllowed: yes
> 	LegacyPairing: no
> 	UUID: Generic Access Profile    (00001800-0000-1000-8000-00805f9b34fb)
> 	UUID: Generic Attribute Profile (00001801-0000-1000-8000-00805f9b34fb)
> 	UUID: Device Information        (0000180a-0000-1000-8000-00805f9b34fb)
> 	UUID: Battery Service           (0000180f-0000-1000-8000-00805f9b34fb)
> 	UUID: Human Interface Device    (00001812-0000-1000-8000-00805f9b34fb)
> 	UUID: Logitech International SA (0000fd72-0000-1000-8000-00805f9b34fb)
> 	UUID: Vendor specific           (00010000-0000-1000-8000-011f2000046d)
> 	Modalias: usb:v046DpB02Ad0009
> 	ManufacturerData Key: 0x0006
> 	ManufacturerData Value:
>    03 00 80                                         ...
> 	ServiceData Key: 0000fd72-0000-1000-8000-00805f9b34fb
> 	ServiceData Value:
>    10 01 01 2a b0 02 02 09                          ...*....
> 
> 

