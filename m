Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A24D23DBA0
	for <lists+linux-input@lfdr.de>; Thu,  6 Aug 2020 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHFQ1e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 12:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgHFQSr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 12:18:47 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A63CC0086A9
        for <linux-input@vger.kernel.org>; Thu,  6 Aug 2020 08:28:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a26so24982909ejc.2
        for <linux-input@vger.kernel.org>; Thu, 06 Aug 2020 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8dJRX0Igl8Nzz5CO3GKFYKT9330jHgO3CL9EwFxbfPY=;
        b=Et4UyxEhb4ruYaDwnjt8+KPZrq/MFw2cICGFKe8rbg1pXlR+HHtzHMoSEgtnFbWhyU
         oO7c1P0pwaTs0mUWogLImAdsgBwbePBedWGjXHb+kEIBlevGB2o01x2tle+6oNN7Ne3z
         X0kABG46i+CXilTn3kpGonGXNkRilg4VYfJkMq3i+HF0v/LWF+HZYzq78yQo4Lx9fgav
         qIMFgp1Cg2K7vBH2DRyFdZcFa2RvxJG+yfVJPpCcdMlqezRcrf1A1cdSVpAKI13eHGUs
         hTsvrcBK4klJThdTnXVOA/yZE02qyEgx57ygmx0QqxEo7BPljTAUffEXUcGLohS1rrXa
         nSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8dJRX0Igl8Nzz5CO3GKFYKT9330jHgO3CL9EwFxbfPY=;
        b=VHvPDSjOazXSNcxpfaD9/BmzQCG1kkeu2Ab7n5CcCAtHMjS7AJ1QEAdlv3b8YG2/8J
         kT4T6fNUcZhpDpNK0jT1BE1JUaHpTiLmU6+b/YAf8PTsnW+6JEPZshR9m9M8gTUcpsg6
         MmqWTpAS9Cf7j0DW5UeIRPyo5OFgBEYjxEYrT4u63iAzE89p3cK5zgyqAUPZjsjFfAiB
         ceXFOsjS8lET+seNV+QDQ5XsFLh5yLfrgBfMylJxlZclRnSegudk0pf1kt3O2/2wp9j9
         MqRniqZyJIHrGv45ySrKJpSrRziFG5Z1mIEHdEfqa7dUmsqADE2FkCVaqAlLlznv45/a
         Bi3g==
X-Gm-Message-State: AOAM533Rq1vQw6AnksCUzG+LqKEENP7IRMXHKKoq34le7iJI9SPO9Sl8
        kll8ty5XDntDercGJMYP3bhGJu+sNzyFOuHxR1vVFiu/+xI=
X-Google-Smtp-Source: ABdhPJyJ6LKnK4sE4FKAWZMO5lrML4pA9T6kL3O1Se2tGp1Pmv8J4aqcA9YOHsfaPuOVZxolrRJlCDcA5wi4VNs9FzU=
X-Received: by 2002:a17:906:7fc9:: with SMTP id r9mr4742298ejs.407.1596727732562;
 Thu, 06 Aug 2020 08:28:52 -0700 (PDT)
MIME-Version: 1.0
From:   Raul Rangel <rrangel@google.com>
Date:   Thu, 6 Aug 2020 09:28:41 -0600
Message-ID: <CAHQZ30ANTeM-pgdYZ4AbgxsnevBJnJgKZ1Kg+Uy8oSXZUvz=og@mail.gmail.com>
Subject: PS/2 + i8042 intermixing commands
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I'm debugging a resume issue on one of our devices using the v5.4
kernel. The device has a PS/2 atkbd and a PS/2 touchpad. It looks like
PS/2 commands are getting intermingled with i8042 commands. This
results in our keyboard controller thinking it got some invalid data.
This usually happens 1 out of 1500 resumes.

Here is the log from my keyboard controller on a good resume.

