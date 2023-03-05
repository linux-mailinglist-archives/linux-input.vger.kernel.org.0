Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF966AAFEC
	for <lists+linux-input@lfdr.de>; Sun,  5 Mar 2023 14:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCENev (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Mar 2023 08:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjCENeu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Mar 2023 08:34:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052AAB455;
        Sun,  5 Mar 2023 05:34:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4398360AD9;
        Sun,  5 Mar 2023 13:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3F8C433D2;
        Sun,  5 Mar 2023 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678023287;
        bh=Ww9ERM95+pBS9/qhdjKVefHnaoUi6JrSFsrwD71Xu8E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OhttQW5raw8emmMTnEMBeznudEb3yCZ3mVBjJXwEQdNLOLe/+wjdsF2l65DusYha6
         l+LLbumOYotJIzNBl6kaFHSQstCrgvNb3tHr5zmMsFquVQNegKCV0M0b306nzFwBQX
         sE6wNTp3+Z6fP0fldRKZj21rCI9y4YDo279CMb1UgixTlZQfCdlhNTnMMQkHTgxxuR
         X1h7YQbY1dkVgT2y21E1A81xBk5wbR2ERt0OCPHm/ea5j94/F9wDJVG/UD1RDRSDKY
         AyS/i2PBugtckqBikdp4gIkmc85/g+GXaAkSLJpKP2fAzkemXrfIsAoKbWARkd3sAS
         B/iUU8GTSQqgg==
Message-ID: <42ac04f2-e7dc-a5a8-750e-243aa82c35db@kernel.org>
Date:   Sun, 5 Mar 2023 14:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] Input: hideep - Optionally reset controller work
 mode to native HiDeep protocol
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org
References: <20230303222113.285546-1-hdegoede@redhat.com>
 <20230303222113.285546-3-hdegoede@redhat.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230303222113.285546-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03/03/2023 23:21, Hans de Goede wrote:
> The HiDeep IST940E touchscreen controller used on the Lenovo Yoga Book X90F
> convertible comes up in HID mode by default.
> 
> This works well on the X91F Windows model where the touchscreen is
> correctly described in ACPI and ACPI takes care of controlling
> the reset GPIO and regulators.
> 
> But the X90F ships with Android and the ACPI tables on this model don't
> describe the touchscreen. Instead this is hardcoded in the vendor kernel.
> 
> The vendor kernel uses the touchscreen in native HiDeep 20 (2.0?) protocol
> mode and switches the controller to this mode by writing 0 to reg 0x081e.
> 
> Adjusting the i2c-hid code to deal with the reset-gpio and regulators on
> this non devicetree (but rather broken ACPI) convertible is somewhat tricky
> and the native protocol reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR
> which are not reported in HID mode, so it is preferable to use the native
> mode.
> 
> Add support to the hideep driver to reset the work-mode to the native
> HiDeep protocol to allow using it on the Lenovo Yoga Book X90F.
> This is guarded behind a new "hideep,reset-work-mode" boolean property,
> to avoid changing behavior on other devices.
> 
> For the record: I did test using the i2c-hid driver with some quick hacks
> and it does work. The I2C-HID descriptor is available from address 0x0020,
> just like on the X91F Windows model.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../bindings/input/touchscreen/hideep.txt        |  1 +
>  drivers/input/touchscreen/hideep.c               | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> index a47c36190b01..68bb9f8dcc30 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
> @@ -17,6 +17,7 @@ Optional properties:
>  - linux,keycodes	: Specifies an array of numeric keycode values to
>  			be used for reporting button presses. The array can
>  			contain up to 3 entries.
> +- hideep,reset-work-mode: bool, reset touch report format to the native HiDeep protocol

Bindings must be a separate patch.

Also, would be nice to convert first the TXT to DT schema (YAML).

"-mode" suggests it's some enum, not bool. Otherwise what exactly it is
choosing (which mode)?



Best regards,
Krzysztof

