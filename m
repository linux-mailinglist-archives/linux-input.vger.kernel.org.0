Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77912631B7
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 18:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgIIQYr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 12:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730462AbgIIQYY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Sep 2020 12:24:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDA5C061756
        for <linux-input@vger.kernel.org>; Wed,  9 Sep 2020 09:24:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id v23so4398487ljd.1
        for <linux-input@vger.kernel.org>; Wed, 09 Sep 2020 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ImE8KLatX/r4ToMgC1tkKtGe4Bl4JBq/F72yeSvTx6Y=;
        b=D2udTa48SlyqB21b8aEIPXG9/XNIlL4URAo0hux/rBO8+ZetkeDgRjvcjgTH7Gs2CA
         tcVXilYjB9WiBgTPWUBJb4CB4Bb0C1/JAe/VHZG5+/1/rtF9QDF1h9b7VZ6HAm5rc4FJ
         LHXsrcpqvzvJggVW/E2zMuALZYkc4DX+k3grqzLe3s5yVUmjDPLf3L8E3BunDwEg3mfC
         +TbScoj3TIX0Gs3+8MvHR1Ql1sHw9w1PezjJlpDKyO4haiIMN30jGuTXjZDRh9L1pvoL
         031TQhQ1YiYmcaPf5f0FJ4PiOVkm/uXxcU2EW87+Q07fVxPm3HDlgpL8lLNOP5Xlz3WC
         OEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ImE8KLatX/r4ToMgC1tkKtGe4Bl4JBq/F72yeSvTx6Y=;
        b=qavWBAIWg3TOn7mivYTkcyHAWYdMbOtCOtt1fZ/+B/Qto8QOEmk3rrMLNmZPUXncb9
         xxskMIQbwMep9Oxh8pf5JYNZVlJgy6iXZPHIEVVnx/7pIJR51reBZxnCFQHHtgzBeojQ
         3+G1Hzm0FWdwBrgQNZ2PD+k4IQyma+gwDRS602t1fs+brAJmYQX3TmF9IJ8ZkHYyJkPk
         hPmrxCl9mTaqFQaCWspj2BduZhp/xJtumGRoMtK56SCMn3Ejoba8Ph5l604FvK8j4fHS
         OkqpLn6whokIdlrDLf47QOwFwEjThgIxKwOrRPI1DUqeAFsrO8WHlnuYA+0hwCZD0fwr
         y9kA==
X-Gm-Message-State: AOAM531jyo2vAnMTcNY0dx67689doYH8LKR/Mb0mDrP6DrhQm5GnQQPh
        ThgvJ3eYaCD/83N/u+KlBTA+nWeMjk4N/R8w7JP6k1H/Rg==
X-Google-Smtp-Source: ABdhPJyDSRSioppid7OeEQVJRt2d81MWVrjSSykxwVbWXNm440ME4qq/QZreLni2nyOQS+q54BWVDuZbe9lo4uwJ0RU=
X-Received: by 2002:a2e:8681:: with SMTP id l1mr2170454lji.108.1599668660394;
 Wed, 09 Sep 2020 09:24:20 -0700 (PDT)
MIME-Version: 1.0
From:   marty leisner <maleisner@gmail.com>
Date:   Wed, 9 Sep 2020 12:23:44 -0400
Message-ID: <CAPNO-hah5VCrjFB1ewKf993qfqwuvjjEFX2=cdQ33RO8QK-ZnA@mail.gmail.com>
Subject: using a chengying multitouch IR frame without X
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have a chengying multitouch IR frame -- it works fine under X (I'm
using linux 5.8.3).

Without X running, it continuously connect/disconnects...

[ 1052.014257] usb 1-1: new full-speed USB device number 6 using xhci_hcd
[ 1052.142086] usb 1-1: New USB device found, idVendor=aaec,
idProduct=c021, bcdDevice= 2.00
[ 1052.142092] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 1052.142095] usb 1-1: Product: Multi touch overlay device
[ 1052.142098] usb 1-1: Manufacturer: Multi touch
[ 1052.142101] usb 1-1: SerialNumber: 6C69E5831138
[ 1052.145041] hid-generic 0003:AAEC:C021.0003: hiddev0,hidraw2: USB
HID v1.10 Device [Multi touch   Multi touch overlay device] on
usb-0000:00:14.0-1/input0
[ 1052.149119] input: Multi touch   Multi touch overlay device as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:AAEC:C021.0004/input/input25
[ 1052.149718] hid-multitouch 0003:AAEC:C021.0004:
input,hiddev1,hidraw3: USB HID v1.00 Mouse [Multi touch   Multi touch
overlay device] on usb-0000:00:14.0-1/input1
[ 1053.500639] usb 1-1: USB disconnect, device number 6
[ 1054.673431] usb 1-1: new full-speed USB device number 7 using xhci_hcd
[ 1054.801406] usb 1-1: New USB device found, idVendor=aaec,
idProduct=c021, bcdDevice= 2.00

I'm experienced writing drivers (but not hid devices).   What do I need to add?

Is there a way in udev to "masquerade" as another device (which
works?) [I couldn't figure out how to do it -- this seems like a
useful feature].

It also interesting this identifies itself as 2 hid devices (mouse +
multitouch overlay) instead of one.

marty