I've added some comments to make it easier to follow:
> <-- i8042_controller_resume
> [KB recv cmd: 0xaa] # CMD #1
>
> [KB recv cmd: 0x60] # CMD #2
> [ACPI kblight 0]
> [KB recv data: 0x70]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x70]
> [KB set CTR_RAM(0x00)=0x70 (old:0x70)]
>
> <- i8042_enable_aux_port
> [KB recv cmd: 0x60] # CMD #3
> [KB recv data: 0x52]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x52]
> [KB set CTR_RAM(0x00)=0x52 (old:0x70)]
> [AUX IRQ enable]
> [AUX enabled]
>
> <- i8042_enable_kbd_port
> [KB recv cmd: 0x60] # CMD #4
> [KB recv data: 0x43]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> [KB set CTR_RAM(0x00)=0x43 (old:0x52)]
> [KB IRQ enable]
> [KB enable]
>
> <- atkbd_reconnect->atkbd_probe
> [KB recv data: 0xf2] <- ATKBD_CMD_GETID # CMD #5
> <- atkbd_deactivate
> [KB recv data: 0xf5] <- ATKBD_CMD_RESET_DIS # CMD #6
> [KS disable]
> [KB Clear Buffer]
>
> <- atkbd_reconnect->atkbd_set_leds
> [KB recv data: 0xed] # CMD #7
> [KB recv data: 0x00]
> [KB eaten by STATE_SETLEDS]
>
> <- atkbd_reconnect->atkbd_set_repeat_rate
> [KB recv data: 0xf3] # CMD #8
> [KB recv data: 0x00]
> [KB eaten by STATE_SETREP: 0x00]
>
> <- atkbd_reconnect->atkbd_activate
> [KB recv data: 0xf4] <- ATKBD_CMD_ENABLE # CMD #9
> [KS enable]
> [KB Clear Buffer]
>
> <- atkbd_event_work->atkbd_set_leds
> [KB recv data: 0xed] # CMD #10
> [KB recv data: 0x00]
> [KB eaten by STATE_SETLEDS]
>
> <- atkbd_event_work->atkbd_set_repeat_rate
> [KB recv data: 0xf3] # CMD #11
> [KB recv data: 0x00]
> [KB eaten by STATE_SETREP: 0x00]
>
> <-- trackpoint_reconnect->trackpoint_start_protocol
> [KB recv cmd: 0xd4] <- I8042_CMD_AUX_SEND # CMD #12
> [KB recv data: 0xe1] <- TP_READ_ID
> [STATE_SEND_TO_MOUSE: 0xe1]
>
> <- Is this i8042_port_close?
> [KB recv cmd: 0x60] # CMD #13
> [KB recv data: 0x41]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x41]
> [KB set CTR_RAM(0x00)=0x41 (old:0x43)]
> [AUX IRQ disable]
> [KB recv cmd: 0x60] # CMD #14
> [KB recv data: 0x43]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> [KB set CTR_RAM(0x00)=0x43 (old:0x41)]
> [AUX IRQ enable]
>
> [KB recv cmd: 0xd4] # CMD #15
> [KB recv data: 0xf2]
> [STATE_SEND_TO_MOUSE: 0xf2]


Here is the log on the bad resume:

