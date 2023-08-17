Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B283777FD9D
	for <lists+linux-input@lfdr.de>; Thu, 17 Aug 2023 20:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348971AbjHQSSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Aug 2023 14:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345052AbjHQSSS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Aug 2023 14:18:18 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0233A2D59
        for <linux-input@vger.kernel.org>; Thu, 17 Aug 2023 11:18:17 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-58439daf39fso1225437b3.1
        for <linux-input@vger.kernel.org>; Thu, 17 Aug 2023 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692296296; x=1692901096;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gCTjCTL1EXRJ8WHAwW1NUo5aytTDakDbIYCQn1bmXhc=;
        b=Y+lUIgGU0U7tDexQ1G7BedzILXefnkMemshFimmDQibP9HvmsteXgzsksWik4xqDPh
         7ZSBpEJ/PkkLO7RRrX/7DYznkhr+C9/X+wFvIH0L+EPIzThhJVkYcbYMbuWk3H83xizm
         LdQmOq1q1UR7ZPJ4PjBsj+MAhIL79AuAZun968uaefFs+JCnkHbSHrZWXSDfVfVLwvxH
         0x71cGdKTBDAidFebV1fmlxXoxaLiA+phVSumUOzqY9WU5uBynaula0Au8nvLRNCwdpN
         klagLy0wHUWbQryJLyw2m2zt940y/k2nWnJMHkBMaAiGzNfsMN97v8dU1LR4qkfdCWgh
         rfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692296296; x=1692901096;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCTjCTL1EXRJ8WHAwW1NUo5aytTDakDbIYCQn1bmXhc=;
        b=eW7wRauVcbTw3Gy+3ZRfvpjl0bhlnJwtmGmSC5gMYxuErVw5GIsOnaHEsFPtyqWgrF
         1EDhoC3r8eXm+3q0sfwjE5kuIGzOoVMZu2uTyJqrcOZYKGe3ktC2CozzDH8b05Vro+fg
         gXqKut76jFQE9kbCGJn0Egfr9ITVXwbDTHNd9Cd4cK60OyarjpedahNPqldiXyLYgbjm
         dCvfLcE84KrXIpuHGnvy6J5Cb5OZ8tf/Mh0m9G8SoXjSs/8uaz9g9J7yWIt0MfdbobFb
         mIs6hX8cSCa31dgeLACODkk8kqLW++Klaq548JIo8v+qXKFzxSRGLKTk1utuZOXn8xD8
         UnqA==
X-Gm-Message-State: AOJu0Yw8Jd3HCIcLvob4sS8IvnaxSq3/CjnsQUTzbK1AdzRCRBsC+ev2
        yeT2n/9pWuvwCc0CYqEG/8O92+Cz3kRBshcH3fR47fduQ+Ee
X-Google-Smtp-Source: AGHT+IEcO3uqxjIuiA+9dp57ksANs7tFcN1l3ismWZlOOmr3RjKkbMSNZAaFzpej07BEKfPgaD29znJjyDON2QCEXec=
X-Received: by 2002:a0d:c1c2:0:b0:589:f491:de94 with SMTP id
 c185-20020a0dc1c2000000b00589f491de94mr149104ywd.29.1692296295588; Thu, 17
 Aug 2023 11:18:15 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Ayrapetyan <robert.ayrapetyan@gmail.com>
Date:   Thu, 17 Aug 2023 11:17:40 -0700
Message-ID: <CAAboi9sOOWALmFSGFyCCK-JsR=jovFhSoBv3sStkXcWZtNr3pg@mail.gmail.com>
Subject: Dell Pro Wireless Keyboard and Mouse KM5221W require
 HID_QUIRK_ALWAYS_POLL patch
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello.

Dell Pro Wireless Keyboard and Mouse KM5221W constantly reconnect with
a following error messages:

kernel: usb 1-1: USB disconnect, device number 28
acpid[762]: input device has been disconnected, fd 20
acpid[762]: input device has been disconnected, fd 21
acpid[762]: input device has been disconnected, fd 22
kernel: usb 1-1: new full-speed USB device number 29 using xhci_hcd
kernel: usb 1-1: New USB device found, idVendor=413c, idProduct=4503,
bcdDevice= 2.40
kernel: usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
kernel: usb 1-1: Product: Dell Universal Receiver
kernel: usb 1-1: Manufacturer: Dell Computer Corp
kernel: input: Dell Computer Corp Dell Universal Receiver as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:413C:4503.000D/input/input35
kernel: hid-generic 0003:413C:4503.000D: input,hidraw4: USB HID v1.11
Keyboard [Dell Computer Corp Dell Universal Receiver] on
usb-0000:00:14.0-1/input0
kernel: input: Dell Computer Corp Dell Universal Receiver Mouse as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:413C:4503.000E/input/input36
kernel: input: Dell Computer Corp Dell Universal Receiver Consumer
Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:413C:4503.000E/input/input37
dbus-daemon[1442]: [session uid=1000 pid=1442] Activating service
name='org.xfce.Xfconf' requested by ':1.2053' (uid=1000 pid=271244
comm="/usr/bin/Thunar --daemon")
kernel: input: Dell Computer Corp Dell Universal Receiver System
Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:413C:4503.000E/input/input38
kernel: hid-generic 0003:413C:4503.000E: input,hidraw5: USB HID v1.11
Mouse [Dell Computer Corp Dell Universal Receiver] on
usb-0000:00:14.0-1/input1
kernel: hid-generic 0003:413C:4503.000F: hiddev1,hidraw6: USB HID
v1.11 Device [Dell Computer Corp Dell Universal Receiver] on
usb-0000:00:14.0-1/input2

A patch similar to
https://marc.info/?l=linux-usb&m=149675002229952&w=2 resolves the
issue (tested via the GRUB kernel options override).

Please add HID_QUIRK_ALWAYS_POLL patch for the 413C:4503 device into the kernel.
Thanks.
