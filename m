Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B9935AB16
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 07:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhDJF35 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 01:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJF35 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 01:29:57 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3AAC061762
        for <linux-input@vger.kernel.org>; Fri,  9 Apr 2021 22:29:43 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t22so5440661pgu.0
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O9pKP4GgW8VsU9gFlkIwqYhpzvu2L0gnlJrbWY7ddso=;
        b=X3quufz+gHw9/2uRFoafFZ7f11pQ1E58vrEEA930rRbkP3tQCgIMuYJvVFQMHa7s+K
         z2ffWfRFER13d8jvSf6K0t9IRrfd5+uJXUSnPvagMFoVMFDn8bN7Cu5YZybkaVxH3KpM
         GPzqeN6o89JZxOzRgGYZW8VWGZDQa8Cd5tsdV3QHuPifZw1VHmn97ngnsSAY8zMfalXB
         jKGvSUUmnHoiRkYeOqXdcq4o1CP9uOjEzPtfgMkqFKS3AImGGUdqYSAlpp1Uls8mC7Bq
         8gtZJdA1OTGiRWzzgY81i5fjZ8usn9GJrbwD11E/qTjczdyOvCY/nDCIkcq2UqMoDYf8
         HvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O9pKP4GgW8VsU9gFlkIwqYhpzvu2L0gnlJrbWY7ddso=;
        b=BZUQTcFmGtkSXc1uXShmNM2HJg/jG1EQgHLg9FGXlXJunLsM3Mj4kq3us49CPoFXYR
         5BMidlGzo3xSRiVyIMlyqe2N51syua8Ja9/OyIRh9oxQWU9+YShyxtxTPXwtBGWYhlYl
         BtgVeHbAHfbOYXKV3sJPK2MvMBWkbF7mLWDAK2VevgfYeGKrP2WmWeSyTI6zaY1QXbmG
         n2ZsMJT8uXm6KoQ3Ft97zVUNXVtgJ0xpWbbYj58VUacIDT2KzNR2zz0CKs1XOqayEpdk
         bVS3rEHy4J1uWfCX7HAT2i9TIKvsfqUrZurmhl/onDdauqWTrqN3P4ZdyaprE2n4y7i1
         PZSA==
X-Gm-Message-State: AOAM533JLBbeqJta/ARYR82XSckXI97XOdn15nLcxaOLqg8Vrn3Pqum2
        7EfAS5BBN+OitOUAW5zCLwiWD3XRLtg=
X-Google-Smtp-Source: ABdhPJxfcsTxBzJYMBNjH+7iiQcmlf9Qg7EbsTiMm8eaDduQczylDG9r/8vfXlWpMMU4pem+ha0VEQ==
X-Received: by 2002:a63:4a5b:: with SMTP id j27mr16463387pgl.264.1618032582515;
        Fri, 09 Apr 2021 22:29:42 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id s21sm4349368pgl.36.2021.04.09.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 22:29:41 -0700 (PDT)
Date:   Fri, 9 Apr 2021 22:29:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] Input: elants_i2c - Do not bind to i2c-hid
 compatible ACPI instantiated devices
Message-ID: <YHE3ww3iw27A6b+w@google.com>
References: <20210405202756.16830-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405202756.16830-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 05, 2021 at 10:27:56PM +0200, Hans de Goede wrote:
> Several users have been reporting that elants_i2c gives several errors
> during probe and that their touchscreen does not work on their Lenovo AMD
> based laptops with a touchscreen with a ELAN0001 ACPI hardware-id:
> 
> [    0.550596] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vcc33 not found, using dummy regulator
> [    0.551836] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vccio not found, using dummy regulator
> [    0.560932] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.562427] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.595925] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.597974] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.621893] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.622504] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.632650] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (4d 61 69 6e): -121
> [    0.634256] elants_i2c i2c-ELAN0001:00: boot failed: -121
> [    0.699212] elants_i2c i2c-ELAN0001:00: invalid 'hello' packet: 00 00 ff ff
> [    1.630506] elants_i2c i2c-ELAN0001:00: Failed to read fw id: -121
> [    1.645508] elants_i2c i2c-ELAN0001:00: unknown packet 00 00 ff ff
> 
> Despite these errors, the elants_i2c driver stays bound to the device
> (it returns 0 from its probe method despite the errors), blocking the
> i2c-hid driver from binding.
> 
> Manually unbinding the elants_i2c driver and binding the i2c-hid driver
> makes the touchscreen work.
> 
> Check if the ACPI-fwnode for the touchscreen contains one of the i2c-hid
> compatiblity-id strings and if it has the I2C-HID spec's DSM to get the
> HID descriptor address, If it has both then make elants_i2c not bind,
> so that the i2c-hid driver can bind.
> 
> This assumes that non of the (older) elan touchscreens which actually
> need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
> + DSM in their ACPI-fwnodes. If some of them actually do have this
> false advertising, then this change may lead to regressions.
> 
> While at it also drop the unnecessary DEVICE_NAME prefixing of the
> "I2C check functionality error", dev_err already outputs the driver-name.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
