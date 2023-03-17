Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58BD6BE763
	for <lists+linux-input@lfdr.de>; Fri, 17 Mar 2023 11:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCQK6P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Mar 2023 06:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjCQK6P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Mar 2023 06:58:15 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE29A25C
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 03:58:08 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v21so4886580ple.9
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679050688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpHETulsnFe35NFxmIPACzJII6agNMa4pnekalgEs/k=;
        b=qEAL04/EWZK+hxg34icRTEudZ0rTq1tfNiJK6CVBtG6ZlUv96ok4TiqrYFdmtBbAc/
         zRkdmqZ1z9SNrV8QqBiShPat8uSuvjHb5L7WOvGmVmWU2CnhU8UFtxZMY3pA03RqQjSe
         iQwrTRnIvJK05/gJsZ3hkrNRF/WfxKwoskT5YmRL6LNlr3JazBf4/rZpRH5FuPWZmT1/
         hWa9KCB6HUsp+gGaGudeckrnI4bbR6d8NDIZHGv1Y77Z4YmB3dmy8ayLMgar2bs7oIgU
         gFCF3u7MGx4qA7H1rqSuM+BXg8/z7f7Oct+tCp4P63B+ZF8ZxVWipgSrhdPku50f7osI
         d/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679050688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpHETulsnFe35NFxmIPACzJII6agNMa4pnekalgEs/k=;
        b=ZQoYG7oe3oPFK3cz9SXRer+T8Vj3ys4EHm1PCQDdtxe2IgoLQH3RDs3mWZLLJE9Zwp
         xymhWbbMhvzSZdt+QIfbnfWZhOAJaVD8LVZgHsP3O4EKwsqKsvA/eRmKGJd9UgagFcsF
         hTiGZSlDSzxLPVLnZYchDr2BRI2UAbUdBVkTlKN9SmUxuUhHXUfGfRWVL4/kMhhS3P/x
         9shH6Id92x+lR9g60z5h6jAEXo6XEZufiwFV9T7rs8nbIvC5ebg4VP2kmEMDMkz32NdV
         UeIoW8iH4HteGLg9J3tu2ZV8/zy8MEZIX9HaYE8fj/pJMen7lxAGFvSvhl3a3plgIs6c
         TCjQ==
X-Gm-Message-State: AO0yUKXt+yT9EclSiOBR+YTGzZUh/vnRz9MP1PKjhIMiZLRzlo706rPQ
        h6C4+o4YupiduWP46MyL0rmqpnMXOv2stA==
X-Google-Smtp-Source: AK7set/VDQf2kvDmUUEwHQI0Gk1KOhWeMx8PxG4VLULpi87XZp/uTMPVhVtiz/iOrf6oUQMC6D+t6A==
X-Received: by 2002:a17:902:db0f:b0:1a1:8edc:c5f8 with SMTP id m15-20020a170902db0f00b001a18edcc5f8mr7797791plx.56.1679050687938;
        Fri, 17 Mar 2023 03:58:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d084:8252:e846:af61])
        by smtp.gmail.com with ESMTPSA id q18-20020a170902789200b00185402cfedesm1274628pll.246.2023.03.17.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:58:07 -0700 (PDT)
Date:   Fri, 17 Mar 2023 03:58:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 2/2] Input: hideep - Optionally reset controller work
 mode to native HiDeep protocol
Message-ID: <ZBRHvImv14Bx1MPd@google.com>
References: <20230311114726.182789-1-hdegoede@redhat.com>
 <20230311114726.182789-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311114726.182789-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 11, 2023 at 12:47:26PM +0100, Hans de Goede wrote:
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
> This is guarded behind a new "hideep,force-native-protocol" boolean
> property, to avoid changing behavior on other devices.
> 
> For the record: I did test using the i2c-hid driver with some quick hacks
> and it does work. The I2C-HID descriptor is available from address 0x0020,
> just like on the X91F Windows model.
> 
> So far the new "hideep,force-native-protocol" property is only used on
> x86/ACPI (non devicetree) devs. IOW it is not used in actual devicetree
> files. The devicetree-bindings maintainers have requested properties like
> these to not be added to the devicetree-bindings, so the new property is
> deliberately not added to the existing devicetree-bindings.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
