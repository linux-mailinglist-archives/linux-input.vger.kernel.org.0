Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382866188C1
	for <lists+linux-input@lfdr.de>; Thu,  3 Nov 2022 20:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiKCT2v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Nov 2022 15:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiKCT2v (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Nov 2022 15:28:51 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC854E0E1
        for <linux-input@vger.kernel.org>; Thu,  3 Nov 2022 12:28:48 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id io19so2874751plb.8
        for <linux-input@vger.kernel.org>; Thu, 03 Nov 2022 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ss4jSWJMRWCPiCM/dUbakKH9sPQ6TjaGAPCCuUjyIFE=;
        b=jHT/iJS2i8jb57DIHw/Xsd/yAuHUvq+9f85Sl4RVYqkOi3v8rXXpi3u+aWKNTuxleV
         0ezB7efOU3GpvtBpQ2Ap0Z1VSx6No8ZzKEbpwOq/kkuvMJH4OO4uFjO5xd8mmPQurYz7
         +kS6/sn4Suhrqcs+jwpdPcVymYvditsIxMR+XxnULUwcuZC4XOw5ltBJy97fROypMJqR
         UKtgutpSu4ta7uvIsRCYxWhEaYcbUctK2GkJKYFfIy7kQaUv7BddDhDqECIzNmLWOLZ6
         Kp9LxdWev5YBX6nd1q4AR4d7qOfGThqRm4LrleIeEmJ5UBSzfZ/BuB+EvW9KORxAdhxb
         kBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ss4jSWJMRWCPiCM/dUbakKH9sPQ6TjaGAPCCuUjyIFE=;
        b=VwOUdNUKZlWMc3Ckh8CNF2VHSzd+OHMkxmfEhQdaXBQdNi8n6XiETsPFcMWlIm9JNS
         b9H2cl44AYUNqjQF3G7IDlHOQqUZTR80mTw9cdNNrwK3RbGrlGp5OxoOQuNtlO9bAGbh
         A09kta2X+9XdgDTcJVtDeievx3PRGM+kL8LQOQEtLsyf7/jq+7g8pLg6p/iEmnJjg+hV
         48aQovwOJcP/8JCYqy6SsozGsMBunU0fIrSdv4eWO1mv3OZTT5jPDMi59pmtOuJylVWC
         aOzYj7HIclMm+r/2XD9lGWoJg0VmjoBhi0eXgafVSUFnnb6kBm3x5dPkjb4Gz5hQeiUm
         wQMA==
X-Gm-Message-State: ACrzQf36ezDrX/47iidVIF0wx9fdI+PAe7pikW5q4vYiRCAaS61aJwDG
        JHW4paqr39FYbwSjWbq6CBo=
X-Google-Smtp-Source: AMsMyM42Mx/oqXP3pMpUmSPsabhlftzRfgFGr+nLKQcs6P1mdPkq+bya38qHPyn8TbGxvyLe0K52Cw==
X-Received: by 2002:a17:90b:198b:b0:213:2574:7e0e with SMTP id mv11-20020a17090b198b00b0021325747e0emr32092631pjb.177.1667503728354;
        Thu, 03 Nov 2022 12:28:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b12-20020a621b0c000000b0054ee4b632dasm1096255pfb.169.2022.11.03.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:28:47 -0700 (PDT)
Date:   Thu, 3 Nov 2022 12:28:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: touchscreen - Extend
 touchscreen_parse_properties() to allow overriding settings with a module
 option
Message-ID: <Y2QWbMFzBvc2JzwD@google.com>
References: <20221025122930.421377-1-hdegoede@redhat.com>
 <20221025122930.421377-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025122930.421377-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Tue, Oct 25, 2022 at 02:29:28PM +0200, Hans de Goede wrote:
> On x86/ACPI platforms touchscreens mostly just work without needing any
> device/model specific configuration. But in some cases (mostly with Silead
> and Goodix touchscreens) it is still necessary to manually specify various
> touchscreen-properties on a per model basis.
> 
> This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
> a large list of per-model touchscreen properties which it attaches to the
> (i2c)device before the touchscreen driver's probe() method gets called.
> This means that ATM changing these settings requires recompiling the
> kernel. This makes figuring out what settings/properties a specific
> touchscreen needs very hard for normal users to do.
> 
> Add a new, optional, settings_override string argument to
> touchscreen_parse_properties(), which takes a list of ; separated
> property-name=value pairs, e.g. :
> "touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y".
> 
> This new argument can be used by drivers to implement a module option which
> allows users to easily specify alternative settings for testing.
> 
> The 2 new touchscreen_property_read_u32() and
> touchscreen_property_read_bool() helpers are also exported so that
> drivers can use these to add settings-override support to the code
> for driver-specific properties.

I totally understand the motivation for this, but I do not think that
having special handling for only touchscreen properties is the right
thing to do. I would very much prefer is we had a more generic approach
of adding/overriding properties (via an swnode?).

Thanks.

-- 
Dmitry
