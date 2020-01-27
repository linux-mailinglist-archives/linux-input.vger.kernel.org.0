Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE42014A92C
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 18:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgA0Rlb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 12:41:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34232 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgA0Rlb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 12:41:31 -0500
Received: by mail-lj1-f196.google.com with SMTP id x7so11665460ljc.1
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2020 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d/e8y4uiSV+KJr5xZhvuBNksYgdKpUBthuu13GVS8Rc=;
        b=TXTPO4/ygyXFUVi5KYjjQIVFBeetXn5ekF14IfKi6Me0HdfuuYhBDCTjc3te94mQII
         jQtM3W6Z8VRgNjUKFgYmylS02aeuEkz8IsvRKCnfGCUfVECRgPO16TicYrxPdef3BCXo
         2S5UN2uP1QjR3uoZ3GWEcLdRJhIaI7FkiQaCsu097H78zuLPH6Uy8zL9fo3nm3n4led6
         Vhhv4Wx5d7IzwzbITCcc78cpcS4HLyDILpN6pXhbdTWeUdR30bBKUdYgzVwhHsWPGEGV
         QrbXold8sOKgRytJ6MDuUhZsBanHUTyhpIm+v49y7OHzZqvpsaLdq5O5aVKV07420d3C
         zIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d/e8y4uiSV+KJr5xZhvuBNksYgdKpUBthuu13GVS8Rc=;
        b=fzYaHN72Y6oO9mNnx51VhEXqyH8FJDfjyTyKBIpV8aMHjqzNOltUkBq3Ej/2E7Uepv
         rAOv4hG6KnwoOq8O/4Fw24O52N2ff9UKpiXomFyLGBAd0pGTibWbGbzdqktNtVSnuBzb
         mr6I7OnrOPeQUghf/UbRKf7Zi4qBAQs0J7gYebnDMaMoPHswaoHjCkZpuKJrTdd70q/c
         1PsAlKolCHnGwF4omGSMchijjZxPX9XBtcM7yx+FzGe4DElPE+RZEQiHnFgw0q14LAfS
         zCEmq/7EeKOCqAZvAy8/TUD1qXUqPqTE1sPVxts8jvLrKy+kO8PBoysuvzysy9vJtwGR
         T11Q==
X-Gm-Message-State: APjAAAU/yo60quaAJH+7gqMWPTiHeJfgIWVeHquWEhlrjlH04GtVf7sS
        CdIjhuyevf06OHdNZkjnaB58kQ==
X-Google-Smtp-Source: APXvYqznaHVydBDCzDtMLOSrJP3WY8kclLy7+J44rPfBTMUbtMv7hBJAFNlTyEyiuWnUs8UCOxX5sA==
X-Received: by 2002:a2e:9090:: with SMTP id l16mr11241095ljg.281.1580146889834;
        Mon, 27 Jan 2020 09:41:29 -0800 (PST)
Received: from bsz-kubuntu.semihalf.local (31-172-191-173.noc.fibertech.net.pl. [31.172.191.173])
        by smtp.gmail.com with ESMTPSA id h81sm8532054lfd.83.2020.01.27.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 09:41:29 -0800 (PST)
From:   Bartosz Szczepanek <bsz@semihalf.com>
To:     nick.dyer@itdev.co.uk, jiada_wang@mentor.com
Cc:     Andrew_Gabbasov@mentor.com, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, erosca@de.adit-jv.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        nick@shmanahar.org, rydberg@bitmath.org, levinale@google.com,
        rad@semihalf.com
Subject: [PATCH v6 24/48] Input: atmel_mxt_ts - make bootloader interrupt driven
Date:   Mon, 27 Jan 2020 18:41:27 +0100
Message-Id: <20200127174127.25522-1-bsz@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-25-jiada_wang@mentor.com>
References: <20191122082402.18173-25-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I've been testing this patchset on Chromebook equipped with Atmel touchscreen &
touchpad. In my setup, this particular patch seems to introduce a regression
on firmware update:

> localhost /sys/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-6/i2c-ATML0001:00 # echo maxtouch-ts.fw > update_fw
> bash: echo: write error: Remote I/O error

Kernel logs show that the reason is failed I2C transfer:

> [ 111.632131] atmel_mxt_ts i2c-ATML0001:00: Found bootloader addr:27 ID:21 version:4
> [ 111.637711] atmel_mxt_ts i2c-ATML0001:00: Unlocking bootloader
> [ 129.155091] atmel_mxt_ts i2c-ATML0001:00: Sent 1356 frames, 212224 bytes
> [ 129.263269] atmel_mxt_ts i2c-ATML0001:00: The firmware update succeeded
> [ 129.263952] atmel_mxt_ts i2c-ATML0001:00: __mxt_read_chunk: i2c transfer failed (-121)
> [ 129.265072] atmel_mxt_ts i2c-ATML0001:00: mxt_bootloader_read: i2c recv failed (-121)
> [ 129.265588] atmel_mxt_ts i2c-ATML0001:00: Trying alternate bootloader address
> [ 129.266375] atmel_mxt_ts i2c-ATML0001:00: mxt_bootloader_read: i2c recv failed (-121)

Surprisingly, only touchscreen device is affected. When I checked out to
119e1b7e8481 ("Input: atmel_mxt_ts - refactor code to enter bootloader into
separate func") all worked fine. In between these commits I got some mixed
results, including timeout while waiting for completion:

> [ 190.006174] atmel_mxt_ts i2c-ATML0001:00: Found bootloader addr:27 ID:21 version:4
> [ 190.317819] atmel_mxt_ts i2c-ATML0001:00: Wait for completion timed out.
> [ 190.318267] atmel_mxt_ts i2c-ATML0001:00: Update wait error -110
> [ 190.319310] atmel_mxt_ts i2c-ATML0001:00: Unlocking bootloader
> [ 208.369825] atmel_mxt_ts i2c-ATML0001:00: Sent 1356 frames, 212224 bytes
> [ 208.536942] atmel_mxt_ts i2c-ATML0001:00: The firmware update succeeded
> [ 208.544835] atmel_mxt_ts i2c-ATML0001:00: Family: 164 Variant: 14 Firmware V2.3.AA Objects: 40
> [ 208.547623] atmel_mxt_ts i2c-ATML0001:00: Touchscreen size X4095Y2729

Some more details - the touchscreen device reports itself as:

> atmel_mxt_ts i2c-ATML0001:00: Family: 164 Variant: 14 Firmware V2.3.AA Objects: 40

Due to Chromebook limitations on kernel version, I'm running 4.19 kernel
with patches backported from master (so that atmel_mxt_ts is aligned between
master and 4.19). The platform is Samsung Chromebook Pro.

Best regards,
Bartosz
