Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561636B583D
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 05:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjCKEsp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 23:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCKEsm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 23:48:42 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC6A7614D;
        Fri, 10 Mar 2023 20:48:40 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u5so7730231plq.7;
        Fri, 10 Mar 2023 20:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678510120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAXK9zWOTHObwGS0Q4Ffcm2sdCcfRHAKJFylYLqDeng=;
        b=hct9OfYj1R8TyYEUFv8Qsq97RHakdBHljlosTczdQZtO4BIQnKcFMgTsYoeDJoyG6O
         pstEIde12OzRoCkSZ3vHe2GRMY57Poh+lf0YKEa4LvKotEmnPSPI09jf95j3DNtLpi9w
         huguVmtTMOM2hlS+sBShk3Wg75qcI14rpJOgayNas8ZlGvFe6STdMbMqJ3gEMahJGwGK
         pwa/q3W/ScfXR9p1W/iua+0yQuRC/De80AmvxIXNI7akFH56e26mr5CifuB8bcPS5T62
         LWVgn1QcjhaQFsn/4XdaJLU/3iCNwS9vnTIHV7BQdbP42mAgOL1MTdmJV9+TlRnclWAZ
         xnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678510120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAXK9zWOTHObwGS0Q4Ffcm2sdCcfRHAKJFylYLqDeng=;
        b=bLz7m/ZkucBpEEbpKcp/D9yuq5arWtCOIuT5b/vjRSy8KLIHCTrtqoqffHMkvpUh4p
         r1mAYlS32tXTWsWF/V6NXl6GGbf+20HZfJ/3tvhsNjXnlTLPLNtZ52vhD+dgQyIR3MkK
         C6k+ZdtYHSYpfRJWTdIMW/F3/0Yp6awziLDD0dCDcrgCjGQV8jnaQrEp1vapSslI9Skv
         uBx3UhCJT7vMahyjsY8gSif0ItcfVQkdBjQFrwt9d+t0Gq+uhlnBKgQwny9yih0Ma8q1
         YGXbZNOIvA05yKSsOG4Qszk6Z2g6WGyWbC7Dkd959DIdMRLbC+dF2++oueSP6YRn5YUS
         rGKw==
X-Gm-Message-State: AO0yUKVkwB4RwJ559NcaKYcZmdA0D5JwjSXlrnxXpEA4LRoCjxKx3a4Q
        kS3ncmi7SmevO2MIIAql7Is=
X-Google-Smtp-Source: AK7set+Nc9KmNgbroIsPL1IE5S76ySHknbAYc5KVaUD2aNPyweais3hAB//OHp7foU+wBBiJnNGNnw==
X-Received: by 2002:a05:6a21:338f:b0:cb:b92c:b46e with SMTP id yy15-20020a056a21338f00b000cbb92cb46emr4498353pzb.9.1678510119536;
        Fri, 10 Mar 2023 20:48:39 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ecf:36d8:c79e:8cd0])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a000bea00b005ded4825201sm589500pfu.112.2023.03.10.20.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:48:38 -0800 (PST)
Date:   Fri, 10 Mar 2023 20:48:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: hideep - Optionally reset controller work
 mode to native HiDeep protocol
Message-ID: <ZAwIIypDOjkNLRLk@google.com>
References: <20230303222113.285546-1-hdegoede@redhat.com>
 <20230303222113.285546-3-hdegoede@redhat.com>
 <42ac04f2-e7dc-a5a8-750e-243aa82c35db@kernel.org>
 <857e6fc3-65f6-5b71-073f-b518ab3c814e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857e6fc3-65f6-5b71-073f-b518ab3c814e@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 05, 2023 at 04:04:30PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/5/23 14:34, Krzysztof Kozlowski wrote:
> > On 03/03/2023 23:21, Hans de Goede wrote:
> >> The HiDeep IST940E touchscreen controller used on the Lenovo Yoga Book X90F
> >> convertible comes up in HID mode by default.
> >>
> >> This works well on the X91F Windows model where the touchscreen is
> >> correctly described in ACPI and ACPI takes care of controlling
> >> the reset GPIO and regulators.
> >>
> >> But the X90F ships with Android and the ACPI tables on this model don't
> >> describe the touchscreen. Instead this is hardcoded in the vendor kernel.
> >>
> >> The vendor kernel uses the touchscreen in native HiDeep 20 (2.0?) protocol
> >> mode and switches the controller to this mode by writing 0 to reg 0x081e.
> >>
> >> Adjusting the i2c-hid code to deal with the reset-gpio and regulators on
> >> this non devicetree (but rather broken ACPI) convertible is somewhat tricky
> >> and the native protocol reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR
> >> which are not reported in HID mode, so it is preferable to use the native
> >> mode.
> >>
> >> Add support to the hideep driver to reset the work-mode to the native
> >> HiDeep protocol to allow using it on the Lenovo Yoga Book X90F.
> >> This is guarded behind a new "hideep,reset-work-mode" boolean property,
> >> to avoid changing behavior on other devices.
> >>
> >> For the record: I did test using the i2c-hid driver with some quick hacks
> >> and it does work. The I2C-HID descriptor is available from address 0x0020,
> >> just like on the X91F Windows model.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC.  It might happen, that command when run on an older
> > kernel, gives you outdated entries.  Therefore please be sure you base
> > your patches on recent Linux kernel.
> > 
> >> ---
> >>  .../bindings/input/touchscreen/hideep.txt        |  1 +
> >>  drivers/input/touchscreen/hideep.c               | 16 ++++++++++++++++
> >>  2 files changed, 17 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> >> index a47c36190b01..68bb9f8dcc30 100644
> >> --- a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> >> @@ -17,6 +17,7 @@ Optional properties:
> >>  - linux,keycodes	: Specifies an array of numeric keycode values to
> >>  			be used for reporting button presses. The array can
> >>  			contain up to 3 entries.
> >> +- hideep,reset-work-mode: bool, reset touch report format to the native HiDeep protocol
> > 
> > Bindings must be a separate patch.
> > 
> > Also, would be nice to convert first the TXT to DT schema (YAML).
> > 
> > "-mode" suggests it's some enum, not bool. Otherwise what exactly it is
> > choosing (which mode)?
> 
> As it says it is resetting the mode to the native HiDeep protocol,
> we have no docs on the controller, so I have no idea what other
> values may be written to 0x081e other then 0 and what modes those
> values will enable.

We could either have property specify desired register value, or call
the property something like "hideep,force-native-protocol" if we want to
keep it a bool.

> 
> Anyways I just realized I should have not included this at all,
> since atm this new property is only used on X86/ACPI platforms
> (through platform code setting a device-property), so it is not
> used on devicetree platforms at all.

Even if such properties are not documented I do not see how it will
prevent people from using them... I guess if they validate DT they will
be caught, but I am not sure that we can rely on this happening.


Thanks.

-- 
Dmitry
