Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E80C86717C
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 16:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfGLOej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 10:34:39 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:38038 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfGLOej (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 10:34:39 -0400
Received: by mail-ed1-f41.google.com with SMTP id r12so9410574edo.5
        for <linux-input@vger.kernel.org>; Fri, 12 Jul 2019 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JabR0tqMX7s1qN3dwFT+tYWSdzs/4AS13i31hM4VeJ4=;
        b=W6kyl5resUDf3mtxoEc80pQEE2XDPGjonUHJFwv7NG2B+pWgwxHYuCMhYzQL4TS9aT
         PK4zJegYh2s3AJ72S6QNHpxQf2/QGs1DlvEw8/RQ3DgQvOtatkPDYNYGOw//lo65p4ei
         7Ka3Uo6qmIw+427G2uMbNMlo1Z8sftAs/1pkdzI0l4UB2ysGRkNqmRCx2AXTnmZJS2yJ
         NK6h38ywMlcrGrqgSEIJnNXwvR9iy89kzwyI2ybgnPiXNowAHdpkTlqeB6GRH9cvF1Vs
         FGuVYJk3dUo6Tqlu80UQhpLwYpGBNWyxzrrOjQlOoOhUDVEFBIio8DSxYQxhA/sZFHAq
         EosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JabR0tqMX7s1qN3dwFT+tYWSdzs/4AS13i31hM4VeJ4=;
        b=XM/BZAfk/RjEnlj77mWzFDhId/UyeO1lPDRNDF8dZr78M8y55Lt9XUsNjRvRJUer88
         ydJ8Br/sFz0Xw+ZLRDwOT1EEbupUm/0piGENqU0CKYvYBUa6obBb4yb2h1NXjE+YHbKT
         usltKeCRV2NkiUotHAwLaLXeAgsRmSx8vSWqOfvQAiESvrlcFsaV8xUIhrzOCwg7Rw4b
         RfnBXKGENeSYTS4jyXbCNHNYdhaavhhHJu9d5PMC0LZVERdhTvrvxiPXKMYjIBnvXOGG
         YCZMgcJP7g9tKpO263hNNf/lZ8wMbogS+XMyitDmR/CFTLai3FDI4nG4wYboFvNV5t/a
         Et/Q==
X-Gm-Message-State: APjAAAVmFcSTXru8fpFP+8gw8KfR5Tt1ITNWkAa9yVN+0Pc6hDTK3t6M
        /Pc1kWQNJOOM5RAejesqe8XjGBRoT/Y8bmyM21wR7LT/
X-Google-Smtp-Source: APXvYqy6PC1ha9K+gICmIvM06fBSlrHmG6vwvt8g5kEN4xG/sfVknfKit2NUcyyPO8JThBV93ruLkDXtIRH6Emdump8=
X-Received: by 2002:a17:907:2114:: with SMTP id qn20mr8563661ejb.138.1562942076862;
 Fri, 12 Jul 2019 07:34:36 -0700 (PDT)
MIME-Version: 1.0
From:   Luis Diaz <diazluis@gmail.com>
Date:   Fri, 12 Jul 2019 11:34:31 -0300
Message-ID: <CAFH3yigJkW0F+gK7p971v93VH9SMxZj2UVbGLF9wNL1JwdxXnw@mail.gmail.com>
Subject: Logitech M720 - battery level
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, I've got a Logitech M720 mouse, it works with an Unifying
receiver or Bluetooth. Both of them report battery level, however,
over bluetooth it's always at 100%. Unsure if this is an input bug.

Kernel: 5.1.16-1-default (OpenSuSE Tumbleweed) This issue is present
in previous versions too
Mouse: Logitech M720

* Using receiver:
[   10.105788] hid-generic 0003:046D:405E.0008: input,hidraw5: USB HID
v1.11 Keyboard [Logitech Unifying Device. Wireless PID:405e] on
usb-0000:00:14.0-1.1.3:1
[   10.277357] logitech-hidpp-device 0003:046D:405E.0008:
input,hidraw5: USB HID v1.11 Keyboard [Logitech M720 Triathlon] on
usb-0000:00:14.0-1.1.3:1
[   35.587036] logitech-hidpp-device 0003:046D:405E.0008: HID++ 4.5
device connected.

upower -i /org/freedesktop/UPower/devices/mouse_hidpp_battery_0
  native-path:          hidpp_battery_0
  model:                M720 Triathlon Multi-Device Mouse
  serial:               405e-b5-52-35-73
  power supply:         no
  updated:              Fri 12 Jul 2019 11:19:28 AM -03 (25 seconds ago)
  has history:          yes
  has statistics:       yes
  mouse
    present:             yes
    rechargeable:        yes
    state:               unknown
    warning-level:       none
    battery-level:       unknown
    percentage:          50% (should be ignored)
    icon-name:          'battery-missing-symbolic'



* Using Bluetooth:
[25707.886746] input: M720 Triathlon Keyboard as
/devices/virtual/misc/uhid/0005:046D:B015.0009/input/input33
[25707.887088] input: M720 Triathlon Mouse as
/devices/virtual/misc/uhid/0005:046D:B015.0009/input/input34
[25707.887502] hid-generic 0005:046D:B015.0009: input,hidraw6:
BLUETOOTH HID v0.09 Keyboard [M720 Triathlon] on F8:59:71:AC:0A:B1

upower -i /org/freedesktop/UPower/devices/mouse_dev_D1_72_0D_82_B5_38
  native-path:          /org/bluez/hci0/dev_D1_72_0D_82_B5_38
  model:                M720 Triathlon
  serial:               D1:72:0D:82:B5:38
  power supply:         no
  updated:              Wed 31 Dec 1969 09:00:00 PM -03 (1562941296 seconds ago)
  has history:          yes
  has statistics:       no
  mouse
    present:             yes
    rechargeable:        no
    state:               unknown
    warning-level:       none
    percentage:          100%
    icon-name:          'battery-missing-symbolic'
