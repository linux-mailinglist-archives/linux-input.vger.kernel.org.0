Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139F135AB18
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 07:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhDJFay (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 01:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJFax (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 01:30:53 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E0DC061762
        for <linux-input@vger.kernel.org>; Fri,  9 Apr 2021 22:30:39 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id l123so5588116pfl.8
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 22:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iD0/q0f/RwFz65xPeHjhoxcurTJgupotK+u8oNYMepY=;
        b=Ze3yDgwgVTQGTUabpaId7At3MvK3cIWHpvVWV/TYS4fKr+LqI+EMz02UneGRtUbHYU
         7lcN1IFDvK+dsrJUGgw4GeTd3bq55SCY7IZ3pFYmrzak3Pfh8lritpLNm1HsWSBRZhbj
         2PdCmMVq9WqgzYEfZ1r5goAbwhynU9GDUWoDJ9Qk89emhHQoewgtqrmoRZtxx7Ty6sbm
         NB3UFD+vahCEdNimR7PRJ4i45T5D+n5xH+zDJrRawINameyaJ7avKhnVWe+lKWEnhMTk
         LgDutk0iJXwv3hKeOnBAfZgnBpTQS3WkLbrLmgqT2bDbiQF8Z8I1uFw9MghYpUArm6QA
         4D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iD0/q0f/RwFz65xPeHjhoxcurTJgupotK+u8oNYMepY=;
        b=onNgdCg1mhB7w09nagdKKD5u61GSYbg2Mon/sl4mhtyh/oIDT4F3kA78vhrGEfJ+IN
         LtEzAJreXg722vYmjhZJqRbulSD9PQMcedSprJgOYoxH2ewzCJlAPx0qB1eG4+r2/hAP
         QGKi/nGFvBGgV2yXqyllwHYS+PpPORTEaW1MGde4fQu+fQBl58Q8q2yya2re4svNPLPz
         KHXvgmRH2bIhO9EuHLLsKUTVw+3jejNJmx2MwJItd6zZ+Qo1q9q2BXgTJ/hA2o7rqXpD
         BZJU5VfBdQGz/oS/r0szEp9mMS0pLX45YlWK1UOUkIW7KmdXg9ECmzckG9J0XGtupPg9
         7XwQ==
X-Gm-Message-State: AOAM530IDpVLO4isWX3Z2qxAZ/utsHgGKKeHp70h9HkqDi9+KkQcm/hS
        2IAV0oTxwuwsv/mYxwtEsynnJuU+dFU=
X-Google-Smtp-Source: ABdhPJyh0gDnMxtNeU1mEDLVaJp0KQqCdFPAtgUt3I527nGKIwkeoQaAdeQ0x7rZEu6HFa7ATSwpcQ==
X-Received: by 2002:a65:640d:: with SMTP id a13mr16194143pgv.272.1618032639408;
        Fri, 09 Apr 2021 22:30:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id t3sm3490018pfg.176.2021.04.09.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 22:30:38 -0700 (PDT)
Date:   Fri, 9 Apr 2021 22:30:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend] Input: silead - Add workaround for x86 BIOS-es
 which bring the Silead chip up in a stuck state
Message-ID: <YHE3/Lfmk1BFeCKP@google.com>
References: <20210405202745.16777-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405202745.16777-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 05, 2021 at 10:27:45PM +0200, Hans de Goede wrote:
> Some buggy BIOS-es bring up the touchscreen-controller in a stuck
> state where it blocks the I2C bus. Specifically this happens on
> the Jumper EZpad 7 tablet model.
> 
> After much poking at this problem I have found that the following steps
> are necessary to unstuck the chip / bus:
> 
> 1. Turn off the Silead chip.
> 2. Try to do an I2C transfer with the chip, this will fail in response to
>    which the I2C-bus-driver will call: i2c_recover_bus() which will unstuck
>    the I2C-bus. Note the unstuck-ing of the I2C bus only works if we first
>    drop the chip of the bus by turning it off.
> 3. Turn the chip back on.
> 
> On the x86/ACPI systems were this problem is seen, step 1. and 3. require
> making ACPI calls and dealing with ACPI Power Resources. This commit adds
> a workaround which runtime-suspends the chip to turn it off, leaving it up
> to the ACPI subsystem to deal with all the ACPI specific details.
> 
> There is no good way to detect this bug, so the workaround gets activated
> by a new "silead,stuck-controller-bug" boolean device-property. Since this
> is only used on x86/ACPI, this will be set by model specific device-props
> set by drivers/platform/x86/touchscreen_dmi.c. Therefor this new
> device-property is not documented in the DT-bindings.
> 
> Dmesg will contain the following messages on systems where the workaround
> is activated:
> 
> [   54.309029] silead_ts i2c-MSSL1680:00: [Firmware Bug]: Stuck I2C bus: please ignore the next 'controller timed out' error
> [   55.373593] i2c_designware 808622C1:04: controller timed out
> [   55.582186] silead_ts i2c-MSSL1680:00: Silead chip ID: 0x80360000
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