> <-- i8042_controller_resume
> [KB recv cmd: 0xaa] # CMD #1
>
> [KB recv cmd: 0x60] # CMD #2
> [ACPI kblight 0]
> [KB recv data: 0x70]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x70]
> [KB set CTR_RAM(0x00)=0x70 (old:0x70)]
>
> <- i8042_enable_aux_port
> [KB recv cmd: 0x60] # CMD #3
> [KB recv data: 0x52]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x52]
> [KB set CTR_RAM(0x00)=0x52 (old:0x70)]
> [AUX IRQ enable]
> [AUX enabled]
>
> <- i8042_enable_kbd_port
> [KB recv cmd: 0x60] # CMD #4
> [KB recv data: 0x43]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> [KB set CTR_RAM(0x00)=0x43 (old:0x52)]
> [KB IRQ enable]
> [KB enable]
>
> <- atkbd_reconnect->atkbd_probe
> [KB recv data: 0xf2] <- ATKBD_CMD_GETID # CMD #5
> <- atkbd_deactivate
> [KB recv data: 0xf5] <- ATKBD_CMD_RESET_DIS # CMD #6
> [KS disable]
> [KB Clear Buffer]
>
> <- atkbd_reconnect->atkbd_set_leds
> [KB recv data: 0xed] # CMD #7
> [KB recv data: 0x00]
> [KB eaten by STATE_SETLEDS]
>
> <- atkbd_reconnect->atkbd_set_repeat_rate
> [KB recv data: 0xf3] # CMD #8
> [KB recv data: 0x00]
> [KB eaten by STATE_SETREP: 0x00]
>
> <- atkbd_reconnect->atkbd_activate
> [KB recv data: 0xf4] <- ATKBD_CMD_ENABLE # CMD #9
> [KS enable]
> [KB Clear Buffer]
>
> <-- trackpoint_reconnect->trackpoint_start_protocol
> [KB recv cmd: 0xd4] <- I8042_CMD_AUX_SEND # CMD #12
> [KB recv data: 0xe1] <- TP_READ_ID
> [STATE_SEND_TO_MOUSE: 0xe1]
>
> <- Is this i8042_port_close?
> [KB recv cmd: 0x60] # CMD #13
> [KB recv data: 0x41]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x41]
> [KB set CTR_RAM(0x00)=0x41 (old:0x43)]
> [AUX IRQ disable]
>
> <- atkbd_event_work->atkbd_set_leds
> [KB recv data: 0xed] # CMD 10
> <- Wait, where is the data?
>
> <- Continuation of i8042_port_close?
> [KB recv cmd: 0x60] # CMD #14
> [KB recv data: 0x43]
> [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> [KB set CTR_RAM(0x00)=0x43 (old:0x41)]
> [AUX IRQ enable]
>
> <- Here is the data!
> [KB recv data: 0x00] # CMD 10 (data)
> [KB Unsupported i8042 data 0x00]
> [KB recv data: 0x00] <- Did the host retry?
> [KB Unsupported i8042 data 0x00]
>
> <- atkbd_event_work->atkbd_set_repeat_rate
> [KB recv data: 0xf3] # CMD #11
> [KB recv data: 0x00]
> [KB eaten by STATE_SETREP: 0x00]
>
> [KB recv cmd: 0xd4] # CMD #15
> [KB recv data: 0xf2]
> [STATE_SEND_TO_MOUSE: 0xf2]

As you can see CMD #10 starts between #13 and #14, and then completes
after #14. Is this expected behavior?

I'm not quite sure if #13 and #14 are coming from i8042_port_close. I
don't have a function trace available, but it seems to fit.

I found this comment:
/*
 * Writers to AUX and KBD ports as well as users issuing i8042_command
 * directly should acquire i8042_mutex (by means of calling
 * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
 * they do not disturb each other (unfortunately in many i8042
 * implementations write to one of the ports will immediately abort
 * command that is being processed by another port).
 */
static DEFINE_MUTEX(i8042_mutex);

Does that not mean that i8042_port_close, i8042_enable_kbd_port,
i8042_enable_aux_port, + any other function that calls i8042_command
should be taking the lock before calling i8042_command?

Imagine this scenario:
1) atkbd_set_leds->ps2_command: locks i8042_mutex
2) __ps2_command->ps2_do_sendbyte->i8042_kbd_write
2a) locks i8042_lock
2b) Sends the kbd command
2c) unlocks i8042_lock
3) i8042_port_close/i8042_enable_aux_port/etc gets called and then
calls i8042_command
3a) locks i8042_lock
3b) sends 8042 CMD
3c) sends 8042 DATA
3d) unlocks i8042_lock
3e) i8042_command returns
4)  ps2_do_sendbyte continues sending the kb param via i8042_kbd_write
4a) locks i8042_lock
4b) Sends the kbd data <- Original data got stomped on because of the
8042 CMD in between
4c) unlocks i8042_lock
4c) ps2_command unlocks i8042_mutex

Is this an invalid sequence or is our keyboard controller at fault
because it doesn't support intermingled commands?

Thanks,
Raul

p.s, sorry for sending twice. I forgot to set the original as plain text :)
